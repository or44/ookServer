using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for MaterialInMachine
/// </summary>
public class MaterialInMachine
{
    private int mimId;

    public int MimId
    {
        get { return mimId; }
        set { mimId = value; }
    }

    private int materialId;

    public int MaterialId
    {
        get { return materialId; }
        set { materialId = value; }
    }

    private int machineId;

    public int MachineId
    {
        get { return machineId; }
        set { machineId = value; }
    }







	public MaterialInMachine()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}