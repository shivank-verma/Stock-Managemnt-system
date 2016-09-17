var cms = function ()

{
    window.onload = function ()
    {
        $('#regform')[0].reset();
        $('#regform1')[0].reset();
        $('#regform2')[0].reset();
        $('#regform3')[0].reset();
    };
   
    var t = new Date();


    var formatDate = function (date) {
        var d = new Date(date),
            month = '' + (d.getMonth() + 1),
            day = '' + d.getDate(),
            year = d.getFullYear();

        if (month.length < 2) month = '0' + month;
        if (day.length < 2) day = '0' + day;

        return [year, month, day].join('-');
    }


    var getDailyStoclist = function (date)
    {
        var newdate;
        if (date === "" || date === null || date === undefined) {

            newdate = formatDate(t);


        }
        else
        {
            newdate = date;
        }


        $.ajax({
            method: "POST",
            url: "stockcms.aspx/showDailydatalist",
            contentType: "application/json",

            data: JSON.stringify({ date: newdate }),
            success: function (result) {

                var dataFinal = JSON.stringify(result);

                result.d = JSON.parse(result.d);
                var d1 = result.d;
                for (var i = 0; i < d1.length; i++)
                {
                    if (d1[i].stock_left <= d1[i].alert_limit)
                    {
                        swal("Warning", "Stock is low for" + d1[i].product_code +""+ d1[i].product_Desc + "", "error")
                    }
                }

                var tmpScrpt = $("#dailydataTemplate").html();
                var tmp = Handlebars.compile(tmpScrpt);
                var html = tmp(d1);
                $("#tablerowid").html(html);

             


            },
            error: function () {

                swal("Oops!", "Something went wrong!", "error")
            }
        });


    }


    getDailyStoclist(null);
  


    //click events

    $("#btnSubmit").on("click", function () {

      
        var productcode = $("#product_code").val();
        var prodetail = $("#prodetail").val();
       


        $.ajax({
            method: "POST",
            url: "stockcms.aspx/AddProduct",
            contentType: "application/json",

            data: JSON.stringify({ product_code: productcode, prodetail: prodetail}),
            success: function (result) {

                swal("Done", "New Product added !", "success");
                $('#regform')[0].reset();
                getDailyStoclist(null);
                
            },
            error: function () {

                swal("Oops!", "Something went wrong!", "error");
                $('#regform')[0].reset();
            }
        });


    });



    $("#checkcls").on("click", function () {


        var productcode = $(this).parent().siblings().children('.prod_code').val();
        
        //var alert_limit = $(this).parent().siblings().children().children('#alert_limit').val();
       

        $.ajax({
            method: "POST",
            url: "stockcms.aspx/getDescription",
            contentType: "application/json",

            data: JSON.stringify({ product_code: productcode }),
            success: function (result) {

                result.d = JSON.parse(result.d);
                var d1 = result.d
                var desc = d1[0].product_desc;
                var alert_limit = d1[0].alert_limit;
                if (alert_limit == '0' || alert_limit == NaN || alert_limit == "" || alert_limit == null) {
                    swal("Warning!", "Alert Limit is not set!", "error");
                }
                else
                {
                    $("#alert_limit").val(alert_limit);
                }
                $("#detail").val(desc);


            },
            error: function () {

                swal("Oops!", "Something went wrong!", "error")
            }
        });


    });




    $("#update_alert_value").on("click", function () {


        var productcode = $(this).parent().siblings().children('.prod_code').val();

        var alert_limit = $(this).parent().siblings().children('#alert_limit').val();


        $.ajax({
            method: "POST",
            url: "stockcms.aspx/updateAlertLimit",
            contentType: "application/json",

            data: JSON.stringify({ product_code: productcode, alert_limit: alert_limit }),
            success: function (result) {

                result.d = JSON.parse(result.d);
                var d1 = result.d
              
                var alert_limit = d1[0].alert_limit;
               
                $("#alert_limit").val(alert_limit);


            },
            error: function () {

                swal("Oops!", "Something went wrong!", "error")
            }
        });


    });


    $("#del_checkcls").on("click", function () {


        var productcode = $(this).parent().siblings().children('.prod_code').val();

       


        $.ajax({
            method: "POST",
            url: "stockcms.aspx/getDescription",
            contentType: "application/json",

            data: JSON.stringify({ product_code: productcode }),
            success: function (result) {

                result.d = JSON.parse(result.d);
                var d1 = result.d

                var desc = d1[0].product_desc;

                $("#del_detail").val(desc);


            },
            error: function () {

                swal("Oops!", "Something went wrong!", "error")
            }
        });


    });


    
    $("#btnProDel").on("click", function () {


        var product_code = $(this).parent().siblings().children().children('.prod_code').val();


        $.ajax({
            method: "POST",
            url: "stockcms.aspx/deleteProduct",
            contentType: "application/json",

            data: JSON.stringify({ product_code: product_code }),
            success: function (result) {

                swal("Done", "Product Deleted from Database !", "success");
                getDailyStoclist(null);


            },
            error: function () {

                swal("Oops!", "Something went wrong!", "error")
            }
        });
       



    });


    $("#btnPurSubmit").on("click", function () {


        var product_code = $(this).parent().siblings().children().children('.prod_code').val();
        var quantity = $(this).parent().siblings().children().children('.quantity').val();
        var pur_from = $(this).parent().siblings().children().children('.purchasedfrom').val();
        var bill_details = $(this).parent().siblings().children().children('#bill_details').val();
        var alert_limit = $(this).parent().siblings().children().children('#alert_limit').val();
        var tin_details = $(this).parent().siblings().children().children('#tin_details').val();
        var bill_date = $(this).parent().siblings().children().children('#bill_date').val();
        var seller_details = $(this).parent().siblings().children().children('#seller_details').val();

        $.ajax({
            method: "POST",
            url: "stockcms.aspx/addpurchase",
            contentType: "application/json",

            data: JSON.stringify({ prod_code: product_code, quantity: quantity, pur_from: pur_from, bill_detail: bill_details, seller_phn: seller_details, tin_no: tin_details, alert_limit: alert_limit, bill_date: bill_date }),
            success: function (result) {

                swal("Done", "New Purchase added !", "success");
                $('#regform2')[0].reset();
                getDailyStoclist(null);


            },
            error: function () {

                swal("Oops!", "Something went wrong!", "error");
                $('#regform2')[0].reset();
                getDailyStoclist(null);
            }
        });


    });



    $("body").on("click", ".btnUpdate", function () {

        var prod_code = $(this).parent().siblings().children('.prod_Code').text();
        var used_today = $(this).parent().siblings().children('.used_today').val();

        var date = $('._date').val();
        if (date == null || date == "" || date == undefined)
        {
            date = formatDate(t);

        }


        $.ajax({
            method: "POST",
            url: "stockcms.aspx/updateDailydatalist",
            contentType: "application/json",

            data: JSON.stringify({ prod_code: prod_code, used_today: used_today, date: date }),
            success: function (result) {

                swal("Done", "Details Updated !", "success");
                getDailyStoclist(null);


            },
            error: function () {

                swal("Oops!", "Something went wrong!", "error");
            }
        });


    });



    $("body").on("click", "#date_btn", function ()
    {
        var date = $('._date').val();
        if (date == null || date == "" || date == undefined) {
            date = formatDate(t);

        }

        getDailyStoclist(date);
    });


    $("body").on("click", "#btnViewSubmit", function () {

        var strtdate = $('#start_date').val();
        var endate = $('#end_date').val();





        $.ajax({
            method: "POST",
            url: "stockcms.aspx/showPurchases",
            contentType: "application/json",

            data: JSON.stringify({ startdate: strtdate, endate: endate}),
            success: function (result) {

                var dataFinal = JSON.stringify(result);

                result.d = JSON.parse(result.d);
                var d1 = result.d;
                for (var i = 0; i < d1.length; i++)
                {
                    d1[i].date = formatDate(d1[i].date);
                }

                var tmpScrpt = $("#viewPurchaseTemplate").html();
                var tmp = Handlebars.compile(tmpScrpt);
                var html = tmp(d1);
                $("#tablevirepurid").html(html);



            },
            error: function () {

                swal("Oops!", "Something went wrong!", "error");
            }
        });

      

    });



    $("#searchbar").keyup(function () {
        var userInput = $(this).val();
        $("#tablerowid tr").map(function (index, value) {
            $(value).toggle($(value).text().toLowerCase().indexOf(userInput) >= 0);
        });
    });

}