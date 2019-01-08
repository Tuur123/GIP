using System;
using System.Text;
using System.Data.OleDb;
using System.Security.Cryptography;

public class Database
{
    private string conString = @"Provider = Microsoft.ACE.OLEDB.12.0; Data Source = ..\Database.accdb; Persist Security Info = False;";

    public Database()
	{

	}

    public void AddUser(string name, string password)
    {

    }

    public void AddData(string co2, string temperatuur, string locatie, string vochtigheid)
    {

    }
}
