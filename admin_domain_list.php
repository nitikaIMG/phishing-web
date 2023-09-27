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
         <!-- Container fluid  -->
         <!-- ============================================================== -->
         <div class="container-fluid" id="section_view_list">
            <!-- ============================================================== -->
            <!-- Start Page Content -->
            <!-- ============================================================== -->
            <div class="card">
               <div class="card-body">
                  <div class="row mb-3">
                     <div class="col-md-10">
                        <h3>Manage Domain</h3>
                     </div>
                     <div class="col-md-2 col-md-2 d-flex justify-content-end">
                        <button type="button" class="btn btn-success" data-toggle="modal" data-target="#mailDefaultIntemodal" id="adminIntegration">Add New</button>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-12 m-t-20">
                        <div class="row">
                           <div class="table-responsive">
                              <table id="table_mail_sender_list" class="table table-bordered">
                                 <thead>
                                    <tr>
                                       <th>#</th>
                                       <th>Domain Name</th>
                                       <th>Path</th>
                                       <th>Created At</th>
                                       <th>Modified On</th>
                                       <th>Actions</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                 </tbody>
                              </table>
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
         </div>
         <!-- Modal -->
         <div class="modal fade" id="mailDefaultIntemodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
               <div class="modal-content">
                  <div class="modal-header">
                     <h5 class="modal-title" id="exampleModalLabel">Add Domain</h5>
                     <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                     </button>
                  </div>
                  <div class="modal-body">
                     <div class="col-md-12">
                        <!-- <div class="row">
                           <div class="col-md-6"> -->
                        <div class="form-group row">
                           <label for="mail_sender_name" class="col-md-3 text-left control-label col-form-label">Domain Name:* </label>
                           <div class="col-md-9">
                              <input type="text" class="form-control" id="domain_name_admin_default" placeholder="abc.com">
                           </div>
                        </div>
                        <div class="form-group row">
                           <label for="mail_sender_SMTP_server"
                              class="col-sm-3 text-left control-label col-form-label">Path:*</label>
                           <div class="col-sm-9">
                              <input type="text" class="form-control" id="domain_path_admin_default"
                                 placeholder="/home/techowlphish/abc.com/">
                           </div>
                        </div>
                        <div class="form-group row">
                           <label for="mail_sender_SMTP_server"
                              class="col-sm-3 text-left control-label col-form-label">SMTP Server:*</label>
                           <div class="col-sm-9">
                                <select class="select2 form-control date-inputmask" required id="smtp_server" placeholder="smtp server">
                                 <option value="" selected disabled>Select smtp server</option>
                              </select>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="modal-footer">
                     <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                     <button type="button" class="btn btn-primary" value="0" id="defaultIntegration"
                        onclick="saveDomainByAdmin($(this),0)">Save</button>
                  </div>
               </div>
            </div>
         </div>
         <!-- Modal -->
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
   <!-- <script src="<?php echo url ?>/js/mail_integration.js"></script> -->
   <?php
   echo '<script>';
   if (isset($_GET['action']) && isset($_GET['sender']) && $_GET['sender'] != '') {
      echo '$("#section_view_list").hide();
                  getSenderFromSenderListId("' . doFilter($_GET['sender'], 'ALPHA_NUM') . '");
                  getStoreList();';
   } else {
      echo '$("#section_addsender").hide();
                  loadTableDomainListAdmin();
                  get_smtp_list(null);';
      echo '$("#store-area").hide();';
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
   <script src="<?php echo url ?>/js/common_scripts.js"></script>
   <script src="<?php echo url ?>/js/mail_sender.js"></script>
</body>

</html>