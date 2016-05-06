using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class allBidsTechnolog : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
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
    }
    protected void gvBid_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        GridViewRow gvrow = (GridViewRow)btn.Parent.Parent;
        int bidId =int.Parse( gvrow.Cells[0].Text);

        Session["bidId"] = bidId;
        Response.Redirect("bidTechnolog.aspx");
       
    }
}