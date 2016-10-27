using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using CountryCityInformationManagementSystem.DAL;
using CountryCityInformationManagementSystem.Models;

namespace CountryCityInformationManagementSystem.BLL
{
    public class CityEntryManager
    {
        CityGateway cityGateway=new CityGateway();

        public bool SetCityInformation(City city)
        {
            if (IsCityNameExist(city.Name))
            {
                throw new Exception("<h3>City Name already exist</h3>");
            }
            bool result = cityGateway.SetCityInformation(city);
            return result;
        }


        public List<string> GetCountryDropdownList()
        {
            List<string> countryNameList = cityGateway.GetCountryDropdownList();
            return countryNameList;
        }

        public DataSet GetAllCityInformation()
        {
            DataSet dataSet = cityGateway.GetAllCityInformation();
            return dataSet;
        }

        public bool IsCityNameExist(string cityName)
        {
            bool isCityNameExist = false;
            City city = cityGateway.GetCityByName(cityName);
            if (city != null)
            {
                isCityNameExist = true;
            }
            return isCityNameExist;

        }

        public int GetSelectedCountryId(string selectedCountryName)
        {
            int countryId = cityGateway.GetSelectedCountryId(selectedCountryName);
            return countryId;
        }
    }
}