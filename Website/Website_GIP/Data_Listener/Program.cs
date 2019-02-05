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
            Database db = new Database();

            //code om met meerdere clients te communiceren
            while (true)
            {
                try
                {
                    TcpListener serverSocket = new TcpListener(IPAddress.Any, 350);
                    int verzoekTeller = 0;
                    TcpClient clientSocket = default(TcpClient);
                    serverSocket.Stop();
                    serverSocket.Start();
                    //Console.WriteLine(" >> Service beschikbaar.");
                    clientSocket = serverSocket.AcceptTcpClient();
                    //Console.WriteLine(" >> Verbinding met cliënt aanvaarden.");
                    verzoekTeller = 0;

                    verzoekTeller += 1;
                    NetworkStream netwerkStream = clientSocket.GetStream();
                    byte[] bytesIn = new byte[100025];

                    netwerkStream.Read(bytesIn, 0, (int)clientSocket.ReceiveBufferSize);

                    string clientData = System.Text.Encoding.ASCII.GetString(bytesIn);
                    clientData = clientData.Substring(0, clientData.IndexOf("$"));
                    string[] data = clientData.Split(new char[] { '&' });

                    //Console.WriteLine(" >> Data ontvangen van client: \n{0} \n{1} \n{2} \n{3} \n{4} \n{5} \n{6}", data[0], data[1], data[2], data[3], data[4], data[5], data[6]);
                    string vochtigheid = data[0];
                    string temperatuur = data[1];
                    string lichtsterkte = data[2];
                    string CO2 = data[3];
                    string breedtegraad = data[4];
                    string lengtegraad = data[5];
                    string user = data[6];

                    netwerkStream.Flush();

                    //Console.WriteLine(" >> ");
                    clientSocket.Close();
                    serverSocket.Stop();
                    db.AddData(vochtigheid, temperatuur, lichtsterkte, CO2, breedtegraad, lengtegraad, user);
                }
                catch (NotSupportedException error)
                {
                    Console.WriteLine(error.Message);
                }
            }
        }   
    }
}
