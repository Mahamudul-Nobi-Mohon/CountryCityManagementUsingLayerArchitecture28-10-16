using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CountryCityInformationManagementSystem.Models
{
    public class Country
    {
        public int CountryId { get; set; }
        public string Name { get; set; }
        public string About { get; set; }

        public Country()
        {
            
        }

        public Country(string name, string about)
        {
            this.Name = name;
            this.About = about;
        }
    }
}