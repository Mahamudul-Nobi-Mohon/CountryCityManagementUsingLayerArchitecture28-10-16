using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using CountryCityInformationManagementSystem.DAL;
using CountryCityInformationManagementSystem.Models;

namespace CountryCityInformationManagementSystem.DAL
{
    public class CityGateway:CommonGateway
    {
        public bool SetCityInformation(City city)
        {
            GenarateConnection();
            using (Connection)
            {
                Connection.Open();
                string query = "insert into City values ('" + city.Name + "','" + city.About + "','"
                               + city.NoOfDwellers + "','" + city.Location + "','"
                               + city.Weather + "','" + city.CountryId + "');";
                Command = new SqlCommand(query, Connection);
                try
                {
                    Command.ExecuteNonQuery();
                    Connection.Close();
                    return true;
                }
                catch (Exception)
                {
                    return false;
                }
            }
        }

        public List<string> GetCountryDropdownList()
        {
            List<string> countryNameList = new List<string>();
            GenarateConnection();
            using (Connection)
            {
                Connection.Open();

                string query = "select countryName from Country;";
                Command = new SqlCommand(query, Connection);
                Reader = Command.ExecuteReader();
                while (Reader.Read())
                {
                    countryNameList.Add(Reader[0].ToString());
                }

                Connection.Close();
            }
            return countryNameList;
        }

        public DataSet GetAllCityInformation()
        {
            GenarateConnection();
            DataSet = new DataSet();
            using (Connection)
            {
                Connection.Open();
                Command = new SqlCommand("select * from ViewAllCityWithCountry;", Connection);
                DataAdapter = new SqlDataAdapter(Command);
                DataAdapter.Fill(DataSet);
                Connection.Close();
            }
            return DataSet;
        }
        public DataSet GetSelectedCityInformation(string cityName)
        {
            GenarateConnection();
            DataSet = new DataSet();
            using (Connection)
            {
                Connection.Open();
                Command = new SqlCommand("select * from ViewAllCityWithCountry where cityName='"+cityName+"';", Connection);
                DataAdapter = new SqlDataAdapter(Command);
                DataAdapter.Fill(DataSet);
                Connection.Close();
            }
            return DataSet;
        }
        public DataSet GetSelectedCountryInformation(int countryId)
        {
            GenarateConnection();
            DataSet = new DataSet();
            using (Connection)
            {
                Connection.Open();
                Command = new SqlCommand("select * from ViewAllCityWithCountry where countryId='" + countryId + "';", Connection);
                DataAdapter = new SqlDataAdapter(Command);
                DataAdapter.Fill(DataSet);
                Connection.Close();
            }
            return DataSet;
        }

        public City GetCityByName(string cityName)
        {
            GenarateConnection();
            string query = "SELECT * FROM City WHERE cityName ='" + cityName + "';";;

            Command = new SqlCommand(query, Connection);
            Connection.Open();
            City city = null;
            Reader = Command.ExecuteReader();
            if (Reader.HasRows)
            {
                Reader.Read();
                city = new City();
                city.Name = Reader["cityName"].ToString();
                city.About = Reader["about"].ToString();
                Reader.Close();
            }
            Connection.Close();
            return city;
        }

        public int GetSelectedCountryId(string selectedCountryName)
        {
            GenarateConnection();
            int countryId=0;
            using (Connection)
            {
                Connection.Open();

                string query = "select CountryId from country where countryName='" + selectedCountryName + "';";
                Command = new SqlCommand(query, Connection);
                Reader = Command.ExecuteReader();
                while (Reader.Read())
                {
                    countryId=Convert.ToInt32(Reader[0].ToString());
                }

                Connection.Close();
            }
            return countryId;
        }


    }
}