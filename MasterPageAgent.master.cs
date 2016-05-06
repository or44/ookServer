using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPageAgent : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void logout(object sender, EventArgs e)
    {
        if (Request.Cookies["LoginUser"] != null)
        {
            HttpCookie myCookie = new HttpCookie("LoginUser");
            myCookie.Expires = DateTime.Now.AddDays(-1d);
            Response.Cookies.Add(myCookie);
        }

        Session["User"] = null;
        
    }
}
