<!--
File: Register.aspx
Funcion: Register page
Project: Website
Authors: Arthur d'Hooge, Ruben Socquet
Project: GIP 2019

2018-2019
Kalmthout
-->

<%@ Page Language="C#" EnableViewState="true" ViewStateEncryptionMode="Always" EnableViewStateMac="true" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Website_GIP.Register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Registreer</title>

    <style type="text/css">
        body, html
        {
            height: 100%;
            width: 100%;
            overflow: auto;
            margin: 0;
            padding: 0;
            background-image: url('Register.jpeg');
            background-repeat: no-repeat;
            background-attachment: fixed;
            text-align: center;
        }
        table {
             width: 100%;
            
        }
        table.center {
            margin-left:auto; 
            margin-right:auto;
            width: 35%;
        }
        .auto-style1 {
            height: 150px;          
        }
        .auto-style2 {
            height: 200px;
        }
        .bgimg {
            background-image: url('background.jpg');
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div style="height: 100%; width: 100%;">
            
            <table class="center">
                <tr>
                    <td class="auto-style2"></td>
                    <td class="auto-style2"></td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <div class="bgimg">
                            <table class="auto-style1">
                            <tr>
                                <td>
                                    <asp:Label ID="LblUserName" runat="server" Text="Gebruikersnaam:" Font-Names="Adobe Fan Heiti Std B"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TbUserName" runat="server"></asp:TextBox>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="LblPass" runat="server" Text="Wachtwoord:" Font-Names="Adobe Fan Heiti Std B"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TbPassword" runat="server" TextMode="Password"></asp:TextBox>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="LblPassRepeat" runat="server" Text="Herhaal wachtwoord:" Font-Names="Adobe Fan Heiti Std B"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TbPasswordRepeat" runat="server" TextMode="Password"></asp:TextBox>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="LblMessage" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:Button ID="BtnConfirm" runat="server" Font-Names="Adobe Fan Heiti Std B" OnClick="BtnConfirm_Click" Text="Bevestig" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        </div>
                        
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            
        </div>
    </form>
        </body>
</html>
