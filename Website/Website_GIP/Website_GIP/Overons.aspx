<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Overons.aspx.cs" Inherits="Website_GIP.Overons" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
        <div id="footer">
		    <!-- Footer start -->
		    <asp:LinkButton ID="OverOns" runat="server" Text="Over Ons" OnClick="BtnOverons_Click"></asp:LinkButton>
            <h2>Contacteren</h2>

            <a href="https://www.facebook.com/pages/Gitok/228181723916129" class="fa fa-facebook"></a>
            <a href="https://twitter.com/gitok_kalmthout" class="fa fa-twitter"></a>
            <a href="https://www.linkedin.com/company/gitok" class="fa fa-linkedin"></a>
            <a href="https://www.instagram.com/gitok_kalmthout/" class="fa fa-instagram"></a>

		    <!-- Footer end -->
	    </div>
    </form>
</body>
</html>
