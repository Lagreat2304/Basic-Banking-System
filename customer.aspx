<%@ Page Language="C#" AutoEventWireup="true" CodeFile="customer.aspx.cs" Inherits="customer" StylesheetTheme="SkinFile" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
<meta http-equiv="Content-Language" content="en-us" />
<link href ="style/style1.css" rel="Stylesheet" />
    <title>BBS :: Customer</title>
	 <script type="text/javascript">
         function close_window() {
             if (confirm("Close Window?")) {
                 close();
             }
         }
     </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
         
			<div align="center">
         	<table width ="1000" border="1" style="border-collapse: collapse" bordercolor="#000000" cellspacing="1" cellpadding="0">
         	<tr>
         	<td>
			<table border="0" width="1000" cellspacing="0" id="table1" cellpadding="0">
				<tr>
					<td>
					<img border="0" src="images/top3.gif" width="1000" height="67" alt="" /></td>
				</tr>
				<tr>
					<td height="18" style="padding-top: 0; padding-bottom: 3px; border-left-width:1px; border-right-width:1px; border-top-width:1px; border-bottom-style:solid; border-bottom-width:1px" class ="td1" align="left">
					&nbsp; Welcome  <span id="sp_name" runat="server"></span> &nbsp; &nbsp; 
					 <a href="mypage.aspx">HOME</a>&nbsp; | &nbsp; 
					 <a href="customer.aspx">VIEW CUSTOMER</a>&nbsp; | &nbsp; 
					 <a href="moneytransfer.aspx">TRANSFER MONEY</a>&nbsp; | &nbsp;
                     <a href="viewtransaction.aspx">TRANSACTIONS VIEW</a>&nbsp; | &nbsp;
                     <a href="#" onclick="close_window();return false;">CLOSE</a></td>
				</tr>
				<tr>
					<td class="td1" style="background-image: url('images/back2.gif')">
					<p>&nbsp;</p>
                        <p>
                            &nbsp;</p>
					<div align="center">
						<table border="1" width="800" cellspacing="1" style="border-collapse: collapse" bordercolor="#999999" id="table2">
							<tr>
								<td class="td2">
								<p align="left">&nbsp;&nbsp; BBS : Customers</td>
							</tr>
							<tr>
								<td>
								<table border="0" width="97%" id="table3" cellpadding="2">
									<tr>
										<td class="td1" align="left" valign="top" colspan="3">&nbsp;<span id="sp_count" runat="server"></span></td>
									</tr>
                                    <tr>
                                        <td align="left" class="td1" colspan="3" valign="top">
                                            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" BackColor="White"
                                                BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black"
                                                GridLines="Vertical" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDataBound="GridView1_RowDataBound"
                                                PageSize="5">
                                                <FooterStyle BackColor="#CCCCCC" />
                                                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                                <AlternatingRowStyle BackColor="#CCCCCC" />
                                            </asp:GridView>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" class="td1" colspan="3" valign="top">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" class="td1" colspan="3" style="text-align: center" valign="top">
                                            &nbsp;
                                            <asp:Button ID="BtnNew" runat="server" OnClick="BtnNew_Click" Text="Add Employee"
                                                Width="130px" Height="30px" />&nbsp;
                                            <asp:Button ID="BtnBack" runat="server" OnClick="BtnBack_Click" Text="Back" Width="130px" Height="30px"/></td>
                                    </tr>
								</table>
								</td>
							</tr>
						</table>
					</div>
					<p>&nbsp;</p>
					<p>
                        &nbsp;<p>&nbsp;</td>
				</tr>
				<tr>
					<td height="20" style="border-left-width: 1px; border-right-width: 1px; border-top-style: solid; border-top-width: 1px; border-bottom-width: 1px" class="td1">
					<p align="center"><font face="Times New Roman">©</font>BBS - eTransactions, <script type="text/javascript">document.write(new Date().getFullYear())</script>.</p></td>
				</tr>
			</table>
		          	</td>
         	</tr>
         	</table>
         
			</div>
		 
	</div>
    </form>
</body>
</html>
