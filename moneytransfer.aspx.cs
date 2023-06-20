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

public partial class moneytransfer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        sp_name.InnerHtml = "<span style='" + "color: darkgreen; font-size: 14pt;'>" + " - VISHAL RK</span>";


        if (!IsPostBack)
        {
            FillDropDownList();

        }



    }

    private void FillDropDownList()
    {
        try
        {
            string connectionInfo = ConfigurationManager.AppSettings["ConnectionInfo"];
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = connectionInfo;
            if (cn.State == ConnectionState.Closed)
            {
                cn.Open();
            }

            string s3;

            s3 = " select -1 as [Acc_No] , '---Select---' as [Customer_Name]  union all select cust_acc_no as [Acc_No], cust_name as [Customer_Name]" +
                   " from customer_master";

            SqlDataAdapter da = new SqlDataAdapter(s3, cn);
            DataTable dt = new DataTable();

            da.Fill(dt);

            DdlFromCustomer.DataSource = dt;
            DdlFromCustomer.DataValueField = "Acc_No";
            DdlFromCustomer.DataTextField = "Customer_Name"; 
            DdlFromCustomer.DataBind();


            DdlToCustomer.DataSource = dt;
            DdlToCustomer.DataValueField = "Acc_No";
            DdlToCustomer.DataTextField = "Customer_Name";
            DdlToCustomer.DataBind();

        }
        catch
        { 
        }
    }
    protected void BtnSubmit_Click(object sender, EventArgs e)
    {

        try
        {
            if (DdlFromCustomer.Text == DdlToCustomer.Text)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('The customer names are the same, please check and change.');", true);
                return;
            }

            decimal mvarbalanceamount = Convert.ToDecimal(TxtBalanceAmount.Text);
            decimal mvartransferamount = Convert.ToDecimal(TxtTransferAmount.Text);

            if (mvartransferamount > mvarbalanceamount)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('The transfer amount should be less than or equal to balance amount.');", true);
                return;
            }

            string connectionInfo = ConfigurationManager.AppSettings["ConnectionInfo"];
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = connectionInfo;
            if (cn.State == ConnectionState.Closed)
            {
                cn.Open();
            }

            string s3;

            s3 = "exec bbs_2023..moneytransfersave '" + DdlFromCustomer.SelectedValue.ToString() + "','" + DdlFromCustomer.SelectedItem.ToString() + "','"
                + DdlToCustomer.SelectedValue.ToString() + "','" + DdlToCustomer.SelectedItem.ToString() + "','" + mvartransferamount.ToString() + "','" + TxtDescription.Text + "'";

            SqlCommand com = new SqlCommand(s3, cn);
            string successflag;
            successflag = com.ExecuteScalar().ToString();

            if (successflag == "success")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('The Money transferred successfully.');", true);
                return;
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Error please try again.');", true);
                return;
            }


        }
        catch 
        { 
        }
       

    }
    protected void BtnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("mypage.aspx");
    }



    protected void DdlFromCustomer_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {

            string connectionInfo = ConfigurationManager.AppSettings["ConnectionInfo"];
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = connectionInfo;
            if (cn.State == ConnectionState.Closed)
            {
                cn.Open();
            }

            string s3;

            s3 = " select cust_current_balance" +
                   " from customer_master where cust_acc_no='" + DdlFromCustomer.SelectedItem.Value.ToString() + "'";

            SqlDataAdapter da = new SqlDataAdapter(s3, cn);
            DataTable dt = new DataTable();

            da.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                TxtBalanceAmount.Text = dt.Rows[0][0].ToString();
            }


            //string message = DdlFromCustomer.SelectedItem.Text + " - " + DdlFromCustomer.SelectedItem.Value;
            //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + message + "');", true);
        }
        catch
        {

        }
    }
}
