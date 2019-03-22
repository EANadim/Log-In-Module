using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LogIn
{
    public partial class user : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!(Session["logged"]).ToString().Equals("user"))
                {
                    Response.Redirect("index.aspx");
                }
            }
            catch (Exception E)
            {
                Response.Redirect("index.aspx");
            }
        }
    }
}