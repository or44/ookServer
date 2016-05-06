using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TechnologMainPage : System.Web.UI.Page
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
            {
                Response.Redirect("login.aspx");
            }

            string query = "select b.bidID as 'מספר הצעה',c.clientName as 'שם לקוח' ,b.productName as 'שם מוצר', b.openingDate as 'תאריך פתיחה'  from Bid b inner join Client c on b.clientID=c.clientID where b.status=1";
            SqlDataSourceopenBigs.SelectCommand = query;
            openBigs.DataBind();

        }

    }
    protected void openBigs_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

        //   RadioButtonList rbl = (RadioButtonList)sender;
        //GridViewRow grdvw_rw = (GridViewRow)rbl.Parent.Parent; // get the row in the grid
        //int index = GetColumnIndexByName(moviesGRDVW, "name");
        //if (index != -1)
        //{
        //    string name = grdvw_rw.Cells[index].Text;
        //    Response.Write("The name of the selected movie is " + name);
        //}
        //else {
        //    Response.Write("name is not one of the fields in the grid");
        //}


    protected void lnbtn_Click(object sender, EventArgs e)
    {
        LinkButton linkBtn = (LinkButton)sender;
        GridViewRow grdvw_row = (GridViewRow)linkBtn.Parent.Parent; // get the row in the grid
        //int index = GetColumnIndexByName(openBigs, "bidID");
        int openBidId = int.Parse(grdvw_row.Cells[1].Text);

        Session["openBidId"] = openBidId;
        Response.Redirect("bidTechnolog.aspx");
    }
}

