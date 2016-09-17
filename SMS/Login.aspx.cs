using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    [System.Web.Services.WebMethod]
    [System.Web.Script.Services.ScriptMethod(UseHttpGet = false)]
    public static string LoginMethod(string user_name, string pass_word)
    {
        clsLogin oclsLogin = new clsLogin();
        oclsLogin.username = user_name;
        oclsLogin.password = pass_word;
        System.Data.DataTable dt = new DataTable();



        clsData oclsData = new clsData();

        string ssql = "select TOP 1 [username],[password] FROM login;";
        dt = oclsData.ExecQueryTable(ssql);

        string usr_db = dt.Rows[0]["username"].ToString();
        string pw_db = dt.Rows[0]["password"].ToString();

        if (oclsLogin.username == usr_db && oclsLogin.password == pw_db)
        {


            System.Web.HttpContext.Current.Session["LoginName"] = usr_db;

            return "stockcms.aspx?user=" + usr_db;

        }
        else if (oclsLogin.username == usr_db && oclsLogin.password != pw_db)
        {
            return "password incorrect";

        }
        else
        {
            return "incorrect login";

        }




    }


}