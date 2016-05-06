using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;
using System.Text;
using System.Configuration;

/// <summary>
/// Summary description for DBservices
/// </summary>
public class DBservices
{
    public DBservices()
    {
        //
        // TODO: Add constructor logic here
        //
    }



    //--------------------------------------------------------------------------------------------------
    // This method creates a connection to the database according to the connectionString name in the web.config 
    //--------------------------------------------------------------------------------------------------
    public SqlConnection connect(String conString)
    {

        // read the connection string from the configuration file
        string cStr = WebConfigurationManager.ConnectionStrings[conString].ConnectionString;
        SqlConnection con = new SqlConnection(cStr);
        con.Open();
        return con;
    }

    public int insertClient(Client client)
    {

        SqlConnection con;
        SqlCommand cmd;

        try
        {
            con = connect("ookDBConnectionString"); // create the connection
        }
        catch (Exception ex)
        {
            // write to log
            throw (ex);
        }

        String cStr = BuildInsertCommandClient(client);      // helper method to build the insert string

        cmd = CreateCommand(cStr, con);             // create the command

        try
        {
            int numEffected = cmd.ExecuteNonQuery(); // execute the command
            return numEffected;
        }
        catch (Exception ex)
        {

            return 0;
            // write to log
            throw (ex);

        }

        finally
        {
            if (con != null)
            {
                // close the db connection
                con.Close();
            }
        }

    }

    private String BuildInsertCommandClient(Client client)
    {
        String command;

        StringBuilder sb = new StringBuilder();
        // use a string builder to create the dynamic string
        sb.AppendFormat("Values('{0}', '{1}' ,'{2}','{3}','{4}','{5}')", client.ClientId, client.ClientName, client.ContactName, client.PhoneNumber, client.Email, client.Status);
        String prefix = "INSERT INTO [Client] " + "(clientID,clientName,contactName,phoneNumber,email,status)";
        command = prefix + sb.ToString();

        return command;
    }

    private SqlCommand CreateCommand(String CommandSTR, SqlConnection con)
    {

        SqlCommand cmd = new SqlCommand(); // create the command object

        cmd.Connection = con;              // assign the connection to the command object

        cmd.CommandText = CommandSTR;      // can be Select, Insert, Update, Delete 

        cmd.CommandTimeout = 10;           // Time to wait for the execution' The default is 30 seconds

        cmd.CommandType = System.Data.CommandType.Text; // the type of the command, can also be stored procedure

        return cmd;
    }





    //public int getMaxClientId()
    //{


    //    SqlConnection con;
    //    SqlCommand cmd;
    //    object maxClientId;
    //    try
    //    {
    //        con = connect("ookDBConnectionString"); // create the connection
    //    }
    //    catch (Exception ex)
    //    {
    //        // write to log
    //        throw (ex);
    //    }

    //    String selectSTR = "SELECT MAX (clientID) FROM Client WHERE [clientID]< 399999";    // helper method to build the insert string
    //    //String selectSTR = "SELECT MAX (clientID) FROM Client";    // helper method to build the insert string
    //    cmd = CreateCommand(selectSTR, con);             // create the command
    //    try
    //    {


    //        cmd = new SqlCommand(selectSTR, con);

    //        maxClientId = cmd.ExecuteScalar();

    //        if (maxClientId.ToString() == "")
    //        {
    //            return 0;
    //        }

    //    }
    //    catch (Exception ex)
    //    {

    //        return 0;
    //        // write to log
    //        throw (ex);

    //    }

    //    finally
    //    {
    //        if (con != null)
    //        {
    //            // close the db connection
    //            con.Close();
    //        }
    //    }
    //    return int.Parse(maxClientId.ToString());
    //}



    //---------------------------------------------------------------------------------
    // Create the SqlCommand GetMaterial from DB
    //---------------------------------------------------------------------------------

