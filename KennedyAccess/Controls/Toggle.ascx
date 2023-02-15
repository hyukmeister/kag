<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Toggle.ascx.cs" Inherits="KennedyAccess.Controls.Toggle" %>
<script type="text/javascript">
    $(document).ready(function () {
        var tb2 = document.getElementById('<%=labCheckbox.ClientID%>');
        tb2.textContent = sender.checked ? '<%=hidCheckedText.Value%>' : '<%=hidUncheckedText.Value%>';
    });
    function <%=hidControlLabel.Value%>_Click(sender) {
        var tb2 = document.getElementById('<%=labCheckbox.ClientID%>');
        tb2.textContent = sender.checked ? '<%=hidCheckedText.Value%>' : '<%=hidUncheckedText.Value%>';
    }
</script>
<asp:HiddenField runat="server" ID="hidControlLabel" />
<asp:HiddenField runat="server" ID="hidCheckedText" />
<asp:HiddenField runat="server" ID="hidUncheckedText" />
<asp:HiddenField runat="server" ID="hidWidth" />
<asp:HiddenField runat="server" ID="hidChecked" />
<asp:HiddenField runat="server" ID="hidEnable" />

<div class="form-switch">
    <input runat="Server" id="cbkActive" class="form-check-input" type="checkbox" role="switch" style="width:100px;height:35px"/>
    <div class="not-clickable" style="pointer-events: none;left:-25px;top:-30px;position:relative;" >
        <label id="labCheckbox" runat="server" class="form-check-label" for="cbkActive" />
    </div>
</div>