/*  
  Connecties met Arduino UNO:
  VCC  <-> 3V3
  GND  <-> GND
  SDA  <-> A4/SDA 
  SCL  <-> A5/SCL
  ADR  <-> GND
*/

#include <BH1750FVI.h>                                 // Voegt de bibliotheek van de sensor toe

BH1750FVI LichtSensor(BH1750FVI::k_DevModeContLowRes); // Maakt het object LichtSensor aan

void setup() 
{
  Serial.begin(9600);                                  
  LichtSensor.begin();                                // Hier hoeft geen Baud rate ingesteld te worden want dit gebuirt automatisch 
}

void loop()
{
  uint16_t lux = LichtSensor.GetLightIntensity();    // Leest de resulaten van de sensor in
  Serial.print("Lichtsterkte: ");
  Serial.println(lux);
  delay(250);
}
