#include "dht.h"
#define dht_dpin 6 // Analog Pin sensor is connected to
#include <BH1750FVI.h>                                 // Voegt de bibliotheek van de sensor toe
#include <Wire.h>
#include <SparkFunCCS811.h>
#define CCS811_ADDR 0x5B //standaard I²C adres
#include <TinyGPS.h>                         // Voegt de "TinyGPS++" bibliotheek toe
#include <SoftwareSerial.h>                    // Voegt de "SoftwareSerial" bibliotheek toe

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
