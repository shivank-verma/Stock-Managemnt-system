using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for product
/// </summary>
public class product
{
	public product()
	{
		//
		// TODO: Add constructor logic here
		//
    }


    #region class varaiabe 

    protected Int32 _productCode;
    protected string _productDesc = String.Empty;
    #endregion



   

    #region class property

    public Int32 productCode
    {
        get { return _productCode; }
        set { _productCode = value; }
    }

    public string productDesc
    {
        get { return _productDesc; }
        set { _productDesc = value; }
    }

   
    #endregion
}