    public List<Material> getMaterial()
    {

        SqlConnection con;
        List<Material> listMaterial = new List<Material>();

        try
        {

            con = connect("ookDBConnectionString"); // create a connection to the database using the connection String defined in the web config file
        }

        catch (Exception ex)
        {
            // write to log
            throw (ex);

        }

        try
        {
            String selectSTR = "SELECT * FROM Materials";

            SqlCommand cmd = new SqlCommand(selectSTR, con);

            SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            while (dr.Read())
            {// Read till the end of the data into a row
                // read first field from the row into the list collection
                Material M = new Material(Convert.ToString(dr["materialSerialNumber"]), Convert.ToString(dr["materialDescription"]), Convert.ToString(dr["materialType"]), Convert.ToString(dr["materialWidth"]), Convert.ToString(dr["materialThick"]), Convert.ToString(dr["materialGroup"]),
                   Convert.ToString(dr["materialBasicUOM"]), Convert.ToString(dr["materialAlternateUOM"]), Convert.ToInt32(dr["materialCostingType"]), Convert.ToDouble(dr["materialUnitPrice"]));
                listMaterial.Add(M);
            }

        }
        catch (Exception ex)
        {
            // write to log
            throw (ex);

        }
        return listMaterial;

    }



    //---------------------------------------------------------------------------------
    // Create the SqlCommand GetMachine from DB
    //---------------------------------------------------------------------------------

    public List<Machine> getMachine()
    {

        SqlConnection con;
        List<Machine> listMachine = new List<Machine>();

        try
        {

            con = connect("ookDBConnectionString"); // create a connection to the database using the connection String defined in the web config file
        }

        catch (Exception ex)
        {
            // write to log
            throw (ex);

        }

        try
        {
            String selectSTR = "SELECT * FROM Machine";

            SqlCommand cmd = new SqlCommand(selectSTR, con);

            SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            while (dr.Read())
            {// Read till the end of the data into a row
                // read first field from the row into the list collection
                Machine Mach = new Machine(Convert.ToInt32(dr["machineID"]), Convert.ToString(dr["machineType"]), Convert.ToString(dr["machineName"]), Convert.ToString(dr["machineWidth"]), Convert.ToString(dr["wastPreparation"]), Convert.ToDouble(dr["invalidPreparation"]),
                   Convert.ToDouble(dr["preparationTime"]), Convert.ToDouble(dr["rhythmPerHoure"]), Convert.ToDouble(dr["pricePerHoure"]));
                listMachine.Add(Mach);
            }

        }
        catch (Exception ex)
        {
            // write to log
            throw (ex);

        }
        return listMachine;

    }


    public int CheckUserNumberDB(int userNumber)
    {


        SqlConnection con;
        SqlCommand cmd;
        int count = 0;
        try
        {
            con = connect("ookDBConnectionString"); // create the connection
        }
        catch (Exception ex)
        {
            // write to log
            throw (ex);
        }

        String cStr = "SELECT * FROM [User] WHERE UserID LIKE " + userNumber;      // helper method to build the insert string

        cmd = CreateCommand(cStr, con);             // create the command
        try
        {


            cmd = new SqlCommand(cStr, con);

            SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            while (dr.Read())
            {// Read till the end of the data into a row
                // read first field from the row into the list collection
                count++;
            }
        }
        catch (Exception ex)
        {

            return 0;
            // write to log
            throw (ex);

        }

        finally
        {
            if (con != null)
            {
                // close the db connection
                con.Close();
            }
        }
        return count;
    }


    public int insertUser(User user)
    {

        SqlConnection con;
        SqlCommand cmd;

        try
        {
            con = connect("ookDBConnectionString"); // create the connection
        }
        catch (Exception ex)
        {
            // write to log
            throw (ex);
        }

        String cStr = BuildInsertCommandUser(user);      // helper method to build the insert string

        cmd = CreateCommand(cStr, con);             // create the command

        try
        {
            int numEffected = cmd.ExecuteNonQuery(); // execute the command
            return numEffected;
        }
        catch (Exception ex)
        {

            return 0;
            // write to log
            throw (ex);

        }

        finally
        {
            if (con != null)
            {
                // close the db connection
                con.Close();
            }
        }

    }

