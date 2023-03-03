<?php
   require_once(dirname(__FILE__) . '/manager/session_manager.php');
   isAdminSessionValid(true);
?>
<!DOCTYPE html>
<html lang="en">
   <head>
      <?php
          include(dirname(__FILE__).'/components/header.php');
      ?>
      <link rel="stylesheet" type="text/css" href="<?php echo url ?>/customecss/css/select2.min.css">
      <link rel="stylesheet" type="text/css" href="<?php echo url ?>/customecss/css/summernote-lite.min.css">
      <link rel="stylesheet" type="text/css" href="<?php echo url ?>/customecss/css/style.min.css">
      <link rel="stylesheet" type="text/css" href="<?php echo url ?>/customecss/css/dataTables.foundation.min.css">
      <link rel="stylesheet" type="text/css" href="<?php echo url ?>/customecss/css/codemirror.min.css">
</head>
   </head>
   <body>
      <!-- ============================================================== -->
      <!-- BEGIN LOADER -->
         <div id="load_screen">
            <div class="loader">
               <div class="loader-content">
                  <div class="spinner-grow align-self-center"></div>
               </div>
            </div>
         </div>
      <!--  END LOADER -->
      <!-- ============================================================== -->
      <!-- Main wrapper - style you can find in pages.scss -->
      <!-- ============================================================== -->
      <div class="main-container" id="container">
         <!-- ============================================================== -->
         <!-- Topbar header - style you can find in pages.scss -->
         <!-- ============================================================== -->
         <?php include(dirname(__FILE__).'/components/navbar.php'); ?>
         <!-- ============================================================== -->
         <!-- End Left Sidebar - style you can find in sidebar.scss  -->
         <!-- ============================================================== -->
         <!-- ============================================================== -->
         <!-- Page wrapper  -->
         <div class="overlay"></div>
      <div class="search-overlay"></div>

      <!--  BEGIN SIDEBAR  -->
      <?php include(dirname(__FILE__).'/components/sidebar.php'); ?>
         <!-- ============================================================== -->
         <!-- <div class="page-wrapper"> -->
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div id="content" class="main-content">

         <div id="main-wrapper">
               <div class="page-breadcrumb">
                  <div class="row">
                     <div class="col-12 d-flex no-block align-items-center">
                        <h4 class="page-title">SniperPhish Settings</h4>
                     </div>
                  </div>
               </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">

                  <!-- ============================================================== -->
                  <!-- Start Page Content -->
                  <!-- ============================================================== -->
                  <div class="card">
                     <div class="card-body">
                        <div class="row">
                           <div class="comment-widgets col-md-12">
                              <!-- Comment Row -->
                              <div class="d-flex flex-row comment-row m-t-0">
                                    <div class="p-2"><img src="images/users/1.png" alt="user" width="150" class="rounded-circle" id="user_dp"></div>
                                    <div class="comment-text w-200">
                                       <h4 class="font-medium m-b-20" id="lb_name"></h4>
                                       <span class="m-b-10 d-block">User Name: <span class="m-l-5" id="lb_uname"></span></span> 
                                       <span class="m-b-10 d-block">Email: <span class="m-l-5" id="lb_mail"></span></span>  
                                       <span class="m-b-15 d-block">Account Created: <span class="m-l-5" id="lb_created_date"></span></span> 
                                       <div class="comment-footer">
                                          <button type="button" class="btn btn-cyan btn-sm" id="bt_edit_current_user">Edit Details</button>
                                       </div>
                                    </div>
                              </div>
                           </div>
                        </div>
                        <hr/>


                     </div>
                     <!-- ============================================================== -->
                     <!-- End PAge Content -->
                     <!-- ============================================================== -->
                     <!-- ============================================================== -->
                     <!-- Right sidebar -->
                     <!-- ============================================================== -->
                     <!-- .right-sidebar -->
                     <!-- ============================================================== -->
                     <!-- End Right sidebar -->
                     <!-- ============================================================== -->
                  </div>
                  <!-- ============================================================== -->
                  <!-- End PAge Content -->
                  <!-- ============================================================== -->
                  <!-- ============================================================== -->
                  <!-- Right sidebar -->
                  <!-- ============================================================== -->
                  <!-- .right-sidebar -->
                  <!-- ============================================================== -->
                  <!-- End Right sidebar -->
                  <!-- ============================================================== -->
               </div>
            <!-- </div> -->
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
            <!-- Modal -->
            <div class="modal fade" id="ModalUserDelete" tabindex="-1" role="dialog" aria-hidden="true">
               <div class="modal-dialog" role="document">
                  <div class="modal-content">
                     <div class="modal-header">
                        <h5 class="modal-title">Are you sure?</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">&times;</button>
                     </div>
                     <div class="modal-body">
                        This will delete user and the action can't be undone!
                     </div>
                     <div class="modal-footer" >
                        <button type="button" class="btn btn-danger" data-tracker_id="" onclick="deleteAccountAction()">Delete</button>
                     </div>
                  </div>
               </div>
            </div>
            <!-- Modal -->            
            <div class="modal fade" id="ModalAddUser" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
               <div class="modal-dialog modal-large" role="document">
                  <div class="modal-content">
                     <div class="modal-header">
                        <h5 class="modal-title">Create New Admin User</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">&times;</button>
                     </div>
                     <div class="modal-body">
                        <div class="form-group row">
                           <label for="rb_dp" class="col-sm-3 text-left control-label col-form-label">Avatar:</label>
                           <div class="col-sm-2">
                              <div class="p-2"><img src="images/users/1.png" alt="user" width="50" class="rounded-circle" onclick="$('input[name=rb_add_dp]').val([1])"></div>
                              <div class="custom-control custom-radio m-l-25">
                                   <input type="radio" class="custom-control-input" id="rbp1" name="rb_add_dp" value="1" checked>
                                   <label class="custom-control-label" for="rbp1"> </label>
                               </div>
                           </div>
                           <div class="col-sm-2">
                              <div class="p-2"><img src="images/users/2.png" alt="user" width="50" class="rounded-circle" onclick="$('input[name=rb_add_dp]').val([2])"></div>
                              <div class="custom-control custom-radio m-l-25">
                                   <input type="radio" class="custom-control-input" id="rbp2" name="rb_add_dp" value="2">
                                   <label class="custom-control-label" for="rbp2"> </label>
                               </div>
                           </div>
                           <div class="col-sm-2">
                              <div class="p-2"><img src="images/users/3.png" alt="user" width="50" class="rounded-circle" onclick="$('input[name=rb_add_dp]').val([3])"></div>
                              <div class="custom-control custom-radio m-l-25">
                                   <input type="radio" class="custom-control-input" id="rbp3" name="rb_add_dp" value="3">
                                   <label class="custom-control-label" for="rbp3"> </label>
                               </div>
                           </div>
                           <div class="col-sm-2">
                              <div class="p-2"><img src="images/users/4.png" alt="user" width="50" class="rounded-circle" onclick="$('input[name=rb_add_dp]').val([4])"></div>
                              <div class="custom-control custom-radio m-l-25">
                                   <input type="radio" class="custom-control-input" id="rbp4" name="rb_add_dp" value="4">
                                   <label class="custom-control-label" for="rbp4"> </label>
                               </div>
                           </div>
                        </div>
                        <div class="form-group row">
                           <label for="tb_add_name" class="col-sm-3 text-left control-label col-form-label">Name:</label>
                           <div class="col-sm-9">
                              <input type="text" class="form-control" id="tb_add_name">
                           </div>
                        </div>
                        <div class="form-group row">
                           <label for="tb_add_uname" class="col-sm-3 text-left control-label col-form-label">Username:</label>
                           <div class="col-sm-9">
                              <input type="text" class="form-control" id="tb_add_uname">
                           </div>
                        </div>
                        <div class="form-group row">
                           <label for="tb_add_mail" class="col-sm-3 text-left control-label col-form-label">Email:</label>
                           <div class="col-sm-9">
                              <input type="text" class="form-control" id="tb_add_mail">
                           </div>
                        </div>
                        <div class="form-group row">
                           <label for="tb_add_pwd" class="col-sm-3 text-left control-label col-form-label">Password:</label>
                           <div class="col-sm-9">
                              <input type="password" class="form-control" id="tb_add_pwd" placeholder="Password Here">
                           </div>
                        </div>
                        <div class="form-group row">
                           <label for="tb_add_confirm_pwd" class="col-sm-3 text-left control-label col-form-label">Confirm Password:</label>
                           <div class="col-sm-9">
                              <input type="password" class="form-control" id="tb_add_confirm_pwd" placeholder="Confirm Password Here">
                           </div>
                        </div>
                        <hr/>
                        <div class="form-group row">
                           <label for="tb_update_current_pwd" class="col-sm-3 text-left control-label col-form-label">Your Password:</label>
                           <div class="col-sm-9">
                              <input type="password" class="form-control" id="tb_add_current_pwd" placeholder="Your Password Here">
                           </div>
                        </div>
                     </div>
                     <div class="modal-footer" >
                        <button type="button" class="btn btn-success" onclick="addUserAction($(this))"><i class="fa fas fa-plus"></i> Add</button>
                     </div>
                  </div>
               </div>
            </div>
            <!-- Modal -->            
            <div class="modal fade" id="ModalModifyUser" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
               <div class="modal-dialog modal-large" role="document">
                  <div class="modal-content">
                     <div class="modal-header">
                        <h5 class="modal-title">Update User Info - <span id="modal_title_name"></span></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">&times;</button>
                     </div>
                     <div class="modal-body">
                        <div class="form-group row">
                           <label for="rb_dp" class="col-sm-3 text-left control-label col-form-label">Avatar:</label>
                           <div class="col-sm-2">
                              <div class="p-2"><img src="images/users/1.png" alt="user" width="50" class="rounded-circle" onclick="$('input[name=rb_update_dp]').val([1])"></div>
                              <div class="custom-control custom-radio m-l-25">
                                   <input type="radio" class="custom-control-input" id="rbu1" name="rb_update_dp" value="1" checked>
                                   <label class="custom-control-label" for="rbu1"> </label>
                               </div>
                           </div>
                           <div class="col-sm-2">
                              <div class="p-2"><img src="images/users/2.png" alt="user" width="50" class="rounded-circle" onclick="$('input[name=rb_update_dp]').val([2])"></div>
                              <div class="custom-control custom-radio m-l-25">
                                   <input type="radio" class="custom-control-input" id="rbu2" name="rb_update_dp" value="2">
                                   <label class="custom-control-label" for="rbu2"> </label>
                               </div>
                           </div>
                           <div class="col-sm-2">
                              <div class="p-2"><img src="images/users/3.png" alt="user" width="50" class="rounded-circle" onclick="$('input[name=rb_update_dp]').val([3])"></div>
                              <div class="custom-control custom-radio m-l-25">
                                   <input type="radio" class="custom-control-input" id="rbu3" name="rb_update_dp" value="3">
                                   <label class="custom-control-label" for="rbu3"> </label>
                               </div>
                           </div>
                           <div class="col-sm-2">
                              <div class="p-2"><img src="images/users/4.png" alt="user" width="50" class="rounded-circle" onclick="$('input[name=rb_update_dp]').val([4])"></div>
                              <div class="custom-control custom-radio m-l-25">
                                   <input type="radio" class="custom-control-input" id="rbu4" name="rb_update_dp" value="4">
                                   <label class="custom-control-label" for="rbu4"> </label>
                               </div>
                           </div>
                        </div>
                        <div class="form-group row">
                           <label for="tb_update_name" class="col-sm-3 text-left control-label col-form-label">Name:</label>
                           <div class="col-sm-9">
                              <input type="text" class="form-control" id="tb_update_name">
                           </div>
                        </div>
                        <div class="form-group row">
                           <label for="tb_update_uname" class="col-sm-3 text-left control-label col-form-label">Username:</label>
                           <div class="col-sm-9">
                              <input type="text" class="form-control" id="tb_update_uname" disabled>
                           </div>
                        </div>
                        <div class="form-group row">
                           <label for="tb_update_mail" class="col-sm-3 text-left control-label col-form-label">Email:</label>
                           <div class="col-sm-9">
                              <input type="text" class="form-control" id="tb_update_mail" disabled>
                           </div>
                        </div>
                        <div class="form-group row">
                           <label for="tb_update_new_pwd" class="col-sm-3 text-left control-label col-form-label">New Password:</label>
                           <div class="col-sm-9">
                              <input type="password" class="form-control" id="tb_update_new_pwd" placeholder="New Password Here">
                           </div>
                        </div>
                        <div class="form-group row">
                           <label for="tb_update_confirm_pwd" class="col-sm-3 text-left control-label col-form-label">Confirm Password:</label>
                           <div class="col-sm-9">
                              <input type="password" class="form-control" id="tb_update_confirm_pwd" placeholder="Confirm Password Here">
                           </div>
                        </div>
                        <hr/>
                        <div class="form-group row">
                           <label for="tb_update_current_pwd" class="col-sm-3 text-left control-label col-form-label">Your Password:</label>
                           <div class="col-sm-9">
                              <input type="password" class="form-control" id="tb_update_current_pwd" placeholder="Your Password Here">
                           </div>
                        </div>
                     </div>
                     <div class="modal-footer" >
                        <button type="button" class="btn btn-success" onclick="modifyUserAction($(this))"><i class="fa fas fa-save"></i> Update</button>
                     </div>
                  </div>
               </div>
            </div>
         <!-- </div> -->
         <?php include(dirname(__FILE__).'/components/foot.php'); ?>

