// Bibliotheken
#include <SD.h>
#include <SPI.h>
#include <Wire.h>
#include "dht.h"
#include <TinyGPS.h>
#include <BH1750FVI.h>
#include <SoftwareSerial.h>
#include <SparkFunCCS811.h>

// Constanten definieren
#define sd 2
#define gprs 9
#define dht_pin 6 
#define dataSelect 5
#define baudRate 9600
#define chipSelect 10
#define CCS811_ADDR 0x5B //standaard I²C adres

// Instanties aanmaken van bibliotheken
dht DHT;
TinyGPS gps;
File userFile;
File dataFile;
CCS811 ccs(CCS811_ADDR);
SoftwareSerial gsm(7, 8);
SoftwareSerial gpsSerial(4, 3);
BH1750FVI LichtSensor(BH1750FVI::k_DevModeContLowRes);

// Globale variabelen
int CO2;
int lichtsterkte;
String userName;
byte temperatuur;
byte vochtigheid;
float fmps;
float flat, flon;
unsigned long date, time, start;

void setup() {

  // Led en schakelaar pin instellen
  pinMode(dataSelect, INPUT);
  pinMode(sd, OUTPUT);
  pinMode(gprs, OUTPUT);
  digitalWrite(gprs, HIGH);
  digitalWrite(sd, HIGH);

  // Communicaties starten
  Wire.begin();
  Serial.begin(baudRate);
  gsm.begin(baudRate);
  gpsSerial.begin(baudRate);

  digitalWrite(gprs, LOW);
  digitalWrite(sd, HIGH);

  // Sensors initialiseren
  LichtSensor.begin();
  ccs.begin();

  digitalWrite(gprs, HIGH);
  digitalWrite(sd, LOW);

  // Sd kaart starten
  SD.begin(chipSelect);
  userFile = SD.open("user.txt", FILE_READ);
  userName = userFile.readString();
  userFile.close();
  Serial.println(userName);

  digitalWrite(gprs, LOW);
  digitalWrite(sd, LOW);
}

void loop() {

  GpsData();
  I2cData();
  DHT11();
  DataSerial();

  if (digitalRead(dataSelect) == 1)
  {
    DataSD();
    digitalWrite(gprs, LOW);
    digitalWrite(sd, HIGH);
  }
  else if (digitalRead(dataSelect) == 0)
  {
    // De gsm module opstarten en configureren
    InitGsm();
    digitalWrite(gprs, HIGH);
    digitalWrite(sd, LOW);
  }
}

void DataSerial() {
  //print temperatuur
  Serial.print(temperatuur);
  Serial.println("C  ");
  //print vochtigheid
  Serial.print(vochtigheid);
  Serial.println("%");
  //print lichtsterkte
  Serial.println(lichtsterkte);
  Serial.println(CO2);
  //print breedtegraad
  Serial.println(flat, 6);
  //print lengtegraad
  Serial.println(flon, 6);
  //print datetime
  Serial.print(date);
  Serial.print(" ");
  Serial.println(time + 1000000);
  //print snelheid
  Serial.println(fmps);
  Serial.println();
}

void DataGPRS()
{
  gsm.print("@");
  gsm.print(vochtigheid);
  gsm.print("&");
  gsm.print(temperatuur);
  gsm.print("&");
  gsm.print(lichtsterkte);
  gsm.print("&");
  gsm.print(CO2);
  gsm.print("&");
  gsm.print(flat, 6);
  gsm.print("&");
  gsm.print(flon, 6);
  gsm.print("&");
  gsm.print(date);
  gsm.print(" ");
  gsm.print(time + 1000000);
  gsm.print("&");
  gsm.print(userName);
  gsm.println("$");
  gsm.write(0x1A);
  delay(7000);
}

