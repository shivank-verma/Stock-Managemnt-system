using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class stockcms : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    [System.Web.Services.WebMethod]
    [System.Web.Script.Services.ScriptMethod(UseHttpGet = false)]
    public static string AddProduct(int product_code, string prodetail)
    {
        product oproduct = new product();
        oproduct.productCode = product_code;
        oproduct.productDesc = prodetail;
        clsData oclsdata = new clsData();

        string ssql = "insert into product ([product_code],[product_desc]) values('" + oproduct.productCode + "','" + oproduct.productDesc + "')";

        bool flag = oclsdata.ExecuteQuery(ssql);
        if (flag)
        {
            return "Database Updated";
        }
        else 
        {
            return "Database error";
        }

 
    }


    [System.Web.Services.WebMethod]
    [System.Web.Script.Services.ScriptMethod(UseHttpGet = false)]
    public static string getDescription(int product_code)
    {
        
        clsData oclsdata = new clsData();

        string ssql = "select top 1 p.product_code,p.product_desc,d.alert_limit from purchase_data d right join  product p on p.product_code = d.prod_code where p.product_code='" + product_code + "' ORDER BY d.date desc";
         string jsonresult;
        DataTable dt = oclsdata.ExecQueryTable(ssql);
        jsonresult = Newtonsoft.Json.JsonConvert.SerializeObject(dt);
        if (dt == null || dt.Rows.Count == 0)
        {
            jsonresult = "product_desc:Details not found";
        }
       

       

        return jsonresult;

    }


    [System.Web.Services.WebMethod]
    [System.Web.Script.Services.ScriptMethod(UseHttpGet = false)]
    public static string updateAlertLimit(int product_code,Int64 alert_limit) 
    {
        string jsonresult;
         DataTable dt;
        clsData oclsdata = new clsData();
        string ssql = "update [purchase_data] set alert_limit='"+alert_limit+"' where prod_code='" + product_code + "';";
        bool flag = oclsdata.ExecuteQuery(ssql);
        if (flag)
        {
            string ssql2 = "select top 1 alert_limit from [purchase_data]  where prod_code='" + product_code + "'; ";
            dt = oclsdata.ExecQueryTable(ssql2);
            jsonresult = Newtonsoft.Json.JsonConvert.SerializeObject(dt);
        }
        else 
        {
            jsonresult = "Alert limit not updated";
        }
       

        return jsonresult;
    }




    [System.Web.Services.WebMethod]
    [System.Web.Script.Services.ScriptMethod(UseHttpGet = false)]
    public static string addpurchase(int prod_code, string pur_from, Int32 quantity, string bill_detail,string seller_phn ,string tin_no ,Int64 alert_limit,string bill_date )
    {
        oprPurchase opur = new oprPurchase();
        opur.iproductCode = prod_code;
        opur.ipPurchaseFrom = pur_from;
        opur.iQuantity = quantity;
        opur.ibill_detials = bill_detail;
        opur.ialert_limit = alert_limit;
        opur.iBill_date = bill_date;
        opur.isellerPhn = seller_phn;
        opur.iTin_no = tin_no;

        string ssql;

        bool flag = false;
        bool flag2=false;
        clsData oclsdata = new clsData();


        ssql = "select * from [daily_data] where [prod_code]='" + prod_code + "' order by [date] desc ";

        DataTable dt1 = oclsdata.ExecQueryTable(ssql);
        if (dt1 == null || dt1.Rows.Count == 0)
        {
            ssql = "INSERT INTO [purchase_data] ([prod_code],[purchase_from],[quantity],[date],[bill_no],[alert_limit],[tin_no],[seller_phn],[bill_date]) VALUES('" + opur.iproductCode + "','" + opur.ipPurchaseFrom + "','" + opur.iQuantity + "',CONVERT(date,GETDATE()),'" + opur.ibill_detials + "','"+opur.ialert_limit+"','"+opur.iTin_no+"','"+opur.isellerPhn+"','"+opur.iBill_date+"')";

            flag = oclsdata.ExecuteQuery(ssql);

            ssql = "insert into [daily_data] ([prod_code],[date],[used_today],[stock_left]) values('" + prod_code + "',convert(date,getdate()),0,'" + quantity + "')";
            flag2 = oclsdata.ExecuteQuery(ssql);
        }
        else
        {
            string stck_left = dt1.Rows[0]["stock_left"].ToString();
            Int64 istck_left = Convert.ToInt64(stck_left);
            istck_left = istck_left + opur.iQuantity ;

            ssql = "INSERT INTO [purchase_data] ([prod_code],[purchase_from],[quantity],[date],[bill_no],[alert_limit],[tin_no],[seller_phn],[bill_date]) VALUES('" + opur.iproductCode + "','" + opur.ipPurchaseFrom + "','" + opur.iQuantity + "',CONVERT(date,GETDATE()),'" + opur.ibill_detials + "','" + opur.ialert_limit + "','" + opur.iTin_no + "','" + opur.isellerPhn + "','" + opur.iBill_date + "')";

            flag = oclsdata.ExecuteQuery(ssql);

            //string date = DateTime.Now.ToString("yyyy-mm-dd");

            ssql = "update [daily_data] set [stock_left] = '" + istck_left + "' where [date] =convert(date,getdate()) and [prod_code]='"+opur.iproductCode+"';";
            flag2 = oclsdata.ExecuteQuery(ssql);

        }


  

        if (flag == true || flag2 == true)
        {
            return "Database Updated";

        }
        else 
        {
            return "Database Error!";
        }
    
    }



    [System.Web.Services.WebMethod]
    [System.Web.Script.Services.ScriptMethod(UseHttpGet = false)]
    public static string showDailydatalist(string date )
    {
       
        clsData oclsdata = new clsData();

        string ssql = "With cte as (select product_code, product_Desc,d.used_today,d.stock_left,d.date from product p join daily_data d on d.prod_code=p.product_code ) select * from cte c cross apply ( select top 1 purchase_from,alert_limit from purchase_data ps where ps.prod_code= c.product_code and c.date='"+date+"' order by date ) b(last_purchase,alert_limit);";

        DataTable dt = oclsdata.ExecQueryTable(ssql);


        //string ssql2 = "select [stock_left]  from [daily_data] order by [date] desc";
        //DataTable dt1 = oclsdata.ExecQueryTable(ssql2);
        //if (dt1 != null && dt1.Rows.Count > 0)
        //{ stockleft = Convert.ToInt64(dt1.Rows[0][0].ToString()); } 

        //ssql = "select count (*) from product; ";
        //DataTable dt2 = oclsdata.ExecQueryTable(ssql);
        //Int32 count = Convert.ToInt32(dt2.Rows[0][0].ToString());

        if (dt == null || dt.Rows.Count == 0)
        {
            ssql = "INSERT daily_data ([prod_code],[date],[used_today],[stock_left]) select distinct prod_code,'" + date + "',0,stock_left from ( select * , row_number() over (partition by daily_data.prod_code order by daily_data.date desc) as rn from product join daily_data on product.product_code = daily_data.prod_code ) tt where rn = 1;";
            bool flag = oclsdata.ExecuteQuery(ssql);
        }


         ssql = "With cte as (select product_code, product_Desc,d.used_today,d.stock_left,d.date from product p join daily_data d on d.prod_code=p.product_code ) select * from cte c cross apply ( select top 1 purchase_from,alert_limit from purchase_data ps where ps.prod_code= c.product_code and c.date='" + date + "' order by date ) b(last_purchase,alert_limit);";

        dt = oclsdata.ExecQueryTable(ssql);
        string jsonresult;

        jsonresult = Newtonsoft.Json.JsonConvert.SerializeObject(dt);

        return jsonresult;



    }


    [System.Web.Services.WebMethod]
    [System.Web.Script.Services.ScriptMethod(UseHttpGet = false)]
    public static string updateDailydatalist(string date, int prod_code, int used_today)
    {
        clsData oclsdata = new clsData();

        string ssql = "select top 1 * from daily_data where [prod_code]='" + prod_code + "' and [date]='"+date+"' ;";

        DataTable dt = oclsdata.ExecQueryTable(ssql);
        bool flag;

        string stock_left =   dt.Rows[0]["stock_left"].ToString();
        Int64 stck_left = Convert.ToInt64(stock_left);


        string usedtoday = dt.Rows[0]["used_today"].ToString();
        Int64 usd_today = Convert.ToInt64(usedtoday);
        if ( usd_today == 0)
        {
            stck_left = stck_left - used_today;

        }
        else 
        {
            stck_left = stck_left - used_today + usd_today;
        }


      

        if (dt.Rows.Count == 0 || dt.Rows == null)
        {
            ssql = "insert into daily_data ([prod_code],[date],[used_today]) values ('" + prod_code + "','" + date + "','" + used_today + "')";
            flag = oclsdata.ExecuteQuery(ssql);
            if (flag)
            {
                return "New Row Inserted";
            }
            else
            {
                return "DataBase Error";
            }
        }
        else
        {
            ssql = "update daily_data set [used_today]='" + used_today + "',[stock_left]='" + stck_left + "' where [prod_code]='" + prod_code + "' and [date]='" + date + "' ";
           flag  = oclsdata.ExecuteQuery(ssql);
           if (flag)
           {
               return "Database Updated";
           }
           else
           {
               return "DataBase Error";
           }
        
        }

    }



    [System.Web.Services.WebMethod]
    [System.Web.Script.Services.ScriptMethod(UseHttpGet = false)]
    public static string showPurchases(string startdate, string endate)
    {
        clsData oclsdata = new clsData();

        string ssql = "select * from [purchase_data] where [date] >='" + startdate + "' and [date] <='" + endate + "';";

        DataTable dt = oclsdata.ExecQueryTable(ssql);


        string jsonresult;

        jsonresult = Newtonsoft.Json.JsonConvert.SerializeObject(dt);

        return jsonresult;
        
    }



    [System.Web.Services.WebMethod]
    [System.Web.Script.Services.ScriptMethod(UseHttpGet = false)]
    public static string deleteProduct(int product_code)
    {
        clsData oclsdata = new clsData();
        string ssql1 = "delete from [product] where [product_code]='"+product_code+"'";
        bool flag1 = oclsdata.ExecuteQuery(ssql1);
        string ssql2 = "delete from [daily_data] where [prod_code]='" + product_code + "'";
        bool flag2 = oclsdata.ExecuteQuery(ssql2);
        string ssql3 = "delete from [purchase_data] where [prod_code]='" + product_code + "'";
        bool flag3 = oclsdata.ExecuteQuery(ssql3);

        if (flag1 && flag2 && flag3)
        {
            return "Database Updated!";
        }
        else 
        {
            return "Error in deletion!";
        }

    }

}