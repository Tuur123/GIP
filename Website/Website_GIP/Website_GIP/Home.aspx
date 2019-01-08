<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Website_GIP.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Luchtkwaliteit</title>

    <link rel="stylesheet" href="styles.css"/>

    <style type="text/css">
        .auto-style1 {
            width: 1300px;
        }
        .auto-style2 {
            width: 1300px;
            height: 500px;
        }
        .auto-style3 {
            width: 1300px;
            margin-left: 80px;
            }
        .auto-style4 {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 0px;
        }
        .auto-style8 {
            width: 100%;
            height: 527px;
        }
        .auto-style9 {
            width: 190px;
        }
        .auto-style10 {
            width: 724px;
        }
        .auto-style11 {
            width: 99%;
            height: 575px;
            background-color: lightblue;
        }
        .auto-style15 {
            height: 29px;
        }
        .auto-style16 {
            height: 54px;
            width: 176px;
            text-align: center;       
            padding-left: 5px;
        }
        .auto-style17 {
            height: 50px;
            width: 920px;           
            
        }
        .auto-style18 {
            height: 54px;
            text-align: center;
        }
        body {
            font-family: Cambria;
            background-color: aliceblue;
        }
        p {
            text-align: left;          
        }
        .auto-style19 {
            width: 1301px;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">

        <div class="auto-style19">
            <table>
                <tr>
                    <td class="auto-style3">
                                               
                        <table class="auto-style4">
                            <tr>
                                <td class="auto-style17">
                                    <asp:Image ID="Logo" runat="server" ImageUrl="~/logo.jpg" Width="923px" />
                                </td>
                                <td class="auto-style16">
                                    <asp:ImageButton ID="BtnLogin" runat="server" Height="48px" ImageUrl="~/login.jpg" Width="174px" />
                                </td>
                                <td class="auto-style18">
                                    <asp:ImageButton ID="BtnRegister" runat="server" Height="48px" ImageUrl="~/register.png" Width="174px" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">

                        <table class="auto-style8">
                            <tr>
                                <td class="auto-style9"></td>
                                <td class="auto-style10">
                                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7042.547259304406!2d4.467869758593663!3d51.38621337554649!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47c40f75fda16103%3A0x7902d23023c0349!2sGitok+bovenbouw!5e0!3m2!1snl!2sbe!4v1546957762004" width="600" height="450" style="border:0" ></iframe>
                                </td>
                                <td>
                                    <table class="auto-style11">
                                        <tr>
                                            <td class="auto-style15"><p>Metingen:</p></td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>

                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">

                        Over ons:

                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
