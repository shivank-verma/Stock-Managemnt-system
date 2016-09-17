using Microsoft.VisualBasic;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Configuration;
using System.Data.SqlClient;
public class clsData
{

    public clsData()
    {
        
      
       
        
}


    #region "VariableDeclaration"

    string sSqlConstr = System.Configuration.ConfigurationManager.ConnectionStrings["ConnStringDb"].ConnectionString;
    
    #endregion


    /// <summary>
    /// function to connect to database
    /// 
    /// </summary>
    /// <returns>sql connection object</returns>
    /// <remarks></remarks>
    public System.Data.SqlClient.SqlConnection SqlConnection()
    {
        try
        {
            SqlConnection scon = new SqlConnection(sSqlConstr);
          //  TraceLogger.Handler.log("Connection state :" + scon.State.ToString);
            return scon;
        }
        catch (Exception ex)
        {
            //TraceLogger.Handler.log("Exception" + ex.Message.ToString, TraceLogger.LogType.Error);
            throw ex;
        }
    }



    /// <summary>
    /// execute database query
    /// </summary>
    /// <param name="sSql"></param>
    /// <returns></returns>
    /// <remarks></remarks>
    public bool ExecuteQuery(string sSql)
    {
        bool functionReturnValue = false;
        try
        {
            functionReturnValue = true;
            SqlConnection sSqlConnection = SqlConnection();
            SqlCommand sSqlCommand = new SqlCommand(sSql, sSqlConnection);
            sSqlConnection.Open();
            sSqlCommand.ExecuteNonQuery();
            sSqlConnection.Close();
        }
        catch (Exception ex)
        {
            functionReturnValue = false;
           // TraceLogger.Handler.log("Exception" + ex.Message.ToString, TraceLogger.LogType.Error);
             throw ex;
        }
        return functionReturnValue;
    }




    /// <summary>
    /// function to execute databse query
    /// </summary>
    /// <param name="sSql"></param>
    /// <returns></returns>
    /// <remarks></remarks>
    public DataTable ExecQueryTable(string sSql)
    {
        DataTable functionReturnValue = default(DataTable);
        DataTable dt = new DataTable();
        try
        {
            dt.TableName = "tbl1";
            SqlConnection sSqlConnection = SqlConnection();
            SqlCommand sSqlCommand = new SqlCommand(sSql, sSqlConnection);
            SqlDataAdapter Da = new SqlDataAdapter(sSqlCommand);
            sSqlConnection.Open();
            Da.Fill(dt);
            sSqlConnection.Close();
            functionReturnValue = dt;
        }
        catch (Exception ex)
        {
            functionReturnValue = dt;
            //TraceLogger.Handler.log("Exception" + ex.Message.ToString, TraceLogger.LogType.Error);
            throw ex;
        }
        return functionReturnValue;
    }



}
