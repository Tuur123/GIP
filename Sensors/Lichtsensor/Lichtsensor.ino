/*  
  Connecties met Arduino UNO:
  VCC  <-> 3V3
  GND  <-> GND
  SDA  <-> A4/SDA 
  SCL  <-> A5/SCL
  ADR  <-> GND
*/

#include <BH1750FVI.h>

// maak sensor object
BH1750FVI LightSensor(BH1750FVI::k_DevModeContLowRes);

void setup() 
{
  Serial.begin(9600);
  LightSensor.begin();  
}

void loop()
{
  uint16_t lux = LightSensor.GetLightIntensity();
  Serial.print("Lichtsterkte: ");
  Serial.println(lux);
  delay(250);
}
