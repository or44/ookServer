using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Machine
/// </summary>
public class Machine
{
    private int machineId;

    public int MachineId
    {
        get { return machineId; }
        set { machineId = value; }
    }

    private string machineType;

    public string MachineType
    {
        get { return machineType; }
        set { machineType = value; }
    }

    private string machineName;

    public string MachineName
    {
        get { return machineName; }
        set { machineName = value; }
    }

    private string machineWidth;

    public string MachineWidth
    {
        get { return machineWidth; }
        set { machineWidth = value; }
    }

    private string machineWastPreparation;

    public string MachineWastPreparation
    {
        get { return machineWastPreparation; }
        set { machineWastPreparation = value; }
    }

    private double machineInvalidPreparation;

    public double MachineInvalidPreparation
    {
        get { return machineInvalidPreparation; }
        set { machineInvalidPreparation = value; }
    }

    private double machinePreparationTime;

    public double MachinePreparationTime
    {
        get { return machinePreparationTime; }
        set { machinePreparationTime = value; }
    }

    private double machineRhythmPerHoure;

    public double MachineRhythmPerHoure
    {
        get { return machineRhythmPerHoure; }
        set { machineRhythmPerHoure = value; }
    }

    private double machinePricePerHoure;

    public double MachinePricePerHoure
    {
        get { return machinePricePerHoure; }
        set { machinePricePerHoure = value; }
    }

	public Machine()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public Machine(int machineId, string machineType, string machineName, string machineWidth, string machineWastPreparation, double machineInvalidPreparation,
        double machinePreparationTime, double machineRhythmPerHoure, double machinePricePerHoure)
    {
        this.MachineId = machineId;
        this.MachineType = machineType;
        this.MachineName = machineName;
        this.MachineWidth = machineWidth;
        this.MachineWastPreparation = machineWastPreparation;
        this.MachineInvalidPreparation = machineInvalidPreparation;
        this.MachinePreparationTime = machinePreparationTime;
        this.MachineRhythmPerHoure = machineRhythmPerHoure;
        this.MachinePricePerHoure = machinePricePerHoure;

    }

    public List<Machine> getMachine()
    {
        DBservices dbs = new DBservices();
        List<Machine> machinelList = dbs.getMachine();
        return machinelList;
    }
}