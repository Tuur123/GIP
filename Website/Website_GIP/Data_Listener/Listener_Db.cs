using System;
using System.Data.OleDb;

public class Database_Listener
{
    private readonly string connString = @"Provider = Microsoft.ACE.OLEDB.12.0; Data Source = ..\Database.accdb; Persist Security Info = False;";
    private readonly string connStringArthur = @"Provider = Microsoft.ACE.OLEDB.12.0; Data Source = C:\Users\arthur.dhooge\Desktop\Database.mdb; Persist Security Info = False;";
    private readonly string connStringRuben = @"Provider = Microsoft.ACE.OLEDB.12.0; Data Source = C:\Users\5TICT socquet\Documents\GIP\GIP-hub\Website\Website_GIP\Website_GIP\Database.mdb;Persist Security Info = False;";

    public void AddData(string vochtigheid, string temperatuur, string lichtsterkte, string CO2, string breedtegraad, string lengtegraad, string time, string user)
    {
        OleDbConnection connection = new OleDbConnection();

        try
        {
            connection.ConnectionString = connStringRuben;
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

