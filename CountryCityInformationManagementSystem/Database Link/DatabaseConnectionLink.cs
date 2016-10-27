using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CountryCityInformationManagementSystem.Database_Link
{
    public class DatabaseConnectionLink
    {
        public static string databaseLink = @"Data Source=MRKOLINCE-PC; " +
                                            "Initial Catalog=CountryCityManagementSystemDB;" +
                                            " Integrated Security=true;";
    }
}