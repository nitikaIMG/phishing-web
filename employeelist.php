<?php
require_once(dirname(__FILE__).'/manager/session_manager.php');
require_once(dirname(__FILE__).'/includes/config.php');
isSessionValid(true);
?>
<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
   <style>
      .unverdom {
         background-color: #f3866d;
         padding: 5px 17px;
         margin: 4px;
         color: #000;
         font-size: 10px;
         border-radius: 2px;
      }
      .verdom {
         background-color: #3eed54;
         padding: 5px 17px;
         margin: 4px;
         color: #000;
         text-transform: lowercase;
         font-size: 10px;
         border-radius: 2px;
      }
      .domver {
         padding: 0.4375rem 1.25rem;
         text-shadow: none;
         font-size: 11px;
         color: #fff;
         font-weight: normal;
         white-space: normal;
         word-wrap: break-word;
         transition: 0.2s ease-out;
         touch-action: manipulation;
         border-radius: 6px !important;
         cursor: pointer;
         background-color: #7460ee;
         box-shadow: 0px 5px 20px 0 rgb(0 0 0 / 10%);
         will-change: opacity, transform;
         transition: all 0.3s ease-out;
         -webkit-transition: all 0.3s ease-out;
        
         /* color: #fff;background-color: #7460ee;border-color: #7460ee !important; */
      }

   </style>
   <?php
   echo include(dirname(__FILE__).'/components/header.php');
   ?>
      <link rel="stylesheet" type="text/css" href="<?php echo url ?>/customecss/css/select2.min.css">
      <link rel="stylesheet" type="text/css" href="<?php echo url ?>/customecss/css/summernote-lite.min.css">
      <link rel="stylesheet" type="text/css" href="<?php echo url ?>/customecss/css/style.min.css">
      <link rel="stylesheet" type="text/css" href="<?php echo url ?>/customecss/css/dataTables.foundation.min.css">
      <link rel="stylesheet" type="text/css" href="<?php echo url ?>/customecss/css/codemirror.min.css">
</head>

