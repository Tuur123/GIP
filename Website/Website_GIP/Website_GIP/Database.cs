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
}
