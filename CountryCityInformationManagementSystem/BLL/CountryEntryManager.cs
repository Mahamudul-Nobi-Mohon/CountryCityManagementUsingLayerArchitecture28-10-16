using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using CountryCityInformationManagementSystem.DAL;
using CountryCityInformationManagementSystem.Models;

namespace CountryCityInformationManagementSystem.BLL
{
    public class CountryEntryManager
    {
        CountryGateway countryGateway=new CountryGateway();
        public bool SetCountryInformation(Country country)
        {
            if (IsCountryNameExist(country.Name))
            {
                throw new Exception("<h3>Country Name already exist.</h3>");
            }
            bool result = countryGateway.SetCountryInformation(country);

            return result;
        }

        public DataSet GetCountryInformation()
        {
            DataSet dataSet = countryGateway.GetCountryInformation();
            return dataSet;
        }
        public bool IsCountryNameExist(string countryName)
        {
            bool isCountryNameExist = false;
            Country country = countryGateway.GetCountryByName(countryName);
            if (country != null)
            {
                isCountryNameExist = true;
            }
            return isCountryNameExist;

        }

    }
}