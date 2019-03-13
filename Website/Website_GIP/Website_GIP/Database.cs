using System;
using System.Collections.Generic;
using System.Data.OleDb;

public class Database
{
    private readonly string connString = @"Provider = Microsoft.ACE.OLEDB.12.0; Data Source = C:\Users\arthur.dhooge\Desktop\Database.mdb; Persist Security Info = False;";

    public Database()
	{

	}

    public void AddUser(string hash, string name)
    {
        string query = string.Format("INSERT INTO Users(Hash, Naam) VALUES('{0}', '{1}')", hash, name);

        OleDbConnection connection = new OleDbConnection();
        connection.ConnectionString = connString;
        connection.Open();

        OleDbCommand command = new OleDbCommand
        {
            Connection = connection,
            CommandText = query
        };
        command.ExecuteNonQuery();
        connection.Close();
    }

    public string ValidateUser(string name)
    {
        string query = string.Format("SELECT Hash FROM Users WHERE Naam ='{0}'", name);
        string result = null;

        try
        {
            OleDbConnection connection = new OleDbConnection();
            connection.ConnectionString = connString;
            connection.Open();

            OleDbCommand command = new OleDbCommand
            {
                Connection = connection,
                CommandText = query
            };
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

    public string GetUserData(string name)
    {
        string query = string.Format("SELECT Breedtegraad, Lengtegraad, Gebruiker, Vochtigheid, Temperatuur, CO2, Lichtsterkte, Tijd FROM Waardes WHERE Gebruiker='{0}'", name);
        int i = 0;

        List<Dataset> datasets = new List<Dataset>();

        try
        {
            OleDbConnection connection = new OleDbConnection();
            connection.ConnectionString = connString;
            connection.Open();

            OleDbCommand command = new OleDbCommand
            {
                Connection = connection,
                CommandText = query
            };
            OleDbDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                string[] data = new string[8];
                for (int x = 0; x < 8; x++)
                {                     
                    data[x] = reader[x].ToString();                   
                }

                Dataset set = new Dataset(i, data);
                datasets.Add(set);
                i++;
            }
            connection.Close();

            foreach(Dataset set in datasets)
            {

            }

        }
        catch (Exception e)
        {
            Console.WriteLine(e.Message);

            return null;
        }
        return json;
    }

    public class Dataset
    {
        public Dataset(int index, string[] data)
        {
            this.index = index;
            this.data = data;
        }

        public int index;
        public string[] data;
    }
}
