using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for User
/// </summary>
public class User
{

    private int userId;

    public int UserId
    {
        get { return userId; }
        set { userId = value; }
    }

    private int userNumber;

    public int UserNumber
    {
        get { return userNumber; }
        set { userNumber = value; }
    }

    private string firstName;

    public string FirstName
    {
        get { return firstName; }
        set { firstName = value; }
    }


    private string lastName;

    public string LastName
    {
        get { return lastName; }
        set { lastName = value; }
    }



    private string phone;

    public string Phone
    {
        get { return phone; }
        set { phone = value; }
    }


    private string password;

    public string Password
    {
        get { return password; }
        set { password = value; }
    }


    private int permission;

    public int Permission
    {
        get { return permission; }
        set { permission = value; }
    }


    private string email;

    public string Email
    {
        get { return email; }
        set { email = value; }
    }

    private bool status;

    public bool Status
    {
        get { return status; }
        set { status = value; }
    }

    public User()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public User(int _userNumber, string _firstname, string _lastname, string _phone, int _permission, string _password, string _email, bool _status)
    {
        UserNumber = _userNumber;
        FirstName = _firstname;
        LastName = _lastname;
        Phone = _phone;
        Permission = _permission;
        Password = _password;
        Email = _email;
        Status =_status;

    }

    
    public int insertUser()
    {
        DBservices dbs = new DBservices();
        int numAffected = dbs.insertUser(this);
        return numAffected;
    }

    public bool CheckUserNumber(int userNumber)
    {
        DBservices dbs = new DBservices();
        int check = dbs.CheckUserNumberDB(userNumber);
        if (check > 0) return true;
        else return false;
    }


    public void deleteUser(int member)
    {
        DBservices dbs = new DBservices();
        dbs.deleteUser(member);
    }

    public User getUser(int UserID, string password)
    {
        DBservices dbs = new DBservices();
        return dbs.getUser(UserID, password);

    }


    public List<User> getUserData()
    {
        DBservices dbs = new DBservices();
        return dbs.getUserData();

    }
}