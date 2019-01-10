#include <TinyGPS++.h>                         // Voegt de "TinyGPS++" bibliotheek toe
#include <SoftwareSerial.h>                    // Voegt de "SoftwareSerial" bibliotheek toe

TinyGPSPlus gps;                               // Maakt een object aan genaamd "gps"

SoftwareSerial gpsCommunicatie(4, 3);          // Declareert poort 4 als TX pin en poort 3 als RX pin

void setup()
{   
  Serial.begin(9600);                          // Stelt seriële communicatie met seriële monitor in op 9600 Baud
  gpsCommunicatie.begin(9600);                 // Stelt de communicatie met de gps mudule in op 9600 Baud
}
void loop()
{
   while (gpsCommunicatie.available() > 0)     // Doorloopt de while loop wanneer er communicatie met de NEO-6M aanweig is
   {
    gps.encode(gpsCommunicatie.read());        // Leest de coördinaten van de gps in en encodeert deze naar gewone coördinaten
    if (gps.location.isUpdated())              // Doorloopt de if loop wanneer er een nieuwe locatie is
    {
      Serial.print("Latitude= ");
      Serial.print(gps.location.lat(), 6);
      Serial.print(" Longitude= "); 
      Serial.println(gps.location.lng(), 6);
    }
  }
}
