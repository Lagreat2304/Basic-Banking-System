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

public partial class customer : System.Web.UI.Page
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

        string s3;

        s3 = " select cust_acc_no as [Acc No], cust_name as [Customer Name], cust_bank as [Bank Name]," +
               " cust_bank_branch as [Branch Name],'INR. '+convert(varchar(25), cast( right(rtrim(cast(cast(cust_current_balance as int) as varchar)),9) as money) ,1)" +
               " as [Current Balnce], created_by as [Created By], created_datetime as [Created DateTime]"+
               " from customer_master order by cust_acc_no";


        SqlDataAdapter da = new SqlDataAdapter(s3, cn);
        DataTable dt = new DataTable();

        da.Fill(dt);
        sp_count.InnerHtml = "<strong>" + dt.Rows.Count.ToString() + " Records Found.</strong> ";

        ViewState["dt"] = dt;
        GridView1.DataSource = ViewState["dt"];
        GridView1.DataBind();

    }


    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //if (e.Row.RowIndex >= 0)
        //{
        //    string s1, s2;
        //    s2 = "";
        //    s1 = "<a href='customerdetails.aspx?id=" + e.Row.Cells[0].Text + "'>Edit</a>";

        //    e.Row.Cells[7].Text = s1;
        //}

        return;
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataSource = ViewState["dt"];
        GridView1.DataBind();
    }
    protected void BtnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("mypage.aspx");
    }
    protected void BtnNew_Click(object sender, EventArgs e)
    {
        // Response.Redirect("customerdetails.aspx?id=0");
        return;
    }
}
