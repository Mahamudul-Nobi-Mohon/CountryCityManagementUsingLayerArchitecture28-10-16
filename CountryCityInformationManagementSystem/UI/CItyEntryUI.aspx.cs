using System;
using System.Collections.Generic;
using System.Drawing;
using System.Web.UI.WebControls;
using CountryCityInformationManagementSystem.Models;
using System.Data;
using CountryCityInformationManagementSystem.BLL;

namespace CountryCityInformationManagementSystem.UI
{
    public partial class CityEntryUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                GetAllCityInformation();
                CountryDropdownList();
            }
        }  
     
        CityEntryManager cityEntryManager=new CityEntryManager();

        protected void cancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("IndexUI.aspx");
        }

        protected void saveButton_Click(object sender, EventArgs e)
        
        {
            try
            {
                 string cityName = nameTextBox.Text;
                 string cityAbout = aboutTextBox.Text;
                 double noOfDwellers = Convert.ToDouble(noOfDwellersTextBox.Text);
                 string location = locationTextBox.Text;
                 string weather = weatherTextBox.Text;

                 string selectedCountryName = countryDropDownList.SelectedValue;
                 int countryId = cityEntryManager.GetSelectedCountryId(selectedCountryName);
                if (countryId != 0)
                {
                    City city = new City(cityName, cityAbout, noOfDwellers, location, weather, countryId);

                    bool result = cityEntryManager.SetCityInformation(city);

                    if (result)
                    {


                        messageLable.Text = "<h3>Save Successfully.</h3>";
                        messageLable.ForeColor = Color.Green;
                        GetAllCityInformation();
                    }
                    else
                    {
                        messageLable.Text = "<h3>Data Not Saved.</h3>";
                        messageLable.ForeColor = Color.Red;
                       
                    }
                }
                else
                {
                    messageLable.Text = "<h3>Please select a Country</h3>";
                    messageLable.ForeColor = Color.Red;
                }
                 

           
            
            //else
            //    {
            //        messageLable.ForeColor = Color.Red;
            //        messageLable.Text = "<h3>Data not saved.</h3>";
            //    }
            }
            catch (Exception exception)
            {
                messageLable.Text = exception.Message;
                messageLable.ForeColor = Color.Red;
            }

            }
        

        public void CountryDropdownList()
        {
            List<string> countryNameList = cityEntryManager.GetCountryDropdownList();
            foreach (string countryName in countryNameList)
            {
                countryDropDownList.Items.Add(countryName);
            }                         
        }


        protected void GetAllCityInformation()
        {

            DataSet dataSet = cityEntryManager.GetAllCityInformation();
            cityListGridView.DataSource = dataSet;
            cityListGridView.DataBind();
            
        }
        protected void gvDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            cityListGridView.PageIndex = e.NewPageIndex;
            GetAllCityInformation();
        }

       

    }
}

