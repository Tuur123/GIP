using System;
using System.Text;
using System.Data.OleDb;
using System.Security.Cryptography;

public class Database
{
    private string connString = @"Provider = Microsoft.ACE.OLEDB.12.0; Data Source = ..\Database.accdb; Persist Security Info = False;";

    public void AddUser(string name, string password)
    {

    }

    public void AddData(string vochtigheid, string temperatuur, string lichtsterkte, string CO2, string breedtegraad, string lengtegraad, string user)
    {
        OleDbConnection connection = new OleDbConnection();
        DateTime Tijd = DateTime.Now;

        try
        {
            connection.ConnectionString = @"Provider = Microsoft.ACE.OLEDB.12.0; Data Source = C:\Users\5TICT socquet\Documents\GIP\GIP-hub\Website\Website_GIP\Website_GIP\Database.accdb;Persist Security Info = False;";
            connection.Open();
            OleDbCommand command = new OleDbCommand();
            command.Connection = connection;
            command.CommandText = "INSERT INTO Waardes(Vochtigheid, Temperatuur, CO2, Lichtsterkte, Gebruiker, Tijd, Breedtegraad, lengtegraad) VALUES ('" + vochtigheid + "','" + temperatuur + "','" + CO2 + "','" + lichtsterkte + "','" + user + "','" + Tijd.ToString() + "','" + breedtegraad + "','" + lengtegraad + "');";

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