    private String BuildInsertCommandUser(User user)
    {
        String command;

        StringBuilder sb = new StringBuilder();
        // use a string builder to create the dynamic string
        sb.AppendFormat("Values('{0}', '{1}' ,'{2}','{3}','{4}','{5}','{6}','{7}')", user.UserNumber, user.FirstName, user.LastName, user.Phone, user.Permission, (string)user.Password, user.Email, user.Status);
        String prefix = "INSERT INTO [User] " + "(userNumber,firstName,lastName,phone,permission,password,email,status)";
        command = prefix + sb.ToString();

        return command;
    }


    public void deleteUser(int number)
    {


        SqlConnection con;
        SqlCommand cmd;
        int count = 0;
        try
        {
            con = connect("ookDBConnectionString"); // create the connection
        }
        catch (Exception ex)
        {
            // write to log
            throw (ex);
        }

        String cStr = "UPDATE [User] SET[status]=0 WHERE userNumber LIKE " + number;      // helper method to build the insert string

        cmd = CreateCommand(cStr, con);             // create the command
        try
        {


            cmd = new SqlCommand(cStr, con);

            SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            while (dr.Read())
            {// Read till the end of the data into a row
                // read first field from the row into the list collection
                count++;
            }
        }
        catch (Exception ex)
        {


            // write to log
            throw (ex);

        }

        finally
        {
            if (con != null)
            {
                // close the db connection
                con.Close();
            }
        }

    }

    //---------------------------------------------------------------------------------
    // get users data
    //---------------------------------------------------------------------------------
    public List<User> getUserData()
    {
        List<User> u1 = new List<User>();
        SqlConnection con;

        try
        {
            con = connect("ookDBConnectionString"); // create a connection to the database using the connection String defined in the web config file
        }

        catch (Exception ex)
        {
            // write to log
            throw (ex);
        }

        try
        {
            String selectSTR = "SELECT * FROM [User]";

            SqlCommand cmd = new SqlCommand(selectSTR, con);

            SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            while (dr.Read())
            {// Read till the end of the data into a row
                // read first field from the row into the list collection
                User NewUser = new User((int)(dr["userNumber"]), Convert.ToString(dr["firstName"]), Convert.ToString(dr["lastName"]), Convert.ToString(dr["phone"]), (int)(dr["permission"]), Convert.ToString(dr["password"]), Convert.ToString(dr["email"]), Convert.ToBoolean(dr["status"]));
                NewUser.UserId = Convert.ToInt16((dr["userID"]));
                u1.Add(NewUser);


            }

        }
        catch (Exception ex)
        {
            // write to log
            throw (ex);
        }
        return u1;
    }


    public int deleteClient(string clientID)
    {

        SqlConnection con;
        SqlCommand cmd;

        try
        {
            con = connect("ookDBConnectionString"); // create the connection
        }
        catch (Exception ex)
        {
            // write to log
            throw (ex);
        }

        String cStr = "UPDATE [Client] SET[status]=2 WHERE clientID LIKE '" + clientID+"'";     // helper method to build the insert string

        cmd = CreateCommand(cStr, con);             // create the command

        try
        {
            int numEffected = cmd.ExecuteNonQuery(); // execute the command
            return numEffected;
        }
        catch (Exception ex)
        {

            return 0;
            // write to log
            throw (ex);

        }

        finally
        {
            if (con != null)
            {
                // close the db connection
                con.Close();
            }
        }

    }


    //---------------------------------------------------------------------------------
    // Create the SqlCommand GetClient from DB
    //---------------------------------------------------------------------------------

    public List<Client> getClient()
    {

        SqlConnection con;
        List<Client> listClient = new List<Client>();

        try
        {

            con = connect("ookDBConnectionString"); // create a connection to the database using the connection String defined in the web config file
        }

        catch (Exception ex)
        {
            // write to log
            throw (ex);

        }

        try
        {
            String selectSTR = "SELECT * FROM Client";

            SqlCommand cmd = new SqlCommand(selectSTR, con);

            SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            while (dr.Read())
            {// Read till the end of the data into a row
                // read first field from the row into the list collection
                Client C = new Client(Convert.ToInt32(dr["clientID"]), Convert.ToString(dr["clientName"]), Convert.ToString(dr["contactName"]), Convert.ToString(dr["phoneNumber"]),
                    Convert.ToInt32(dr["status"]), Convert.ToString(dr["email"]));
                listClient.Add(C);
            }

        }
        catch (Exception ex)
        {
            // write to log
            throw (ex);

        }
        return listClient;

    }





