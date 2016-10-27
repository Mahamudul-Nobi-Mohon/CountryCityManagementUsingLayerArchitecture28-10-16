<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CityVIewUI.aspx.cs" Inherits="CountryCityInformationManagementSystem.UI.CityVIewUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <html lang="en" />
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
     <link href="../Bootstrap/css/bootstrap.min.css" rel="stylesheet" />
     <link href="../alertifyjs/css/alertify.min.css" rel="stylesheet" />
    <link href="../alertifyjs/css/alertify.rtl.min.css" rel="stylesheet" />
   
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
        .auto-style1 {
            width: 129px;
        }
    </style>
    <style type="text/css">
        .GridviewDiv {
            font-size: 100%;
            font-family: 'Lucida Grande', 'Lucida Sans Unicode', Verdana, Arial, Helevetica, sans-serif;
            color: #303933;
        }

        .headerstyle {
            color: #FFFFFF;
            border-right-color: #abb079;
            border-bottom-color: #abb079;
            background-color: #df5015;
            padding: 0.5em 0.5em 0.5em 0.5em;
            text-align: center;
        }
    </style>
   </head>
<body>
    




     <form id="form1" runat="server">
        <div class="container">
            <div class="col-md-10 col-md-offset-1">
                    <table class="tab-content table table-bordered table-responsive">
                        <tr>
                            <div class="form-group">
                               
                                <td>
                                    <asp:RadioButton ID="cityNameRadioButton" class="form-control" runat="server" Text="City Name" Checked="True" GroupName="oneChoice" />

                                </td>
                                <td>
                                   <asp:TextBox ID="cityNameTextBox" class="form-control" runat="server"></asp:TextBox>
                                </td>
                            </div>
                        </tr>
                         <tr>
                            <div class="form-group">
                                
                                <td>
                                    <asp:RadioButton ID="countryRadioButton" class="form-control" runat="server" Text="Country" GroupName="oneChoice" />

                                </td>
                                <td>
                                    <asp:DropDownList ID="countryDropDownList" class="form-control" runat="server">
                                        <asp:ListItem Text="--Select Country--" Value="0" />
                                    </asp:DropDownList>
                                </td>
                            </div>
                        </tr>
                         <tr>
                            <div class="form-group">
                                
                                <td>
                                    

                                </td>
                                <td>
                                     <asp:Button ID="searchButton" runat="server" class="form-control btn btn-primary" Text="Search" OnClick="searchButton_Click" />
                                <asp:Label ID="messageLabel" runat="server"></asp:Label>

                                </td>
                            </div>
                        </tr>

                    </table>
                                    
                <br />   
                
          <div class="GridviewDiv">
            <asp:GridView runat="server" ID="cityListGridView" AllowPaging="true" PageSize="10" AutoGenerateColumns="false" Width="100%" OnPageIndexChanging="gvDetails_PageIndexChanging">
                <HeaderStyle CssClass="headerstyle" />
                <Columns>
                    <asp:TemplateField HeaderText="serial No">
                        <ItemTemplate>
                            <%#Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="cityName" HeaderText="City Name" />
                    <asp:TemplateField HeaderText="City About">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%#Eval("cityAbout") %>'></asp:Label>
                                </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="noOfDwellers" HeaderText="No Of Dwellers" />                  
                    <asp:BoundField DataField="location" HeaderText="Location" />
                    <asp:BoundField DataField="weather" HeaderText="Weather" />
                    <asp:BoundField DataField="countryName" HeaderText="Country" />
                    <asp:TemplateField HeaderText="Country About">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%#Eval("countryAbout") %>'></asp:Label>
                                </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            </div>
            </div>

                
        </div>
         
    </form>

     <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="../alertifyjs/alertify.js"></script>
    <script src="../alertifyjs/alertify.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
   <script src="../Bootstrap/js/bootstrap.min.js"></script>
    
   
    

</body>
</html>
