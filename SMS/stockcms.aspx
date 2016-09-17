<%@ Page Language="C#" AutoEventWireup="true" CodeFile="stockcms.aspx.cs" Inherits="stockcms" %>

<!DOCTYPE html>
<html lang="en" class="app">
<head>  
  <meta charset="utf-8" />
  <title>Stock Management</title>
  <meta name="description" content="" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" /> 
  <link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
  <link rel="stylesheet" href="css/animate.css" type="text/css" />
  <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css" />
  <link rel="stylesheet" href="css/icon.css" type="text/css" />
  <link rel="stylesheet" href="css/font.css" type="text/css" />
  <link rel="stylesheet" href="css/app.css" type="text/css" />  
  
  <link rel="stylesheet" href="swal/sweetalert.css">
    <link href="css/bootstrap-datepicker.min.css" rel="stylesheet" />
   
     <!--[if lt IE 9]>
    <script src="js/ie/html5shiv.js"></script>
    <script src="js/ie/respond.min.js"></script>
    <script src="js/ie/excanvas.js"></script>
  <![endif]-->

<script src="js/handlebars-v4.0.4.js"></script>
</head>




<body class="" >
  <section class="vbox">
    <header class="bg-white header header-md navbar navbar-fixed-top-xs box-shadow">
      <div class="navbar-header aside-md dk">
        <a class="btn btn-link visible-xs" data-toggle="class:nav-off-screen,open" data-target="#nav,html">
          <i class="fa fa-bars"></i>
        </a>
        <a href="" class="navbar-brand">
          
          <span class="hidden-nav-xs">S.M.S.</span>
        </a>
        <a class="btn btn-link visible-xs" data-toggle="dropdown" data-target=".user">
          <i class="fa fa-cog"></i>
        </a>
      </div>
      
      <ul class="nav navbar-nav navbar-right m-n hidden-xs nav-user user">
        
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            
            <%=(Session["LoginName"])%><b class="caret"></b>
          </a>
          <ul class="dropdown-menu animated fadeInRight">            
            
            
            
            
            <li>
              <a id ="logout" href="Login.aspx">Logout</a>
            </li>
          </ul>
        </li>
      </ul>      
    </header>
    <section>
      <section class="hbox stretch">
       
        <section id="content">
          <section class="hbox stretch">

