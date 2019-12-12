<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test2.aspx.cs" Inherits="WebApplication1.WebForm12" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
    <script type="text/javascript">

        //$("form_selector").validate(
        //    {
        //        rules: {
        //            inputName: {
        //                time: true,
        //                normalizer: function(currentValue) {
        //                    var isSimleNumber=/^([01]\d|2[0-3]/[0-9]$/.test.currentValue);

        //                    return isSimleNumber ? currentValue+ ":00" : currentValue;
        //                }
        //            }


        function autoTabTimes(input, len) {

            if (input.value.length == 2) {
                if (input.value.indexOf(":") == -1) {
                    input.value = input.value + ":";
                }
                var str = input.value.split(":");
                if (str[0].length == 1) {
                    input.value = "0" + str[0];
                }
            }


            if (input.value.length >= len) {
                input.value = input.value.slice(0, len);
                input.form[(getIndex(input) + 1)].focus();

            }

            return true;
        }






    </script>
<body>
    <form id="form1" runat="server">
        <asp:TextBox ID="Time" runat="server" onkeyup="autoTabTimes(this)" MaxLength="5"></asp:TextBox>
    <%--<input type="text" onkeyup="autoTabTimes(this)" />--%>
    </form>
</body>
</html>
