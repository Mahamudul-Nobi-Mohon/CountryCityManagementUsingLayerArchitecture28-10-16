using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CountryCityInformationManagementSystem.Models.ViewModels
{
    public class ViewAllCityWithCountry
    {
        
        public string SerialNo { get; set; }     
        public string Name { get; set; }
        public string About { get; set; }
        public double NoOfDwellers { get; set; }
        public string Location { get; set; }
        public string Weather { get; set; }
        public int CountryId { get; set; }
        public string CountryName { get; set; }
        public string CountryAbout { get; set; }
        public int NoOfCities { get; set; }
        public double TotalNoOfDwellers { get; set; }

        public ViewAllCityWithCountry()
        {
            
        }

        public ViewAllCityWithCountry(string name, string about, double noOfDwellers, string location, string weather, int countryId, string countryName,string countryAbout)
        {
            this.Name = name;
            this.About = about;
            this.NoOfDwellers = noOfDwellers;
            this.Location = location;
            this.Weather = weather;
            this.CountryId = countryId;
            this.CountryName = countryName;
            this.CountryAbout = countryAbout;
        }
    }
}