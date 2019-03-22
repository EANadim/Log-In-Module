using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LogIn
{
    public partial class checkCookie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Fetch the Cookie using its Key.
            HttpCookie nameCookie = Request.Cookies["email"];

            //If Cookie exists fetch its value.
            string email = nameCookie != null ? nameCookie.Value.Split('=')[1] : "undefined";
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + email + "');", true);
        }
    }
}