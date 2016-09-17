var loginpage = function () {

    //button click events 
    $("#btnSubmit").on("click", function () {

        var username = $("#login_input_username").val();
        var password = $("#login_input_password").val();


        $.ajax({
            method: "POST",
            url: "Login.aspx/LoginMethod",
            data: JSON.stringify({ user_name: username,pass_word:password }),
            contentType: "application/json; charset=utf-8",
            dataType: 'json',
            async: true,
            success: function (result) {
               
                
                window.location = result.d;
                            },
            error: function () {
               
                swal("Oops!", "Something went wrong!Try Again", "error")

            }
        });

    });
}