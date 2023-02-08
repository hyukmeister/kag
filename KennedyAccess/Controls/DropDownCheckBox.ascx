<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DropDownCheckBox.ascx.cs" Inherits="KennedyAccess.Controls.DropDownCheckBox" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="mcc" %>
<script type = "text/javascript"> 
function CheckItem_<%=ControlLabel%>(checkBoxList)
{
    var options = checkBoxList.getElementsByTagName('input');
    var arrayOfCheckBoxLabels= checkBoxList.getElementsByTagName("label");
    var s = "";
    
    for(i=0;i<options.length;i++)
    {
        var opt = options[i];
        if(opt.checked)
        {
            s = s + ", " + arrayOfCheckBoxLabels[i].innerText;
        } 
    }
    if(s.length > 0) 
    {       
       s = s.substring(2, s.length); 
    }
    var TxtBox = document.getElementById("<%=txtCombo.ClientID%>");
    TxtBox.value = s;
}
</script>

<style type="text/css">
.checkboxlist input {
    margin-right: 10px !important;
}
.checkboxlist label {
    color: #642a2a !important;
}
</style>

<div class="form-floating mb-3;">
    <asp:TextBox ID="txtCombo" class="form-control" runat="server" ReadOnly="true" Width="430" Font-Size="X-Small" ></asp:TextBox>
    <label id="labLabel" runat="server" for="txtCombo">Employers</label>
</div>

<mcc:PopupControlExtender ID="PopupControlExtender111" runat="server" 
    TargetControlID="txtCombo" PopupControlID="Panel111" Position="Bottom" >
</mcc:PopupControlExtender>

<asp:Panel ID="Panel111" runat="server" CssClass="rounded-3 panel-primary" ScrollBars="Vertical" 
    Width="430" Height="220" BackColor="AliceBlue" BorderColor="Gray" BorderWidth="1">&nbsp;
    <asp:Button ID="btnSelectAll" runat="server" class="btn btn-primary" Text="Check All" OnClick="btnSelectAll_Click" Width="30%" Font-Bold="true"/>&nbsp;
    <asp:Button ID="btnUncheckAll" runat="server" class="btn btn-primary" Text="Uncheck All" OnClick="btnUncheckAll_Click" Width="30%" Font-Bold="true"/>&nbsp;
    <asp:Button ID="btnDone" runat="server" class="btn btn-primary" Text="Done" OnClick="btnDone_Click" Width="30%" Font-Bold="true"/>
    <asp:CheckBoxList ID="chkList" runat="server" CellPadding="8" CssClass="checkboxlist" >                                                                                                                                                                        
    </asp:CheckBoxList>
</asp:Panel>
