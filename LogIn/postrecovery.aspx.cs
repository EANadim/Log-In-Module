using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LogIn
{
    public partial class postrecovery : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string password = Request["password"].ToString();
            using (MD5 md5Hash = MD5.Create())
            {
                string hash = GetMd5Hash(md5Hash, password);
                if (VerifyMd5Hash(md5Hash, password, hash))
                {
                    password = hash;
                }
                else
                {

                }
                password = hash;
                Session["password"] = "";
            }

            DataSet1TableAdapters.userTableAdapter uta = new DataSet1TableAdapters.userTableAdapter();
            uta.UpdatePassword(password, Request["email"].ToString());

            Response.Write("<p><b>Success</b></p></br>" +
                            "<a href='index.aspx'>click here to go home</a>");
            Session["email"] = "";
            Session["question"] = "";
            Session["answer"] = "";
            Session["password"] = "";
        }
        static string GetMd5Hash(MD5 md5Hash, string input)
        {

            byte[] data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input));
            StringBuilder sBuilder = new StringBuilder();
            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }
            return sBuilder.ToString();
        }
        static bool VerifyMd5Hash(MD5 md5Hash, string input, string hash)
        {
            string hashOfInput = GetMd5Hash(md5Hash, input);
            StringComparer comparer = StringComparer.OrdinalIgnoreCase;
            if (0 == comparer.Compare(hashOfInput, hash))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}