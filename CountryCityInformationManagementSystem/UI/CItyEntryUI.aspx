<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeBehind="CItyEntryUI.aspx.cs" Inherits="CountryCityInformationManagementSystem.UI.CityEntryUI" %>

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
    <script src="//cdn.tinymce.com/4/tinymce.min.js"></script>
    <script>tinymce.init({ selector: 'textarea' });</script>

</head>
<body>
         <div class="container">
            <div class="col-md-10 col-md-offset-1">     
                <form id="form1" runat="server">
        
                <table class="tab-content table table-bordered table-responsive">
                    <tr>
                        <div class="form-group">
                            <td>
                                <h3>Name </h3>
                            </td>
                            <td>
                                <asp:TextBox ID="nameTextBox" class="form-control" runat="server"></asp:TextBox>
                            </td>
                        </div>
                    </tr>
                    <tr>
                        <div class="form-group">
                            <td class="auto-style1">
                                <h3>About</h3>
                            </td>
                            <td>
                                <asp:TextBox ID="aboutTextBox" class="form-control" TextMode="MultiLine" runat="server"></asp:TextBox>
                            </td>
                        </div>
                    </tr>
                    <tr>
                        <div class="form-group">
                            <td>
                                <h3>No of dwellers </h3>
                            </td>
                            <td>
                                <asp:TextBox ID="noOfDwellersTextBox" class="form-control"  runat="server"></asp:TextBox>
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="String Not Allowed" ValidationExpression="\d+(?:(?:\.|,)\d{1,5})?" ControlToValidate="noOfDwellersTextBox" EnableClientScript="False" Font-Bold="True" ForeColor="Red"></asp:RegularExpressionValidator>
                            </td>
                        </div>
                    </tr>
                    <tr>
                        <div class="form-group">
                            <td class="auto-style1">
                                <h3>Location </h3>
                            </td>
                            <td>
                                <asp:TextBox ID="locationTextBox" class="form-control" runat="server"></asp:TextBox>
                            </td>
                        </div>
                    </tr>
                    <tr>
                        <div class="form-group">
                            <td class="auto-style1">
                                <h3>Weather </h3>
                            </td>
                            <td>
                                <asp:TextBox ID="weatherTextBox" class="form-control" runat="server"></asp:TextBox>
                            </td>
                        </div>
                    </tr>
                    <tr>
                        <div class="form-group">
                            <td class="auto-style1">
                                <h3>Country </h3>
                            </td>
                            <td>
                                <asp:DropDownList ID="countryDropDownList" class="form-control" runat="server" >
                                    <asp:ListItem Selected="True" Value="0" Text="--Select Country--"></asp:ListItem>
                                </asp:DropDownList>
                               
                            </td>
                        </div>
                    </tr>
                    <tr>
                        <div class="form-group">

                            <td>
                                <asp:Button ID="saveButton" runat="server" class="btn btn-success btn-lg" Text="Save" OnClick="saveButton_Click" />
                            </td>
                            <td>
                                <asp:Button ID="Button2" runat="server" class="btn btn-info btn-lg" OnClick="cancelButton_Click" Text="Cancel" />
                                <asp:Label ID="messageLable" runat="server"></asp:Label>

                            </td>
                        </div>
                    </tr>

                </table>
              
                <div class="GridviewDiv">
                    <asp:GridView runat="server" ID="cityListGridView" AllowPaging="true" PageSize="10" AutoGenerateColumns="false" Width="100%" OnPageIndexChanging="gvDetails_PageIndexChanging" Height="263px">
                        <HeaderStyle CssClass="headerstyle" />
                        <Columns>
                            <asp:TemplateField HeaderText="serial No">
                                <ItemTemplate>
                                    <%#Container.DataItemIndex+1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="cityName" HeaderText="City Name" />
                            <asp:BoundField DataField="noOfDwellers" HeaderText="No Of Dwellers" />
                            <asp:BoundField DataField="countryName" HeaderText="Country Name" />
                        </Columns>
                    </asp:GridView>
                    <br />
                    <br />
                    <br />
                    <br />
                </div>
               </form>

            </div>
        </div>
   



    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="../alertifyjs/alertify.js"></script>
    <script src="../alertifyjs/alertify.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
   <script src="../Bootstrap/js/bootstrap.min.js"></script>
    
    
    <%-- <script type="text/javascript">
         $(function () {
             $('#saveButton').click(function () {
                 var name = $('#nameTextBox').val();
                 var about = $('#aboutTextBox').val();
                 var noOfDwellers = $('#noOfDwellersTextBox').val();
                 var location = $('#locationTextBox').val();
                 var weather = $('#weatherTextBox').val();
                 var countryId = $('#countryDropDownList').val();
                 if (name != '' && country != 0) {
                     $.ajax({
                         type: "POST",
                         contentType: "application/json; charset=utf-8",
                         url: "CityEntryUI.aspx/saveButton_Click",
                         data: "{'cityName':'" + name + "','about':'" + about + "','noOfDwellers':'" + noOfDwellers + "','location':'" + location + "','weather':'" + weather + "','countryId':'" + countryId + "'}",
                         dataType: "json",
                         success: function (data) {
                             var obj = data.d;
                             if (obj == 'true') {
                                 $('#nameTextBox').val('');
                                 $('#aboutTextBox').val('');
                                 $('#noOfDwellersTextBox').val('');
                                 $('#locationTextBox').val('');
                                 $('#weatherTextBox').val('');
                                 $('#countryDropDownList').val('');
                                 $('#messageLable').html("Details Submitted Successfully");
                                 window.location.reload();
                             }
                         },
                         error: function (result) {
                             alert("Error");
                         }
                     });
                 }
                 else {
                     alert('Please enter all the fields')
                     return false;
                 }
             })
         });
</script>--%>
    

</body>
</html>
