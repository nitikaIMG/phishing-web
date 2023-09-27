<?php
require_once(dirname(__FILE__) . '/manager/session_manager.php');
require_once(dirname(__FILE__).'/includes/config.php');
isAdminSessionValid(true);
?>
<!DOCTYPE html>
<html lang="en">

<head>
   <?php
    include(dirname(__FILE__) . '/components/header.php');
   ?>
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <!-- Tell the browser to be responsive to screen width -->
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <meta name="description" content="">
   <meta name="author" content="">
   <meta name="robots" content="noindex, nofollow" />


   <!-- Custom CSS -->
   <link rel="stylesheet" type="text/css" href="<?php echo url ?>/customecss/css/select2.min.css">
   <link rel="stylesheet" type="text/css" href="<?php echo url ?>/customecss/css/style.min.css">
   <link rel="stylesheet" type="text/css" href="<?php echo url ?>/customecss/css/dataTables.foundation.min.css">
   <style>
      .tab-header {
         list-style-type: none;
      }
   </style>
   <link rel="stylesheet" type="text/css" href="<?php echo url ?>/customecss/css/toastr.min.css">
</head>

<body class="layout-boxed alt-menu">
   <!-- ============================================================== -->
   <!-- Preloader - style you can find in spinners.css -->
   <!-- ============================================================== -->
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
      <?php include(dirname(__FILE__) . '/components/adminnavbar.php'); ?>
      <!-- Topbar header - style you can find in pages.scss -->
      <!-- ============================================================== -->
      <div class="overlay"></div>
      <div class="search-overlay"></div>

      <!--  BEGIN SIDEBAR  -->
      <?php include(dirname(__FILE__) . '/components/adminsidebar.php'); ?>
      <!-- ============================================================== -->
      <!-- End Left Sidebar - style you can find in sidebar.scss  -->
      <!-- ============================================================== -->
      <!-- ============================================================== -->
      <!-- Page wrapper  -->
      <!-- ============================================================== -->
      <div id="content" class="main-content">
         <!-- ============================================================== -->
         <!-- Bread crumb and right sidebar toggle -->
         <!-- ============================================================== -->
         <div class="page-breadcrumb breadcrumb-withbutton">
            <div class="row align-items-center my-3" >
               <div class="col-sm d-flex no-block align-items-center">
                  <h4 class="page-title m-0">Edit Domain</h4>
               </div>
            </div>
         </div>
         <!-- ============================================================== -->
         <!-- End Bread crumb and right sidebar toggle -->
         <!-- ============================================================== -->
         <!-- ============================================================== -->
         <div class="container-fluid" id="section_addsender">
            <!-- ============================================================== -->
            <!-- Start Page Content -->
            <!-- ============================================================== -->
            <div class="card">
               <div class="card-body">
                  <div class="row">
                       <input type="hidden" class="form-control" id="domain_id_admin_default" value="<?php echo $_GET['sender'] ?>">
                     <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-10">
                               <div class="form-group row">
                                  <label for="mail_sender_name" class="col-md-3 text-left control-label col-form-label">Domain Name:* </label>
                                  <div class="col-md-9">
                                     <input type="text" class="form-control" id="domain_name_admin_default" placeholder="abc.com">
                                  </div>
                                </div>
                            </div>
                            <div class="col-md-10">
                              <div class="form-group row">
                                 <label for="mail_sender_name" class="col-md-3 text-left control-label col-form-label">Path:* </label>
                                 <div class="col-md-9">
                                     <input type="text" class="form-control" id="domain_path_admin_default" placeholder="/home/techowlphish/abc.com/">                    
                                 </div>
                              </div>
                            </div>
                            <div class="col-md-10">
                                 <div class="form-group row">
                                 <label class="col-md-3 text-left control-label col-form-label">SMTP Server:*</label>
                                  <div class="col-md-9">
                                      <select class="select2 form-control date-inputmask" required id="smtp_server" placeholder="smtp server">
                                         <option value="" selected disabled>Select smtp server</option>
                                      </select>
                                  </div>
                                </div>
                            </div>
                            <div class="col-md-1">
                               <div class="form-group row" style="margin: 6px;">
                                 <div class="col-sm-7 text-right">
                                    <button type="button" class="btn btn-info" onclick="updateDomainById($(this),0)" style="width: 100px;"><i class="fa fas fa-save"></i> Save</button>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
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
         <!-- End Container fluid  -->
         <!-- ============================================================== -->
         <!-- ============================================================== -->
         <!-- footer -->
         <!-- ============================================================== -->
         <?php include(dirname(__FILE__) . '/components/foot.php'); ?>
         <?php include dirname(__FILE__) . "/components/script.php"; ?>
         <!-- ============================================================== -->
         <!-- End footer -->
         <!-- ============================================================== -->
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
   <script src="<?php echo url ?>/js/libs/jquery/jquery-3.6.0.min.js"></script>
   <script src="<?php echo url ?>/js/libs/js.cookie.min.js"></script>
   <!-- Bootstrap tether Core JavaScript -->
   <script src="<?php echo url ?>/js/libs/perfect-scrollbar.jquery.min.js"></script>
   <!--Custom JavaScript -->
   <script src="<?php echo url ?>/js/libs/custom.min.js"></script>
   <!-- this page js -->
   <script src="<?php echo url ?>/js/libs/jquery/datatables.js"></script>
   <script src="<?php echo url ?>/js/common_scripts.js"></script>
   <script src="<?php echo url ?>/js/domain_manager.js"></script>
   <?php
   echo '<script>';
   if (isset($_GET['action']) && isset($_GET['sender']) && $_GET['sender'] != '') {
      echo '$("#section_view_list").hide();
                  getDomainById("' . doFilter($_GET['sender'], 'ALPHA_NUM') . '");get_smtp_list("' . doFilter($_GET['sender'], 'ALPHA_NUM') . '");';
   }
   echo '</script>';
   ?>

   <script defer src="<?php echo url ?>/js/libs/sidebarmenu.js"></script>
   <script defer src="<?php echo url ?>/js/libs/moment.min.js"></script>
   <script defer src="<?php echo url ?>/js/libs/moment-timezone-with-data.min.js"></script>
   <script defer src="<?php echo url ?>/js/libs/toastr.min.js"></script>
   <script defer src="<?php echo url ?>/js/libs/popper.min.js"></script>
   <script defer src="<?php echo url ?>/js/libs/bootstrap.min.js"></script>
   <script defer src="<?php echo url ?>/js/libs/select2.min.js"></script>
</body>

</html>