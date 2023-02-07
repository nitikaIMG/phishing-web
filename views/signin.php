<?php
   require_once('../manager/session_manager.php');
   if(isSessionValid() == true){
      header("Location: index.php");
      die();
  }
   
  if (!empty($_POST['contact_mail']) && !empty($_POST['password'])) {
      if(validateLogin($_POST['contact_mail'],$_POST['password']) == true){
         createSession(true,$_POST['contact_mail']);
         header("Location: index.php");
         die();
      }  
   }
?>

<?php 
require_once '../includes/config.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <?php include('../components/header.php'); ?>
</head>
   <body>

      <!-- BEGIN LOADER -->
      <div id="load_screen"> <div class="loader"> <div class="loader-content">
        <div class="spinner-grow align-self-center"></div>
    </div></div></div>
    <!--  END LOADER -->

    <div class="auth-container d-flex">

<div class="container mx-auto align-self-center">

    <div class="row">

        <div class="col-xxl-4 col-xl-5 col-lg-5 col-md-8 col-12 d-flex flex-column align-self-center mx-auto">
            <div class="card mt-3 mb-3">
                <div class="card-body">

                <form class="form-horizontal m-t-20" id="loginform"  method="post" onsubmit="doLogin()">

                    <div class="row">
                        <div class="col-md-12 mb-3">
                            
                            <h2>Sign In</h2>
                            <p>Enter your contact_mail and password to login</p>
                            
                        </div>
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label">contact_mail</label>
                                <input type="email" name="contact_mail" class="form-control">
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="mb-4">
                                <label class="form-label">Password</label>
                                <input type="password" name="password"  class="form-control">
                            </div>
                            <?php 
                      if(isset($_POST['username']) || isset($_POST['password']))
                         echo '<div class="text-danger">
                                  Username or password is incorrect.
                               </div>';
                   ?>
                        </div>
                        <div class="col-12">
                            <div class="mb-3">
                                <div class="form-check form-check-primary form-check-inline">
                                    <input class="form-check-input me-3" type="checkbox" id="form-check-default">
                                    <label class="form-check-label" for="form-check-default">
                                        Remember me
                                    </label>
                                    <button class="btn btn-info" id="to-recover" type="button"><i class="fa fa-lock m-r-5"></i> Lost password?</button>
                                    
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-12">
                            <div class="mb-4">
                                <button name="login" type="submit" class="btn btn-secondary w-100">SIGN IN</button>
                            </div>
                        </div>
                        
                        <div class="col-12 mb-4">
                            <div class="">
                                <div class="seperator">
                                    <hr>
                                    <div class="seperator-text"> <span>Or continue with</span></div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-sm-4 col-12">
                            <div class="mb-4">
                                <button class="btn  btn-social-login w-100 ">
                                    <img src="<?php echo url?>/src/assets/img/google-gmail.svg" alt="" class="img-fluid">
                                    <span class="btn-text-inner">Google</span>
                                </button>
                            </div>
                        </div>

                        <div class="col-sm-4 col-12">
                            <div class="mb-4">
                                <button class="btn  btn-social-login w-100">
                                    <img src="<?php echo url?>/src/assets/img/github-icon.svg" alt="" class="img-fluid">
                                    <span class="btn-text-inner">Github</span>
                                </button>
                            </div>
                        </div>

                        <div class="col-sm-4 col-12">
                            <div class="mb-4">
                                <button class="btn  btn-social-login w-100">
                                    <img src="<?php echo url?>/src/assets/img/twitter.svg" alt="" class="img-fluid">
                                    <span class="btn-text-inner">Twitter</span>
                                </button>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="text-center">
                                <p class="mb-0">Dont't have an account ? <a href="./signup.php" class="text-warning">Sign Up</a></p>
                            </div>
                        </div>
                        
                    </div>
                    
                </form>

                </div>
            </div>
        </div>
        <div id="recoverform">
                  <div class="text-center">
                     <span class="text-white">Enter your e-mail address below and we will send you instructions how to recover a password.</span>
                  </div>
                  <div class="row m-t-20">
                     <!-- Form -->
                     <form class="col-12" id="recoveryform" >
                        <!-- email -->
                        <div class="input-group mb-3">
                           <div class="input-group-prepend">
                              <span class="input-group-text bg-danger text-white" id="basic-addon1"><i class="mdi mdi-email-outline"></i></span>
                           </div>
                           <input type="email" class="form-control form-control-lg" id="tb_recoverymail" placeholder="Email Address" aria-label="Username" aria-describedby="basic-addon1" required>
                        </div>
                        <!-- pwd -->
                        <div class="row m-t-20 p-t-20 border-top border-secondary">
                           <div class="col-12">
                              <a class="btn btn-success" href="#" id="to-login">Back To Login</a>
                              <button class="btn btn-info float-right" type="submit" name="recovery"><i class="fa fas"></i> Recover</button>
                           </div>
                        </div>
                        <div id="lb_msg" class="m-t-10"></div>
                     </form>
                  </div>
               </div>
    </div>
    
</div>

</div>
<!-- <script src="js/libs/jquery/jquery-3.6.0.min.js"></script> -->
<?php include('../components/script.php'); ?>
      <script>
         $(".preloader").fadeOut();
         // ============================================================== 
         // Login and Recover Password 
         // ============================================================== 
         $('#to-recover').on("click", function() {
             $("#loginform").slideUp();
             $("#recoverform").fadeIn();
         });
         $('#to-login').click(function(){             
             $("#recoverform").hide();
             $("#loginform").fadeIn();
         });

         function doLogin(){
            e= $('[name ="login"]');
            if($('[name ="contact_mail"]').val()=='' || $('[name ="password"]').val()=='')
               return;
             if(!e.is('[disabled=disabled]'))
                 e.attr('disabled', true);
             else
                 e.attr('disabled', false);
             e.children(":first").toggleClass('fa-spinner fa-spin');
         }

        $("#recoveryform").submit(function(e) {
            e.preventDefault();
            $('[name ="recovery"]').children(":first").toggleClass('fa-spinner fa-spin');
              var contact_mail= $("#tb_recoverymail").val();
            $.post({
                url: "../manager/pwd_manager.php",
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify({ 
                    action_type: "send_pwd_reset",
                    contact_mail: contact_mail
                })
            }).done(function (data) {
                $('[name ="recovery"]').children(":first").toggleClass('fa-spinner fa-spin');
                if(data.result == "success"){
                    $("#lb_msg").html('<span class="text-success">If the contact_mail is valid, you will receive a password reset link now. Please note the link is valid for 48hrs only.</span>');
                    $("#tb_recoverymail").val('');
                }
                else
                    $("#lb_msg").html('<span class="text-danger">' + data.error + '</span>');
              });
            }); 
      </script>
   </body>
</html>