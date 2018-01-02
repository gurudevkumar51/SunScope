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
        <hr />
          <div class="row">
              <div class="col-lg-2"></div>
              <div class="col-lg-4">
                  <label>Your Property type</label>
                  <asp:RadioButtonList ID="RdbPropType" runat="server">
                      <asp:ListItem Text="Residential" Value="Residential"></asp:ListItem>
                      <asp:ListItem Text="Commercial" Value="Commercial"></asp:ListItem>
                      <asp:ListItem Text="Non-Profit" Value="NProfit"></asp:ListItem>                      
                  </asp:RadioButtonList>
                  <label>Your Email</label>
                  <input type="text" id="TbEmail" runat="server" class="form-control" placeholder="Your Email" />
                  <label>Your Mobile</label>
                  <input type="text" id="TbMobile" runat="server" class="form-control" placeholder="Your Mobile" />
                  <label>Best time to call</label>
                  <input type="text" id="TbCallTime" runat="server" class="form-control" placeholder="Best time to call" />
              </div>
              <div class="col-lg-4">
                  <label>Your Average Monthly Electricity Bill</label>
                  <input type="text" id="TbBill" runat="server" class="form-control" placeholder="Your Monthly Bill" />
                  <label>Your Roof Type</label>
                  <input type="text" id="TBRoofType" runat="server" class="form-control" placeholder="Your Roof Type" />
                  <label>Roof size</label>
                  <input type="text" id="TbRoofSize" runat="server" class="form-control" placeholder="Your Monthly Bill" />
                  <label>Your Landline number</label>
                  <input type="text" id="TbLandline" runat="server" class="form-control" placeholder="Your Landline" />
              </div>
              <div class="col-lg-2"></div>
          </div>
        <hr />
        <div class="row text-center">
            <asp:Button ID="BtnEnqSubmit" runat="server" Text="Calculate" CssClass="btn btn-info" OnClick="BtnEnqSubmit_Click" />
        </div>
    </form>
        </div>
</body>
</html>