using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CountryCityInformationManagementSystem.Models;
using System.Data;
using CountryCityInformationManagementSystem.BLL;

namespace CountryCityInformationManagementSystem.UI
{
    public partial class CountryEntryUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetCountryInformation();
            }
        }
        CountryEntryManager countryEntryManager = new CountryEntryManager();


        protected void cancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("IndexUI.aspx");
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            try
            {

            Country country = new Country(nameTextBox.Text, aboutTextBox.Text);

           

            bool result = countryEntryManager.SetCountryInformation(country);

            if (result)
            {
                messageLable.Text = "<h3>Save Successfully.</h3>";
                messageLable.ForeColor = Color.Green;               
            }
            else
            {
                messageLable.ForeColor = Color.Red;
                messageLable.Text = "<h3>Data not saved.</h3>";
            }
            }
            catch (Exception exception)
            {
                messageLable.Text = exception.Message;
                messageLable.ForeColor = Color.Red;
            }
            GetCountryInformation();
        }

        
        protected void GetCountryInformation()
        {
            DataSet dataSet = countryEntryManager.GetCountryInformation();
            countryListGridView.DataSource = dataSet;
            countryListGridView.DataBind();
        }

        protected void gvDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            countryListGridView.PageIndex = e.NewPageIndex;
            GetCountryInformation();
        }


    }
}