<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>
<html lang="en" class=" ">
<head>  
  <meta charset="utf-8" />
  <title>Stock Managment</title>
  <meta name="description" content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" /> 
  <link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
  <link rel="stylesheet" href="css/animate.css" type="text/css" />
  <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css" />
  <link rel="stylesheet" href="css/icon.css" type="text/css" />
  <link rel="stylesheet" href="css/font.css" type="text/css" />
  <link rel="stylesheet" href="css/app.css" type="text/css" />  
 
  <link rel="stylesheet" href="swal/sweetalert.css">
  
   <script src="js/jquery.min.js"></script>
  <!-- Bootstrap -->
  <script src="js/bootstrap.js"></script>
  <!-- App -->
  <script src="js/app.js"></script>  
  <script src="js/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="js/app.plugin.js"></script>
	 <script src="swal/sweetalert-dev.js"></script>
     
    <script src="myjs/main.js"></script>
  
    <!--[if lt IE 9]>
    <script src="js/ie/html5shiv.js"></script>
    <script src="js/ie/respond.min.js"></script>
    <script src="js/ie/excanvas.js"></script>
  <![endif]-->
</head>
<body class="" >
  <section id="content" class="m-t-lg wrapper-md animated fadeInUp">    
    <div class="container aside-xl">
        <img src="logo/logo.png" class="img-responsive">
      <a class="navbar-brand block">Stock Management System</a>
      <section class="m-b-lg">
        <header class="wrapper text-center">
          
        </header>
        <form method="post" action="" name="loginform">
          <div class="list-group">
            <div class="list-group-item">
              <input type="text" placeholder="UserID" class="login_input form-control no-border"  id="login_input_username"   name="user_name" required />
            </div>
            <div class="list-group-item">
               <input type="password" placeholder="Password" class="login_input form-control no-border" id="login_input_password" class="login_input" type="password" name="user_password" autocomplete="off" required >
            </div>
          </div>
          <button type="submit" id="btnSubmit" class="btn btn-lg btn-warning btn-block" name="login" value="Log in">Sign in</button>
          
        </form>
		
		

		
		
		
      </section>
    </div>
  </section>
  <!-- footer -->
  <footer id="footer">
   <div class="text-center padder">
      <p>
        <small>S.A Hydraulics &copy; 2016 &nbsp; Developed by <a  style="color:blue" href="http://www.shivank-verma.com">Shivank Verma</a></small>
      </p>
    </div>
  </footer>
  <!-- / footer -->
 
 <script src="myjs/jquery.blockUI.js"></script>

</body>

    <script type="text/javascript">

        var loginObj = new loginpage();

        </script>
    <script type="text/javascript">
        $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);

        </script>

</html>

