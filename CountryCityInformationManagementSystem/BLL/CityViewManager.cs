using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using CountryCityInformationManagementSystem.DAL;
using CountryCityInformationManagementSystem.Models;

namespace CountryCityInformationManagementSystem.BLL
{  
    public class CityViewManager
    {
        CityGateway cityGateway = new CityGateway();
        public List<string> GetCountryDropdownList()
        {
            List<string> countryNameList = cityGateway.GetCountryDropdownList();
            return countryNameList;
        }

        public DataSet GetSelectedCityInformation(string cityName)
        {
            DataSet dataSet = cityGateway.GetSelectedCityInformation(cityName);
            return dataSet;
        }

        public DataSet GetSelectedCountryInformation(int countryId)
        {
            DataSet dataSet = cityGateway.GetSelectedCountryInformation(countryId);
            return dataSet;
        }
        public int GetSelectedCountryId(string selectedCountryName)
        {
            int countryId = cityGateway.GetSelectedCountryId(selectedCountryName);
            return countryId;
        }

    }
}