</div>
</div>
         <!-- ============================================================== -->
         <!-- End Page wrapper  -->
         <!-- ============================================================== -->
      </div>
      <!-- ============================================================== -->
      <!-- End Wrapper -->
      <!-- ============================================================== -->
      <!-- ============================================================== -->
      <!-- All Jquery -->
      <!-- ============================================================== -->
      <?php include(dirname(__FILE__).'/components/script.php'); ?>
      
      <script src="<?php echo url ?>/js/libs/js.cookie.min.js"></script>
      <!-- Bootstrap tether Core JavaScript -->
      <script src="<?php echo url ?>/js/libs/popper.min.js"></script>
      <script src="<?php echo url ?>/js/libs/bootstrap.min.js"></script>
      <!--Menu sidebar -->
      <script src="<?php echo url ?>/js/libs/perfect-scrollbar.jquery.min.js"></script>
      <!--Custom JavaScript -->
      <script src="<?php echo url ?>/js/libs/custom.min.js"></script>
      <!-- this page js -->   
      <script src="<?php echo url ?>/js/common_scripts.js"></script>
      <!-- Employee List libraries -->
      <script src="https://www.virtuosoft.eu/code/bootstrap-duallistbox/bootstrap-duallistbox/v3.0.2/jquery.bootstrap-duallistbox.js"></script>
      <!-- Employee List libraries -->

      <script src="<?php echo url ?>/js/settings_user.js"></script> 
      <script defer src="<?php echo url ?>/js/libs/sidebarmenu.js"></script>
      <script defer src="<?php echo url ?>/js/libs/jquery/datatables.js"></script> 
      <script defer src="<?php echo url ?>/js/libs/toastr.min.js"></script>
      <script defer src="<?php echo url ?>/js/libs/select2.min.js"></script>
      <script defer src="<?php echo url ?>/js/libs/moment.min.js"></script>
      <script defer src="<?php echo url ?>/js/libs/bootstrap-datetimepicker.min.js"></script>
      <script defer src="<?php echo url ?>/js/libs/moment.min.js"></script>
      <script defer src="<?php echo url ?>/js/libs/moment-timezone-with-data.min.js"></script>
      <script type="text/javascript">
         var curr_version = "<?php getSniperPhishVersion(); ?>";
         // $("#lb_version").text("Version: " + curr_version);
      </script>
      
   </body>
</html>