using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CountryCityInformationManagementSystem.UI
{
    public partial class IndexUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void countryEntryLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("CountryEntryUI.aspx");
        }

        protected void countryViewLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("CountryViewUI.aspx");
        }

        protected void cityEntryLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("CityEntryUI.aspx");
        }

        protected void cityViewLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("CityVIewUI.aspx");
        }
    }
}