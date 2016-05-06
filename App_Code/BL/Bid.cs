using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Bid
/// </summary>
public class Bid
{
    private int bidId;

    public int BidId
    {
        get { return bidId; }
        set { bidId = value; }
    }


    private string clientId; //foreign key to Customer

    public string ClientId
    {
        get { return clientId; }
        set { clientId = value; }
    }


    private int userId; //foreign key to User

    public int UserId
    {
        get { return userId; }
        set { userId = value; }
    }


    private int status; // where is the bid on the process- which user

    public int Status
    {
        get { return status; }
        set { status = value; }
    }

    private string productName;

    public string ProductName
    {
        get { return productName; }
        set { productName = value; }
    }

    private int productType; // for now only IMD & roll

    public int ProductType
    {
        get { return productType; }
        set { productType = value; }
    }

    private double productWidth; // mm unit

    public double ProductWidth
    {
        get { return productWidth; }
        set { productWidth = value; }
    }

    private double productPitch; // mm unit

    public double ProductPitch
    {
        get { return productPitch; }
        set { productPitch = value; }
    }

    private double percentageOfColdGlueCover;

    public double PercentageOfColdGlueCover
    {
        get { return percentageOfColdGlueCover; }
        set { percentageOfColdGlueCover = value; }
    }

    private double percentageOfColor;

    public double PercentageOfColor
    {
        get { return percentageOfColor; }
        set { percentageOfColor = value; }
    }

    private double percentageOfWhiteColor;

    public double PercentageOfWhiteColor
    {
        get { return percentageOfWhiteColor; }
        set { percentageOfWhiteColor = value; }
    }

    private double percentageOfLacquer;

    public double PercentageOfLacquer
    {
        get { return percentageOfLacquer; }
        set { percentageOfLacquer = value; }
    }

    private double percentageOfDiscount;

    public double PercentageOfDiscount
    {
        get { return percentageOfDiscount; }
        set { percentageOfDiscount = value; }
    }


    private double percentageOfCommission;

    public double PercentageOfCommission
    {
        get { return percentageOfCommission; }
        set { percentageOfCommission = value; }
    }

    private int numberOfColor;

    public int NumberOfColor
    {
        get { return numberOfColor; }
        set { numberOfColor = value; }
    }

    //private bool lacquer;

    //public bool Lacquer
    //{
    //    get { return lacquer; }
    //    set { lacquer = value; }
    //}

    //private bool discount;

    //public bool Discount
    //{
    //    get { return discount; }
    //    set { discount = value; }
    //}

    //private double commission;

    //public double Commission
    //{
    //    get { return commission; }
    //    set { commission = value; }
    //}

    private double targetPrice;

    public double TargetPrice
    {
        get { return targetPrice; }
        set { targetPrice = value; }
    }

    private DateTime openingDate;

    public DateTime OpeningDate
    {
        get { return openingDate; }
        set { openingDate = value; }
    }

    private DateTime targetDate;

    public DateTime TargetDate
    {
        get { return targetDate; }
        set { targetDate = value; }
    }

    private DateTime closingDate;

    public DateTime ClosingDate
    {
        get { return closingDate; }
        set { closingDate = value; }
    }

    private DateTime closingTimeMarketer;

    public DateTime ClosingTimeMarketer
    {
        get { return closingTimeMarketer; }
        set { closingTimeMarketer = value; }
    }

    private DateTime closingTimeTechnologist;

    public DateTime ClosingTimeTechnologist
    {
        get { return closingTimeTechnologist; }
        set { closingTimeTechnologist = value; }
    }

    private DateTime closingTimeAnalyst;

    public DateTime ClosingTimeAnalyst
    {
        get { return closingTimeAnalyst; }
        set { closingTimeAnalyst = value; }
    }

    private string comment;

    public string Comment
    {
        get { return comment; }
        set { comment = value; }
    }

    int numberOfLeminate;

    public int NumberOfLeminate
    {
        get { return numberOfLeminate; }
        set { numberOfLeminate = value; }
    }





	public Bid()
	{
		//
		// TODO: Add constructor logic here
		//
	}


    public Bid(string clientId, int userId, int status, string productName, int productType, double productWidth, double productPitch, int numberOfColor, double percentageOfColor, int numberOfLeminate,
        double percentageOfColdGlueCover, double percentageOfWhiteColor, double percentageOfLacquer, double percentageOfCommission, double percentageOfDiscount ,
        double targetPrice, DateTime targetDate, string comment, DateTime closingTimeMarketer)
       