<aside>
              <section class="vbox">
                <header class="header bg-white b-b clearfix">
                  <div class="row m-t-sm">
                    <div class="col-sm-6 m-b-xs">
        
                      
                      <button data-toggle="modal" data-target="#addProductMoadal" class="btn btn-sm btn-warning"><i class="fa fa-plus"></i> Add New Product</button>
					 <button data-toggle="modal" data-target="#PurchaseMoadal" class="btn btn-sm btn-danger"><i class="fa fa-plus"></i> Add New Purchase</button>
                     <button data-toggle="modal" data-target="#ViewPurchaseMoadal" class="btn btn-sm btn-warning"><i class="fa fa-th"></i> View Purchases</button>
                         <button data-toggle="modal" data-target="#DeleteProductMoadal" class="btn btn-sm btn-danger"><i class="fa fa-minus"></i> Delete Product</button>
                    </div>

                        <div class="col-sm-3 m-b-xs">
                                  <div class="input-group">
                               <input type="text" placeholder="Choose Date" class="input-sm form-control _date">
                                      <span class="input-group-btn">  <button id="date_btn" class="btn btn-sm btn-success" type="button">View!</button></span>
                           </div>
                          </div>
                    <div class="col-sm-3 m-b-xs">
                      <div class="input-group">
                        <input type="text" class="input-sm form-control" id="searchbar" placeholder="Search">
                        <span class="input-group-btn">
                          <button class="btn btn-sm btn-default" type="button">Go!</button>
                        </span>
                      </div>
                    </div>
                  </div>
                </header>
                <section class="scrollable wrapper w-f">
                  <section class="panel panel-default">
                    <div class="table-responsive">
                      <table class="table table-striped m-b-none">
                        <thead>
                          <tr>
                           
                            <th>Product Code</th>
                            <th>Product Description</th>
                             
                            <th>Last Purchase</th>
							<th>Stock Left</th>
                              <th>Used Today</th>
                              <th></th>
                          </tr>
                        </thead>
                        <tbody id="tablerowid">
						
                         
						  
                        </tbody>
                      </table>
                    </div>
                  </section>
                </section>
                <footer class="footer bg-white b-t">
                  <div class="row text-center-xs">

                      <div class="text-center padder">
      <p>
        <small>S.A Hydraulics &copy; 2016 &nbsp; Developed by <a  style="color:blue" href="http://www.shivank-verma.com">Shivank Verma</a></small>
      </p>
    </div>
                    
                  </div>
                </footer>
              </section>
            </aside>
			
          </section>
          <a href="#" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen,open" data-target="#nav,html"></a>
        </section>
      </section>
    </section>
  </section>
  <script src="js/jquery.min.js"></script>
  <!-- Bootstrap -->
  <script src="js/bootstrap.js"></script>
  <!-- App -->
  <script src="js/app.js"></script>  
  <script src="js/slimscroll/jquery.slimscroll.min.js"></script>
     <script src="js/app.plugin.js"></script>

    <!--custom-->
    <script src="swal/sweetalert-dev.js"></script>
    <script src="bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
    <script src="myjs/cms.js"></script>

    <!--parsley-->
    <script src="js/parsley/parsley.extend.js"></script>
    <script src="js/parsley/parsley.min.js"></script>
    <script src="myjs/jquery.blockUI.js"></script>
    <script src="js/bootstrap-datepicker.min.js"></script>
    <script src="myjs/jquery.blockUI.js"></script>



    <script type="text/x-handlebars-template" id="dailydataTemplate">


        {{#each .}}

           <tr>
                            <form class="form-inline">
                            <td><label class="prod_Code" id ="">{{product_code}}</label></td>
                            <td><a  class ="prod_Desc" style="cursor:pointer" data-workerid="{{product_code}}">{{product_Desc}}</a></td>
                              <td><label class="last_pur" id =""><%--<i>{{quantity}}</i> &nbsp;<b>from</b>&nbsp;--%>{{last_purchase}}</label></td>    
                            
                          <td><label class="btn btn-s-lg btn-info stock_left" id ="">{{stock_left}}</label></td>
                              <td>
                                <input type="text" class="form-control used_today" id="" value="{{used_today}}"/>

                            </td>

                       
                                <td><button class="btnUpdate btn btn-md btn-danger " id="">Update</button></td>
                           </form>
                          </tr>
                           
						

        {{/each}}

        </script>
    

    </body>



    
<div id="addProductMoadal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Add user Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        
      </div>
      <div class="modal-body">
        <div class="row">
		<div class="col-sm-12">
                  <form method="" data-validate="parsley" action="" id="regform" >
                    <section class="panel panel-default">
                      <header class="panel-heading">
                        <span class="h4">Add new Product</span>
                      </header>
                      <div class="panel-body">
                        <p class="text-muted">Please fill the Product details</p>
                        
						<div class="form-group col-sm-6">
                          <label>Product Code</label>
                          <input type="text" name="workerID" class="form-control parsley-validated"  data-trigger="keyup" data-type="digits"  data-required="true" id="product_code">                        
                        </div>

                          
				
                          
                          <div class="form-group col-sm-12">
                            <label>Product Details</label>
                            <textarea name="desc" class="form-control parsley-validated" rows="1" data-minwords="1" data-required="true" placeholder="Enter the product details" id="prodetail"></textarea>
                          </div>
                        
                      </div>
                      <footer class="panel-footer text-right bg-light lter">
                        <button type="button" class="btn btn-warning btn-s-xs" id="btnSubmit">Add Product</button>
						 <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                      </footer>
                    </section>
                  </form>
                </div>
		</div>
      </div>
      <div class="modal-footer">
       
      </div>
    </div>
	</div>
</div>




 <div id="PurchaseMoadal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Add user Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        
      </div>
      <div class="modal-body">
        <div class="row">
		<div class="col-sm-12">
                  <form method="" data-validate="parsley" action="" id="regform2" >
                    <section class="panel panel-default">
                      <header class="panel-heading">
                        <span class="h4">Add new Purchase</span>
                      </header>
                      <div class="panel-body">
                        <p class="text-muted">Please fill the Purchase details</p>
                        
						<div class="form-group col-sm-6">
                          <label>Product Code</label>
                          <input type="text" name="productcode" class="prod_code form-control parsley-validated" placeholder="Enter the Product code"  data-trigger="keyup" data-type="digits"  data-required="true">                        
                        </div>
                          <div class="form-group col-sm-6">
                              <br>
                              <label class="btn btn-s-sm btn-danger" id="checkcls">Check!</label>
                        </div>
						
						<div class="form-group col-sm-12">
                            <label>Product Details</label>
                            <textarea id="detail" name="desc" class="prodetails form-control parsley-validated" rows="1" data-minwords="1" data-required="true"  ></textarea>
                          </div>

                         
                          <div class="form-group col-sm-6">
                          <label>Alert value</label>
                          <input type="text" name="alertlimit" class="form-control parsley-validated"  data-trigger="keyup" data-type="digits"  data-required="true" id="alert_limit">                        
                        </div>
                            <div class="form-group col-sm-6">
                              <br>
                              <label class="btn btn-s-sm btn-warning" id="update_alert_value">Update!</label>
                        </div>
                             
						
                          

                         

                          
                          <div class="form-group col-sm-12">
                            <label>Seller Contact Details</label>
                            <textarea name="seller_details" class="sellerdetails form-control parsley-validated" rows="1" data-minwords="1" data-required="true" placeholder="Enter the contact details of Seller" id="seller_details"></textarea>
                          </div>
                           <div class="form-group col-sm-6">
                          <label>Quantity</label>
                          <input type="text" name="quantity" class="quantity form-control parsley-validated" placeholder="Enter the quantity purchased"  data-trigger="keyup" data-type="digits"  data-required="true">                        
                        </div>
                           <div class="form-group col-sm-6">
                            <label>Bill Details</label>
                            <textarea name="bill_details" class="billdetails form-control parsley-validated" rows="1" data-minwords="1" data-required="true" placeholder="Enter the  details of Bill" id="bill_details"></textarea>
                          </div>

                          <div class="form-group col-sm-6">
                            <label>Tin No/CST no</label>
                            <textarea name="tin_details" class="tindetails form-control parsley-validated" rows="1" data-minwords="1" data-required="true" placeholder="Enter the  details of TIN" id="tin_details"></textarea>
                          </div>

                          <div class="form-group col-sm-6">
                            <label>Bill Date</label>
                              <input type="text" placeholder="Choose Date" class="input-sm form-control _date" id="bill_date">
                            
                          </div>
                          <div class="form-group col-sm-12">
                            <label>Purchased from</label>
                            <textarea name="purchasedfrom" class="purchasedfrom form-control parsley-validated" rows="1" data-minwords="1" data-required="true" placeholder="Enter the  details of seller" id="buy_from"></textarea>
                          </div>


                        
                      </div>
                      <footer class="panel-footer text-right bg-light lter">
                        <button type="button" class="btn btn-danger btn-s-xs" id="btnPurSubmit">Add Stock</button>
						 <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                      </footer>
                    </section>
                  </form>
                </div>
		</div>
      </div>
      <div class="modal-footer">
       
      </div>
    </div>
	</div>
</div>

 
    
<div id="ViewPurchaseMoadal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Add user Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        
      </div>
      <div class="modal-body">
        <div class="row">
		<div class="col-sm-12">
                  <form method="" id="regform3" >
                    <section class="panel panel-default">
                      <header class="panel-heading">
                        <span class="h4">View Product Purchase History</span>
                      </header>
                      <div class="panel-body">
                       
                        
						<div class="form-group col-sm-6">
                          <label>Start Date</label>
                           <div class="input-group">
                               <input type="text" placeholder="Choose Date" class="input-sm form-control _date" id="start_date">
                                     
                           </div>
                        </div>

                          <div class="form-group col-sm-6">
                                 <label>End Date</label>
                          <div class="input-group">
                               <input type="text" placeholder="Choose Date" class="input-sm form-control _date" id="end_date">
                                    
                           </div>

                          </div>
                          <br>
						<div class="form-group col-sm-12">

                             <div class="table-responsive">
                      <table class="table table-striped m-b-none">
                        <thead>
                          <tr>
                           
                            <th>Product Code</th>
                            <th>Purchased From</th>
                             
                            <th>Quantity</th>
							
                              <th>Date</th>
                          </tr>
                        </thead>
                        <tbody id="tablevirepurid">
						
                         
						  
                        </tbody>
                      </table>
                    </div>
                         
                        
                        </div>
				
                     
                        
                      </div>
                      <footer class="panel-footer text-right bg-light lter">
                        <button type="button" class="btn btn-warning btn-s-xs" id="btnViewSubmit">View Purchases</button>
						 <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                      </footer>
                    </section>
                  </form>
                </div>
		</div>
      </div>
      <div class="modal-footer">
       
      </div>
    </div>
	</div>
</div>



     <div id="DeleteProductMoadal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Add user Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        
      </div>
      <div class="modal-body">
        <div class="row">
		<div class="col-sm-12">
                  <form method="" data-validate="parsley" action="" id="regform4" >
                    <section class="panel panel-default">
                      <header class="panel-heading">
                        <span class="h4">Delete Product</span>
                      </header>
                      <div class="panel-body">
                       
                        
						<div class="form-group col-sm-6">
                          <label>Product Code</label>
                          <input type="text" name="productcode" class="prod_code form-control parsley-validated" placeholder="Enter the Product code"  data-trigger="keyup" data-type="digits"  data-required="true">                        
                        </div>
                          <div class="form-group col-sm-6">
                              <br>
                              <label class="btn btn-s-sm btn-danger" id="del_checkcls">Check!</label>
                        </div>
						
						<div class="form-group col-sm-12">
                            <label>Product Details</label>
                            <textarea id="del_detail" name="desc" class="prodetails form-control parsley-validated" rows="1" data-minwords="1" data-required="true"  ></textarea>
                          </div>

                          

                          
                          
                        
                      </div>
                      <footer class="panel-footer text-right bg-light lter">
                        <button type="button" class="btn btn-danger btn-s-xs" id="btnProDel">Delete Product</button>
						 <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                      </footer>
                    </section>
                  </form>
                </div>
		</div>
      </div>
      <div class="modal-footer">
       
      </div>
    </div>
	</div>
</div>



    <script type="text/javascript">
        var objcms = new cms();
        </script>
    <script>
    $('._date').datepicker({
    format: "yyyy-mm-dd",
    
    clearBtn: true,
        autoclose: true,
    todayHighlight: true
    });
        </script>

     <script type="text/x-handlebars-template" id="viewPurchaseTemplate">


        {{#each .}}
         <tr>
             <td>{{prod_code}}</td>
             <td>{{purchase_from}}</td>
             <td>{{quantity}}</td>
             <td>{{date}}</td>
             </tr>

         {{/each}}

         </script>

     <script type="text/javascript">
         $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);

        </script>

    </html>