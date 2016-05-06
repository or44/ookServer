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
}