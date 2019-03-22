<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reg2.aspx.cs" Inherits="LogIn.reg2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <h1>Registration Page 2</h1>
    <form id="reg2" runat="server" method="post">
        Security question    :         
        <select name="question" id="question">
          <option value="What is your pets name ?">What is your pets name ?</option>
          <option value="Who is your favorite cousin ?">Who is your favorite cousin ?</option>
          <option value="Which is your favorite animal ?">Which is your favorite animal ?</option>
        </select><br/>
        <span id="questionEr"></span><br/>
        Answer : <input type="text" name="answer" id="answer"/><br/><span id="answerEr"></span><br/>
        <input type = 'button' value = 'Back' onclick='loadReg1()' /> |
        <input type = 'button' value = 'Confirm' onclick='checkReg2()' />
    </form>
</body>
</html>
