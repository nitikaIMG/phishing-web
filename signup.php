<?php 
require_once (dirname(__FILE__).'/includes/config.php');
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <?php include(dirname(__FILE__).'/components/header.php'); ?>
</head>
<body class="form">

    <!-- BEGIN LOADER -->
    <div id="load_screen"> <div class="loader"> <div class="loader-content">
        <div class="spinner-grow align-self-center"></div>
    </div></div></div>
    <!--  END LOADER -->

    <div class="auth-container d-flex">

        <div class="container mx-auto align-self-center">
    
            <div class="row">
    
                <div class="col-xxl-4 col-xl-5 col-lg-5 col-md-8 col-12 d-flex flex-column align-self-center mx-auto">
                    <div class="card mt-5 mb-3">
                        <div class="card-body">
    
                        <form class="form-horizontal m-t-20" id="loginform"  method="post">

                            <div class="row">
                                <div class="col-md-12 mb-3">
                                    
                                    <h2>Sign Up</h2>
                                    <p>Enter your email and password to register</p>
                                    
                                </div>
                                <div class="col-md-12">
                                    <div class="mb-3">
                                        <label class="form-label">Name</label>
                                        <input type="text" name="username" id="username" class="form-control add-billing-address-input" required>
                                        <div class="text-danger" id="username-error">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="mb-3">
                                        <label class="form-label">Email</label>
                                        <input type="email" name="contact_mail" id="contact_mail" class="form-control" required>
                                        <div class="text-danger" id="email-error">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="mb-3">
                                        <label class="form-label">Password</label>
                                        <input type="password" name="password" id="password" min="6" required class="form-control">
                                        <div class="text-danger" id="password-error">
                                        </div>
                                    </div>
                                </div>
                                <!--<div class="col-12">-->
                                <!--    <div class="mb-3">-->
                                <!--        <div class="form-check form-check-primary form-check-inline">-->
                                <!--            <input class="form-check-input me-3" type="checkbox" id="form-check-default">-->
                                <!--            <label class="form-check-label" for="form-check-default">-->
                                <!--                I agree the <a href="javascript:void(0);" class="text-primary">Terms and Conditions</a>-->
                                <!--            </label>-->
                                <!--        </div>-->
                                <!--    </div>-->
                                <!--</div>-->
                                
                                <div class="col-12">
                                    <div class="mb-4">
                                        <button type="button" id="submit"  class="btn btn-secondary w-100">SIGN UP</button>
                                    </div>
                                </div>
                                
                                <!--<div class="col-12 mb-4">-->
                                <!--    <div class="">-->
                                <!--        <div class="seperator">-->
                                <!--            <hr>-->
                                <!--            <div class="seperator-text"> <span>Or continue with</span></div>-->
                                <!--        </div>-->
                                <!--    </div>-->
                                <!--</div>-->
                                
                                <!--<div class="col-sm-4 col-12">-->
                                <!--    <div class="mb-4">-->
                                <!--        <button class="btn  btn-social-login w-100 ">-->
                                <!--            <img src="<?php echo url?>/src/assets/img/google-gmail.svg" alt="" class="img-fluid">-->
                                <!--            <span class="btn-text-inner">Google</span>-->
                                <!--        </button>-->
                                <!--    </div>-->
                                <!--</div>-->
    
                                <!--<div class="col-sm-4 col-12">-->
                                <!--    <div class="mb-4">-->
                                <!--        <button class="btn  btn-social-login w-100">-->
                                <!--            <img src="<?php echo url?>/src/assets/img/github-icon.svg" alt="" class="img-fluid">-->
                                <!--            <span class="btn-text-inner">Github</span>-->
                                <!--        </button>-->
                                <!--    </div>-->
                                <!--</div>-->
    
                                <!--<div class="col-sm-4 col-12">-->
                                <!--    <div class="mb-4">-->
                                <!--        <button class="btn  btn-social-login w-100">-->
                                <!--            <img src="<?php echo url?>/src/assets/img/twitter.svg" alt="" class="img-fluid">-->
                                <!--            <span class="btn-text-inner">Twitter</span>-->
                                <!--        </button>-->
                                <!--    </div>-->
                                <!--</div>-->

                                <div class="col-12">
                                    <div class="text-center">
                                        <p class="mb-0">Already have an account ? <a href="signin.php" class="text-warning">Sign in</a></p>
                                    </div>
                                </div>
                                
                            </div>
                            
                        </form>
                        </div>
                    </div>
                </div>
                
            </div>
            
        </div>

    </div>

    <?php include(dirname(__FILE__).'/components/script.php'); ?>

    <script>
              $("#submit").click(function(e){ 
              e.preventDefault();
              var username= $("#username").val();
              var contact_mail= $("#contact_mail").val();
              var password= $("#password").val();
              var status=0;

              var re =  /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
             
              $("#username-error").html("");
              $("#password-error").html("");
              $("#email-error").html("");

              if(!username){
                 $("#username-error").append("Please Enter User Name!"); 
                   status=1;
                }
              
                if(!password){
                    $("#password-error").append("Please Enter Passsword!");
                      status=1;
                }else if(password.toString().length<=5){
                    $("#password-error").append("password must be at least 6 characters!");
                      status=1;
                }
             
                if(!contact_mail){
                  $("#email-error").children().remove();
                  $("#email-error").append("Please Enter Email Address!");
                    status=1;
                }else if(!contact_mail.match(re)){
                  $("#email-error").children().remove();
                  $("#email-error").append("Please Enter valid Email Address!");
                    status=1;
                }
            
           if(status==1){
               exit();
           }

            if(!username || !password || !contact_mail || !contact_mail.match(re)){
                exit();
            }

            $.post({
                url: "./manager/signup.php",
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify({ 
                    contact_mail: contact_mail,
                    username: username,
                    password: password
                })
            }).done(function (data) {
               if(data == "success"){
                            Swal.fire(
                            'Success!',
                            'Registered Successfully.',
                            'success'
                            )
                            setTimeout(function () {
                            window.location.href='<?=App?>/signin.php';
                             }, 2500);
               }else{
                alert("Email already exist!");
               }
              });
            }); 
    </script>
</body>
</html>