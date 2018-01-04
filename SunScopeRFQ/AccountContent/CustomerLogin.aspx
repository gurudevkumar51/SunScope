<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerLogin.aspx.cs" Inherits="SunScopeRFQ.AccountContent.CustomerLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 2 | Log in</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
  <!-- Font Awesome -->
    <link href="../Content/font-awesome.min.css" rel="stylesheet" />
  <!-- Ionicons -->
    <link href="../Content/ionicons.min.css" rel="stylesheet" />
  <!-- Theme style -->
    <link href="../Content/AdminLTE/css/AdminLTE.min.css" rel="stylesheet" />
  <!-- iCheck -->
    <link href="../Content/AdminLTE/iCheck/square/blue.css" rel="stylesheet" />

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic" />

    <!-- jQuery 3 -->
    <script src="../scripts/jquery-3.2.1.min.js"></script>
<!-- Bootstrap 3.3.7 -->
    <script src="../scripts/bootstrap.min.js"></script>
<!-- iCheck -->
    <script src="../Content/AdminLTE/iCheck/icheck.min.js"></script>
</head>
<body class="hold-transition login-page">

    <div class="login-box">
  <div class="login-logo">
    <b>Login</b>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">Sign in to enquiry updates</p>

    <form id="form1" runat="server">
    <div class="form-group has-feedback">
        <input type="email" runat="server" id="TbLoginEmail" class="form-control" placeholder="Email" />
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" runat="server" id="TbPassword" class="form-control" placeholder="Password" />
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox icheck">
            <label>
        <asp:CheckBox ID="ChkBxRemember" runat="server" /> Remember Me
              <%--<input type="checkbox" >--%> 
            </label>
          </div>
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <%--<button type="submit" id="BtnSubmit" runat="server" class="btn btn-primary btn-block btn-flat">Sign In</button>--%>
<asp:Button ID="BtnSubmit" CssClass="btn btn-primary btn-block btn-flat" runat="server" Text="Sign in" OnClick="BtnSubmit_Click" />
        </div>
        <!-- /.col -->
      </div>
    </form>
      <a href="#">I forgot my password</a><br>
    <a href="register.html" class="text-center">Register a new membership</a>
      </div>
        </div>
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' // optional
    });
  });
</script>
</body>
</html>
