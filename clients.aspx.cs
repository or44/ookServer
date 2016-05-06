using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class clients : System.Web.UI.Page
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
            { Response.Redirect("login.aspx"); }
            gvClient.Visible = true;
            gvNoActive.Visible = false;
            gvStatus0.Visible = false;
            gvConstant.Visible = false;

        }


      


        }

    

    protected void delet(object sender, EventArgs e)
    {
        LinkButton lnk = (LinkButton)sender;
        GridViewRow gdr = (GridViewRow)lnk.Parent.Parent;
        string id = (string)gdr.Cells[6].Text;
        id1.Text = id;
        string strDelete = "האם אתה בטוח שברצונך להסיר לקוח מזדמן בשם : " + gdr.Cells[5].Text + " מספר לקוח : " + gdr.Cells[6].Text;
        ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowDeleteClient('" + strDelete + "');", true);

    }

    public void delete_Click(object sender, EventArgs e)
    {
        Client c = new Client();
        c.deleteClient(id1.Text);





        try
        {
            if (c.deleteClient(id1.Text) == 1)
            {
                gvNoActive.DataBind();
                gvStatus0.DataBind();
                string strOk;
                strOk = "הלקוח עבר לסטטוס לא פעיל  ";
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowClientDelete('" + strOk + "');", true);

            }
            else
            {

                //Response.Write("שגיאה. נסה שנית");
                string strError;
                strError = " שגיאה! אנא נסה שנית";
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowClientDelete('" + strError + "');", true);

            }
        }
        catch (Exception ex)
        {
            Response.Write("illegal values to the user attributes - error message is " + ex.Message);
            string strError;
            strError = " שגיאה! אנא נסה שנית";
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowClientDelete('" + strError + "');", true);
            return;
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