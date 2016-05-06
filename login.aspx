<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Login</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="author" />
    <link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" />
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/style-responsive.css" rel="stylesheet" />

    <!--Start gray theme initialized-->
    <link href="css/style-gray.css" rel="stylesheet" />
    <!--End gray theme initialized-->
</head>
<body class="lock">
    <form id="formLogin" runat="server">
        <div class="lock-header">
            <!-- BEGIN LOGO -->
            <a class="center" id="logo" href="#">
                <img class="center" alt="logo" src="img/logoOOK.png" />
            </a>
            <!-- END LOGO -->
        </div>

        <!--BEGIN CONTENT-->
        <div class="login-wrap">
            <div class="metro single-size red">
                <div class="locked">
                    <i class="icon-lock"></i>
                    <span>Login</span>
                </div>
            </div>
            <div class="metro double-size green">
                <div class="lock-header">
                    <span>Username</span>
                </div>
                <div class="input-append lock-input">
                    <asp:TextBox ID="username" runat="server"> </asp:TextBox>
                </div>
            </div>
            <div class="metro double-size yellow">
                <div class="lock-header">
                    <span>Password</span>
                </div>
                <div class="input-append lock-input">
                    <asp:TextBox ID="password" runat="server" TextMode="Password"> </asp:TextBox>
                </div>
            </div>

            <div class="metro single-size terques login">
                <asp:Button ID="sumbit" runat="server" CssClass="btn login-btn" Text="Login" OnClick="sumbit_Click"></asp:Button>
            </div>

            <div class="login-footer">
                <div class="forgot-hint pull-right">
                    <asp:Label ID="GeneralMessage" runat="server" Text=""></asp:Label>
                </div>
                <div class="forgot-hint pull-left">
                    <a id="forget-password" class="" href="javascript:;">Forgot Password?</a>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
