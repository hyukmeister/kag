<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Toggle.ascx.cs" Inherits="KennedyAccess.Controls.Toggle" %>
<script type="text/javascript">
    $(document).ready(function () {
        $('input[type="checkbox"]').each(function () {
            OnClick_<%=ControlLabel%>(this);
        });
    });

    function OnClick_<%=cbkMyTogle.ClientID%>(sender) {
        var lable = document.getElementsByTagName('lab<%=cbkMyTogle.ClientID%>');
        lable.textContent = sender.checked ? '<%=CheckedText%>' : '<%=UncheckedText%>'; 
    }
</script>
<div class="form-switch">
    <asp:HiddenField ID="hidControlLabel" runat="server" />
    <asp:HiddenField ID="hidCheckedText" runat="server" />
    <asp:HiddenField ID="hidUncheckedText" runat="server" />
    <asp:HiddenField ID="hidWidth" runat="server" />
    <asp:HiddenField ID="hidChecked" runat="server" />
    <input id="cbk<%=hidControlLabel.Value%>" name="cbk<%=hidControlLabel.Value%>" class="form-check-input" <%=hidControlLabel.Value%> type="checkbox" role="switch" style="width:80px;height:35px" onclick="OnClick_<%=hidControlLabel.Value%>(this)" />
    <asp:CheckBox ID="cbkMyTogle" runat="server" class="form-check-input" type="checkbox" Width="200px" Checked="false" Height="40px" />
    <div class="not-clickable" style="pointer-events: none;left:-25px;top:-30px;position:relative;" >
        <label id="lab<%=hidControlLabel.Value%>" class="form-check-label" for="cbkActive" />
    </div>
</div>