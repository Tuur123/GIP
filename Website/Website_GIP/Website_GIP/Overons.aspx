<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Overons.aspx.cs" Inherits="Website_GIP.Overons" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
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
                <br />
                <h2>Wie zijn wij?</h2>
                <p>Wij, Arthur d'Hooge en Ruben Socquet zijn twee zesde jaars studenten aan Gitok bovenbouw. 
                    Wij volgen de richting industriële informatie en communicatie technologiën.</p>
                <h2>Ons project.</h2>
                <p>De website waarop u dit momenteel leest is een deel van onze geïntegreerde proef ofwel gip.
                    Dit gip gaat over het meten van de luchtkwaliteit om de evolutie ervan op te volgen. 
                    Met deze metingen kunnen we een objectief beeld scheppen voor onze gebruikers en indien nodig
                    de gebruiker te laten inzien dat er iets moet veranderen aan onze uitstoot en verbuik.
                </p>
                <br />
                <p><img style="width: 300px" src="luchtvervuiling_1.jpg" alt="luchtvervuiling fabriek"/>                      
                <img style="width: 300px" src="luchtvervuiling_2.jpg" alt="luchtvervuiling auto"/>
                <img style="width: 355px" src="luchtvervuiling_3.jpg" alt="luchtvervuiling boot"/>
                </p>
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
        </div>
    </div>
        <div id="footer">
		    <h2><asp:LinkButton ID="OverOns" runat="server" Text="Over Ons" OnClick="BtnOverons_Click"></asp:LinkButton></h2>
            <h2><asp:LinkButton ID="HomeFooter" runat="server" Text="Home" OnClick="Home_Click"></asp:LinkButton></h2>
            <h2>Contacteren:</h2>

            <a href="https://www.facebook.com/pages/Gitok/228181723916129" class="fa fa-facebook"></a>
            <a href="https://twitter.com/gitok_kalmthout" class="fa fa-twitter"></a>
            <a href="https://www.linkedin.com/company/gitok" class="fa fa-linkedin"></a>
            <a href="https://www.instagram.com/gitok_kalmthout/" class="fa fa-instagram"></a>
            <a style="background: #dd4b39; color:white" href="mailto:ruben.arthur1@gmail.com" class="fa fa-google"></a>
	    </div>
    </form>
</body>
</html>
