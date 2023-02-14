<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Toggle.ascx.cs" Inherits="KennedyAccess.Controls.Toggle" %>
<script type="text/javascript">
    $(document).ready(function () {
        $('input[type="checkbox"]').each(function () {
            OnClick_<%=ControlLabel%>(this);
        });
    });

    function OnClick_<%=ControlLabel%>(sender) {
        var lable = document.getElementById('lab<%=ControlLabel%>');
        lable.textContent = sender.checked ? '<%=CheckedText%>' : '<%=UncheckedText%>'; 
    }
</script>
<div class="form-switch">
    <input id="cbk<%=ControlLabel%>" name="cbk<%=ControlLabel%>" class="form-check-input" type="checkbox" role="switch" style="width:80px;height:35px" onclick="OnClick_<%=ControlLabel%>(this)" />
    <div class="not-clickable" style="pointer-events: none;left:-25px;top:-30px;position:relative;" >
        <label id="lab<%=ControlLabel%>" class="form-check-label" for="cbkActive" />
    </div>
</div>