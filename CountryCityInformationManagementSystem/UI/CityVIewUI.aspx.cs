using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;
using CountryCityInformationManagementSystem.BLL;

namespace CountryCityInformationManagementSystem.UI
{
    public partial class CityVIewUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CountryDropdownList();
            }
        }

        CityViewManager cityViewManager=new CityViewManager();
        protected void searchButton_Click(object sender, EventArgs e)
        {
            GetSelectedCityOrCountryInformation();
            if (cityListGridView.Rows.Count < 1)
            {
                messageLabel.Text = "<h3>No Data Found.</h3>";
                //  messageLabel.ForeColor = ConsoleColor.Red;
                messageLabel.ForeColor = Color.Red;
            }
            else
            {
                messageLabel.Text = string.Empty;
            }
        }

        protected void GetSelectedCityOrCountryInformation()
        {                     
            DataSet dataSet = new DataSet();
            
           if (cityNameRadioButton.Checked)
              {
                  string cityName = cityNameTextBox.Text;
                  dataSet=cityViewManager.GetSelectedCityInformation(cityName);

              }
            else if (countryRadioButton.Checked)
              {
                  string selectedCountryName = countryDropDownList.SelectedValue;
                  int countryId = cityViewManager.GetSelectedCountryId(selectedCountryName);

                  dataSet = cityViewManager.GetSelectedCountryInformation(countryId);
                    
              }
                cityListGridView.DataSource = dataSet;
                cityListGridView.DataBind();
            }
        
        protected void gvDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            cityListGridView.PageIndex = e.NewPageIndex;
            GetSelectedCityOrCountryInformation();
        }


        public void CountryDropdownList()
        {
            List<string> countryNameList = cityViewManager.GetCountryDropdownList();
            foreach (string countryName in countryNameList)
            {
                countryDropDownList.Items.Add(countryName);
            }  
        }
    }
}