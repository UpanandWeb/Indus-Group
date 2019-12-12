using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for uclass
/// </summary>
public class userclass
{//Default Constructor

    public userclass()
    {

    }

    /// <summary>

    /// Create object of student Class

    /// </summary>

    /// <param name="intRoll">Int RollNumber</param>

    /// <param name="strName">String Name</param>

    public userclass(string UserName, string Password)
    {

        this.UName = UserName;

        this.Pass = Password;

    }

    private string UserName;

    private string Password;

    public string UName
    {

        get
        {

            return UserName;

        }

        set
        {

            UserName = value;

        }

    }

    public string Pass
    {

        get
        {

            return Password;

        }

        set
        {

            Password = value;

        }

    }

}

