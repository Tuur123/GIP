using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;

namespace Website_GIP
{
    public partial class Register : System.Web.UI.Page
    {
        Database db = new Database();
        private Regex NameAllowedRegex = new Regex(@"^[a-zA-Z]{1}[a-zA-Z0-9\._\-]{0,23}[^.-]$", RegexOptions.Compiled);
        

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnConfirm_Click(object sender, EventArgs e)
        {
            if (TbPassword.Text != TbPasswordRepeat.Text)
                LblMessage.Text = "Wachtwoorden komen niet overeen!";
            else if (TbUserName.Text == "" || TbPassword.Text == "")
                LblMessage.Text = "Vul alle velden in.";
            else if (!NameAllowedRegex.IsMatch(TbUserName.Text))
                LblMessage.Text = "Niet toegestane gebruikersnaam.";
            else
            {
                byte[] data = Encoding.ASCII.GetBytes(TbUserName.Text + TbPassword.Text);

                SHA512 shaM = new SHA512Managed();
                byte[] bytes = shaM.ComputeHash(data);

                StringBuilder result = new StringBuilder(bytes.Length * 2);

                for (int i = 0; i < bytes.Length; i++)
                    result.Append(bytes[i].ToString("x2"));

                db.AddUser(result.ToString(), TbUserName.Text);
                Response.Redirect("Home.aspx");
            }
        }
    }
}