/*
File: Home.aspx.cs
Funcion:  back-end code for Home.aspx
Authors: Arthur d'Hooge, Ruben Socquet
Project: GIP 2019

2018-2019
Kalmthout
*/

using System;
using System.Web.UI;
using System.Text;
using System.IO;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Security.Cryptography;
using System.Web.Services;

namespace Website_GIP
{
    public partial class Home : Page
    {
        Database db = new Database();
        public static string markers, userName, userHash = null;

        protected Button btnUpload;
        protected Label lblUploadResult;
        protected Panel frmConfirmation;
        protected HtmlInputFile oFile;

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
            // met de userId kan de gebruiker zich authenticeren;

            userHash = ComputeHash(TbUser.Text + TbPassword.Text);
            if (Convert.ToBoolean(ViewState["Login"]))
                Response.Write("<script>alert('" + loginMessage[1] + "')</script>");

            else if (userHash == db.GetHash(TbUser.Text))
            {
                //user heeft geldig passwoord en gebruikersnaam en mag ingelogd worden
                ViewState["Login"] = true;
                LblUser.Text = TbUser.Text;
                userName = TbUser.Text;
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

        protected void BtnDataDelete_Click(object sender, EventArgs e)
        {
            db.Delete(userName);
        }

        protected void BtnGemeente_Click(object sender, EventArgs e)
        {

        }
        protected void btnUpload_Click(object sender, EventArgs e)
        {
            string strFileName;

            // Retrieve the name of the file that is posted.
            strFileName = oFile.PostedFile.FileName;

            if (oFile.Value != "")
            {
                using (StreamReader inputStreamReader = new StreamReader(oFile.PostedFile.InputStream))
                {
                    db.AddSD(inputStreamReader.ReadToEnd());
                }
                lblUploadResult.Text = strFileName + " has been successfully uploaded.";             
            }
            else
            {
                lblUploadResult.Text = "Click 'Browse' to select the file to upload.";
            }
            // Display the result of the upload.
            frmConfirmation.Visible = true;
        }

        [WebMethod]
        public static string GetData()
        {
            Database db = new Database();

            if (db.GetHash(userName) == userHash)
                return db.GetUserData(userName);
            return null;
        }
    }
}