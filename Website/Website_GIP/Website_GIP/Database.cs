﻿using System;
using System.Data.OleDb;

public class Database
{
    private readonly string connString = @"Provider = Microsoft.ACE.OLEDB.12.0; Data Source = ..\Database.accdb; Persist Security Info = False;";
    
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
        string query = string.Format("SELECT Hash, Naam FROM Users WHERE Naam ='{0}'", name);
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

    public string[] GetUserData(string name)
    {
        //string query = string.Format("SELECT Locatie, Vochtigheid, Temperatuur, CO2, Lichtsterke, Tijd FROM Waardes WHERE id=860", name);
        string query = string.Format("SELECT Breedtegraad, Lengtegraad, Gebruiker, Vochtigheid, Temperatuur, CO2, Lichtsterkte, Tijd FROM Waardes WHERE Gebruiker='{0}'", name);

        string[] result = new string[8];

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
                for (int x = 0; x < 8; x++)
                {
                    result[x] = reader[x].ToString();
                }                                                         
            }
            connection.Close();
        }
        catch (Exception e)
        {
            Console.WriteLine(e.Message);

            return result;
        }

        return result;
    }
}
