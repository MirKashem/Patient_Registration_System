<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LogIn.aspx.cs" Inherits="BloodDonation_LogIn" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
    <style>
        body {
            padding: 0;
            margin: 0;
            background-image: url(Image/Admin_login.jpg);
            background-size: cover;
            background-repeat: no-repeat;
            font-family: Arial;
        }

        h1 {
            margin-top: -60px;
            /*text-align: center;*/
            padding-bottom: 1px;
        }

        .login {
            width: 32.875rem;
            margin: auto;
            padding: 5rem;
            background-color: skyblue;
            border-radius: 1rem;
        }

        label {
            font-size: 1.1rem;
        }

        #uname, #pass, #b1 {
            width: 18.75rem;
            height: 2rem;
            padding-left: 8px;
            border: none;
            border-radius: 3px;
        }

        img {
            width: 10.75rem;
            height: 10.75rem;
            padding-left: 56%;
            margin-bottom: -432px;
            margin-left: 40px;
        }

        .login {
            padding-top: 80px;
            margin-top: 174px;
        }

        @media screen and (max-width: 1200px) {
            .login {
                width: 70%;
            }
        }

        @media screen and (max-width: 992px) {
            .login {
                width: 80%;
            }
        }

        @media screen and (max-width: 768px) {
            h1 {
                margin-top: 0;
            }

            .login {
                width: 90%;
                padding: 2rem;
            }

            img {
                display: none;
            }
        }

        @media screen and (max-width: 480px) {
            .login {
                padding-top: 20px;
                margin-top: 20px;
            }
        }
    </style>
</head>
<body>
    <img src="Image/final_admin.png" alt="Admin Image"/>
    <div class="login">
        <h1>Login Page</h1>
        <form id="loginform" runat="server">
           <asp:TextBox ID="uname" CssClass="txt" runat="server" autocomplete="off"></asp:TextBox><br /><br />
<asp:TextBox ID="pass" CssClass="txt" runat="server" TextMode="Password" autocomplete="off"></asp:TextBox><br /><br />

            <asp:Button CssClass="btn" ID="b1" runat="server" Text="LOGIN" OnClick="b1_Click" />
        </form>
    </div>
</body>
    <script>
        
    </script>
</html>
