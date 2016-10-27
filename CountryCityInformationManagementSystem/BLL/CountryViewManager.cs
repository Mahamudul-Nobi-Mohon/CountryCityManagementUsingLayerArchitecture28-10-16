using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using CountryCityInformationManagementSystem.DAL;
using CountryCityInformationManagementSystem.Models.ViewModels;

namespace CountryCityInformationManagementSystem.BLL
{
    public class CountryViewManager
    {
        CountryGateway countryGateway=new CountryGateway();
        public DataSet GetSelectedCountryInformaion(string countryName)
        {
            DataSet dataSet = countryGateway.GetSelectedCountryInformaion(countryName);
            return dataSet;
        }
    }
}