using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for MaterialAndMachineInBid
/// </summary>
public class MaterialAndMachineInBid
{

    private int bidId;

    public int BidId
    {
        get { return bidId; }
        set { bidId = value; }
    }


    private string materialId;
    public string MaterialId
    {
        get { return materialId; }
        set { materialId = value; }
    }

    private double materialPrice;

    public double MaterialPrice
    {
        get { return materialPrice; }
        set { materialPrice = value; }
    }

    private int machineId;

    public int MachineId
    {
        get { return machineId; }
        set { machineId = value; }
    }

    private double wastPreparation;

    public double WastPreparation
    {
        get { return wastPreparation; }
        set { wastPreparation = value; }
    }

    private double invalidPreparation;

    public double InvalidPreparation
    {
        get { return invalidPreparation; }
        set { invalidPreparation = value; }
    }

    private double preparationTime;

    public double PreparationTime
    {
        get { return preparationTime; }
        set { preparationTime = value; }
    }

    private double rhythmPerHoure;

    public double RhythmPerHoure
    {
        get { return rhythmPerHoure; }
        set { rhythmPerHoure = value; }
    }

    private double pricePerHoure;

    public double PricePerHoure
    {
        get { return pricePerHoure; }
        set { pricePerHoure = value; }
    }

    private double cost;

    public double Cost
    {
        get { return cost; }
        set { cost = value; }
    }


    private int version;

    public int Version
    {
        get { return version; }
        set { version = value; }
    }

    private int activityNum;

    public int ActivityNum
    {
        get { return activityNum; }
        set { activityNum = value; }
    }

	public MaterialAndMachineInBid()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public MaterialAndMachineInBid(int bidID, int version, int activity, string materialId, double matrialPrice, string nachineId, double wastPreparation, double invalidPreparation, double preparationTime, double rhythmPerHoure,
        double pricePerHoure, double cost)
    {
        this.BidId = bidID;
        this.Version = version;
        this.ActivityNum = activityNum;
        this.MaterialId = materialId;
        this.MaterialPrice = materialPrice;
        this.MachineId = machineId;
        this.WastPreparation = wastPreparation;
        this.InvalidPreparation = invalidPreparation;
        this.PreparationTime = preparationTime;
        this.RhythmPerHoure = rhythmPerHoure;
        this.PricePerHoure = pricePerHoure;
        this.Cost = cost;
    }



}