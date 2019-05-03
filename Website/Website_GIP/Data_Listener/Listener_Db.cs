/*
File: Program.cs
Project: Listener
Funcion: database communication class
Authors: Arthur d'Hooge, Ruben Socquet
Project: GIP 2019

2018-2019
Kalmthout
*/

using System;
using System.Data.OleDb;

public class Database_Listener
{
    private readonly string connStringArthur = @"Provider = Microsoft.ACE.OLEDB.12.0; Data Source = C:\Users\Arthur\Documents\GitHub\Gip\Website\Website_GIP\Website_GIP\Database.mdb; Persist Security Info = False;";
    private readonly string connStringRuben = @"Provider = Microsoft.ACE.OLEDB.12.0; Data Source = C:\Users\5TICT socquet\Documents\GIP\GIP-hub\Website\Website_GIP\Website_GIP\Database.mdb;Persist Security Info = False;";

    public void AddData(string vochtigheid, string temperatuur, string lichtsterkte, string CO2, string breedtegraad, string lengtegraad, string time, string user)
    {
        OleDbConnection connection = new OleDbConnection();

        try
        {
            connection.ConnectionString = connStringArthur;
            connection.Open();
            OleDbCommand command = new OleDbCommand
            {
                Connection = connection,
                CommandText = string.Format("INSERT INTO Waardes(Vochtigheid, Temperatuur, CO2, Lichtsterkte, Gebruiker, Tijd, Breedtegraad, lengtegraad) VALUES ('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}');", vochtigheid, temperatuur, CO2, lichtsterkte, user, time, breedtegraad, lengtegraad)
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

