#include "dht.h"
#define dht_dpin 6 // Analog Pin sensor is connected to
#include <BH1750FVI.h>                                 // Voegt de bibliotheek van de sensor toe
#include <Wire.h>
#include <SparkFunCCS811.h>
#define CCS811_ADDR 0x5B //standaard I²C adres
#include <TinyGPS.h>                         // Voegt de "TinyGPS++" bibliotheek toe
#include <SoftwareSerial.h>                    // Voegt de "SoftwareSerial" bibliotheek toe

SoftwareSerial myGsm(7, 8);                        // Stelt in dat de SIM900 verbonden is met de pinnen 7 en 8

TinyGPS gps;                               // Maakt een object aan genaamd "gps"
SoftwareSerial ss(4, 3);          // Declareert poort 4 als TX pin en poort 3 als RX pin

CCS811 ccs(CCS811_ADDR); //ccs object aanmaken met standaard I²C adres
BH1750FVI LichtSensor(BH1750FVI::k_DevModeContLowRes); // Maakt het object LichtSensor aan
 
dht DHT;

String temperatuur;
String vochtigheid;
String lichtsterkte;
String CO2;
void smartdelay(unsigned long ms);
void print_float(float val, float invalid, int len, int prec);
float flat, flon;
unsigned long age;
 
void setup(){
 
  Serial.begin(9600);
  myGsm.begin(9600);                               // Verbinding met SIM900 instellen op 9600 Baud
  ss.begin(9600);
  LichtSensor.begin();
  Wire.begin(); //start I²C bus
  CCS811Core::status returnCode = ccs.begin();
  delay(500);//Delay to let system boot
    
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
 
}//end "setup()"
 
void loop()
{
  smartdelay(4000);
  getcoordinates();
  BH1750();
  CCS_811();
  DHT11();
  printData();
  //senddata();
}
void DHT11()
{
    DHT.read11(dht_dpin);

    temperatuur = DHT.temperature;
    vochtigheid = DHT.humidity;
}
void BH1750()
{
  lichtsterkte = LichtSensor.GetLightIntensity();    // Leest de resulaten van de sensor in
}
void CCS_811()
{
    //kijken of er data beschikbaar is
  if (ccs.dataAvailable())
  {  
    //Laat sensor CO2 waardes en tVOC waardes berekenen
    ccs.readAlgorithmResults();
    
    //vraag CO2 waarde
    CO2 = ccs.getCO2();
  }
}
void getcoordinates()
{
  gps.f_get_position(&flat, &flon, &age);
  
  smartdelay(1000);
}
void smartdelay(unsigned long ms)
{
  unsigned long start = millis();
  do 
  {
    while (ss.available())
      gps.encode(ss.read());
  } while (millis() - start < ms);
}
void senddata()
{
  myGsm.println("AT+CIPSHUT");                      // Zorgt ervoor dat mogelijke gemaakte verbindingen verbroken zijn
  delay(1000);                                      // Wacht 2 seconden
  printSerialData();                                // Gaat naar de "printSerialData" methode

  myGsm.println("AT+CIPMUX=0");                     // Command dat er voor zorgt dat er 1 IP aan de SIM900 wordt toegewezen
  delay(2000);                                      // Wacht 2 seconden om de command door te voeren 
  printSerialData();                                // Ga naar de "printSerialData" methode

  myGsm.println("AT+CGATT=1");                     // Controleert of er een internetverbinding tot stand is gebracht
  delay(1000);                                     // Wacht 1 seconde
  printSerialData();                               // Ga naar de "printSerialData" methode


  myGsm.println("AT+CSTT=\"mworld.be\",\"\",\"\"");// acces point name instellen om toegang te krijgen tot het moebiele netwerk van de provider
  delay(5000);                                     // wacht 5 seconden om dinstelling door te voeren naar de SIM900
  printSerialData();                               // ga naar de "printSerialData" methode

  myGsm.println();                                 // Print een lege lijn naar de SIM900
  myGsm.println("AT+CIICR");                       // Checkt of er krediet of een dataplan op de SIM kaart staat
  delay(6000);                                     // wacht 6 seconden om de command door te voeren
  printSerialData();                               // ga naar de "printSerialData" methode

  myGsm.println("AT+CIFSR");                       // Command om het IP adress van de SIM900 te verkrijgen
  delay(2000);                                     // Wacht 2 seconden om command door te voeren
  printSerialData();                               // Gaat naar de "printSerialData()" methode

  myGsm.println("AT+CIPSTART=\"TCP\",\"84.197.109.181\",\"350\"");   // Maakt verbinding met de server met publieke IP: 84.197.109.181 aan poort 350.
  delay(5000);                                    // Wacht 5 seconden om de verbinding te maken
  printSerialData();                              // Gaat naar de "printSerialData" methode                                    

  myGsm.println("AT+CIPSEND");                    // Deze command wordt gebruikt om de data naar de server te sturen
  delay(2000);                                    // Wacht 2 seconden om de command door te voeren
  printSerialData();                              // Gaat naar de "printSerialData" methode
 
  sendData();                                     // Gaat naar de "sendtemp" methode
  delay(3000);                                    // Wacht 3 seconden
  myGsm.println("AT+CIPCLOSE");                   // Communicatie wordt gesloten na het verzenden van de data
  printSerialData();                              // Gaat naar de "printSerialData" methode

  myGsm.println("AT+CIPSHUT");                    // Zorgt ervoor dat de connectie met de server zeker gesloten wordt.
  delay(1000);                                    // Wacht 1 seconde
  printSerialData();                              // Gaat naar de "printSerialData" methode
}
void printSerialData()                            
{
  while (myGsm.available() != 0)                  // Wanneer er van de SIM900 iets wordt teruggestuurd wordt deze while loop doorlopen
    Serial.write(myGsm.read());                   // Print de data van de SIM900 naar de seriële monitor
}

void sendData()
{
    myGsm.print(vochtigheid);
    myGsm.print("&");
    myGsm.print(temperatuur); 
    myGsm.print("&");
    myGsm.print(lichtsterkte);
    myGsm.print("&");
    myGsm.print(CO2);
    myGsm.print("&");  
    myGsm.print(flat, 6);
    myGsm.print("&");
    myGsm.print(flon, 6); 
    myGsm.print("&");
    myGsm.println("Ruben$");
    
    myGsm.write(0x1A);
    delay(7000);
}

void printData()
{
  //print temperatuur
    Serial.print("Temperatuur = ");
    Serial.print(temperatuur);
    Serial.println("C  ");
  //print vochtigheid
    Serial.print("Vochtigheid = ");
    Serial.print(vochtigheid); 
    Serial.println("%");
  //print lichtsterkte 
    Serial.print("Lichtsterkte: ");
    Serial.println(lichtsterkte);
  //print CO² waarde
    Serial.print("CO² waarde = ");
    Serial.println(CO2);
  //print breedtegraad
    Serial.print("breedtegraad = ");
    Serial.println(flat,6);
  //print lengtegraad
    Serial.print("lengtegraad = ");
    Serial.println(flon,6);
}