<body class="layout-boxed alt-menu">
   <!-- ============================================================== -->
   <!-- Preloader - style you can find in spinners.css -->
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
      <?php include(dirname(__FILE__).'/components/navbar.php'); ?>
      <!-- Topbar header - style you can find in pages.scss -->
      <!-- ============================================================== -->
      <div class="overlay"></div>
      <div class="search-overlay"></div>

      <!--  BEGIN SIDEBAR  -->
      <?php include(dirname(__FILE__).'/components/sidebar.php'); ?>
      <!--  END SIDEBAR  -->
      <!-- ============================================================== -->
      <!-- End Left Sidebar - style you can find in sidebar.scss  -->
      <!-- ============================================================== -->
      <!-- ============================================================== -->
      <!-- Page wrapper  -->
      <!-- ============================================================== -->
      <div id="content" class="main-content">
         <div class="layout-px-spacing" id="section_adduser">

            <div class="container-xxl p-0">

               <!-- BREADCRUMB -->
               <div class="page-meta">
                  <nav class="breadcrumb-style-one" aria-label="breadcrumb">
                     <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Email User Groups</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Add</li>
                     </ol>
                  </nav>
               </div>
               <!-- /BREADCRUMB -->

               <div class="row">
                  <div id="card_1" class="col-xxl-12 col-xl-12 col-lg-12 col-md-12 layout-spacing layout-top-spacing">
                     <div class="statbox widget box box-shadow">
                        <div class="widget-header">
                           <div class="row">
                              <div class="col-xl-12 col-md-12 col-sm-12 col-12">
                                 <h4>Add User</h4>
                              </div>
                           </div>
                        </div>
                        <div class="widget-content widget-content-area">

                           <div class="row">

                              <div class="col-xxl-8 col-xl-12 col-lg-12 col-md-12 col-sm-8 mx-auto">
                                 <div class="card">
                                    <div class="card-body">
                                       <div class="row">
                                          <div class="col-md-12">
                                             <div class="row">
                                                <div class="col-md-12">
                                                   <div class="form-group row">
                                                      <label for="user_group_name" class="col-md-3 text-left control-label col-form-label">User Group Name: </label>
                                                      <div class="col-md-7">
                                                         <input type="text" class="form-control" id="user_group_name">
                                                      </div>
                                                      <div class="col-md-2 text-right">
                                                         <button type="button" class="btn btn-info w-100" onclick="saveUserGroup($(this))"><i class="fa fas fa-save"></i> Save</button>
                                                      </div>
                                                   </div>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                       <hr />
                                       <div class="row">
                                          <div class="col-12">
                                             <div class="row d-flex align-items-center g-md-0 g-3">
                                                <div class="col-md-auto">
                                                <button type="button" class="btn d-flex align-items-center text-nowrap  justify-content-center btn-success dropdown-toggle" id="addcsvdata" title="Import email list" data-toggle="tooltip"><i class="fas fa-download me-2"></i>bulk Import</button>
                                                </div>
                                                <div class="col"><input type="file" id="fileinput" class="form-control date-inputmask" accept=".txt, .csv, .lst, .rtf" />       </div>
                                                <div class="col-md-auto col-12">
                                                <a class="dropdown-item" href="#" onclick="exportUserAction()"><span class=" mdi mdi-file-excel"></span>Download Template</a>
                                                </div>
                                             </div>
                                               <!--  <div class="btn-group" id="bt_save_config">                                
                                                     
                                                </div>-->
                                             </div> 
                                       </div>
                                       <hr />
                                       <div class="row g-3 align-items-end text-nowrap">
                                          <div class="col">
                                             <label>First Name:</label>
                                             <input type="text" class="form-control date-inputmask" id="tablevalue_fname">
                                          </div>
                                          <div class="col">
                                             <label>Last Name:</label>
                                             <input type="text" class="form-control date-inputmask" id="tablevalue_lname">
                                          </div>
                                          <div class="col">
                                             <label>Email Address:</label>
                                             <input type="text" class="form-control" id="tablevalue_email">
                                          </div>
                                          <div class="col">
                                             <label>Company Name:</label>
                                             <input type="text" class="form-control" id="tablevalue_companyname">
                                          </div>
                                          <div class="col">
                                             <label>Job title:</label>
                                             <input type="text" class="form-control" id="tablevalue_jobtitle">
                                          </div>
                                          <div class="col pb-2">
                                             <button type="button" class="btn btn-success" id="bt_add_email_tracker" onclick="addUserToTable($(this))"><i class="fa fas fa-plus"></i> Add</button>
                                             
                                          </div>
                                       </div>
                                       </div>
                                       <!-- <div class="row">
                                          <div class="col">
                                             <label>Company Name:</label>
                                             <input type="text" class="form-control phone-inputmask" id="tablevalue_notes">
                                          </div>
                                       </div> -->
                                    </div>
                                    <div class="row layout-spacing">
                                       <div class="col-12">
                                          <div class="statbox widget box box-shadow">
                                             <div class="widget-content widget-content-area table-responsive">
                                                <table id="table_user_list" class="table table-bordered w-100 style-3 dt-table-hover dataTable no-footer">
                                                   <thead>
                                                      <tr>
                                                         <th>#</th>
                                                         <th>First Name</th>
                                                         <th>Last Name</th>
                                                         <th>Email</th>
                                                         <th>Company</th>
                                                         <th>Job</th>
                                                         <th>Action</th>
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
                              </div>

                           </div>

                        </div>

                     </div>
                  </div>
               </div>
            </div>
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
                        <div class="row">
                           <div class="col-md-12" style="display: flex;justify-content: end;">
                              <div class="row">
                                 <div class="col-auto">
                                    <button type="button"  class="btn btn-secondary waves-effect waves-light" onclick ="domainverification();" id="verificationdomain" style="padding-top: 11px; " data-bs-toggle="modal" data-bs-target="#exampleModal"> Domain Verification</button>
                                 </div>
                                 <div class="col-auto">
                                    <button type="button" class="btn btn-info btn-sm" style="padding-top: 11px; " onclick="document.location='employeelist?action=add&user=new'"><i class="fas fa-plus"></i> New User Group</button>
                              </div>
                              </div>
                              
                           </div>
                           
                        </div>
                        <div class="row">
                           <div class="col-md-12 m-t-20">
                              <div class="row">
                                 <div class="table-responsive">
                                    <table id="table_user_group_list" class="table  table-bordered">
                                       <thead>
                                          <tr>
                                             <th>#</th>
                                             <th>Group Name</th>
                                             <th>Total Users</th>
                                             <th>Domain</th>
                                             <th>Date Created</th>
                                             <th>Action</th>
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
            <div class="container-fluid" id="section_adduser">
               <!-- ============================================================== -->
               <!-- Start Page Content -->
               <!-- ============================================================== -->
               <!-- <div class="card">
                  <div class="card-body">
                     <div class="row">
                        <div class="col-md-12">
                           <div class="row">
                              <div class="col-md-6">
                                 <div class="form-group row">
                                    <label for="user_group_name" class="col-md-3 text-left control-label col-form-label">User Group Name: </label>
                                    <div class="col-md-9">
                                       <input type="text" class="form-control" id="user_group_name">
                                    </div>
                                 </div>
                              </div>
                              <div class="col-md-6 text-right">
                                 <button type="button" class="btn btn-info" onclick="saveUserGroup($(this))"><i class="fa fas fa-save"></i> Save</button>
                              </div>
                           </div>
                        </div>
                     </div>
                     <hr />
                     <div class="row">
                        <div class="col-md-4">
                           <div class="form-group">
                              <label>First Name:</label>
                              <input type="text" class="form-control date-inputmask" id="tablevalue_fname">
                           </div>
                           <div class="form-group">
                              <label>Email:</label>
                              <input type="text" class="form-control phone-inputmask" id="tablevalue_email">
                           </div>
                        </div>
                        <div class="col-md-4">
                           <div class="form-group">
                              <label>Last Name:</label>
                              <input type="text" class="form-control date-inputmask" id="tablevalue_lname">
                           </div>
                           <div class="form-group">
                              <label>Notes:</label>
                              <input type="text" class="form-control phone-inputmask" id="tablevalue_notes">
                           </div>
                        </div>
                        <div class="col-md-2">
                           <div class="form-group m-t-25">
                              <button type="button" class="btn btn-success" id="bt_add_email_tracker" onclick="addUserToTable($(this))"><i class="fa fas fa-plus"></i> Add</button>
                           </div>
                        </div>
                        <div class="col-md-2 m-t-25 text-right">
                           <div class="form-group">
                              <div class="btn-group" id="bt_save_config">
                                 <button type="button" class="btn btn-success" onclick="addUserFromFile()" title="Import email list" data-toggle="tooltip">Import</button>
                                 <input type="file" id="fileinput" accept=".txt, .csv, .lst, .rtf" hidden />
                                 <button type="button" class="btn btn-success dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
                                 <div class="dropdown-menu">
                                    <a class="dropdown-item" href="#" onclick="exportUserAction()">Export as CSV</a>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="row layout-spacing">
                        <div class="col-lg-12">
                           <div class="statbox widget box box-shadow">
                              <div class="widget-content widget-content-area">
                                 <table id="table_user_list" class="table style-2 dt-table-hover">
                                    <thead>
                                       <tr>
                                          <th>#</th>
                                          <th>First Name</th>
                                          <th>Last Name</th>
                                          <th>Email</th>
                                          <th>Notes</th>
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
               </div>  -->
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
            <div class="modal fade" id="modal_modify_row" tabindex="-1" role="dialog" aria-hidden="true">
               <div class="modal-dialog" role="document">
                  <div class="modal-content" style="width: 610px;">
                     <div class="modal-header">
                        <h5 class="modal-title">Modify user</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                     </div>
                     <div class="modal-body">
                        <div class="form-group row  m-t-20">
                           <label for="modal_tablevalue_name" class="col-sm-2 text-left control-label col-form-label">First Name: </label>
                           <div class="col-sm-8">
                              <input type="text" class="form-control" id="modal_tablevalue_fname">
                           </div>
                        </div>
                        <div class="form-group row  m-t-20">
                           <label for="modal_tablevalue_name" class="col-sm-2 text-left control-label col-form-label">Last Name: </label>
                           <div class="col-sm-8">
                              <input type="text" class="form-control" id="modal_tablevalue_lname">
                           </div>
                        </div>
                        <div class="form-group row  m-t-20">
                           <label for="modal_tablevalue_email" class="col-sm-2 text-left control-label col-form-label">Email: </label>
                           <div class="col-sm-8">
                              <input type="email" class="form-control" id="modal_tablevalue_email">
                           </div>
                        </div>
                        <div class="form-group row  m-t-20">
                           <label for="modal_tablevalue_company" class="col-sm-2 text-left control-label col-form-label">Company: </label>
                           <div class="col-sm-8">
                              <input type="text" class="form-control" id="modal_tablevalue_company">
                           </div>
                        </div>
                        <div class="form-group row  m-t-20">
                           <label for="modal_tablevalue_job" class="col-sm-2 text-left control-label col-form-label">Job: </label>
                           <div class="col-sm-8">
                              <input type="text" class="form-control" id="modal_tablevalue_job">
                           </div>
                        </div>
                     </div>
                     <div class="modal-footer">
                        <button type="button" class="btn btn-info" id="bt_add_email_tracker" onclick="editRowAction($(this))"><i class="fa fas fa-save"></i> Save</button>
                     </div>
                  </div>
               </div>
            </div>
            <!-- Modal -->
            <div class="modal fade" id="modal_user_group_delete" tabindex="-1" role="dialog" aria-hidden="true">
               <div class="modal-dialog" role="document">
                  <div class="modal-content">
                     <div class="modal-header">
                        <h5 class="modal-title">Are you sure?</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                     </div>
                     <div class="modal-body">
                        This will delete user group and the action can't be undone!
                     </div>
                     <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-tracker_id="" onclick="userGroupDeletionAction()">Delete</button>
                     </div>
                  </div>
               </div>
            </div>
            <!-- Modal -->
            <div class="modal fade" id="modal_row_delete" tabindex="-1" role="dialog" aria-hidden="true">
               <div class="modal-dialog" role="document">
                  <div class="modal-content">
                     <div class="modal-header">
                        <h5 class="modal-title">Are you sure?</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                     </div>
                     <div class="modal-body">
                        This will delete user and the action can't be undone!
                     </div>
                     <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-tracker_id="" onclick="deleteRowAction()">Delete</button>
                     </div>
                  </div>
               </div>
            </div>
            <!-- Modal -->
            <div class="modal fade" id="modal_user_group_copy" tabindex="-1" role="dialog" aria-hidden="true">
               <div class="modal-dialog" role="document">
                  <div class="modal-content">
                     <div class="modal-header">
                        <h5 class="modal-title">Enter new user group name</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                     </div>
                     <div class="modal-body">
                        <div class="form-group row  m-t-20">
                           <label for="modal_new_user_group_name" class="col-sm-3  control-label col-form-label">Group Name</label>
                           <div class="col-sm-7">
                              <input type="text" class="form-control" id="modal_new_user_group_name" placeholder="Group Name Here">
                           </div>
                        </div>
                     </div>
                     <div class="modal-footer">
                        <button type="button" class="btn btn-success" onclick="UserGroupCopy()"><i class="mdi mdi-content-copy"></i> Copy</button>
                     </div>
                  </div>
               </div>
            </div>
            <!-- Domain Verify Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
               <div class="modal-dialog" role="document">
                  <div class="modal-content">
                        <div class="modal-header">
                           <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                           <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                              <svg> ... </svg>
                           </button>
                        </div>
                        <div class="modal-body" id="verificationbody">
                           
                        </div>
                        <div class="modal-footer">
                           <button class="btn btn btn-light-dark" data-bs-dismiss="modal"><i class="flaticon-cancel-12"></i> Discard</button>
                           <button type="button" class="btn btn-primary">Save</button>
                        </div>
                  </div>
               </div>
            </div>

            <div id="Modal4"  style="background: rgba(0,0,0,0.7);"  class="modal fade" id="Modal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
               <div class="modal-dialog" role="document">
                  <div class="modal-content">
                        <div class="modal-header d-flex align-items-center">
                           <h4 class="modal-title" id="myModalLabel">Verify Domain</h4>
                           <button type="button" class="btn-close ml-auto" data-bs-dismiss="modal" aria-hidden="true"   aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                           <p>
                              Domain verification is performed through challenge-response authentication of the provided email address. <br /> (e.g. verifying support@mybusiness.com
                              will enable mybusiness.com.)
                           </p>
                           <div class="form-group row" id="verifyDomainForm">
                              <label for="eVAddress" class="col-sm-12 text-left control-label col-form-label">Email Address <span class="text-danger">*</span></label>
                              <div class="col-sm-12">
                                    <input type="email" class="form-control" id="eVAddress" placeholder="Email Address" required="" aria-invalid="false">
                                    <div class="invalid-tooltip">
                                       Please choose an email address.
                                    </div>
                                    <div class="text-danger bold" id="domainerr"></div>
                              </div>
                           </div>
                           <div class="col">
                              <button type="button" class="btn btn-primary" id="vDomain" onclick="verifyDomain()">
                                    <i class="mdi mdi-email-secure"></i> Generate Verification Email
                              </button>
                           </div>
                           <div id="codeInputDiv" class="form-group row m-t-15" style="border-top-style:inset; border-top-width:thin; padding-top:15px; display:none">
                              <label for="eVCode" class="col-sm-3 text-left control-label col-form-label p-l-25" style="text-align:center">Input Code: <span class="text-danger">*</span></label>
                              <div class="col-sm-6">
                                    <input type="text" class="form-control" id="eVCode" placeholder="XXXX-XXXX" required="" aria-invalid="false">
                              </div>
                              <div class="col-sm-3">
                                    <button type="button" class="btn btn-success" id="vCodeButton" onclick="codeVerification()">
                                       <i class="mdi mdi-verified"></i> Verify
                                    </button>
                              </div>
                           </div>

                        </div>
                        <div class="modal-footer">
                           <button type="button" class="btn btn-info waves-effect" data-dismiss="modal" onclick="reloadVerification()">Close</button>
                        </div>
                  </div>
                  <!-- /.modal-content -->
               </div>
               <!-- /.modal-dialog -->
            </div>

            <?php include(dirname(__FILE__).'/components/foot.php'); ?>
            <?php include dirname(__FILE__)."/components/script.php"; ?>
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
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

   <script src="<?php echo url ?>/js/libs/jquery/jquery-3.6.0.min.js" ></script>
   <script src="<?php echo url ?>/js/libs/js.cookie.min.js" ></script>
   <!--Menu sidebar -->
   <!-- <script src="js/libs/sidebarmenu.js"></script> -->
   <!-- <script src="js/libs/perfect-scrollbar.jquery.min.js"></script> -->
   <!--Custom JavaScript -->
   <!-- <script src="js/libs/custom.min.js"></script> -->
   <!-- this page js -->
   <script src="<?php echo url ?>/js/libs/jquery/datatables.js" ></script>
   <script src="<?php echo url ?>/js/common_scripts.js"></script>
   <script src="<?php echo url ?>/js/libs/moment.min.js"></script>
   <script src="<?php echo url ?>/js/mail_user_group.js" ></script>
   <?php
   echo '<script>';
   if (isset($_GET['action'])) {
      if (isset($_GET['action']) && isset($_GET['user'])) {
         if ($_GET['action'] == 'add' || $_GET['action'] == 'edit') {
            
            echo '$("#section_view_list").hide();
                        getUserGroupFromGroupId("' . doFilter($_GET['user'], 'ALPHA_NUM') . '");';
         }
      }
   } else
      echo '$("#section_adduser").hide();
                  loadTableUserGroupList();';
   echo '</script>';
   ?>
    <script defer src="<?php echo url ?>/js/libs/popper.min.js"></script>
   <script defer src="<?php echo url ?>/js/libs/bootstrap.min.js"></script>
   <script defer src="<?php echo url ?>/js/libs/select2.min.js" ></script>
   <script defer src="<?php echo url ?>/js/libs/toastr.min.js" ></script>
   <script>
   
   </script>
</body>



</html>