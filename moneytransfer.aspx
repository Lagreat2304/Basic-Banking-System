<%@ Page Language="C#" AutoEventWireup="true" CodeFile="moneytransfer.aspx.cs" Inherits="moneytransfer" StylesheetTheme="SkinFile" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Language" content="en-us" />
    <link href="style/style1.css" rel="Stylesheet" />
    <title>BBS :: Money Transfer</title>
    <script type="text/javascript">
        function close_window() {
            var new_tab;

            if (confirm("Close Window?")) {
                new_tab.close();
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <div align="center">
                <table width="1000" border="1" style="border-collapse: collapse" bordercolor="#000000" cellspacing="1" cellpadding="0">
                    <tr>
                        <td>


                            <table border="0" width="1000" cellspacing="0" id="table1" cellpadding="0">
                                <tr>
                                    <td>
                                        <img border="0" src="images/top3.gif" width="1000" height="67" alt="" /></td>
                                </tr>
                                <tr>
                                    <td height="18" style="padding-top: 0; padding-bottom: 3px; border-left-width: 1px; border-right-width: 1px; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px" class="td1" align="left">&nbsp; Welcome  <span id="sp_name" runat="server"></span>&nbsp; &nbsp; 
					<a href="mypage.aspx">HOME</a>&nbsp; | &nbsp; 
					 <a href="customer.aspx">VIEW CUSTOMER</a>&nbsp; | &nbsp; 
					 <a href="moneytransfer.aspx">TRANSFER MONEY</a>&nbsp; | &nbsp;
                     <a href="viewtransaction.aspx">TRANSACTIONS VIEW</a>&nbsp; | &nbsp
                 <a href="javascript:close_window();">CLOSE</a></td>
                                </tr>
                                <tr>
                                    <td class="td1" style="background-image: url('images/back2.gif')">
                                        <p>&nbsp;</p>
                                        <p>
                                            &nbsp;
                                        </p>
                                        <div align="center">
                                            <table border="1" width="573" cellspacing="1" style="border-collapse: collapse" bordercolor="#999999" id="table2">
                                                <tr>
                                                    <td class="td2">
                                                        <p align="left">
                                                        &nbsp; BBS : Money Transfer 
								Details</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <table border="0" width="97%" id="table3" cellpadding="2">
                                                            <tr>
                                                                <td align="left" class="td1" valign="top" width="54"></td>
                                                                <td align="left" class="td1" style="width: 112px" valign="top"></td>
                                                                <td align="left" class="td1" valign="top"></td>
                                                            </tr>

                                                            <tr>
                                                                <td width="54" class="td1" align="left" valign="top">&nbsp;</td>
                                                                <td class="td1" align="left" valign="top" style="width: 112px">&nbsp;From Customer:</td>
                                                                <td class="td1" align="left" valign="top">&nbsp;<asp:DropDownList ID="DdlFromCustomer" runat="server" BackColor="WhiteSmoke"
                                                                    Font-Names="arial" Font-Size="8pt" Width="131px" OnSelectedIndexChanged="DdlFromCustomer_SelectedIndexChanged" AutoPostBack="true">
                                                                </asp:DropDownList>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                                                                    runat="server" ControlToValidate="DdlFromCustomer" ErrorMessage="* Select Type" InitialValue="---Select---"></asp:RequiredFieldValidator></td>
                                                            </tr>
                                                            <tr>
                                                                <td width="54" class="td1" align="left" valign="top">&nbsp;</td>
                                                                <td class="td1" align="left" valign="top" style="width: 112px">&nbsp;Balance Amount:</td>
                                                                <td class="td1" align="left" valign="top">&nbsp;<asp:TextBox ID="TxtBalanceAmount" runat="server" ReadOnly="true"></asp:TextBox>&nbsp;
                                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="TxtBalanceAmount"
                                                Display="Dynamic" ErrorMessage="CompareValidator" Operator="DataTypeCheck" Type="Double">* Numeric only</asp:CompareValidator>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtBalanceAmount"
                                                                        ErrorMessage="* Enter Amount"></asp:RequiredFieldValidator></td>
                                                            </tr>

                                                            <tr>
                                                                <td width="54" class="td1" align="left" valign="top">&nbsp;</td>
                                                                <td class="td1" align="left" valign="top" style="width: 112px">&nbsp;To Customer:</td>
                                                                <td class="td1" align="left" valign="top">&nbsp;<asp:DropDownList ID="DdlToCustomer" runat="server" BackColor="WhiteSmoke"
                                                                    Font-Names="arial" Font-Size="8pt" Width="131px">
                                                                </asp:DropDownList>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                                                                    runat="server" ControlToValidate="DdlToCustomer" ErrorMessage="* Select Type" InitialValue="---Select---"></asp:RequiredFieldValidator></td>
                                                            </tr>
                                                            <tr>
                                                                <td width="54" class="td1" align="left" valign="top">&nbsp;</td>
                                                                <td class="td1" align="left" valign="top" style="width: 112px">&nbsp;Transfer Amount:</td>
                                                                <td class="td1" align="left" valign="top">&nbsp;<asp:TextBox ID="TxtTransferAmount" runat="server"></asp:TextBox>&nbsp;
                                            <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="TxtTransferAmount"
                                                Display="Dynamic" ErrorMessage="CompareValidator" Operator="DataTypeCheck" Type="Double">* Numeric only</asp:CompareValidator>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TxtTransferAmount"
                                                                        ErrorMessage="* Enter Amount"></asp:RequiredFieldValidator></td>
                                                            </tr>

                                                            <tr>
                                                                <td width="54" class="td1" align="left" valign="top">&nbsp;</td>
                                                                <td class="td1" align="left" valign="top" style="width: 112px">&nbsp;Remarks:</td>
                                                                <td class="td1" align="left" valign="top">&nbsp;<asp:TextBox ID="TxtDescription" runat="server" MaxLength="250" TextMode="MultiLine"
                                                                    Width="301px"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                                                                        runat="server" ControlToValidate="TxtDescription" ErrorMessage="* Enter Remarks"></asp:RequiredFieldValidator></td>
                                                            </tr>
                                                            <tr>
                                                                <td width="54" class="td1" align="left" valign="top">&nbsp;</td>
                                                                <td class="td1" align="left" valign="top" style="width: 112px">&nbsp;</td>
                                                                <td class="td1" align="left" valign="top">&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td width="54" class="td1" align="left" valign="top">&nbsp;</td>
                                                                <td class="td1" align="left" valign="top" style="width: 112px">&nbsp;</td>
                                                                <td class="td1" align="left" valign="top">&nbsp;
                                                                    <asp:Button ID="BtnSubmit" runat="server" Text="Submit" OnClick="BtnSubmit_Click" Width="130px" Height="30px" />&nbsp;
                                            <asp:Button ID="BtnBack" runat="server" Text="Back" OnClick="BtnBack_Click" Width="130px" Height="30px" /></td>
                                                            </tr>
                                                            <tr>
                                                                <td width="54" class="td1" align="left" valign="top">&nbsp;</td>
                                                                <td class="td1" align="left" valign="top" style="width: 112px">&nbsp;</td>
                                                                <td class="td1" align="left" valign="top">&nbsp;</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <p>&nbsp;</p>
                                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                                            ShowSummary="False" />
                                        <p>
                                            &nbsp;<p>&nbsp;</p>
                                        </p>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="20" style="border-left-width: 1px; border-right-width: 1px; border-top-style: solid; border-top-width: 1px; border-bottom-width: 1px" class="td1">
                                        <p align="center">
                                            <font face="Times New Roman">©</font>BBS - eTransactions,
                                            <script type="text/javascript">document.write(new Date().getFullYear())</script>
                                            .
                                        </p>
                                    </td>
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