    public int insertBid(Bid bid)
    {

        SqlConnection con;
        SqlCommand cmd;

        try
        {
            con = connect("ookDBConnectionString"); // create the connection
        }
        catch (Exception ex)
        {
            // write to log
            throw (ex);
        }

        String cStr = BuildInsertBidCommandClient(bid);      // helper method to build the insert string

        cmd = CreateCommand(cStr, con);             // create the command

        try
        {
            int numEffected = cmd.ExecuteNonQuery(); // execute the command
            return numEffected;
        }
        catch (Exception ex)
        {

            return 0;
            // write to log
            throw (ex);

        }

        finally
        {
            if (con != null)
            {
                // close the db connection
                con.Close();
            }
        }

    }

    private String BuildInsertBidCommandClient(Bid bid)
    {
        String command;

        StringBuilder sb = new StringBuilder();
        // use a string builder to create the dynamic string
        sb.AppendFormat("Values('{0}', '{1}' ,'{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}','{11}','{12}','{13}','{14}','{15}','{16}','{17}','{18}','{19}')", bid.ClientId, bid.UserId, bid.Status, bid.ProductName, bid.ProductType, bid.ProductWidth, bid.ProductPitch, bid.NumberOfColor,
            bid.TargetPrice, bid.OpeningDate, bid.TargetDate, bid.PercentageOfColdGlueCover, bid.PercentageOfColor, bid.PercentageOfWhiteColor, bid.PercentageOfLacquer, bid.PercentageOfCommission, bid.PercentageOfDiscount, bid.NumberOfLeminate, bid.Comment, bid.ClosingTimeMarketer);
        String prefix = "INSERT INTO [Bid] " + "(clientID,userID,status,productName,productType,productWidth,pitch,numberOfColor,targetPrice,openingDate,targetDate,percentageOfColdGlueCover,percentageOfColor,percentageOfWhiteColor,percentageOfLacquer,percentageOfCommission,percentageOfDiscount,numberOfLeminate,comment,closingTimeMarketer)";
        command = prefix + sb.ToString();

        return command;
    }


    public User getUser(int userNumber, string password)
    {
        User u1 = new User();
        SqlConnection con;

        try
        {
            con = connect("ookDBConnectionString"); // create a connection to the database using the connection String defined in the web config file
        }

        catch (Exception ex)
        {
            // write to log
            throw (ex);
        }

        try
        {
            String selectSTR = "SELECT * FROM [User] WHERE userNumber = " + userNumber + " and password='" + password + "'";

            SqlCommand cmd = new SqlCommand(selectSTR, con);

            SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            while (dr.Read())
            {// Read till the end of the data into a row
                // read first field from the row into the list collection
                User NewUser = new User((int)(dr["userNumber"]), Convert.ToString(dr["firstName"]), Convert.ToString(dr["lastName"]), Convert.ToString(dr["phone"]), (int)(dr["permission"]), Convert.ToString(dr["password"]), Convert.ToString(dr["email"]), Convert.ToBoolean(dr["status"]));
                NewUser.UserId = Convert.ToInt16((dr["userID"]));
                u1 = NewUser;


            }

        }
        catch (Exception ex)
        {
            // write to log
            throw (ex);
        }
        return u1;
    }


    //public void getBidId(string clientId, DateTime openDate)
    //{
    //    int bid;
    //    SqlConnection con;

    //    try
    //    {
    //        con = connect("ookDBConnectionString"); // create a connection to the database using the connection String defined in the web config file
    //    }

    //    catch (Exception ex)
    //    {
    //        // write to log
    //        throw (ex);
    //    }

