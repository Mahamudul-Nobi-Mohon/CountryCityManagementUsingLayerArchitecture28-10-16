using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CountryCityInformationManagementSystem.Models;

namespace CountryCityInformationManagementSystem.Models
{
    public class City
    {
        public string SerialNo { get; set; }     
        public string Name { get; set; }
        public string About { get; set; }
        public double NoOfDwellers { get; set; }
        public string Location { get; set; }
        public string Weather { get; set; }
        public int CountryId { get; set; }

        public City()
        {
            
        }

        public City(string name, string about, double noOfDwellers, string location, string weather, int countryId)
        {
            this.Name = name;
            this.About = about;
            this.NoOfDwellers = noOfDwellers;
            this.Location = location;
            this.Weather = weather;
            this.CountryId = countryId;
        }
    }
}