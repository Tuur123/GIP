<%@ Page Language="C#" EnableViewState="true" ViewStateEncryptionMode="Always" EnableViewStateMac="true" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Website_GIP.Home" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta charset='utf-8' />
    <title>Luchtkwaliteit</title>
    <meta name='viewport' content='initial-scale=1,maximum-scale=1,user-scalable=no' />
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" />
    <script src='https://api.tiles.mapbox.com/mapbox-gl-js/v0.52.0/mapbox-gl.js'></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
    <script src="Main.js"></script>
    <link href='https://api.tiles.mapbox.com/mapbox-gl-js/v0.52.0/mapbox-gl.css' rel='stylesheet' />
    <link rel="stylesheet" type="text/css" href="styles.css" />
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
                    <asp:Label ID="LblUser" runat="server" Text="Log in om persoonlijke metingen te zien!"></asp:Label>
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
                    <input id="oFile" type="file" runat="server"  name="oFile"/>
                    <asp:button id="btnUpload" type="submit" text="Upload" runat="server" OnClick="btnUpload_Click"></asp:button>
                    <asp:Panel ID="frmConfirmation" Visible="False" Runat="server">
                    <asp:Label id="lblUploadResult" Runat="server"></asp:Label>
                    </asp:Panel>
                </div>
            </div>
        </div>
        
    </form>
</body>
</html>