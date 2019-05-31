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

namespace Data_Listener
{
    class Program
    {
        static void Main(string[] args)
        {
            Database_Listener db = new Database_Listener();

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
                    clientData = clientData.TrimStart('@');
                    clientData = clientData.Substring(0, clientData.IndexOf("$"));
                    string[] data = clientData.Split(new char[] { '&' });

                    foreach(string str in data)
                    {
                        if (str == "" || str == null)
                        {
                            Console.Write(str + "   ");
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
                                data[6] = data[6].Insert(2, "-");
                                data[6] = data[6].Insert(5, "-");
                                data[6] = data[6].Insert(11, ":");
                                data[6] = data[6].Insert(14, ":");
                                data[6] = data[6].Insert(17, ":");
                            }
                            string time = data[6];
                            string user = data[7];

                            db.AddData(vochtigheid, temperatuur, lichtsterkte, CO2, breedtegraad, lengtegraad, time, user);
                        }
                        catch(Exception error)
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
    }
}
