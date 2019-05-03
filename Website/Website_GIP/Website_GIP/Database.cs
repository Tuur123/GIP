/*
File: Database.cs
Project: Website
Function: database communication class
Authors: Arthur d'Hooge, Ruben Socquet
Project: GIP 2019

2018-2019
Kalmthout
*/

using System;
using System.Collections.Generic;
using System.Data.OleDb;
using Newtonsoft.Json;

public class Database
{
    //private readonly string connString = @"Provider = Microsoft.ACE.OLEDB.12.0; Data Source = C:\Users\arthur.dhooge\Documents\GitHub\GIP\Website\Website_GIP\Website_GIP\Database.mdb;Persist Security Info = False;";
    //666private readonly string connString = @"Provider = Microsoft.ACE.OLEDB.12.0; Data Source = C:\Users\5TICT socquet\Documents\GIP\GIP-hub\Website\Website_GIP\Website_GIP\Database.mdb;Persist Security Info = False;";
    private readonly string connString = @"Provider = Microsoft.ACE.OLEDB.12.0; Data Source = C:\Users\leerling\Documents\GitHub\GIP\Website\Website_GIP\Website_GIP\Database.mdb;Persist Security Info = False;";
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

    public void AddSD(string data)
    {
        string DataString = data;

        string[] DataArray;

        //split string from DATALOG.txt
        DataArray = DataString.Split(new char[] { '&' });

        for (int x = 0; x < DataArray.Length - 1; x++)
        {
            if (DataArray[x + 6].Length >= 12)
            {
                DataArray[x + 6] = DataArray[x + 6].Insert(2, "-");
                DataArray[x + 6] = DataArray[x + 6].Insert(5, "-");
                DataArray[x + 6] = DataArray[x + 6].Insert(11, ":");
                DataArray[x + 6] = DataArray[x + 6].Insert(14, ":");
                DataArray[x + 6] = DataArray[x + 6].Insert(17, ":");
            }

            DataToDB(DataArray[x], DataArray[x + 1], DataArray[x + 2], DataArray[x + 3], DataArray[x + 4], DataArray[x + 5], DataArray[x + 6], DataArray[x + 7]);
            x = x + 7;
        }
    }

    public void DataToDB(string vochtigheid, string temperatuur, string lichtsterkte, string CO2, string breedtegraad, string lengtegraad, string time, string user)
    {
        OleDbConnection connection = new OleDbConnection();

        try
        {
            connection.ConnectionString = connString;
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
        UserData userData = new UserData();
        Chart chart = new Chart();

        List<Feature> features = new List<Feature>();
        List<string> tijd = new List<string>();
        List<double> vocht = new List<double>();
        List<double> temp = new List<double>();
        List<int> licht = new List<int>();
        List<int> co2 = new List<int>();

        string query = string.Format("SELECT Breedtegraad, Lengtegraad, Gebruiker, Vochtigheid, Temperatuur, CO2, Lichtsterkte, Tijd FROM Waardes WHERE Gebruiker='{0}'", name);
        string json = "";
        
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

            string[] data = new string[8];
            string desc;

            while (reader.Read())
            {
                List<double> coords = new List<double>();

                for (int x = 0; x < 8; x++)
                {    
                    // Lat, Long, User, Vochtigheid, Temp, CO2, Licht, Time
                    data[x] = reader[x].ToString();                   
                }

                data[0] = data[0].Replace('.', ',');
                data[1] = data[1].Replace('.', ',');

                coords.Add(Convert.ToDouble(data[1]));
                coords.Add(Convert.ToDouble(data[0]));

                vocht.Add(Convert.ToDouble(data[3]));
                temp.Add(Convert.ToDouble(data[4]));
                co2.Add(Convert.ToInt32(data[5]));
                licht.Add(Convert.ToInt32(data[6]));
                tijd.Add(data[7]);

                desc = string.Format(@"Temperatuur: {1} <br/>Vochtigheid: {0} <br/>CO²: {2} <br/>Lichtsterkte: {3} <br/>Tijd van meting: {4}", data[3], data[4], data[5], data[6], data[7]);
                
                Properties properties = new Properties
                {
                    description = desc,
                    title = "Gemeten door: " + data[2]
                };
                Geometry geometry = new Geometry
                {
                    type = "Point",
                    coordinates = coords
                };
                Feature feature = new Feature
                {
                    type = "Feature",
                    properties = properties,
                    geometry = geometry
                };
                features.Add(feature);
            }
            connection.Close();

            chart.CO2 = co2;
            chart.Licht = licht;
            chart.Temp = temp;
            chart.Tijd = tijd;
            chart.Vocht = vocht;
            userData.chart = chart;
            userData.features = features;

            json = JsonConvert.SerializeObject(userData, Formatting.Indented);
        }
        catch (Exception e)
        {
            Console.WriteLine(e.Message);
            return json;
        }
        return json;
    }

    protected  internal class Geometry
    {
        public string type { get; set; }
        public List<double> coordinates { get; set; }
    }

    protected internal class Properties
    {
        public string title { get; set; }
        public string description { get; set; }
    }

    protected internal class Feature
    {
        public string type { get; set; }
        public Geometry geometry { get; set; }
        public Properties properties { get; set; }
    }

    protected internal class Chart
    {
        public List<string> Tijd { get; set; }
        public List<int> CO2 { get; set; }
        public List<double> Vocht { get; set; }
        public List<double> Temp { get; set; }
        public List<int> Licht { get; set; }
    }

    protected internal class UserData
    {
        public string type = "FeatureCollection";
        public List<Feature> features { get; set; }
        public Chart chart { get; set; }
    }
}
