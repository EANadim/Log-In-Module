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
    public partial class postreg2 : System.Web.UI.Page
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
            }

            DataSet1TableAdapters.userTableAdapter uta = new DataSet1TableAdapters.userTableAdapter();
            uta.Insert(Request["email"].ToString(),Request["name"].ToString(), password, Request["gender"].ToString(),Request["address"].ToString(), Request["type"].ToString(), Request["question"].ToString(), Request["answer"].ToString(), null,0,0);

            Session["email"] = "";
            Session["name"] = "";
            Session["password"] = "";
            Session["gender"] = "";
            Session["address"] = "";
            Session["type"] = "";

            Response.Write("<h3>Successful registration</h3><br/><a href='index.aspx'>Go to home</a>");

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