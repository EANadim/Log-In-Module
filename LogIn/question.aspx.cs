using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LogIn
{
    public partial class question : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string email = Request["email"].ToString();
            bool flag = false;
            string question = "";
            string labelText ="";

            Session["email"] = email;

            DataSet1TableAdapters.userTableAdapter uta = new DataSet1TableAdapters.userTableAdapter();
            DataSet1.userDataTable result = new DataSet1.userDataTable();
            result = uta.GetData();
            foreach (DataSet1.userRow row in result)
            {
                if (row["email"].ToString().Equals(email))
                {
                    flag = true;
                    question = row["question"].ToString();
                }
            }
            if (flag)
            {
                labelText = labelText + "<p><b>"+question+"</b></p></br>";
                labelText = labelText + "<form id='forget3' runat='server' method='post'> Answer : <input type='text' name='answer' id='answer'></br> <span id='answerEr'></span><br/><button type='button' onclick='loadForget()'>Back</button>|<button type='button' onclick='checkQuestion()'>Next</button></form>";
                MyProperty = labelText;
            }
            else
            {
                Response.Write("<span>NO EMAIL FOUND</span><br>");
            }
        }
        public string MyProperty { get; set; }
    }
}