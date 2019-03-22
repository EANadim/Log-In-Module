using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LogIn
{
    public partial class recovery : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string answer = Request["answer"].ToString();
            string email = Session["email"].ToString();
            string labelText = "";
            bool flag = false;
            DataSet1TableAdapters.userTableAdapter uta = new DataSet1TableAdapters.userTableAdapter();
            DataSet1.userDataTable result = new DataSet1.userDataTable();
            result = uta.GetData();
            foreach (DataSet1.userRow row in result)
            {
                if (row["email"].ToString().Equals(email) && row["answer"].ToString().Equals(answer))
                {
                    Session["password"] = row["password"].ToString();
                    flag = true;
                    labelText = labelText + "<p><b>Password Recovery</b></p></br>";
                    labelText = labelText + "<form id='forget4' runat='server' method='post'>" +
                                                " New Password : <input type='text' name='password' id='password'></br>" +
                                                "<span id='passwordEr'></span><br/> " +
                                                "<button type='button' onclick='loadQuestion()'>Back</button>" +
                                                "<button type='button' onclick='checkRecovery()'>Submit</button>" +
                                            "</form>";
                    MyProperty = labelText;
                }
            }
            if (!flag)
            {
                Response.Write("<p><b>Wrong answer</b></p><a href='index.aspx'>Click here to go home</a>");
            }
        }
        public string MyProperty { get; set; }
    }
}