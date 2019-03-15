using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Text;
using System.IO;
using System.Web.UI.WebControls;
using System.Security.Cryptography;

namespace Website_GIP
{
    public partial class Home : System.Web.UI.Page
    {
        Database db = new Database();
        public string markers;
        //string serverPath = @"C:\Users\arthur.dhooge\Documents\GitHub\GIP\Website\Website_GIP\Website_GIP\";
        string serverPath = @"C:\Users\5TICT socquet\Documents\GIP\GIP-hub\Website\Website_GIP\Website_GIP\Database.mdb";
        private string ComputeHash(string input)
        {
            SHA512 shaM = new SHA512Managed();
            byte[] bytes = shaM.ComputeHash(Encoding.ASCII.GetBytes(input));

            StringBuilder result = new StringBuilder(bytes.Length * 2);

            for (int i = 0; i < bytes.Length; i++)
                result.Append(bytes[i].ToString("x2"));

            return result.ToString();
        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            string[] loginMessage = { "Verkeerde wachtwoord of gebruikersnaam!", "U bent al ingelogd!" };

            if (Convert.ToBoolean(ViewState["Login"]))
                Response.Write("<script>alert('" + loginMessage[1] + "')</script>");

            else if (ComputeHash(TbUser.Text + TbPassword.Text) == db.ValidateUser(TbUser.Text))
            {
                //user heeft geldig passwoord en gebruikersnaam en mag ingelogd worden
                ViewState["Login"] = true;
                LblUser.Text = TbUser.Text;
                markers = db.GetUserData(TbUser.Text);
                StreamWriter writer = new StreamWriter(serverPath + TbUser.Text);
                writer.Write(markers);
            }
            else
            {
                //user heeft ongeldige gegevens.
                Response.Write("<script>alert('" + loginMessage[0] + "')</script>");
            }
        }

        protected void BtnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }

        protected void BtnOverons_Click(object sender, EventArgs e)
        {
            Response.Redirect("Overons.aspx");
        }

        protected void ImageButton_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}