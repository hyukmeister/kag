﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Toggle.ascx.cs" Inherits="KennedyAccess.Controls.Toggle" %>
<script type="text/javascript">
    $(document).ready(function () {
        $('input[type="checkbox"]').each(function () {
            CheckboxClick(this);
        });
    });
    function CheckboxClick(sender) {
        var tb2 = document.getElementById('<%=labCheckbox.ClientID%>');
        tb2.textContent = sender.checked ? '<%=hidCheckedText.Value%>' : '<%=hidUncheckedText.Value%>';
    }
</script>
<asp:HiddenField runat="server" ID="hidControlLabel" />
<asp:HiddenField runat="server" ID="hidCheckedText" />
<asp:HiddenField runat="server" ID="hidUncheckedText" />

<div class="form-switch">
    <input runat="Server" id="cbkActive" class="form-check-input" type="checkbox" role="switch" style="width:80px;height:35px" onclick="CheckboxClick(this)" />
    <div class="not-clickable" style="pointer-events: none;left:-25px;top:-30px;position:relative;" >
        <label id="labCheckbox" runat="server" class="form-check-label" for="cbkActive" />
    </div>
</div>