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
            <div class="row align-items-center my-3">
               <div class="col-sm d-flex no-block align-items-center">
                  <h3 class="page-title m-0">Mail Server Integrations</h3>
                  <!-- <div class="ml-auto text-right" id="store-area">
                     <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#modal_store"><i class="fa fas fa-warehouse"></i> Store</button>
                  </div> -->
               </div>
               <?php if(isset($_GET['action'])){?>
               <div class="col-sm-auto text-sm-right mt-3 mt-sm-0">
                  <button type="button" class="btn btn-success" data-toggle="modal"
                     data-target="#modal_sender_list_test_mail"><i class="fa fas fa-paper-plane"></i> Send Test
                     Mail</button>
               </div>
               <?php } ?>
            </div>
         </div>

         <!-- ============================================================== -->
         <!-- Mail Server Integrations -->
         <!-- ============================================================== -->
         <div class="container-fluid">
            <div class="card">
                  <div class="card-body">
                     <div class="row">
                        <div class="col-md-12 m-t-20">
                           <div class="row">
                              <div class="table-responsive">
                                 <table class="table" class="table table-bordered">
                                    <thead class="thead-dark">
                                       <tr>
                                          <th scope="col fs-1">Service Provider</th>
                                          <th scope="col">Integration</th>
                                          <th scope="col">Features</th>
                                          <th scope="col">Requirements</th>
                                          <th scope="col">Action</th>
                                       </tr>
                                    </thead>
                                    <tbody>
                                       <tr>
                                          <td>CanIPhish</td>
                                          <td>N/A - Native</td>
                                          <td>
                                             <ul>
                                                <li>Supports domain spoofing</li>
                                                <li>Preconfigured list of sending profiles to choose from</li>
                                                <li>Preconfigured list of phishing emails to choose from</li>
                                                <li>Preconfigured list of phishing websites to choose from</li>
                                                <li>Preconfigured mail service</li>

                                             </ul>
                                          </td>
                                          <td>
                                             <ul>
                                                <li>Allowlisting of CanIPhish mail server IPs (see Knowledge Base)</li>
                                                <li>Verification of target domains</li>
                                             </ul>
                                          </td>
                                          <td><button type="button" class="btn btn-success" data-toggle="modal"
                                                data-target="#mailDefaultIntemodal" id="adminIntegration">Integration
                                             </button></td>
                                       </tr>
                                       <tr>
                                          <td>Third-party SMTP Server</td>
                                          <td>SMTP Relay</td>
                                          <td>
                                             <ul>
                                                <li>Sender profiles may be from any domain under your control</li>
                                                <li>Preconfigured list of phishing emails to choose from</li>
                                                <li>Preconfigured list of phishing websites to choose from</li>
                                                <li>Provides full control over mail delivery</li>
                                             </ul>
                                          </td>
                                          <td>
                                             <ul>
                                                <li>SMTP Server must accept emails via the secure SMTP protocol (TCP port 587)</li>
                                                <li>SMTP server credentials must be provided</li>
                                                <li>Use of default sender profiles will fail SPF checks and require allowlisting</li>
                                                <li>Verification of target domains</li>
                                             </ul>
                                          </td>
                                          <!-- <td><button class="btn btn-success">New Integration</button></td> -->
                                          <td><button type="button" class="btn btn-success" data-toggle="modal" data-target="#mailIntemodal">
                                                New Integration
                                             </button></td>

                                       </tr>
                                    </tbody>
                                 </table>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
            </div>
         </div>
          <!-- ============================================================== -->
         <!-- Mail Server Integrations -->
         <!-- ============================================================== -->


         <!-- ============================================================== -->
         <!-- End Bread crumb and right sidebar toggle -->
         <!-- ============================================================== -->
         <!-- ============================================================== -->
         <!-- Container fluid  -->
         <!-- ============================================================== -->
         <div class="container-fluid" id="section_view_list">
            <!-- ============================================================== -->
            <!-- Start Page Content -->
            <!-- ============================================================== -->
            <div class="card">
               <div class="card-body">
                  <div class="row mb-2">
                     <div class="col-md-12">
                        <h3>Manage Mail Servers</h3>
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
                                       <th>Name</th>
                                       <th>SMTP Server</th>
                                       <th>From</th>
                                       <th>Acc Username</th>
                                       <th>Custom Headers</th>
                                       <th>Date Created</th>
                                       <th>Actions</th>
                                       <th>Status</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                    <!-- <tr>
                                       <td>#</td>
                                       <td>CanIPhish</td>
                                       <td>smtp.sendgrid.net:503</td>
                                       <td>Caniphish@gmail.com</td>
                                       <td>apikey</td>
                                       <td>-</td>
                                       <td>-</td>
                                       <td>-</td>
                                       <td>Default</td>

                                    </tr> -->
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
         <div class="container-fluid" id="section_addsender">
            <!-- ============================================================== -->
            <!-- Start Page Content -->
            <!-- ============================================================== -->
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col-md-12">
                        <div class="row">
                           <div class="col-md-10">
                              <div class="form-group row">
                                 <label for="mail_sender_name"
                                    class="col-md-3 text-left control-label col-form-label">Mail Sender Name: </label>
                                 <div class="col-md-9">
                                    <input type="text" class="form-control" id="mail_sender_name">
                                 </div>
                              </div>
                           </div>
                           <div class="col-md-1">
                              <div class="form-group row" style="margin: 6px;">
                                 <!-- <div class="col-sm-5">
                                    <label class="text-left control-label row col-form-label">Sender Template: <span class="text-success ml-1 cursor-pointer" id="lb_sender_template_name" onclick="$('#modal_store').modal('toggle');">Custom</span></label>
                                 </div> -->
                                 <div class="col-sm-7 text-right">
                                    <button type="button" class="btn btn-info" onclick="saveMailSenderGroup($(this))"
                                       style="width: 100px;"><i class="fa fas fa-save"></i> Save</button>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <hr />
                  <div class="row">
                     <div class="col-md-12">
                        <!-- <div class="row">
                           <div class="col-md-6"> -->
                        <div class="form-group row">
                           <label for="mail_sender_SMTP_server"
                              class="col-sm-3 text-left control-label col-form-label">SMTP Server:*</label>
                           <div class="col-sm-7">
                              <input type="text" class="form-control" id="mail_sender_SMTP_server"
                                 placeholder="smtp.mailserver.com:25">
                           </div>
                        </div>
                        <div class="form-group row">
                           <label for="mail_sender_acc_username"
                              class="col-sm-3 text-left control-label col-form-label">SMTP Username:*</label>
                           <div class="col-sm-7">
                              <input type="text" class="form-control" id="mail_sender_acc_username"
                                 placeholder="Email address">
                           </div>
                        </div>
                        <div class="form-group row">
                           <label for="mail_sender_acc_pwd" class="col-sm-3 text-left control-label col-form-label">SMTP
                              Password:*</label>
                           <div class="col-sm-7">
                              <input type="password" class="form-control" id="mail_sender_acc_pwd"
                                 placeholder="SMTP login password" autocomplete="new-password">
                           </div>
                        </div>
                        <div class="form-group row">
                           <label for="mail_sender_from" class="col-sm-3 text-left control-label col-form-label">From
                              Address: *</label>
                           <div class="col-sm-7">
                              <input type="text" class="form-control" id="mail_sender_from"
                                 placeholder="Name <username@mailserver.com>">
                           </div>
                        </div>

                        <hr />
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
         <!-- Modal -->
         <div class="modal fade" id="modal_mail_header_delete" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog" role="document">
               <div class="modal-content">
                  <div class="modal-header">
                     <h5 class="modal-title">Are you sure?</h5>
                     <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                     This will delete mail header!
                  </div>
                  <div class="modal-footer">
                     <button type="button" class="btn btn-danger" data-tracker_id=""
                        onclick="MailHeaderDeletionAction()">Delete</button>
                  </div>
               </div>
            </div>
         </div>
         <!-- Modal -->
         <div class="modal fade" id="modal_mail_header_edit" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog" role="document">
               <div class="modal-content">
                  <div class="modal-header">
                     <h5 class="modal-title">Edit Custom Email Header</h5>
                     <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                     <div class="form-group row  m-t-20">
                        <label for="modal_mail_sender_custome_header_name"
                           class="col-sm-3  control-label col-form-label">Header Name</label>
                        <div class="col-sm-7">
                           <input type="text" class="form-control" id="modal_mail_sender_custome_header_name"
                              placeholder="Header Name Here">
                        </div>
                     </div>
                     <div class="form-group row  m-t-20">
                        <label for="modal_mail_sender_custome_header_val"
                           class="col-sm-3  control-label col-form-label">Header Value</label>
                        <div class="col-sm-7">
                           <input type="text" class="form-control" id="modal_mail_sender_custome_header_val"
                              placeholder="Header Name Here">
                        </div>
                     </div>
                  </div>
                  <div class="modal-footer">
                     <button type="button" class="btn btn-success" onclick="editRowHeaderTableAction()"><i
                           class="mdi mdi-content-save"></i> Save</button>
                  </div>
               </div>
            </div>
         </div>
         <!-- Modal -->
         <div class="modal fade" id="modal_sender_list_delete" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog" role="document">
               <div class="modal-content">
                  <div class="modal-header">
                     <h5 class="modal-title">Are you sure?</h5>
                     <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                     This will delete selected sender!
                  </div>
                  <div class="modal-footer">
                     <button type="button" class="btn btn-danger" data-tracker_id=""
                        onclick="senderListDeletionAction()">Delete</button>
                  </div>
               </div>
            </div>
         </div>
         <!-- Modal -->
         <div class="modal fade" id="modal_sender_list_copy" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog" role="document">
               <div class="modal-content">
                  <div class="modal-header">
                     <h5 class="modal-title">Enter new sender list name</h5>
                     <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                     <div class="form-group row  m-t-20">
                        <label for="modal_mail_sender_name" class="col-sm-3  control-label col-form-label">Email Sender
                           Name</label>
                        <div class="col-sm-7">
                           <input type="text" class="form-control" id="modal_mail_sender_name"
                              placeholder="Email Sender Name Here">
                        </div>
                     </div>
                  </div>
                  <div class="modal-footer">
                     <button type="button" class="btn btn-success" onclick="MailSenderCopyAction()"><i
                           class="mdi mdi-content-copy"></i> Copy</button>
                  </div>
               </div>
            </div>
         </div>
         <!-- Modal -->
         <div class="modal fade" id="mailIntemodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
               <div class="modal-content">
                  <div class="modal-header">
                     <h5 class="modal-title" id="exampleModalLabel">Mail Server Integration</h5>
                     <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                     </button>
                  </div>
                  <div class="modal-body">
                     <div class="col-md-12">
                        <!-- <div class="row">
                           <div class="col-md-6"> -->
                        <div class="form-group row">
                           <label for="mail_sender_name" class="col-md-3 text-left control-label col-form-label">Mail
                              Sender Name: </label>
                           <div class="col-md-9">
                              <input type="text" class="form-control" id="mail_sender_name_admin">
                           </div>
                        </div>
                        <div class="form-group row">
                           <label for="mail_sender_SMTP_server"
                              class="col-sm-3 text-left control-label col-form-label">SMTP Server:*</label>
                           <div class="col-sm-7">
                              <input type="text" class="form-control" id="mail_sender_SMTP_server_admin"
                                 placeholder="smtp.mailserver.com:25">
                           </div>
                        </div>
                        <div class="form-group row">
                           <label for="mail_sender_acc_username"
                              class="col-sm-3 text-left control-label col-form-label">SMTP Username:*</label>
                           <div class="col-sm-7">
                              <input type="text" class="form-control" id="mail_sender_acc_username_admin"
                                 placeholder="Email address">
                           </div>
                        </div>
                        <div class="form-group row">
                           <label for="mail_sender_acc_pwd" class="col-sm-3 text-left control-label col-form-label">SMTP
                              Password:*</label>
                           <div class="col-sm-7">
                              <input type="password" class="form-control" id="mail_sender_acc_pwd_admin"
                                 placeholder="SMTP login password" autocomplete="new-password">
                           </div>
                        </div>
                        <div class="form-group row">
                           <label for="mail_sender_from" class="col-sm-3 text-left control-label col-form-label">From
                              Address: *</label>
                           <div class="col-sm-7">
                              <input type="text" class="form-control" id="mail_sender_from_admin"
                                 placeholder="Name <username@mailserver.com>">
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="modal-footer">
                     <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                     <button type="button" class="btn btn-primary" id="mailIntegration"
                       value="1" onclick="saveMailIntegrationbyadmin($(this),1)">Save</button>
                  </div>
               </div>
            </div>
         </div>

         <!-- Modal -->
         <div class="modal fade" id="mailDefaultIntemodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
               <div class="modal-content">
                  <div class="modal-header">
                     <h5 class="modal-title" id="exampleModalLabel">Mail Server Integration</h5>
                     <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                     </button>
                  </div>
                  <div class="modal-body">
                     <div class="col-md-12">
                        <!-- <div class="row">
                           <div class="col-md-6"> -->
                        <div class="form-group row">
                           <label for="mail_sender_name" class="col-md-3 text-left control-label col-form-label">Mail
                              Sender Name: </label>
                           <div class="col-md-9">
                              <input type="text" class="form-control" id="mail_sender_name_admin_default">
                           </div>
                        </div>
                        <div class="form-group row">
                           <label for="mail_sender_SMTP_server"
                              class="col-sm-3 text-left control-label col-form-label">SMTP Server:*</label>
                           <div class="col-sm-7">
                              <input type="text" class="form-control" id="mail_sender_SMTP_server_admin_default"
                                 placeholder="smtp.mailserver.com:25">
                           </div>
                        </div>
                        <div class="form-group row">
                           <label for="mail_sender_acc_username"
                              class="col-sm-3 text-left control-label col-form-label">SMTP Username:*</label>
                           <div class="col-sm-7">
                              <input type="text" class="form-control" id="mail_sender_acc_username_admin_default"
                                 placeholder="Email address">
                           </div>
                        </div>
                        <div class="form-group row">
                           <label for="mail_sender_acc_pwd" class="col-sm-3 text-left control-label col-form-label">SMTP
                              Password:*</label>
                           <div class="col-sm-7">
                              <input type="password" class="form-control" id="mail_sender_acc_pwd_admin_default"
                                 placeholder="SMTP login password" autocomplete="new-password">
                           </div>
                        </div>
                        <div class="form-group row">
                           <label for="mail_sender_from" class="col-sm-3 text-left control-label col-form-label">From
                              Address: *</label>
                           <div class="col-sm-7">
                              <input type="text" class="form-control" id="mail_sender_from_admin_default"
                                 placeholder="Name <username@mailserver.com>">
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="modal-footer">
                     <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                     <button type="button" class="btn btn-primary" value="0" id="defaultIntegration"
                        onclick="saveMailIntegrationbyadmin($(this),0)">Save</button>
                  </div>
               </div>
            </div>
         </div>
         <!-- Modal -->
         <div class="modal fade" id="modal_sender_list_test_mail" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog" role="document">
               <div class="modal-content">
                  <div class="modal-header">
                     <h5 class="modal-title">Test Mail Delivery</h5>
                     <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                     <div class="form-group row m-t-20">
                        <label for="modal_mail_sender_test_mail_to" class="col-sm-4  control-label col-form-label">Enter
                           To address:</label>
                        <div class="col-sm-8">
                           <input type="text" class="form-control" id="modal_mail_sender_test_mail_to"
                              placeholder="Email address of test recipient">
                        </div>
                     </div>
                  </div>
                  <div class="modal-footer">
                     <button type="button" class="btn btn-success" onclick="modalTestDeliveryAction($(this))"><i
                           class="fa fas fa-paper-plane"></i> Send</button>
                  </div>
               </div>
            </div>
         </div>
         <!-- Modal -->
         <div class="modal fade" id="modal_verifier" tabindex="-1" role="dialog" aria-hidden="true"
            data-backdrop="static" data-keyboard="false">
            <div class="modal-dialog" role="document">
               <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body" id="modal_verifier_body">
                     <div class="form-group row area_data">
                     </div>
                     <div class="form-group row area_loader">
                     </div>
                  </div>
                  <div class="modal-footer">
                  </div>
               </div>
            </div>
         </div>
         <!-- Modal -->
         <div class="modal fade" id="modal_store" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog" role="document">
               <div class="modal-content">
                  <div class="modal-header">
                     <h5 class="modal-title">Common Senders</h5>
                     <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                     <div class="form-group row m-t-20">
                        <label for="selector_common_mail_senders" class="col-sm-4  control-label col-form-label">Select
                           mail sender:</label>
                        <div class="col-md-8">
                           <select class="select2 form-control custom-select" id="selector_common_mail_senders"
                              style="height: 36px;width: 100%;">
                           </select>
                        </div>
                     </div>
                     <div class="form-group"><i>*You are selecting the default configuration corresponding to each
                           service providers. If they are not working, check the corresponding service provider's
                           website for any changes and manually configure it after selecting "Custom" option.</i></div>
                     <div class="form-group"><i id="lb_selector_common_mail_sender_note"></i></div>
                  </div>
                  <div class="modal-footer">
                     <button type="button" class="btn btn-success" onclick="appySenderTemplate()"><i
                           class="mdi mdi-arrow-bottom-left"></i> Insert</button>
                  </div>
               </div>
            </div>
         </div>
         <!-- Modal -->
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
   <script src="<?php echo url ?>/js/mail_sender.js"></script>
   <!-- <script src="<?php echo url ?>/js/mail_integration.js"></script> -->
   <?php
   echo '<script>';
   if (isset($_GET['action']) && isset($_GET['sender']) && $_GET['sender'] != '') {
      echo '$("#section_view_list").hide();
                  getSenderFromSenderListId("' . doFilter($_GET['sender'], 'ALPHA_NUM') . '");
                  getStoreList();';
   } else {
      echo '$("#section_addsender").hide();
                  loadTableSenderListAdmin();
                  CheckDefaultIntegration();';
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