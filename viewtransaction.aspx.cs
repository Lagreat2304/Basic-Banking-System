using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class viewtransaction : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        sp_name.InnerHtml = "<span style='" + "color: darkgreen; font-size: 14pt;'>" + " - VISHAL RK</span>";

        displaygrid();
        
    }
    private void displaygrid()
    {
        string connectionInfo = ConfigurationManager.AppSettings["ConnectionInfo"];
        SqlConnection cn = new SqlConnection();
        cn.ConnectionString = connectionInfo;
        if (cn.State == ConnectionState.Closed)
        {
            cn.Open();
        }

        string s1="";
        string s2="";
       
        string s3;
        s3 = "select transaction_no as [Trans_No],format(transaction_date, 'dd/MMM/yyyy') as [Trans_Date],from_cust_acc_no as [From_Ac_No]," +
                " from_cust_name as [From_Cust_Name],to_cust_acc_no as [To_Ac_No],to_cust_name as [To_Cust_Name],transfer_amount as [Transfer_Amount],remarks as [Remarks]" +
                //" ,created_by as [Created_By],created_datetime as [Created_DateTime]" +
                "  from bbs_2023..moneytransfer_trans order by transaction_no;";

        SqlDataAdapter da=new SqlDataAdapter (s3,cn);
        DataTable dt=new DataTable();

        da.Fill(dt);
        sp_count.InnerHtml = dt.Rows.Count.ToString() + " Records found.";

        ViewState["dt"] = dt;
        GridView1.DataSource = ViewState["dt"];
        GridView1.DataBind();

    }

    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        displaygrid();
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        return;
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataSource = ViewState["dt"];
        GridView1.DataBind();
    }
}
