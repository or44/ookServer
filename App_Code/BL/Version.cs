using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Version
/// </summary>
public class Version
{
    private int versionId;

    private int bidId; //foreign key to bid

    public int BidId
    {
        get { return bidId; }
        set { bidId = value; }
    }


    private int quantity;

    public int Quantity
    {
        get { return quantity; }
        set { quantity = value; }
    } 



    private double pricePerUnit;

    public double PricePerUnit
    {
        get { return pricePerUnit; }
        set { pricePerUnit = value; }
    }

    private double totalCostMaterial;

    public double TotalCostMaterial
    {
        get { return totalCostMaterial; }
        set { totalCostMaterial = value; }
    }

    private double totalCostWork;

    public double TotalCostWork
    {
        get { return totalCostWork; }
        set { totalCostWork = value; }
    }

    private double totalCost;

    public double TotalCost
    {
        get { return totalCost; }
        set { totalCost = value; }
    }





    
	public Version()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public Version(int bidId, int Quantity, double pricePerUnit, double totalCostMaterial, double totalCostWork, double totalCost)
    {
        this.BidId = bidId;
        this.Quantity = quantity;
        this.PricePerUnit = pricePerUnit;
        this.TotalCostMaterial = totalCostMaterial;
        this.TotalCostWork = totalCostWork;
        this.TotalCost = totalCost;
    }
}