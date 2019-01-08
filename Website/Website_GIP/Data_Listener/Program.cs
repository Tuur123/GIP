using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net.Sockets;
using System.Net;
using System.Threading.Tasks;
using System.Threading;
using System.Data.OleDb;

namespace Data_Listener
{
    class Program
    {
        static void Main(string[] args)
        {
            //code om met meerdere clients te communiceren
            while (true)
            {
                try
                {
                    TcpListener serverSocket = new TcpListener(350);
                    int verzoekTeller = 0;
                    TcpClient clientSocket = default(TcpClient);

                    serverSocket.Start();
                    Console.WriteLine(" >> Service beschikbaar.");
                    clientSocket = serverSocket.AcceptTcpClient();
                    Console.WriteLine(" >> Verbinding met cliënt aanvaarden.");

                    verzoekTeller = 0;

                    verzoekTeller += 1;
                    NetworkStream netwerkStream = clientSocket.GetStream();
                    byte[] bytesIn = new byte[100025];

                    netwerkStream.Read(bytesIn, 0, (int)clientSocket.ReceiveBufferSize);

                    string clientData = System.Text.Encoding.ASCII.GetString(bytesIn);
                    clientData = clientData.Substring(0, clientData.IndexOf("$"));
                    string[] data = clientData.Split(new char[] { '&' });

                    Console.WriteLine(" >> Data ontvangen van client: {0} {1}", data[0], data[1]);

                    netwerkStream.Flush();

                    Console.WriteLine(" >> " + clientData);
                    clientSocket.Close();
                    serverSocket.Stop();
                }
                catch (Exception error)
                {
                    Console.WriteLine(error.ToString());
                }
                //en hun data in database te zetten
            }
        }   
    }
}
