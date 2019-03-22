<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reg1.aspx.cs" Inherits="LogIn.reg1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <h1>Registration Page 1</h1>
    <form id="reg1" runat="server" method="post">
        Email     : <input type="email" name="email" id="email"/><br/><span id="emailEr"></span><br/>
        Name     : <input type="text" name="name" id="name"/><br/><span id="nameEr"></span><br/>
        Password : <input type="password" name="password" id="password"/><br/><span id="passwordEr"></span><br/>
        Gender :  
        <select name="gender" id="gender">
          <option value="male">male</option>
          <option value="female">female</option>
          <option value="other">other</option>
        </select>
        <br/><span id="genderEr"></span><br/>
        Address : <input type="text" name="address" id="address"/><br/><span id="addressEr"></span><br/>
        Type :
        <select name="type" id="type">
          <option value="user">user</option>
          <option value="admin">admin</option>
        </select>
        <br/><span id="typeEr"></span><br/>
        <input type = 'button' value = 'Back' onclick='loadStart()' /> |
        <input type = 'button' value = 'Next' onclick='checkReg1()' />
    </form>
</body>
</html>
