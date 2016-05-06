using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Material
/// </summary>
public class Material
{
    public Material()
    {

    }

    private string materialId;

    public string MaterialId
    {
        get { return materialId; }
        set { materialId = value; }
    }

    private string materialDescription;

    public string MaterialDescription
    {
        get { return materialDescription; }
        set { materialDescription = value; }
    }

    private string materialType;

    public string MaterialType
    {
        get { return materialType; }
        set { materialType = value; }
    }

    private string materialWidth;

    public string MaterialWidth
    {
        get { return materialWidth; }
        set { materialWidth = value; }
    }

    private string materialThick;

    public string MaterialThick
    {
        get { return materialThick; }
        set { materialThick = value; }
    }

    private string materialGroup;

    public string MaterialGroup
    {
        get { return materialGroup; }
        set { materialGroup = value; }
    }

    private string materialBasicUOM;

    public string MaterialBasicUOM
    {
        get { return materialBasicUOM; }
        set { materialBasicUOM = value; }
    }

    private string materialAlternateUOM;

    public string MaterialAlternateUOM
    {
        get { return materialAlternateUOM; }
        set { materialAlternateUOM = value; }
    }
    private int materialCostingType;

    public int MaterialCostingType
    {
        get { return materialCostingType; }
        set { materialCostingType = value; }
    }

    private double materialUnitPrice;

    public double MaterialUnitPrice
    {
        get { return materialUnitPrice; }
        set { materialUnitPrice = value; }
    }
   

    public Material(string materialId, string materialDescription, string materialType, string materialWidth, string materialThick, string materialGroup,
    string materialBasicUOM, string materialAlternateUOM, int materialCostingType, double materialUnitPrice)
    {
        this.MaterialId = materialId;
        this.MaterialDescription = materialDescription;
        this.MaterialType = materialType;
        this.MaterialWidth = materialWidth;
        this.MaterialThick = materialThick;
        this.MaterialGroup = materialGroup;
        this.MaterialBasicUOM = materialBasicUOM;
        this.MaterialAlternateUOM = materialAlternateUOM;
        this.MaterialCostingType = materialCostingType;
        this.MaterialUnitPrice = materialUnitPrice;
    }


    public List<Material> getMaterial()
    {
        DBservices dbs = new DBservices();
        List<Material> materialList = dbs.getMaterial();      
        return materialList;
    }

    public Material getMaterialData(string materialId)
    {
        DBservices dbs = new DBservices();
        Material materialData = dbs.getMaterialData(materialId);
        return materialData;
    }
}