    //    try
    //    {
    //        String selectSTR = "SELECT bidID FROM [Bid] WHERE clientID = " + clientId + " and openingDate='" + openDate + "'";

    //        SqlCommand cmd = new SqlCommand(selectSTR, con);

    //        SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

    //        while (dr.Read())
    //        {// Read till the end of the data into a row
    //            // read first field from the row into the list collection

    //             bid =(int) (dr["bidID"]);


    //        }

    //    }
    //    catch (Exception ex)
    //    {
    //        // write to log
    //        throw (ex);
    //    }
    //      //return bid;
    //}


    public int getBidId(string clientId, DateTime openDate)
    {

  
        string bid;
        SqlConnection con;
        SqlCommand cmd;
       
        try
        {
            con = connect("ookDBConnectionString"); // create the connection
        }
        catch (Exception ex)
        {
            // write to log
            throw (ex);
        }

        String selectSTR = "SELECT bidID FROM [Bid] WHERE clientID = " + clientId + " and openingDate='" + openDate + "'";   // helper method to build the insert string
        //String selectSTR = "SELECT MAX (clientID) FROM Client";    // helper method to build the insert string
        cmd = CreateCommand(selectSTR, con);             // create the command
        try
        {


            cmd = new SqlCommand(selectSTR, con);
          
            object bidId = cmd.ExecuteScalar();
            bid = bidId.ToString();
  

        }
        catch (Exception ex)
        {

            return 0;
            // write to log
            throw (ex);

        }

        finally
        {
            if (con != null)
            {
                // close the db connection
                con.Close();
            }
        }
        return int.Parse(bid) ;
    }





    public Material getMaterialData(string materialId)
    {
        Material M = new Material();
        SqlConnection con;

        try
        {
            con = connect("ookDBConnectionString"); // create a connection to the database using the connection String defined in the web config file
        }

        catch (Exception ex)
        {
            // write to log
            throw (ex);
        }

        try
        {
            String selectSTR = "SELECT * FROM [Materials] WHERE materialSerialNumber ='" +M + "'";

            SqlCommand cmd = new SqlCommand(selectSTR, con);

            SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            while (dr.Read())
            {// Read till the end of the data into a row
                // read first field from the row into the list collection
                 M = new Material(Convert.ToString(dr["materialSerialNumber"]), Convert.ToString(dr["materialDescription"]), Convert.ToString(dr["materialType"]), Convert.ToString(dr["materialWidth"]), Convert.ToString(dr["materialThick"]), Convert.ToString(dr["materialGroup"]),
                  Convert.ToString(dr["materialBasicUOM"]), Convert.ToString(dr["materialAlternateUOM"]), Convert.ToInt32(dr["materialCostingType"]), Convert.ToDouble(dr["materialUnitPrice"]));

               
            }

        }
        catch (Exception ex)
        {
            // write to log
            throw (ex);
        }
        return M;
    }

    public List<Bid> getOpenBids()
    {

        SqlConnection con;
        List<Bid> openBidsList = new List<Bid>();

        try
        {

            con = connect("ookDBConnectionString"); // create a connection to the database using the connection String defined in the web config file
        }

        catch (Exception ex)
        {
            // write to log
            throw (ex);

        }

        try
        {
            string selectSTR = "select b.bidID ,b.userID, c.clientName , b.productName  ,b.status  from Bid b inner join Client c on b.clientID=c.clientID ";
            SqlCommand cmd = new SqlCommand(selectSTR, con);

            SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            while (dr.Read())
            {// Read till the end of the data into a row
                // read first field from the row into the list collection
                Bid B = new Bid(Convert.ToInt32(dr["bidID"]), Convert.ToInt16(dr["userID"]), Convert.ToString(dr["clientName"]), Convert.ToString(dr["productName"]), Convert.ToInt32(dr["status"]));
                openBidsList.Add(B);
            }

        }
        catch (Exception ex)
        {
            // write to log
            throw (ex);

        }
        return openBidsList;

    }


    //---------------------------------------------------------------------------------
    // get getBidForTech from SQL
    //---------------------------------------------------------------------------------

