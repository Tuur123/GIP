using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Text;
using System.Web.UI.WebControls;
using System.Security.Cryptography;

namespace Website_GIP
{
    public partial class Home : System.Web.UI.Page
    {
        Database db = new Database();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnLogin_Click(object sender, ImageClickEventArgs e)
        {
            string loginFail = "Verkeerde wachtwoord of gebruikersnaam!";
            string alreadyLoggedIn = "U bent al ingelogd!";

            if(Convert.ToBoolean(ViewState["Login"]))
                Response.Write("<script>alert('" + alreadyLoggedIn + "')</script>");

            else if (ComputeHash(TbUser.Text + TbPassword.Text) == db.ValidateUser(TbUser.Text))
            {
                //user heeft geldig passwoord en gebruikersnaam en mag ingelogd worden
                ViewState["Login"] = true;
                DrawMap(TbUser.Text);
                LblUser.Text = TbUser.Text;
            }
            else
            {
                //user heeft ongeldige gegevens.
                Response.Write("<script>alert('" + loginFail + "')</script>");
            }
        }

        protected void BtnRegister_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Register.aspx");
        }

        private void DrawMap(string user)
        {
            //kaartje tekene neef
        }

        private string ComputeHash(string input)
        {
            SHA512 shaM = new SHA512Managed();
            byte[] bytes = shaM.ComputeHash(Encoding.ASCII.GetBytes(input));

            StringBuilder result = new StringBuilder(bytes.Length * 2);

            for (int i = 0; i < bytes.Length; i++)
                result.Append(bytes[i].ToString("x2"));

            return result.ToString();
        }
    }
}