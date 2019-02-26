<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Overons.aspx.cs" Inherits="Website_GIP.Overons" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <title>Luchtkwaliteit</title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="header">
           <asp:ImageButton id="home" runat="server"
           ImageUrl="logo_Luchtkwaliteit.png"
           OnClick="ImageButton_Click"/>
    </div>
    <div class="topnav">
    </div>
    <div class="row">
        <div class="leftcolumn">
            <div class="card">
                <h1>Over ons</h1>
            </div>
        </div>
        <div class="rightcolumn">
            <div class="card">
                <article class="ac-aircheckr-widget"
                         data-current-location="undifined" data-level="street" data-locale="nl_BE" data-theme="dark"
                         data-timestamp="undefined"
                         data-token="eyJhbGciOiJIUzI1NiJ9.ZTdlODJjZDAtMzY3Zi0xMWU5LWE3MDktMTEyNWJmZDZhNDQw.NuqhuUSOoPgknpqL2zNb3CREAdFiLBDLB_NpDcBuobU" data-type="extended"></article>
                <script src="https://widget.aircheckr.com/js/client.widget.js"></script>
            </div>
            <div class="card">

            </div>
        </div>
    </div>
    <div class="footer">
        <h2>Footer</h2>
        <asp:Button ID="BtnOverons" runat="server" Text="Over ons" Width="75%" OnClick="BtnOverons_Click1" />
    </div>
    </form>
</body>
</html>
