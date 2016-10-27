using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using CountryCityInformationManagementSystem.Models;
using CountryCityInformationManagementSystem.Database_Link;
using System.Drawing;
using CountryCityInformationManagementSystem.BLL;
using CountryCityInformationManagementSystem.Models.ViewModels;


namespace CountryCityInformationManagementSystem.UI
{
    public partial class CountryViewUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            GetSelectedCountryInformaion();
        }


        protected void GetSelectedCountryInformaion()
        {
            
            string countryName = countryNameTextBox.Text;
            CountryViewManager countryViewManager=new CountryViewManager();
            DataSet dataSet = countryViewManager.GetSelectedCountryInformaion(countryName);

            countryListGridView.DataSource = dataSet;
            countryListGridView.DataBind();
            if (countryListGridView.Rows.Count < 1)
                {
                    messageLabel.Text = "<h3>Please select a valid Country Name</h3>";
                    messageLabel.ForeColor = Color.Red;
                }
            else
                {
                    messageLabel.Text = string.Empty;
                }
            
        }
        protected void gvDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            countryListGridView.PageIndex = e.NewPageIndex;
            GetSelectedCountryInformaion();
        }

    }
}