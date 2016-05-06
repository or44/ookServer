using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Script.Serialization;
using System.Web.Script.Services;


/// <summary>
/// Summary description for WebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class WebService : System.Web.Services.WebService
{


    public WebService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }



    //--------------------------------------------------------------------------------------------------
    // Login User Function
    //--------------------------------------------------------------------------------------------------

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string check_user(int name, string password)
    {
        User u = new User();
        u = u.getUser(name, password);

        if (u.UserId != 0)
        {
            JavaScriptSerializer js = new JavaScriptSerializer();
            string userDetails = js.Serialize(u);
            return userDetails;
        }
        else
        {
            throw (new Exception("שגיאה! משתמש לא נמצא "));
        }
    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    //--------------------------------------------------------------------------
    // Method must be public
    // The method must return a string
    // The name of the parameters in the window must be identical to the names
    // passed in the Ajax call
    //--------------------------------------------------------------------------
    public string getClientNames()
    {


        Client c = new Client();
        List<Client> cList = new List<Client>();
        cList = c.getClient();

        JavaScriptSerializer js = new JavaScriptSerializer();

        // serialize to string
        string jsonString = js.Serialize(cList);
        return jsonString;
    }





    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string getMaterialName()
    {
        Material material = new Material();
        List<Material> mList = new List<Material>();
        //List<Material> typeList = new List<Material>();

        mList = material.getMaterial();

        //foreach (Material m in mList)
        //{
        //    if (m.MaterialType == "200")
        //    {
        //        typeList.Add(m);
        //    }
        //}
        //Client c = new Client();
        //List<Client> cList = new List<Client>();
        //List<string> names = new List<string>();
        //cList = c.getClient();

        //var materials = typeList.Select(m1 => new { Name = m1.MaterialDescription, Id = m1.MaterialId }).ToList(); // anonymous class to create JSON object

        JavaScriptSerializer js = new JavaScriptSerializer();


        string jsonString = js.Serialize(mList);
        return jsonString;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]

    //public string getMachine(string machineType)
    //{
    //    Machine machine = new Machine();
    //    List<Machine> mList = new List<Machine>();
    //    List<Machine> typeList = new List<Machine>();

    //    mList = machine.getMachine();

    //    foreach (Machine m in mList)
    //    {
    //        if (m.MachineType == machineType)
    //        {
    //            typeList.Add(m);
    //        }
    //    }

    //    JavaScriptSerializer js = new JavaScriptSerializer();


    //    string jsonString = js.Serialize(typeList);
    //    return jsonString;
    //}

    public string getMachine()
    {
        Machine machine = new Machine();
        List<Machine> mList = new List<Machine>();


        mList = machine.getMachine();

        JavaScriptSerializer js = new JavaScriptSerializer();


        string jsonString = js.Serialize(mList);
        return jsonString;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string getOpenBid()
    {
        Bid bid = new Bid();
        List<Bid> bList = new List<Bid>();

        bList = bid.getOpenBids();

        JavaScriptSerializer js = new JavaScriptSerializer();


        string jsonString = js.Serialize(bList);
        return jsonString;
    }




    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string getUserData()
    {
        User user = new User();
        List<User> uList = new List<User>();

        uList = user.getUserData();

        JavaScriptSerializer js = new JavaScriptSerializer();


        string jsonString = js.Serialize(uList);
        return jsonString;
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string getAgentReport(int userID)
    {
        Bid bid = new Bid();
        List<Bid> bidList = new List<Bid>();
        List<Bid> bList = new List<Bid>();

        bidList = bid.getOpenBids();
        foreach (Bid b in bidList)
        {
            if (b.UserId == userID) bList.Add(b);
        }

        JavaScriptSerializer js = new JavaScriptSerializer();


        string jsonString = js.Serialize(bList);
        return jsonString;
    }


    //--------------------------------------------------------------------------
    //function for client's bid
    //--------------------------------------------------------------------------

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]

    public string getBidForClient(int cId)
    {
        Bid bid = new Bid();
        List<Bid> openBidsList = new List<Bid>();
        openBidsList = bid.getBidForClient(cId);

        JavaScriptSerializer js = new JavaScriptSerializer();


        string jsonString = js.Serialize(openBidsList);
        return jsonString;
    }

    //--------------------------------------------------------------------------
    //function for agent bid
    //--------------------------------------------------------------------------

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]

    public string getBidForAgent(int userID)
    {
        Bid bid = new Bid();
        List<Bid> openBidsList = new List<Bid>();
        openBidsList = bid.getBidForAgent(userID);

        JavaScriptSerializer js = new JavaScriptSerializer();


        string jsonString = js.Serialize(openBidsList);
        return jsonString;
    }

}
