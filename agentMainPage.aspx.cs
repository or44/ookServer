using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



public partial class agentMainPage : System.Web.UI.Page
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
            if (u.Permission != 1)
            {
                Response.Redirect("login.aspx");
            }

            string query = "select b.bidID as 'מספר הצעה',c.clientName as 'שם לקוח' ,b.productName as 'שם מוצר', b.status as 'סטאטוס'  from Bid b inner join Client c on b.clientID=c.clientID where b.userID='" + u.UserId + "'";
            SqlDataSourceopenBigs.SelectCommand = query;
            openBigs.DataBind();

            int countAgent = 0;
            int countTec = 0;
            int countAnalyst = 0;
            int countApproved = 0;

            Bid bid = new Bid();
            List<Bid> listBid = new List<Bid>();
            listBid = bid.getOpenBids();
            foreach (Bid b in listBid)
            {
                if (b.UserId == u.UserId)
                {
                    if (b.Status == 0) countAgent++;
                    if (b.Status == 1) countTec++;
                    if (b.Status == 2) countAnalyst++;
                    if (b.Status == 3) countApproved++;
                }
            }

            DivCountAgent.InnerText = countAgent.ToString();
            DivCountTec.InnerText = countTec.ToString();
            DivCountAnalyst.InnerText = countAnalyst.ToString();
            DivCountApproved.InnerText = countApproved.ToString();


        }


    }


}