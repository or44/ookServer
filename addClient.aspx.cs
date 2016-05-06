using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;

public partial class addClinet : System.Web.UI.Page
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
                Response.Redirect("login.aspx");
        }
    }


    protected void SaveClientClick(object sender, EventArgs e)
    {
        string str;
        str = "האם אתה בטוח שברצונך להכניס לקוח חדש בשם : " + TBname.Text + " איש הקשר : " + TBContactName.Text + "" + " טלפון : " + TBphoneNumber.Text + " E-mail : " + TBemail.Text;
        ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowNewClient('" + str + "');", true);
    }

    protected void hiddenSubmitInsertClick(object sender, EventArgs e)
    {
        string client_name = TBname.Text;
        string contact_name = TBContactName.Text;
        string phone_number = TBphoneNumber.Text;
        string email_client = TBemail.Text;
        Client client = new Client(client_name, contact_name, phone_number, email_client);

        try
        {
            if (client.insertClient() == 1)
            {
                //Response.Redirect(Request.RawUrl);
                //Response.Write("הלקוח נוצר בהצלחה");

                string strOk;
                strOk = "לקוח מזדמן נוצר בהצלחה  ";
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowClient('" + strOk + "');", true);
                TBname.Text = "";
                TBContactName.Text = "";
                TBphoneNumber.Text = "";
                TBemail.Text = "";
                }
            else
            {

                //Response.Write("שגיאה. נסה שנית");
                string strError;
                strError = " שגיאה! אנא נסה שנית";
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowClient('" + strError + "');", true);

            }
        }
        catch (Exception ex)
        {
            Response.Write("illegal values to the user attributes - error message is " + ex.Message);
            string strError;
            strError = " שגיאה! אנא נסה שנית";
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowClient('" + strError + "');", true);
            return;
        }

    }

   


}