    //public List<Bid> getBidForTech(int bidId)
    //{

    //    SqlConnection con;
    //    List<Bid> bidsList = new List<Bid>();

    //    try
    //    {

    //        con = connect("ookDBConnectionString"); // create a connection to the database using the connection String defined in the web config file
    //    }

    //    catch (Exception ex)
    //    {
    //        // write to log
    //        throw (ex);

    //    }

    //    try
    //    {
    //        string selectSTR = "select b.bidID ,c.clientName , b.productName, b.productType,  from Bid b inner join Client c on b.clientID=c.clientID where b.userID='" + bidId + "' ";
    //        SqlCommand cmd = new SqlCommand(selectSTR, con);
    //        //inner join User u  on b.userID=u.userID"
    //        SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

    //        while (dr.Read())
    //        {// Read till the end of the data into a row
    //            // read first field from the row into the list collection
    //            Bid B = new Bid(Convert.ToInt32(dr["bidID"]), Convert.ToInt16(dr["userID"]), Convert.ToString(dr["clientName"]), Convert.ToString(dr["productName"]), Convert.ToDateTime(dr["openingDate"]), Convert.ToInt32(dr["status"]));
    //            bidsList.Add(B);
    //        }

    //    }

    //    catch (Exception ex)
    //    {
    //        // write to log
    //        throw (ex);

    //    }
    //    return bidsList;

    //}




    //=========================from mobile function================================================

    //---------------------------------------------------------------------------------
    // Create the SqlCommand getBidForClient from DB
    //---------------------------------------------------------------------------------

    public List<Bid> getBidForClient(int cId)
    {

        SqlConnection con;
        List<Bid> openBidsList = new List<Bid>();

        try
        {

            con = connect("ookDBConnectionString"); // create a connection to the database using the connection String defined in the web config file
        }

        catch (Exception ex)
        {
            // write to log
            throw (ex);

        }

        try
        {
            string selectSTR = "select b.bidID ,b.userID ,c.clientName , b.productName , b.openingDate ,b.status from Bid b inner join Client c on b.clientID=c.clientID where b.clientID='" + cId + "' ";
            SqlCommand cmd = new SqlCommand(selectSTR, con);
            //inner join User u  on b.userID=u.userID"
            SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            while (dr.Read())
            {// Read till the end of the data into a row
                // read first field from the row into the list collection
                Bid B = new Bid(Convert.ToInt32(dr["bidID"]), Convert.ToInt16(dr["userID"]), Convert.ToString(dr["clientName"]), Convert.ToString(dr["productName"]), Convert.ToDateTime(dr["openingDate"]), Convert.ToInt32(dr["status"]));
                openBidsList.Add(B);
            }

        }

        catch (Exception ex)
        {
            // write to log
            throw (ex);

        }
        return openBidsList;

    }


    public List<Bid> getBidForAgent(int aId)
    {

        SqlConnection con;
        List<Bid> openBidsList = new List<Bid>();

        try
        {

            con = connect("ookDBConnectionString"); // create a connection to the database using the connection String defined in the web config file
        }

        catch (Exception ex)
        {
            // write to log
            throw (ex);

        }

        try
        {
            string selectSTR = "select b.bidID ,b.userID ,c.clientName , b.productName , b.openingDate ,b.status from Bid b inner join Client c on b.clientID=c.clientID where b.userID='" + aId + "' ";
            SqlCommand cmd = new SqlCommand(selectSTR, con);
            //inner join User u  on b.userID=u.userID"
            SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            while (dr.Read())
            {// Read till the end of the data into a row
                // read first field from the row into the list collection
                Bid B = new Bid(Convert.ToInt32(dr["bidID"]), Convert.ToInt16(dr["userID"]), Convert.ToString(dr["clientName"]), Convert.ToString(dr["productName"]), Convert.ToDateTime(dr["openingDate"]), Convert.ToInt32(dr["status"]));
                openBidsList.Add(B);
            }

        }

        catch (Exception ex)
        {
            // write to log
            throw (ex);

        }
        return openBidsList;

    }

    //=================================================================================================================

}



