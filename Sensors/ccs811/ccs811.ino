#include <SparkFunCCS811.h>
#include <Wire.h>

#define CCS811_ADDR 0x5B //standaard I²C adres

CCS811 ccs(CCS811_ADDR); //ccs object aanmaken met standaard I²C adres

void setup()
{
  Serial.begin(9600);
  Serial.println("CCS811 Basic Example");
  Wire.begin(); //start I²C bus

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
}

void loop()
{
  //kijken of er data beschikbaar is
  if (ccs.dataAvailable())
  {  
    //Laat sensor CO2 waardes en tVOC waardes berekenen
    ccs.readAlgorithmResults();

    Serial.print("CO2[");
    //vraag CO2 waarde
    Serial.print(ccs.getCO2());
    Serial.print("] tVOC[");
    //vraag tVOC waarde
    Serial.print(ccs.getTVOC());
    Serial.print("]");
    Serial.println();
  }

  delay(10); //Don't spam the I2C bus
}

