<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="LogIn.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <div id="demo"></div>
</body>
</html>
<script>

    var email = "", password = "",name="",gender="",address="",type="",question="",answer="",ChkRememberme="false";
    var emailEr = "", passwordEr = "",nameEr="",genderEr="",addressEr="",typeEr="",questionEr="",answerEr="";
    var isValid = true;

    loadStart();

    function checkEmail(email)
    {
        if (email.length>=1)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    function checkField(attribute)
    {
        if (attribute.length>=1)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    /*load start.html starts here*/
    function loadStart()
    {
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200)
            {
                document.getElementById("demo").innerHTML = this.responseText;

                document.getElementById("email").value = email;
                document.getElementById("password").value = password;

                document.getElementById("emailEr").innerHTML = emailEr;
                document.getElementById("passwordEr").innerHTML = passwordEr;
            }
        };
        xmlhttp.open("GET", "start.html", true);
        xmlhttp.send();
    }
    /*load start.html ends here*/


    /*load log.aspx starts here*/
    function loadLog()
    {
        isValid = true;

        email = document.getElementById("email").value;
        password = document.getElementById("password").value;
        ChkRememberme = "false";

        if (document.getElementById("ChkRememberme").checked)
        {
            ChkRememberme = "true";
        }
        if (checkEmail(email) && checkField(password))
        {
            var formData = new FormData();
            formData.append("email", email);
            formData.append("password", password);
            formData.append("ChkRememberme", ChkRememberme);

            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200)
                {
                    document.getElementById("demo").innerHTML = this.responseText;
                }
            };
            xhr.open("POST", "log.aspx", true);
            xhr.send(formData);
        }
        if (!checkEmail(email))
        {
            emailEr = "Please insert a valid email address";
            loadStart();
        }
        if (!checkField(password))
        {
            passwordEr = "Please insert password";
            loadStart();
        }
    }
    /*load log.aspx ends here*/


    /*load reg1.aspx starts here*/
    function loadReg1()
    {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200)
            {
                document.getElementById("demo").innerHTML = this.responseText;

                document.getElementById("email").value = email;
                document.getElementById("password").value = password;
                document.getElementById("name").value = name;
                document.getElementById("gender").value = gender;
                document.getElementById("address").value = address;
                document.getElementById("type").value = type;

                document.getElementById("emailEr").innerHTML = emailEr;
                document.getElementById("passwordEr").innerHTML = passwordEr;
                document.getElementById("nameEr").innerHTML = nameEr;
                document.getElementById("genderEr").innerHTML = genderEr;
                document.getElementById("addressEr").innerHTML = addressEr;
                document.getElementById("typeEr").innerHTML = typeEr;
            }
        };
        xhr.open("GET", "reg1.aspx", true);
        xhr.send();
    }
    /*load reg1.aspx ends here*/


    /*load reg2.aspx starts here*/
    function checkReg1()
    {
        email = document.getElementById("email").value;
        password = document.getElementById("password").value;
        name = document.getElementById("name").value;
        gender = document.getElementById("gender").value;
        address = document.getElementById("address").value;
        type = document.getElementById("type").value;


        if (checkEmail(email) && checkField(password) && checkField(name) && checkField(gender) && checkField(address) && checkField(type))
        {
            var formData = new FormData();
            formData.append("email", email);
            formData.append("password", password);
            formData.append("name", name);
            formData.append("gender", gender);
            formData.append("address", address);
            formData.append("type", type);

            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200)
                {
                    document.getElementById("demo").innerHTML = this.responseText;

                    document.getElementById("questionEr").innerHTML = questionEr;
                    document.getElementById("answerEr").innerHTML = answerEr;
                }
            };
            xhr.open("POST", "reg2.aspx", true);
            xhr.send(formData);
        }
        if (!checkEmail(email))
        {
            emailEr = "Please insert a valid email address";
            loadReg1();
        }
        if (!checkField(password))
        {
            passwordEr = "Please insert password";
            loadReg1();
        }
        if (!checkField(name))
        {
            nameEr = "Please insert name";
            loadReg1();
        }
        if (!checkField(gender))
        {
            genderEr = "Please insert gender";
            loadReg1();
        }
        if (!checkField(address))
        {
            addressEr = "Please insert address";
            loadReg1();
        }
        if (!checkField(type))
        {
            typeEr = "Please insert user type";
            loadReg1();
        }
    }
    function loadReg2()
    {
        var formData = new FormData();
        formData.append("email", email);
        formData.append("password", password);
        formData.append("name", name);
        formData.append("gender", gender);
        formData.append("address", address);
        formData.append("type", type);

        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200)
            {
                document.getElementById("demo").innerHTML = this.responseText;

                document.getElementById("questionEr").innerHTML = questionEr;
                document.getElementById("answerEr").innerHTML = answerEr;
            }
        };
        xhr.open("POST", "reg2.aspx", true);
        xhr.send(formData);
    }
    /*load reg2.aspx ends here*/


    /*load postreg2.aspx starts here*/
    function checkReg2()
    {
        question = document.getElementById("question").value;
        answer = document.getElementById("answer").value;


        if (checkField(question) && checkField(answer))
        {
            var formData = new FormData();
            formData.append("email", email);
            formData.append("password", password);
            formData.append("name", name);
            formData.append("gender", gender);
            formData.append("address", address);
            formData.append("type", type);
            formData.append("question", question);
            formData.append("answer", answer);

            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200)
                {
                    document.getElementById("demo").innerHTML = this.responseText;
                }
            };
            xhr.open("POST", "postreg2.aspx", true);
            xhr.send(formData);
        }
        if (!checkField(question))
        {
            questionEr = "Please choose a question";
            loadReg2();
        }
        if (!checkField(answer))
        {
            answerEr = "Please insert an answer";
            loadReg2();
        }
    }
    /*load postreg2.aspx ends here*/


    /*load forget.aspx starts here*/
    function loadForget()
    {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200)
            {
                document.getElementById("demo").innerHTML = this.responseText;

                document.getElementById("email").value = email;

                document.getElementById("emailEr").innerHTML = emailEr;
            }
        };
        xhr.open("GET", "forget.aspx", true);
        xhr.send();
    }
    /*load forget.aspx ends here*/


    /*load question.aspx starts here*/
    function checkForget()
    {
        email = document.getElementById("email").value;

        if (checkEmail(email))
        {
            var formData = new FormData();
            formData.append("email", email);

            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200)
                {
                    document.getElementById("demo").innerHTML = this.responseText;

                    document.getElementById("answerEr").innerHTML = answerEr;
                }
            };
            xhr.open("POST", "question.aspx", true);
            xhr.send(formData);
        }
        if (!checkEmail(email))
        {
            emailEr = "Please insert a valid email";
            loadForget();
        }
    }

    function loadQuestion()
    {
        var formData = new FormData();
        formData.append("email", email);

        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200)
            {
                document.getElementById("demo").innerHTML = this.responseText;

                document.getElementById("answerEr").innerHTML = answerEr;
            }
        };
        xhr.open("POST", "question.aspx", true);
        xhr.send(formData);
    }
    /*load question.aspx ends here*/


    /*load recovery.aspx starts here*/
    function checkQuestion()
    {
        answer = document.getElementById("answer").value;

        if (checkField(answer))
        {
            var formData = new FormData();
            formData.append("email", email);
            formData.append("answer", answer);

            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200)
                {
                    document.getElementById("demo").innerHTML = this.responseText;

                    document.getElementById("passwordEr").innerHTML = passwordEr;
                }
            };
            xhr.open("POST", "recovery.aspx", true);
            xhr.send(formData);
        }
        if (!checkField(answer))
        {
            answerEr = "Please insert a valid answer";
            loadQuestion();
        }
    }
    function loadRecovery()
    {
        var formData = new FormData();
        formData.append("email", email);
        formData.append("answer", answer);

        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200)
            {
                document.getElementById("demo").innerHTML = this.responseText;

                document.getElementById("passwordEr").innerHTML = passwordEr;
            }
        };
        xhr.open("POST", "recovery.aspx", true);
        xhr.send(formData);
    }
    /*load recovery.aspx ends here*/


    /*load postrecovery.aspx starts here*/
    function checkRecovery()
    {
        password = document.getElementById("password").value;

        if (checkField(password))
        {
            var formData = new FormData();
            formData.append("email", email);
            formData.append("answer", answer);
            formData.append("password", password);

            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200)
                {
                    document.getElementById("demo").innerHTML = this.responseText;
                }
            };
            xhr.open("POST", "postrecovery.aspx", true);
            xhr.send(formData);
        }
        if (!checkField(password))
        {
            passwordEr = "Please insert password";
            loadRecovery();
        }
    }
    /*load postrecovery.aspx ends here*/
</script>