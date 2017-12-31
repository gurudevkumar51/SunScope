<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewEnquiry.aspx.cs" Inherits="SunScopeRFQ.CustomerContent.NewEnquiry" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>  
    <!-- Bootstrap 3.3.7 -->
  <link href="../Content/bootstrap.min.css" rel="stylesheet" />
  <!-- Font Awesome -->
  <link href="../Content/font-awesome.min.css" rel="stylesheet" />
  <!-- Ionicons -->
  <link href="../Content/ionicons.min.css" rel="stylesheet" />
  
    <!-- jQuery 3 -->
    <script src="../scripts/jquery-3.2.1.min.js"></script>
<!-- Bootstrap 3.3.7 -->
    <script src="../scripts/bootstrap.min.js"></script>
   
    <!--SweetAlert-->
     <link href="../Content/SweetAlert/sweetalert2.min.css" rel="stylesheet" />
    <script src="../Content/SweetAlert/sweetalert2.min.js"></script>

  <!--Google map-->
  <script src="https://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyBjkfs45j9M37h03pyfxVE9S7MULDWWsPk"></script>
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
    
    <!--Custom Javascript-->
    <script src="../scripts/EnquiryCustom.js"></script>

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic" />
</head>
<body>
    <div class="container">        
    <form id="form1" runat="server">
        <div class="row">
            <label>Your address</label>
            <input type="text" id="TBEnquiryLocation" runat="server" class="form-control" placeholder="Your Location" />
            <div id="map"></div>  
        </div>
          <div class="row">
              <div class="col-lg-6"></div>
              <div class="col-lg-6"></div>
          </div>
    </form>
        </div>
</body>
</html>