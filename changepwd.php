<?php
   require_once(dirname(__FILE__) . '/config/db.php');
   require_once(dirname(__FILE__) . '/manager/common_functions.php');
   require_once (dirname(__FILE__).'/includes/config.php');

   if(isset($_GET['token'])){  
      if(!isTokenValid($conn,$_GET['token']))
        die("Incorrect request. Token may be invalid");
   }
   else
      die();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <?php include(dirname(__FILE__).'/components/header.php'); ?>
</head>
<style>
    #to-recover:hover {
        color:#805dca;
    }
    #to-recover{
        font-style:italic;
    }
</style>

<body class="layout-boxed alt-menu">
    <!-- BEGIN LOADER -->
    <div id="load_screen"> <div class="loader"> <div class="loader-content">
        <div class="spinner-grow align-self-center"></div>
    </div></div></div>
    <!--  END LOADER -->
      
    <div class="container mx-auto align-self-center">

<div class="row">

    <div class="col-xxl-4 col-xl-5 col-lg-5 col-md-8 col-12 d-flex flex-column align-self-center mx-auto">
        <div class="card mt-5 mb-3">
            <div class="card-body">

                  <form class="form-horizontal m-t-20" id="doPwdReset">

                  <div class="row">
                        <div class="col-md-12 mb-3">
                          <h2>Reset Password</h2>
                        </div>
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label">New Password</label>
                                <input type="password" class="form-control form-control-lg" placeholder="New Password" id="tb_pwd" aria-label="Username" aria-describedby="basic-addon1" required>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label">Confirm Password</label>
                                <input type="password" class="form-control form-control-lg" placeholder="Confirm Password" id="tb_pwd_confirm" aria-label="Password" aria-describedby="basic-addon1" required>
                            </div>
                            <div id="lb_msg" class="m-t-10"></div>
                        </div>

                        <div class="col-12">
                            <div class="mb-4">
                            <button class="btn btn-secondary w-100 float-right" id="bt_reset_pwd" type="submit"><i class="fa fas"></i> Change</button>
                            </div>
                        </div>
                  </div>
                   
               </form>

            </div>
        </div>
    </div>
   
</div>

</div>
  
       <!-- <script src="js/libs/jquery/jquery-3.6.0.min.js"></script> -->
       <?php include(dirname(__FILE__).'/components/script.php'); ?>


      <script>
        $(".preloader").fadeOut();
        // ============================================================== 

        $("#doPwdReset").submit(function(event) {
            event.preventDefault();
            $("#lb_msg").html('');

            if($("#tb_pwd").val() != $("#tb_pwd_confirm").val()){
              $("#lb_msg").html('<span class="text-danger">Passwords are not matching.</span>');
              return;
            }

            if($("#tb_pwd").val().length <8 ){
              $("#lb_msg").html('<span class="text-danger">Password minimum length 8 is required.</span>');
              return;
            }

            $("#bt_reset_pwd i").toggleClass('fa-spinner fa-spin');
            $.post({
                url: "./manager/pwd_manager.php",
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify({ 
                    action_type: "do_change_pwd",
                    new_pwd: $("#tb_pwd").val(),
                    token: location.search.split("?token=")[1],
                })
            }).done(function (data) {
                var url=App;
                $("#bt_reset_pwd i").toggleClass('fa-spinner fa-spin');
                if(data.result == "success"){ 
                    $("#lb_msg").html('<span class="text-success">Password reset successs. Click <a href="#">here</a> to login</span>');
                }
                else
                    $("#lb_msg").html('<span class="text-danger">' + data.error + '</span>');
              });
        });
      </script>

   </body>
</html>