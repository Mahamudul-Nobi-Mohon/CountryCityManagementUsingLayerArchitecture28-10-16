<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeBehind="CountryEntryUI.aspx.cs" Inherits="CountryCityInformationManagementSystem.UI.CountryEntryUI" %>
<%@ Import Namespace="System.Activities.Expressions" %>

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
    <form id="form1" runat="server">
        <div class="container">
            <div class="col-md-10 col-md-offset-1">
                <%--<div class="col-md-8 col-md-ofset-2">--%>
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
                                <asp:Button ID="saveButton" runat="server" class="btn btn-success btn-lg" Text="Save" OnClick="saveButton_Click" />
                            </td>
                            <td>
                                <asp:Button ID="cancelButton" runat="server" class="btn btn-info btn-lg" OnClick="cancelButton_Click" Text="Cancel" />
                                <asp:Label ID="messageLable" runat="server"></asp:Label>
                            </td>
                        </div>
                    </tr>

                </table>
               <br />

                <div class="GridviewDiv">
                    <asp:GridView runat="server" ID="countryListGridView" AllowPaging="True" AutoGenerateColumns="False" Width="100%" OnPageIndexChanging="gvDetails_PageIndexChanging" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                        <FooterStyle BackColor="#CCCC99" />
                        <HeaderStyle CssClass="headerstyle" BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            
                            <asp:TemplateField HeaderText="serial No">
                                <ItemTemplate>
                                    <%#Container.DataItemIndex+1 %>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField DataField="countryName" HeaderText="Country Name" />
                            
                            <asp:TemplateField HeaderText="About">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%#Eval("about") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#F7F7DE" />
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#FBFBF2" />
                        <SortedAscendingHeaderStyle BackColor="#848384" />
                        <SortedDescendingCellStyle BackColor="#EAEAD3" />
                        <SortedDescendingHeaderStyle BackColor="#575357" />
                    </asp:GridView>
                    <br />

                </div>
            </div>
        </div>
        <%--</div>--%>
    </form>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="../alertifyjs/alertify.js"></script>
    <script src="../alertifyjs/alertify.min.js"></script>
   <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../Bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
