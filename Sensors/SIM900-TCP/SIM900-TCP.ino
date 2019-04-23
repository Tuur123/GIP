#include <SoftwareSerial.h>                        // Voegt de "SoftwareSerial" bibliotheek toe om te kunnen comuniceren met de SIM900
SoftwareSerial myGsm(7, 8);                        // Stelt in dat de SIM900 verbonden is met de pinnen 7 en 8

void setup()
{
  myGsm.begin(9600);                               // Verbinding met SIM900 instellen op 9600 Baud
  Serial.begin(9600);                              // Verbinding met seriële monitor instellen op 9600 Baud
  delay(500);                                      // Wacht een halve seconde om instellingen door te voeren
}

void loop()
{
  senddata();                                      // Gaat naar de "senddata" methode
  delay(5000);                                     // Wacht 5 seconden tot volgende stap
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
 
  //sendtemp();                                     // Gaat naar de "sendtemp" methode
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

void sendtemp()
{
    //DHT.read11(dht_dpin);
    
    Serial.print("Current humidity = ");
    //Serial.print(DHT.humidity);
    Serial.print("%  ");
    Serial.print("temperature = ");
    //Serial.print(DHT.temperature); 
    Serial.println("C");

    myGsm.print("Current humidity = ");
    //myGsm.print(DHT.humidity);
    myGsm.print("%&");
    myGsm.print("temperature = ");
    //myGsm.print(DHT.temperature); 
    myGsm.println("C$");
    
    myGsm.write(0x1A);
    delay(7000);
}
