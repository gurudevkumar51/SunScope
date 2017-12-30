<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="SunScopeRFQ.CustomerContent.Register" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Welcome to sun scope | Register yourself</title>
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

  <!--Google map-->
    <%--<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>--%> 
    <script src="https://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyBjkfs45j9M37h03pyfxVE9S7MULDWWsPk"></script>
    <%--AIzaSyBjkfs45j9M37h03pyfxVE9S7MULDWWsPk--%>
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition register-page">
<div class="register-box">
  <div class="register-logo">
   <b>Sun Scope</b>
  </div>

  <div class="register-box-body">
    <p class="login-box-msg">Register to become a new member</p>

    <form action="../../index.html" method="post" runat="server">
      <div class="form-group has-feedback">
        <asp:TextBox ID="TBName" runat="server" placeholder="Full Name" CssClass="form-control"></asp:TextBox>
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="email" id="TBemail" required runat="server" class="form-control" placeholder="Email">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
        <div class="form-group has-feedback">
        <input type="tel" pattern="^\d{10}$" required id="TBPhone" runat="server" class="form-control" placeholder="Mobile Number">
        <span class="glyphicon glyphicon-phone form-control-feedback"></span>
      </div>
        <div class="form-group has-feedback">
        <input type="text" required id="TBLocation" runat="server" class="form-control" placeholder="Your Location city">
        <span class="glyphicon glyphicon-globe form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">        
          <input id="TBPwd" class="form-control" name="password" type="password" runat="server" pattern="^\S{6,}$" onchange="this.setCustomValidity(this.validity.patternMismatch ? 'Must have at least 6 characters' : ''); if(this.checkValidity()) form.password_two.pattern = this.value;" placeholder="Password" required>  
          <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input id="TBCPwd" class="form-control" name="Cpassword" type="password" pattern="^\S{6,}$" onchange="this.setCustomValidity(this.validity.patternMismatch ? 'Please enter the same Password as above' : '');" placeholder="Verify Password" required>
        <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
      </div>
      <div class="row">
        <%--<div class="col-xs-8">
          <div class="checkbox icheck">
            <label>
              <input type="checkbox"> I agree to the <a href="#">terms</a>
            </label>
          </div>
        </div>
        <!-- /.col -->--%>
        <div class="col-xs-4">
          <asp:Button ID="BtnSubmit" CssClass="btn btn-primary btn-block btn-flat" runat="server" Text="Register" OnClick="BtnSubmit_Click" />
        </div>
        <!-- /.col -->
      </div>
    </form>
    <a href="login.html" class="text-center">I already have account</a>
  </div>
  <!-- /.form-box -->
</div>
<!-- /.register-box -->

<!-- jQuery 3 -->
    <script src="../scripts/jquery-3.2.1.min.js"></script>
<!-- Bootstrap 3.3.7 -->
    <script src="../scripts/bootstrap.min.js"></script>
<!-- iCheck -->
    <script src="../Content/AdminLTE/iCheck/icheck.min.js"></script>
<script>
    var geocoder;
    $(document).ready(function () {

        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(successFunction, errorFunction);
        }
        initialize();
    });

    //Get the latitude and the longitude;
    function successFunction(position) {
        var lat = position.coords.latitude;
        var lng = position.coords.longitude;
        codeLatLng(lat, lng)
    }

    function errorFunction() {
        //alert("Geocoder failed");
    }

    function initialize() {
        geocoder = new google.maps.Geocoder();
    }

    function codeLatLng(lat, lng) {

        var latlng = new google.maps.LatLng(lat, lng);
        geocoder.geocode({ 'latLng': latlng }, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                console.log(results)
                if (results[1]) {
                    //formatted address                    
                    //find country name
                    for (var i = 0; i < results[0].address_components.length; i++) {
                        for (var b = 0; b < results[0].address_components[i].types.length; b++) {

                            //there are different types that might hold a city admin_area_lvl_1 usually does in come cases looking for sublocality type will be more appropriate
                            if (results[0].address_components[i].types[b] == "administrative_area_level_2") {
                                //this is the object you are looking for
                                city = results[0].address_components[i];
                                break;
                            }
                        }

                        for (var b = 0; b < results[0].address_components[i].types.length; b++) {

                            //there are different types that might hold a city admin_area_lvl_1 usually does in come cases looking for sublocality type will be more appropriate
                            if (results[0].address_components[i].types[b] == "administrative_area_level_1") {
                                //this is the object you are looking for
                                state = results[0].address_components[i];
                                break;
                            }
                        }

                        for (var b = 0; b < results[0].address_components[i].types.length; b++) {

                            //there are different types that might hold a city admin_area_lvl_1 usually does in come cases looking for sublocality type will be more appropriate
                            if (results[0].address_components[i].types[b] == "country") {
                                //this is the object you are looking for
                                country = results[0].address_components[i];
                                break;
                            }
                        }
                    }
                    $("#TBLocation").val(city.long_name+", "+state.long_name+", "+country.long_name);                    
                } 
            } 
        });
    }
</script>
</body>
</html>
<style>
    body{
        height:80%;
    }
</style>

