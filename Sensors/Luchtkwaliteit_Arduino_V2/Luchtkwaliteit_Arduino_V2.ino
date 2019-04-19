// Bibliotheken
#include <SPI.h>
#include <SD.h>
#include <Wire.h>
#include <TinyGPS.h>
#include <BH1750FVI.h>
#include <SoftwareSerial.h>
#include "dht.h"
#include <SparkFunCCS811.h>

// Constanten definieren
#define CCS811_ADDR 0x5B //standaard I²C adres
#define chipSelect 10
#define dht_pin 6

// Instanties aanmaken van bibliotheken
SoftwareSerial gsm(7, 8);
SoftwareSerial gpsSerial(4, 3);
TinyGPS gps;
CCS811 ccs(CCS811_ADDR);
BH1750FVI LichtSensor(BH1750FVI::k_DevModeContLowRes);
dht DHT;

// Globale variabelen
int CO2;
int lichtsterkte;
byte temperatuur;
byte vochtigheid;
float flat, flon;
unsigned long date, time;
String userName = "Ruben$";

void setup() {

  // Led en schakelaar pin instellen
  pinMode(5, INPUT);
  pinMode(2, OUTPUT);
  pinMode(9, OUTPUT);
  digitalWrite(9, HIGH);
  digitalWrite(2, HIGH);

  // Communicaties starten
  Wire.begin();
  Serial.begin(115200);
  gsm.begin(9600);
  gpsSerial.begin(9600);

  // De gsm module opstarten en configureren
  //InitGsm();

  digitalWrite(9, LOW);
  digitalWrite(2, HIGH);

  // Sensors initialiseren
  LichtSensor.begin();
  CCS811Core::status returnCode = ccs.begin();

  if (returnCode != CCS811Core::SENSOR_SUCCESS)
  {
    Serial.println(".begin() returned with an error.");
    switch ( returnCode )
    {
      case CCS811Core::SENSOR_SUCCESS:
        Serial.print("SUCCESS");
        break;
      case CCS811Core::SENSOR_ID_ERROR:
        Serial.print("ID_ERROR");
        break;
      case CCS811Core::SENSOR_I2C_ERROR:
        Serial.print("I2C_ERROR");
        break;
      case CCS811Core::SENSOR_INTERNAL_ERROR:
        Serial.print("INTERNAL_ERROR");
        break;
      case CCS811Core::SENSOR_GENERIC_ERROR:
        Serial.print("GENERIC_ERROR");
        break;
      default:
        Serial.print("Unspecified error.");
    }
    while (1);
  }

  digitalWrite(9, HIGH);
  digitalWrite(2, LOW);

  // Sd kaart starten
  if (!SD.begin(chipSelect)) {
    Serial.println("Card failed, or not present");
    // Blijf hangen bij een probleem
  }
  
  digitalWrite(9, LOW);
  digitalWrite(2, LOW);
}

void loop() {

  GpsData();
  I2cData();
  DHT11();
  DataSerial();

  if (digitalRead(5) == 1)
  {
    DataSD();
    digitalWrite(9, LOW);
    digitalWrite(2, HIGH);
  }
  else if (digitalRead(5) == 0)
  {
    DataGPRS();
    digitalWrite(2, LOW);
    digitalWrite(9, HIGH);
  }
}

void DataSerial() {
  //print temperatuur
  Serial.print("Temperatuur = ");
  Serial.print(temperatuur);
  Serial.println("C  ");
  //print vochtigheid
  Serial.print("Vochtigheid = ");
  Serial.print(vochtigheid);
  Serial.println("%");
  //print lichtsterkte
  Serial.print("Lichtsterkte= ");
  Serial.println(lichtsterkte);
  Serial.print("CO₂ waarde = ");
  Serial.println(CO2);
  Serial.print("breedtegraad = ");
  Serial.println(flat, 6);
  //print lengtegraad
  Serial.print("lengtegraad = ");
  Serial.println(flon, 6);
  Serial.print(date);
  Serial.print(" ");
  Serial.println(time + 1000000);
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
  gsm.println(userName);
  gsm.write(0x1A);
  delay(7000);
}

void DataSD()
{
  // SPI bus starten
  if (SD.begin(chipSelect)) {

    // File object maken om te kunnen schrijven
    File dataFile = SD.open("datalog.txt", FILE_WRITE);

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
      while (!SD.open("datalog.txt", FILE_WRITE) && digitalRead(5) == 1) {
        PulseLeds();
      }
    }
  }

  // Als er geen communicatie is met de chip:
  else
  {
    while (!SD.begin(chipSelect) && digitalRead(5) == 1) {
      PulseLeds();
    }
  }
}

void GpsData()
{
  unsigned long start = millis();
  do
  {
    while (gpsSerial.available())
      gps.encode(gpsSerial.read());
  } while (millis() - start < 1000);

  gps.f_get_position(&flat, &flon);
  gps.get_datetime(&date, &time);
}

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

void DHT11()
{
  DHT.read11(dht_pin);
  temperatuur = DHT.temperature;
  vochtigheid = DHT.humidity;
}

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

  gsm.println("AT+CIPSTART=\"TCP\",\"thuisnetwerk.ddns.net\",\"350\"");   // Maakt verbinding met de server met publieke IP: 84.197.109.181 aan poort 350.
  delay(5000);                                    // Wacht 5 seconden om de verbinding te maken

  gsm.println("AT+CIPSEND");                    // Deze command wordt gebruikt om de data naar de server te sturen
  delay(2000);                                    // Wacht 2 seconden om de command door te voeren
}

void PulseLeds() {
  digitalWrite(2, HIGH);
  digitalWrite(9, HIGH);
  delay(250);
  digitalWrite(2, LOW);
  digitalWrite(9, LOW);
  delay(250);
}
