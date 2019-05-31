<!--
File: Home.aspx
Project: Website
Function: Home page
Authors: Arthur d'Hooge, Ruben Socquet
Project: GIP 2019

2018-2019
Kalmthout
-->

<%@ Page Language="C#" EnableViewState="true" ViewStateEncryptionMode="Always" EnableViewStateMac="true" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Website_GIP.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta charset='utf-8' />
    <title>Luchtkwaliteit</title>
    <meta name='viewport' content='initial-scale=1,maximum-scale=1,user-scalable=no' />
    <script src='https://api.tiles.mapbox.com/mapbox-gl-js/v0.52.0/mapbox-gl.js'></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
    <script src="Main.js"></script>
    <link href='https://api.tiles.mapbox.com/mapbox-gl-js/v0.52.0/mapbox-gl.css' rel='stylesheet' />
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
</head>

<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
        <asp:ScriptManager ID="ScriptManager" runat="server" EnablePageMethods="true">
        </asp:ScriptManager>
        <div class="header">
            <asp:ImageButton ID="home" runat="server"
                ImageUrl="logo_Luchtkwaliteit.png"
                OnClick="ImageButton_Click" />
        </div>
        <div class="topnav">
        </div>
        <div class="row">
            <div class="leftcolumn">
                <div class="card">
                    <div id='map'></div>
                </div>
                <div class="card">
                    <h2>Grafieken</h2>
                    <div class="slidecontainer">
                        <h3>Van <span id="van"></span></h3>
                        <input type="range" min="0" max="200" value="10" class="slider" id="From" />
                    </div>
                    <div class="slidecontainer">
                        <h3>Tot <span id="tot"></span></h3>
                        <input type="range" min="0" max="200" value="50" class="slider" id="Until" />
                    </div>
                    <canvas id="coChart"></canvas>
                    <canvas id="tempVochtLichtChart"></canvas>
                </div>
            </div>
            <div class="rightcolumn">
                <div class="card">
                    <asp:TextBox ID="TbUser" runat="server" Width="100%">gebruikersnaam</asp:TextBox>
                    <br />
                    <br />
                    <asp:TextBox ID="TbPassword" runat="server" TextMode="Password" Width="100%">Wachtwoord</asp:TextBox>
                    <br />
                    <br />
                    <asp:Button ID="BtnLogin" runat="server" Text="Login" Width="75%" OnClick="BtnLogin_Click" />
                    <br />
                    <br />
                    <asp:Button ID="BtnRegister" runat="server" Text="Registreer" Width="75%" OnClick="BtnRegister_Click" />
                    <br />
                    <br />
                    <asp:Label ID="LblUser" runat="server" Text="Log in om je persoonlijke metingen te zien!"></asp:Label>
                </div>
                <div class="card">
                    <article class="ac-aircheckr-widget"
                        data-current-location="undifined" data-level="street" data-locale="nl_BE" data-theme="dark"
                        data-timestamp="undefined"
                        data-token="eyJhbGciOiJIUzI1NiJ9.ZTdlODJjZDAtMzY3Zi0xMWU5LWE3MDktMTEyNWJmZDZhNDQw.NuqhuUSOoPgknpqL2zNb3CREAdFiLBDLB_NpDcBuobU" data-type="extended">
                    </article>
                    <script src="https://widget.aircheckr.com/js/client.widget.js"></script>
                </div>
                <div class="card">
                    <h1>Metingen uploaden van een SD kaart:</h1>
                    <input id="oFile" type="file" runat="server" name="oFile" />
                    <asp:Button ID="btnUpload" type="submit" Text="Upload" runat="server" OnClick="btnUpload_Click"></asp:Button>
                    <asp:Panel ID="frmConfirmation" Visible="False" runat="server">
                        <asp:Label ID="lblUploadResult" runat="server"></asp:Label>
                    </asp:Panel>
                </div>
                <div class="card">
                    <h1>Verwijder al je data:</h1>
                    <asp:Button ID="BtnDataDelete" runat="server" Text="Delete" OnClick="BtnDataDelete_Click" />
                </div>
            </div>
        </div>
        <div id="footer">
		    <!-- Footer start -->
		    <h2><asp:LinkButton ID="OverOns" runat="server" Text="Over Ons" OnClick="BtnOverons_Click"></asp:LinkButton></h2>
            <h2>Contacteren:</h2>

            <a href="https://www.facebook.com/pages/Gitok/228181723916129" class="fa fa-facebook"></a>
            <a href="https://twitter.com/gitok_kalmthout" class="fa fa-twitter"></a>
            <a href="https://www.linkedin.com/company/gitok" class="fa fa-linkedin"></a>
            <a href="https://www.instagram.com/gitok_kalmthout/" class="fa fa-instagram"></a>
            <a style="background: #dd4b39; color:white" href="mailto:ruben.arthur1@gmail.com" class="fa fa-google"></a>
		    <!-- Footer end -->
	    </div>
    </form>
</body>
</html>