void DataSD()
{
  SD.begin(chipSelect);
  // Databestand openen
  dataFile = SD.open("datalog.txt", FILE_WRITE);

  // Kijken of bestand bestaat
  if (dataFile) {
    dataFile.print(vochtigheid);
    dataFile.print("&");
    dataFile.print(temperatuur);
    dataFile.print("&");
    dataFile.print(lichtsterkte);
    dataFile.print("&");
    dataFile.print(CO2);
    dataFile.print("&");
    dataFile.print(flat, 6);
    dataFile.print("&");
    dataFile.print(flon, 6);
    dataFile.print("&");
    dataFile.print(date);
    dataFile.print(" ");
    dataFile.print(time + 1000000);
    dataFile.print("&");
    dataFile.print(userName);
    dataFile.close();
  }

  // Als het bestand niet aanwezig is:
  else {
    Serial.println("Error opening datalog.txt");
    while (!SD.open("datalog.txt", FILE_WRITE) && digitalRead(dataSelect) == 1) {
      BlinkLeds();
    }
  }
}

// Lees alle data van de gps
void GpsData()
{
  start = millis();
  do
  {
    while (gpsSerial.available())
      gps.encode(gpsSerial.read());
  } while (millis() - start < 1000);

  gps.f_get_position(&flat, &flon);
  gps.get_datetime(&date, &time);
  fmps = gps.f_speed_mps();
}

// Lees alle data van de I2c bus
void I2cData()
{
  // Wacht tot er databeschikbaar is
  while (!ccs.dataAvailable()) {  }
  // Laat ccs CO2 waarde berekenen
  ccs.readAlgorithmResults();
  // Vraag CO2 waarde op
  CO2 = ccs.getCO2();
  // Leest de resulaten van de sensor in
  lichtsterkte = LichtSensor.GetLightIntensity();
}

// Lees alle data van de dht
void DHT11()
{
  DHT.read11(dht_pin);
  temperatuur = DHT.temperature;
  vochtigheid = DHT.humidity;
}

// Init gsm module
void InitGsm()
{
  gsm.println("AT+CIPSHUT");                      // Zorgt ervoor dat mogelijke gemaakte verbindingen verbroken zijn
  delay(1000);

  gsm.println("AT+CIPMUX=0");                     // Command dat er voor zorgt dat er 1 IP aan de SIM900 wordt toegewezen
  delay(2000);                                      // Wacht 2 seconden om de command door te voeren

  gsm.println("AT+CGATT=1");                     // Controleert of er een internetverbinding tot stand is gebracht
  delay(1000);                                     // Wacht 1 seconde

  gsm.println("AT+CSTT=\"mworld.be\",\"\",\"\"");// acces point name instellen om toegang te krijgen tot het mobiele netwerk van de provider
  delay(5000);                                     // wacht 5 seconden om de instelling door te voeren naar de SIM900

  gsm.println();                                 // Print een lege lijn naar de SIM900
  gsm.println("AT+CIICR");                       // Checkt of er krediet of een dataplan op de SIM kaart staat
  delay(6000);                                     // wacht 6 seconden om de command door te voeren

  gsm.println("AT+CIFSR");                       // Command om het IP adress van de SIM900 te verkrijgen
  delay(2000);                                     // Wacht 2 seconden om command door te voeren

  gsm.println("AT+CIPSTART=\"TCP\",\"luchtkwaliteit.ddns.net\",\"350\"");   // Maakt verbinding met de server met publieke Ruben IP: 84.197.109.181 Arthur: luchtkwaliteit.ddns.net aan poort 350.
  delay(5000);                                    // Wacht 5 seconden om de verbinding te maken

  gsm.println("AT+CIPSEND");                    // Deze command wordt gebruikt om de data naar de server te sturen
  delay(2000);                                    // Wacht 2 seconden om de command door te voeren

  DataGPRS();
  delay(3000);                                    // Wacht 3 seconden
  gsm.println("AT+CIPCLOSE");                   // Communicatie wordt gesloten na het verzenden van de data

  gsm.println("AT+CIPSHUT");                    // Zorgt ervoor dat de connectie met de server zeker gesloten wordt.
  delay(1000);                                    // Wacht 1 seconde
}

// Blink leds
void BlinkLeds() {
  digitalWrite(sd, HIGH);
  digitalWrite(gprs, HIGH);
  delay(250);
  digitalWrite(sd, LOW);
  digitalWrite(gprs, LOW);
  delay(250);
}
