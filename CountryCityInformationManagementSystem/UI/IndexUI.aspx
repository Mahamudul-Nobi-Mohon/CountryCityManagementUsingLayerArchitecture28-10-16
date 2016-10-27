<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IndexUI.aspx.cs" Inherits="CountryCityInformationManagementSystem.UI.IndexUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <html lang="en" />
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Bootstrap 101 Template</title>
    <link href="../alertifyjs/css/alertify.min.css" rel="stylesheet" />
    <link href="../alertifyjs/css/alertify.rtl.min.css" rel="stylesheet" />
    <!-- Bootstrap -->
    <link href="../Bootstrap/css/bootstrap.min.css" rel="stylesheet" />

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
            div #m{
                  position:absolute;
                  color:#fff;
                  top:42%;
                  left:51%;
                  padding:15px;
                  -ms-transform: translateX(-50%) translateY(-50%);
                  -webkit-transform: translate(-50%,-50%);
                  transform: translate(-50%,-50%);
                }   
        
    </style>
   </head>
<body>
       <div class="container">
            <div id="m" class="col-md-3 col-md-offsset-4.5">
                <center>
                    
                <form id="form1" runat="server">
      
                   
                            <div class="form-group">
                               
                               
                                    <asp:Button ID="countryEntryButton" runat="server" style="width: 100%;font-size: 25px " class="btn btn-info btn-lg " OnClick="countryEntryLinkButton_Click" Text="Country Entry" />
                                    
                               
                            </div>
                       <div class="form-group">
                                    <asp:Button ID="countryViewButton" runat="server" style="width: 100%;font-size: 25px " class="btn btn-success btn-lg" OnClick="countryViewLinkButton_Click" Text="Country View" />
                                
                                  
                            </div>
                        
                            <div class="form-group">
                                
                                
                               
                                    <asp:Button ID="cityEntryButton" runat="server" style="width: 100%; font-size: 25px;" class="btn btn-default btn-lg" OnClick="cityEntryLinkButton_Click" Text="City Entry" />
                                  
                            </div>
                      
                            <div class="form-group">
                                
                                
                                
                                     <asp:Button ID="cityViewButton" runat="server" style="width: 100%;font-size: 25px " class="btn btn-primary btn-lg" OnClick="cityViewLinkButton_Click" Text="City View" />
                                    
                            </div>
                       

                    </form>
                
                     </center>
              
                </div>
            </div>         
        
    
     <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="../alertifyjs/alertify.js"></script>
    <script src="../alertifyjs/alertify.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../Bootstrap/js/bootstrap.min.js"></script>
</body>
</html>