    {
        this.ClientId = clientId;
        this.UserId = userId;
        this.Status = status;
        this.ProductName = productName;
        this.ProductType = productType;
        this.ProductWidth = productWidth;
        this.ProductPitch = productPitch;
        this.NumberOfColor = numberOfColor;
        this.TargetPrice = targetPrice;
        this.OpeningDate = DateTime.Now;
        this.TargetDate = targetDate;      
        this.Comment = comment;
        this.PercentageOfColdGlueCover = percentageOfColdGlueCover;
        this.PercentageOfColor = percentageOfColor;
        this.PercentageOfWhiteColor = percentageOfWhiteColor;
        this.PercentageOfLacquer = percentageOfLacquer;
        this.PercentageOfCommission = percentageOfCommission;
        this.PercentageOfDiscount = percentageOfDiscount;
        this.NumberOfLeminate = numberOfLeminate;
        this.ClosingTimeMarketer = closingTimeMarketer;
    }


    public Bid(int bidId,int userId,  string clientName, string productName, DateTime openingDate, int status)
    {
        this.BidId = bidId;
        this.UserId = userId;
        string ClientName = clientName;
        this.ProductName = productName;
        this.OpeningDate = openingDate;
        this.Status = status;

    }

    public Bid(int bidId, int userId, string clientName, string productName,  int status)
    {
        this.BidId = bidId;
        this.UserId = userId;
        string ClientName = clientName;
        this.ProductName = productName;
        this.Status = status;

    }
    //public Bid(string clientId, int userId, int status, string productName, int productType, double productWidth, double productPitch, int numberOfColor, double percentageOfColor, int numberOfLeminate,
    //double percentageOfColdGlueCover, double percentageOfWhiteColor, double percentageOfLacquer, double percentageOfCommission, double percentageOfDiscount,
    //double targetPrice, DateTime TargetDate, DateTime closingTimeMarketer, string comment)
    //{
    //    this.ClientId = clientId;
    //    this.UserId = userId;
    //    this.Status = status;
    //    this.ProductName = productName;
    //    this.ProductType = productType;
    //    this.ProductWidth = productWidth;
    //    this.ProductPitch = productPitch;
    //    this.NumberOfColor = numberOfColor;
    //    this.TargetPrice = targetPrice;
    //    this.OpeningDate = DateTime.Now;
    //    this.TargetDate = targetDate;
    //    this.ClosingTimeMarketer = closingTimeMarketer;
    //    this.Comment = comment;
    //    this.PercentageOfColdGlueCover = percentageOfColdGlueCover;
    //    this.PercentageOfColor = percentageOfColor;
    //    this.PercentageOfWhiteColor = percentageOfWhiteColor;
    //    this.PercentageOfLacquer = percentageOfLacquer;
    //    this.PercentageOfCommission = percentageOfCommission;
    //    this.PercentageOfDiscount = percentageOfDiscount;
    //    this.NumberOfLeminate = numberOfLeminate;
    //}

    public int insertBid()
    {
        DBservices dbs = new DBservices();
        int numAffected = dbs.insertBid(this);
        return numAffected;
    }

    public int getBidId(string clientId, DateTime openDate)
    {
        DBservices dbs = new DBservices();
        int bidId = dbs.getBidId(clientId,openDate);
        return bidId;
    }

    public List<Bid> getOpenBids()
    {
        List<Bid> openBidsList = new List<Bid>();
        DBservices dbs = new DBservices();
        openBidsList = dbs.getOpenBids();
        return openBidsList;
    }

    public List<Bid> getBidForClient(int clientId)
    {
        DBservices dbs = new DBservices();
        List<Bid> BidForClient = dbs.getBidForClient(clientId);
        return BidForClient;
    }

    public List<Bid> getBidForAgent(int userID)
    {
        DBservices dbs = new DBservices();
        List<Bid> BidForAgent = dbs.getBidForAgent(userID);
        return BidForAgent;
    }

    //public List<Bid> getBidForTech(int bidId)
    //{
    //    DBservices dbs = new DBservices();
    //    List<Bid> bidForTech = dbs.getBidForTech(bidId);
    //    return bidForTech;
    //}
}