<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forget.aspx.cs" Inherits="LogIn.forget" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <div>
        <p><b>Forget Password</b></p>
        <form id="forget1" runat="server" method="post" action="question.aspx">
            Email : <input type="email" name="email" id="email"/><br/><span id="emailEr"></span><br/>
            <button type="button" onclick="loadStart()">Back</button> |
            <button type="button" onclick="checkForget()">Next</button>
        </form>
    </div>
</body>
</html>
