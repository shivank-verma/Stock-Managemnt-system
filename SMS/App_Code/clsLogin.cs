using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsLogin
/// </summary>
public class clsLogin
{
	public clsLogin()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    #region class variable
    protected string _username = String.Empty;
    protected string _password = String.Empty;
    #endregion

    #region class property
    public string username
    {
        get { return _username; }
        set { _username = value; }
    }
    public string password
    {
        get { return _password; }
        set { _password = value; }
    }
    
    #endregion


}