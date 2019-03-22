using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LogIn
{
    public partial class logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ChkRememberme"].Equals("true"))
            {
                HttpCookie nameCookie = Request.Cookies["email"]; //Fetch the Cookie using its Key.
                nameCookie.Expires = DateTime.Now.AddDays(-1); //Set the Expiry date to past date.
                Response.Cookies.Add(nameCookie); //Update the Cookie in Browser.
            }


            Session["email"] = "";
            Session["password"] = "";
            Session["logged"] = "";
            Session["ChkRememberme"] = "false";

            //Response.Write(Request.Cookies["email"].Value);
            Response.Redirect("index.aspx");
        }
    }
}