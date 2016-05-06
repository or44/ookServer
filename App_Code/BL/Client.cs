using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;

/// <summary>
/// Summary description for Client
/// </summary>
public class Client
{
    //private static int counterClient = 5;

    //public static int CounterClient
    //{
    //    get { return Client.counterClient; }
        
    //}

    
    private int clientId;

    public int ClientId
    {
        get { return clientId; }
        set { clientId = value; }
    }

    private string clientName;

    public string ClientName
    {
        get { return clientName; }
        set { clientName = value; }
    }


    private string contactName;

    public string ContactName
    {
        get { return contactName; }
        set { contactName = value; }
    }



    private string phoneNumber;

    public string PhoneNumber
    {
        get { return phoneNumber; }
        set { phoneNumber = value; }
    }



    private string email;

    public string Email
    {
        get { return email; }
        set { email = value; }
    }



    private int status;

    public int Status
    {
        get { return status; }
        set { status = value; }
    }



    public Client()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public Client(int clientId, string clientName, string contactName, string phoneNumber, int status, string email = null)
    {
        this.ClientId = clientId;
        this.ClientName = clientName;
        this.ContactName = contactName;
        this.PhoneNumber = phoneNumber;
        this.Email = email;
        this.Status = status;
        
    }


    //public int getMaxClientId()
    //{
    //    DBservices dbs = new DBservices();
    //    int MaxClientId = dbs.getMaxClientId();
    //    return MaxClientId;
    //}


    public Client(string _clientName, string _contactName, string _phoneNumber, string _email)
    {
        //ClientId = (getMaxClientId()) + 1;
        ClientName = _clientName;
        ContactName = _contactName;
        PhoneNumber = _phoneNumber;
        Email = _email;
        Status = 0;
      
    }

    public int insertClient()
    {
        DBservices dbs = new DBservices();
        int numAffected = dbs.insertClient(this);
        return numAffected;
    }

    protected void insertNewUser_Click(object sender, EventArgs e)
    {
        //string str;
        //str = "האם אתה בטוח?";
        
        //ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowNewUser('" + str + "');", true);
    }


    public List<Client> getClient()
    {

        List<Client> cList = new List<Client>();
        DBservices dbs = new DBservices();
        cList = dbs.getClient();
        return cList;
    }


    public int deleteClient(string client)
    {
        DBservices dbs = new DBservices();
        return dbs.deleteClient(client);
    }
}