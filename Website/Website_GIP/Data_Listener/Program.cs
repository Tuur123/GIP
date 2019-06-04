/*
File: Program.cs
Project: Listener
Funcion: database communication program
Authors: Arthur d'Hooge, Ruben Socquet
Project: GIP 2019

2018-2019
Kalmthout
*/

using System;
using System.Text;
using System.Net.Sockets;
using System.Net;
using Newtonsoft.Json;
using System.Net.Http;
using System.Data.OleDb;

namespace Website_GIP
{
    class Program
    {
        static void Main(string[] args)
        {            
            bool dataCorrupt = false;

            while (true)
            {
                try
                {                  
                    TcpListener serverSocket = new TcpListener(IPAddress.Any, 350);
                    TcpClient clientSocket = default(TcpClient);
                    serverSocket.Stop();
                    serverSocket.Start();

                    Console.WriteLine(" >> Service beschikbaar.");
                    clientSocket = serverSocket.AcceptTcpClient();

                    Console.WriteLine(" >> Verbinding met cliënt aanvaarden.");

                    NetworkStream netwerkStream = clientSocket.GetStream();
                    byte[] bytesIn = new byte[clientSocket.ReceiveBufferSize];

                    netwerkStream.Read(bytesIn, 0, clientSocket.ReceiveBufferSize);

                    string clientData = Encoding.ASCII.GetString(bytesIn);
                    
                    //string clientData = "@vochtigheid&temp&licht&CO2&51,392574&4,474912&010619 15164200&arthur$";
                    clientData = clientData.TrimStart('@');
                    clientData = clientData.Substring(0, clientData.IndexOf("$"));
                    string[] data = clientData.Split(new char[] { '&' });

                    foreach (string str in data)
                    {
                        if (str == null)
                        {
                            dataCorrupt = true;
                            break;
                        }
                    }

                    if (!dataCorrupt)
                    {
                        try
                        {
                            Console.WriteLine(" >> Data ontvangen van client: {0} {1} {2} {3} {4} {5} {6}", data[0], data[1], data[2], data[3], data[4], data[5], data[6]);
                            string vochtigheid = data[0];
                            string temperatuur = data[1];
                            string lichtsterkte = data[2];
                            string CO2 = data[3];
                            string breedtegraad = data[4].Replace('.', ',');
                            string lengtegraad = data[5].Replace('.', ',');

                            if (data[6].Length >= 12)
                            {
                                data[6] = data[6].Insert(1, "-");
                                data[6] = data[6].Insert(4, "-");
                                data[6] = data[6].Insert(10, ":");
                                data[6] = data[6].Insert(13, ":");
                                data[6] = data[6].Insert(16, ":");
                            }
                            string time = data[6];
                            string user = data[7];

                            // START API QUERY
                            string query = string.Format("json?key=2dacfb3978c248c497fffefc37f76ca4&q={0}%2C+{1}&pretty=1&no_annotations=1", breedtegraad, lengtegraad);
                            string result;

                            Console.WriteLine("Making API Call...");
                            Gemeente.GemeenteData gm = new Gemeente.GemeenteData();

                            using (var client = new HttpClient(new HttpClientHandler { AutomaticDecompression = DecompressionMethods.GZip | DecompressionMethods.Deflate }))
                            {
                                client.BaseAddress = new Uri("https://api.opencagedata.com/geocode/v1/");
                                HttpResponseMessage response = client.GetAsync(query).Result;
                                response.EnsureSuccessStatusCode();
                                result = response.Content.ReadAsStringAsync().Result;
                            }
                            JsonConvert.PopulateObject(result, gm);
                            // END API QUERY

                            string gemeente = gm.results[0].components.postcode;
                            Console.WriteLine(">> Plaats: {0}", gemeente);

                            AddData(vochtigheid, temperatuur, lichtsterkte, CO2, breedtegraad, lengtegraad, time, user, gemeente);
                        }
                        catch (Exception error)
                        {
                            Console.WriteLine(error);
                        }
                    }
                    else
                    {
                        Console.WriteLine(">> Data corrupt: {0} {1} {2} {3} {4} {5} {6}", data[0], data[1], data[2], data[3], data[4], data[5], data[6]);
                    }
                    
                    netwerkStream.Flush();

                    Console.WriteLine(" >> ");
                    clientSocket.Close();
                    serverSocket.Stop();
                    
                }
                catch (Exception error)
                {
                    Console.WriteLine(error.Message);
                }
            }
        }

        static void AddData(string vochtigheid, string temperatuur, string lichtsterkte, string CO2, string breedtegraad, string lengtegraad, string time, string user, string gemeente)
        {
             //string connString = @"Provider = Microsoft.ACE.OLEDB.12.0; Data Source = C:\Users\Arthur\Documents\GitHub\GIP\Website\Website_GIP\Website_GIP\Database.mdb;Persist Security Info = False;";
             string connString = @"Provider = Microsoft.ACE.OLEDB.12.0; Data Source = C:\Users\5TICT socquet\Documents\GIP\GIP-hub\Website\Website_GIP\Website_GIP\Database.mdb;Persist Security Info = False;";
             //string connString = @"Provider = Microsoft.ACE.OLEDB.12.0; Data Source = C:\Users\leerling\Documents\GitHub\GIP\Website\Website_GIP\Website_GIP\Database.mdb;Persist Security Info = False;";
             OleDbConnection connection = new OleDbConnection();

            try
            {
                connection.ConnectionString = connString;
                connection.Open();
                OleDbCommand command = new OleDbCommand
                {
                    Connection = connection,
                    CommandText = string.Format("INSERT INTO Waardes(Vochtigheid, Temperatuur, CO2, Lichtsterkte, Gebruiker, Tijd, Breedtegraad, lengtegraad, Gemeente) VALUES ('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}');", vochtigheid, temperatuur, CO2, lichtsterkte, user, time, breedtegraad, lengtegraad, gemeente)
                };

                command.ExecuteNonQuery();
            }
            catch (OleDbException error)
            {
                Console.WriteLine(error.ToString());
            }
            finally
            {
                connection.Close();
            }
        }
    }
}
