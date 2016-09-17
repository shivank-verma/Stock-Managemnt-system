using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for oprPurchase
/// </summary>
public class oprPurchase
{
	public oprPurchase()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    #region class varaiabe

    protected Int32 _iproductCode;
    protected string _ipPurchaseFrom = String.Empty;
    protected Int64 _iQuantity;
    protected string _ibill_detials = String.Empty;
    protected string _isellerPhn = String.Empty;
    protected string _iTin_no = String.Empty;
    protected Int64 _ialert_limit;
    protected string _iBill_date = String.Empty;
   
    #endregion





    #region class property


    public Int64 ialert_limit
    {
        get { return _ialert_limit; }
        set { _ialert_limit = value; }
    }


    public string iBill_date
    {
        get { return _iBill_date; }
        set { _iBill_date = value; }
    }



    public string iTin_no
    {
        get { return _iTin_no; }
        set { _iTin_no = value; }
    }


    public string isellerPhn
    {
        get { return _isellerPhn; }
        set { _isellerPhn = value; }
    }




    public Int32 iproductCode
    {
        get { return _iproductCode; }
        set { _iproductCode = value; }
    }

   

    public string ipPurchaseFrom
    {
        get { return _ipPurchaseFrom; }
        set { _ipPurchaseFrom = value; }
    }

    public string ibill_detials
    {
        get { return _ibill_detials; }
        set { _ibill_detials = value; }
    }

   
    public Int64 iQuantity
    {
        get { return _iQuantity; }
        set { _iQuantity = value; }
    }
    


    #endregion



}