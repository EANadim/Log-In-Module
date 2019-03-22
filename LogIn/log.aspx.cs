using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;

namespace LogIn
{
    public partial class log : System.Web.UI.Page
    {
        public object MessageBox { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            { 
                string email = Request["email"].ToString();
                string password = Request["password"].ToString();
                string ChkRememberme = Request["ChkRememberme"].ToString();

                Session["ChkRememberme"] = "false";

                bool flag = false;
                int delay = 0;
                int wpcount = 0;
           

                DataSet1TableAdapters.userTableAdapter uta = new DataSet1TableAdapters.userTableAdapter();
                DataSet1.userDataTable result = new DataSet1.userDataTable();
                result = uta.GetData();
                foreach (DataSet1.userRow row in result)
                {
                    using (MD5 md5Hash = MD5.Create())
                    {
                        if (row["email"].ToString().Equals(email) && VerifyMd5Hash(md5Hash, password, row["password"].ToString()))
                        {
                            if (row["type"].Equals("admin"))
                            {
                                Session["email"] = email;
                                Session["password"] = password;
                                Session["logged"] = "admin";
                                flag = true;
                                delay = 0;
                                wpcount = 0;

                                if (ChkRememberme.Equals("true"))
                                {
                                    Session["ChkRememberme"] = "true";
                                    HttpCookie nameCookie = new HttpCookie("email"); //Create a Cookie with a suitable Key.                                    
                                    nameCookie.Values["email"] = email; //Set the Cookie value.
                                    nameCookie.Expires = DateTime.Now.AddDays(30); //Set the Expiry date.
                                    Response.Cookies.Add(nameCookie); //Add the Cookie to Browser.
                                }

                                //Response.Write(email);
                                //Response.Write(password);
                                //Response.Write(ChkRememberme);
                                //Response.Write(Request.Cookies["email"].Value);

                                Response.Redirect("admin.aspx");

                            }
                            else if (row["type"].Equals("user"))
                            {
                                Session["email"] = email;
                                Session["password"] = password;
                                Session["logged"] = "user";
                                flag = true;
                                delay = 0;
                                wpcount = 0;

                                if (ChkRememberme.Equals("true"))
                                {
                                    Session["ChkRememberme"] = "true";
                                    HttpCookie nameCookie = new HttpCookie("email"); //Create a Cookie with a suitable Key.                                    
                                    nameCookie.Values["email"] = email; //Set the Cookie value.
                                    nameCookie.Expires = DateTime.Now.AddDays(30); //Set the Expiry date.
                                    Response.Cookies.Add(nameCookie); //Add the Cookie to Browser.
                                }

                                //Response.Write(email);
                                //Response.Write(password);
                                //Response.Write(ChkRememberme);
                                //Response.Write(Request.Cookies["email"].Value);

                                Response.Redirect("user.aspx");
                            }
                        }
                    }
                }
                if (!flag)
                {
                    Session["email"] = "";
                    Session["password"] = "";
                    Session["logged"] = "";
                    Response.Write("<p><b>Invalid email or password</b></p>" +
                        "<a href='index.aspx'>Click here to go home</a>");
                }
            }
            catch (Exception E)
            {
                Response.Write("Ex");
            }
        }

        private static void Write(object p)
        {
            throw new NotImplementedException();
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
        public static String GetTimestamp(DateTime value)
        {
            return value.ToString("yyyyMMddHHmmssffff");
        }
    }
}