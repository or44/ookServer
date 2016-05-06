using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class clientsTechnolog : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                User u = (User)Session["User"];
                if (u.Permission != 2)
                    Response.Redirect("login.aspx");

            }
            gvClient.Visible = true;
            gvNoActive.Visible = false;
            gvStatus0.Visible = false;
            gvConstant.Visible = false;


        }
    }

    protected void DDLfilter_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DDLfilter.SelectedValue == "0")
        {
            gvClient.Visible = true;
            gvNoActive.Visible = false;
            gvStatus0.Visible = false;
            gvConstant.Visible = false;

        }

        if (DDLfilter.SelectedValue == "1")
        {
            gvClient.Visible = false;
            gvNoActive.Visible = false;
            gvStatus0.Visible = false;
            gvConstant.Visible = true;

        }

        if (DDLfilter.SelectedValue == "2")
        {
            gvClient.Visible = false;
            gvNoActive.Visible = false;
            gvStatus0.Visible = true;
            gvConstant.Visible = false;

        }
        if (DDLfilter.SelectedValue == "3")
        {
            gvClient.Visible = false;
            gvNoActive.Visible = true;
            gvStatus0.Visible = false;
            gvConstant.Visible = false;

        }
    }
}