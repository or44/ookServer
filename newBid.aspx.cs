using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class newBid : System.Web.UI.Page
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


    
    protected void BTNsave_Click(object sender, EventArgs e)
    {
        string clientId = Request.Form["ctl00$ContentPlaceHolder1$ddlclients"];
        string productName = TBproductName.Text;
        int productType;
        if (RBLproductType.SelectedValue == "1") { productType = 1; }
        else productType = 2;
        double ProductWidth = double.Parse(TBwidth.Text);
        double productPitch = double.Parse(TBpitch.Text);
        double percentageOfColdGlueCover = double.Parse(tbGluePercentage.Text);
        int numberOfColor = int.Parse(tbNumOfColor.Text);
        int numberOfLeminate = int.Parse(numOfLayer.Text);
        double percentageOfColor = double.Parse(tbColorPercentage.Text);
        double PercentageOfWhiteColor = double.Parse(tbWhitePercentage.Text);
        double percentageOfLacquer = double.Parse(tbLaquerPercentage.Text);
        double percentageOfDiscount = double.Parse(tbDiscount.Text);
        double percentageOfCommission = double.Parse(tbCommission.Text);
        double targetPrice = double.Parse(tbTargetPrice.Text);
        //DateTime targetDate = (Request.Form["ctl00$ContentPlaceHolder1$ctl00"]).ToString("yyyy-MM-dd");
        //string targetDate = Request.Form["ctl00$ContentPlaceHolder1$targetDate"];
        //DateTime dt = DateTime.ParseExact(targetDate, "yyyy-MM-dd", System.Globalization.CultureInfo.CurrentCulture);
        DateTime td = Calendar.SelectedDate;

        //DateTime td = DateTime.Parse(Request.Form["ContentPlaceHolder1_datepicker"]);

        string comment = tbComment.Text;



        // הכנסת נתוני הצעה לבנאי כאשר לוחצים על "שמור"
        Bid newBid = new Bid(clientId, 1, 0, productName, productType, ProductWidth, productPitch, numberOfColor, percentageOfColor, numberOfLeminate, percentageOfColdGlueCover,
            PercentageOfWhiteColor, percentageOfLacquer, percentageOfCommission, percentageOfDiscount, targetPrice, td, comment, DateTime.Now);



        if (newBid.insertBid() == 1)
        {
            test.Text = "yessssssss";
        }
    }

    protected void BTNsend_Click(object sender, EventArgs e)
    {
        string clientId = Request.Form["ctl00$ContentPlaceHolder1$ddlclients"];
        string productName = TBproductName.Text;
        int productType;
        if (RBLproductType.SelectedValue == "1")
        { productType = 1; }
        else productType = 2;
        double ProductWidth = double.Parse(TBwidth.Text);
        double productPitch = double.Parse(TBpitch.Text);
        double percentageOfColdGlueCover = double.Parse(tbGluePercentage.Text);
        int numberOfColor = int.Parse(tbNumOfColor.Text);
        int numberOfLeminate = int.Parse(numOfLayer.Text);
        double percentageOfColor = double.Parse(tbColorPercentage.Text);
        double PercentageOfWhiteColor = double.Parse(tbWhitePercentage.Text);
        double percentageOfLacquer = double.Parse(tbLaquerPercentage.Text);
        double percentageOfDiscount = double.Parse(tbDiscount.Text);
        double percentageOfCommission = double.Parse(tbCommission.Text);
        double targetPrice = double.Parse(tbTargetPrice.Text);
        //string targetDate = Request.Form["ctl00$ContentPlaceHolder1$targetDate"];
        //DateTime td = DateTime.ParseExact(targetDate, "yyyy-MM-dd", System.Globalization.CultureInfo.CurrentCulture);
        string comment = tbComment.Text;
        DateTime td = Calendar.SelectedDate;

        //DateTime td = DateTime.Parse(Request.Form["ContentPlaceHolder1_datepicker"]);

        // "הכנסת נתוני הצעה לבנאי כאשר לוחצים על "שמור ושלח 
        Bid newBid = new Bid(clientId, 1, 1, productName, productType, ProductWidth, productPitch, numberOfColor, percentageOfColor, numberOfLeminate, percentageOfColdGlueCover,
        PercentageOfWhiteColor, percentageOfLacquer, percentageOfCommission, percentageOfDiscount, targetPrice, td, comment, DateTime.Now);

        //---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        if (newBid.insertBid() == 1)
        {
            test.Text = "yessssssss";
        }

        int bidId = newBid.getBidId(clientId, newBid.OpeningDate);

        if (cbPrint.Checked == true)
        {
            if (rblPrint.SelectedValue == "1")
            {
                string machineName = ddlSheka.SelectedValue;
            }
            else if (rblPrint.SelectedValue == "2")
            {
                string machineName = ddlFlexo.SelectedValue;
            }
        }
        

    }

}