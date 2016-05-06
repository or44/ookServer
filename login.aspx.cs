using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["LoginUser"] != null)
        {
            string str = Request.Cookies["LoginUser"].Value;
            string[] arr = str.Split(',');
            string userN = arr[0];
            //username.Text = userN;

        }

    }

    protected void sumbit_Click(object sender, EventArgs e)
    {
        LoginUser(int.Parse(username.Text), password.Text);


    }


    public void LoginUser(int member, string password)// הבאת פרטי לקוח ושמירתם ב-cookies  ו- session
    {
        User user = new User();                                           //validate user's details
        User u = user.getUser(member, password);
        if (u.FirstName == null)
        {

            GeneralMessage.Text = "שגיאה! משתמש לא נמצא או אחד מהפרטים שהזנת שגויים";
        }

        else
        {
            Session["User"] = u;
            Session["Member"] = u.UserNumber;


            if (Request.Cookies["LoginUser"] == null)        //if there is know cookie
            {
                Response.Cookies["LoginUser"].Value = u.UserNumber + "," + u.Password;
                Response.Cookies["LoginUser"].Expires = DateTime.Now.AddSeconds(3000);
            }

            if (u.Permission == 1)
                Response.Redirect("agentMainPage.aspx");
            else if (u.Permission == 2)
                Response.Redirect("TechnologMainPage.aspx");
            //else if (u.Permission == 3)
            //    Response.Redirect("Users.aspx");
            //else if (u.Permission == 4)
            //    Response.Redirect("Users.aspx");
            //else if (u.Permission == 5)
            //    Response.Redirect("Users.aspx");


        }

    }
}