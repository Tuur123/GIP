using System;
using System.Text;
using System.Data.OleDb;

public class Database
{
    private readonly string connString = @"Provider = Microsoft.ACE.OLEDB.12.0; Data Source = C:\Users\leerling\Documents\GitHub\GIP\Website\Website_GIP\Website_GIP\Database.accdb; Persist Security Info = False;";

    public Database()
	{

	}

    public void AddUser(string hash, string name)
    {
        string query = string.Format("INSERT INTO Users(Hash, Naam) VALUES('{0}', '{1}')", hash, name);

        OleDbConnection connection = new OleDbConnection();
        connection.ConnectionString = connString;
        connection.Open();

        OleDbCommand command = new OleDbCommand();
        command.Connection = connection;
        command.CommandText = query;
        command.ExecuteNonQuery();
        connection.Close();
    }

    public string ValidateUser(string name)
    {
        string query = string.Format("SELECT Hash, Naam FROM Users WHERE Naam ='{0}'", name);
        string result = null;

        try
        {
            OleDbConnection connection = new OleDbConnection();
            connection.ConnectionString = connString;
            connection.Open();

            OleDbCommand command = new OleDbCommand();
            command.Connection = connection;
            command.CommandText = query;
            OleDbDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                result = reader[0].ToString();
            }
            connection.Close();
        }
        catch (Exception e)
        {
            return e.Message;
        }
        return result;
    }

    public string[,] getUserData(string name)
    {
        string query = string.Format("SELECT Locatie, Vochtigheid, Temperatuur, CO2, Lichtsterke, Tijd FROM Waardes WHERE Naam ='{0}'", name);
        string[,] result = null;

        try
        {
            OleDbConnection connection = new OleDbConnection();
            connection.ConnectionString = connString;
            connection.Open();

            OleDbCommand command = new OleDbCommand();
            command.Connection = connection;
            command.CommandText = query;
            OleDbDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                int j = 0;
                for (int i = 0; i < 6; i++)
                    result[j, i] = reader[i].ToString();
                j++;                                             
            }
            connection.Close();

            /*nummer        locatie     vochtigheid     temp     c02     lichsterkte     tijd
             * 
             * 1 
             *
             * 2
             * 
             * 3
             * 
             * 4
             * 
             * .
             * .
             * .
             */
        }
        catch (Exception e)
        {
            result[0, 0] = e.Message;
        }

        return result;
    }
}
