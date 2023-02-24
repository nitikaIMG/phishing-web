
<?php
require_once(dirname(__FILE__) . '/manager/session_manager.php');
require_once(dirname(__FILE__).'/includes/config.php');
isSessionValid(true);
?>
<!DOCTYPE html>
<html dir="ltr" lang="en">
   <head>
   <?php
      echo include(dirname(__FILE__) . '/components/header.php');
      ?>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <!-- Tell the browser to be responsive to screen width -->
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="description" content="">
      <meta name="author" content="">
      <!-- Favicon icon -->
      <link rel="icon" type="image/png" sizes="16x16" href="images/favicon.png">
      <title>SniperPhish - The Web-Email Spear Phishing Toolkit</title>
      <link rel="stylesheet" type="text/css" href="<?php echo url ?>/customecss/css/select2.min.css"> 
      <link rel="stylesheet" type="text/css" href="<?php echo url ?>/customecss/css/prism.css"/>
      <link rel="stylesheet" type="text/css" href="<?php echo url ?>/customecss/css/style.min.css">
      <link rel="stylesheet" type="text/css" href="<?php echo url ?>/customecss/css/toastr.min.css">
      <link rel="stylesheet" type="text/css" href="<?php echo url ?>/customecss/css/dataTables.foundation.min.css">
      <link rel="stylesheet" type="text/css" href="<?php echo url ?>/customecss/css/summernote-lite.min.css"> 
      <style type="text/css">
         .note-editable { background-color: white !important; } /*Disabled background colour*/
         .tab-header{ list-style-type: none; }
         body.dark .table tbody tr td {
            color: white;
         }
      </style> 
   </head>
   <body class="layout-boxed alt-menu">
    <!-- BEGIN LOADER -->
    <div id="load_screen"> <div class="loader"> <div class="loader-content">
        <div class="spinner-grow align-self-center"></div>
    </div></div></div>
    <!--  END LOADER -->

    <!--  BEGIN NAVBAR  -->
    <?php include(dirname(__FILE__).'/components/navbar.php'); ?>
    <!--  END NAVBAR  -->


      <!--  BEGIN MAIN CONTAINER  -->
      <div class="main-container" id="container">

         <div class="overlay"></div>
         <div class="search-overlay"></div>

         <!--  BEGIN SIDEBAR  -->
         <?php include(dirname(__FILE__).'/components/sidebar.php'); ?>
         <!--  END SIDEBAR  -->

         <!--  BEGIN CONTENT AREA  -->
         <div id="content" class="main-content">

         <div id="main-wrapper">

            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="page-breadcrumb breadcrumb-withbutton">
               <div class="row">
                  <div class="col-12 d-flex no-block align-items-center">
                     <h4 class="page-title">Email Campaign Dashboard</h4>
                     <!-- <div class="ml-auto text-right">
                        <button type="button" class="btn btn-info btn-sm item_private" data-toggle="modal" data-target="#ModalCampaignList"><i class="mdi mdi-hand-pointing-right" title="Select mail campaign" data-toggle="tooltip" data-placement="bottom"></i> Select Campaign</button>
                        <div class="btn-group">
                            <button type="button" class="btn btn-info btn-sm" onclick="refreshDashboard()" title="Refresh dashboard" data-toggle="tooltip" data-placement="bottom"><i class="mdi mdi-refresh"></i></button>
                            <button type="button" class="btn btn-info btn-sm dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="sr-only">Toggle Dropdown</span>
                            </button>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#modal_settings">Display Settings</a>
                                <a class="dropdown-item item_private" href="#" data-toggle="modal" data-target="#modal_dashboard_link">Get Dashboard Link</a>
                            </div>
                        </div>
                     </div> -->
                  </div>
               </div>
            </div>
            <div class="container-fluid">
               <!-- <div class="row">
                    <div class="col-12">
                        <div class="card">
                              <div class="card-body">
                                 <div class="row">
                                    <div class="align-items-left col-12 d-flex no-block row">
                                       <div class="col-md-4">
                                          <span><strong>Campaign: </strong></span><span id="disp_camp_name">NA</span>
                                       </div>  
                                       <div class="col-md-4 text-center m-l-5" id="disp_camp_status">                            
                                       </div>  
                                       <div class="align-items-right ml-auto row">                                  
                                          <div>
                                             <span><strong>Start: </strong></span><span id="disp_camp_start">NA</span>
                                          </div> 
                                       </div>
                                    </div>                                    
                                 </div>
                                 <div class="progress m-t-15" title="Sending status" data-toggle="tooltip" data-placement="top" id="progressbar_status" style="height:20px; background-color:#ccccff;">
                                    <div class="progress-bar progress-bar-striped progress-bar-animated" style="width:0%"></div>
                                 </div>
                              </div>
                        </div>
                    </div>
               </div>
               <div class="row">
                  <div class="col-md-12">
                     <div class="card">
                        <div class="card-body">
                           <h5 class="card-title "><span>Campaign Timeline</span></h5>
                           <div id="chart_live_mailcamp">                           
                              <apexchart type="scatter" height="350"/>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="row">
                  <div class="col-md-12">   
                     <div class="card">
                        <div class="card-body">     
                           <div class="align-items-left col-12 d-flex no-block">             
                              <div class="col-md-3">                             
                                 <h5 class="card-title text-center"><span>Email Overview</span></h5> 
                                 <div id="radialchart_overview_mailcamp" ></div>
                              </div>
                                 
                              <div class="col-md-3">    
                                 <h5 class="card-title text-center"><span>Email Sent</span></h5>
                                 <div id="piechart_mail_total_sent" ></div>
                              </div>
                              <div class="col-md-3">
                                 <h5 class="card-title text-center"><span>Email Opened</span></h5>
                                 <div id="piechart_mail_total_mail_open" ></div>
                              </div>
                              <div class="col-md-3">                           
                                 <h5 class="card-title text-center"><span>Email Replied</span></h5>
                                 <div id="piechart_mail_total_replied" class="center"></div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div> -->
               

               <div class="row">
                  <div class="row draggable-cards" id="draggable-area">
                        <div class="col-lg-4 col-md-6">
                           <div class="card border-bottom border-success card-hover">
                              <div class="card-body">
                                    <div class="d-flex no-block align-items-center">
                                       <div>
                                          <h2 id="succ_camp">
                                                50
                                          </h2>
                                          <h6 class="text-success">Active &amp; Recurring Campaigns</h6>
                                       </div>
                                       <div class="ml-auto">
                                          <span class="text-success display-6"><i class="ti-stats-up"></i></span>
                                       </div>
                                    </div>
                              </div>
                           </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                           <div class="card border-bottom border-primary card-hover">
                              <div class="card-body">
                                    <div class="d-flex no-block align-items-center">
                                       <div>
                                          <h2 id="del_camp">12</h2>
                                          <h6 class="text-primary">Yearly Emails Delivered</h6>
                                       </div>
                                       <div class="ml-auto">
                                          <span class="text-primary display-6"><i class=" ti-calendar"></i></span>
                                       </div>
                                    </div>
                              </div>
                           </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                           <div class="card border-bottom border-info card-hover">
                              <div class="card-body">
                                    <div class="d-flex no-block align-items-center">
                                       <div>
                                          <h2 id="past_camp">0</h2>
                                          <h6 class="text-info">Past Campaigns</h6>
                                       </div>
                                       <div class="ml-auto">
                                          <span class="text-info display-6"><i class="ti-stats-down"></i></span>
                                       </div>
                                    </div>
                              </div>
                           </div>
                        </div>
                  </div>
               </div>

            <!-- ============================================================== -->
            <!-- Start Table View  -->
               <div class="row">
                  <div class="col-12">
                     <div class="card">
                        <div class="card-body">
                           <div class="row">
                              <div class="col-md-12">
                                 <p>Active Campaigns</p>
                                 <button type="button" class="btn btn-success item_private" onclick="exportReportAction1($(this))" value="csv">Export as CSV</button>
                                 <button type="button" class="btn btn-success item_private" onclick="exportReportAction1($(this))" value="pdf">Export as PDF</button>
                                 <button type="button" class="btn btn-success item_private" onclick="exportReportAction1($(this))" value="html">Export as HTML</button>
                              </div>
                           </div>
                           <div class="row">
                              <div class="col-md-12 m-t-20">    
                                 <div class="row">                    
                                    <div class="table-responsive">
                                       <table id="table_mail_campaign_result1" class="table table-striped table-bordered">
                                          <thead>
                                             <tr>
                                                <th>#</th>
                                                <th>Campaign Name</th>
                                                <th>Status</th>
                                                <th>Scheduled Date</th>
                                                <th>Employees</th>
                                                <th>Email Delivered</th>
                                                <th>Email Viewed</th>
                                                <th>Payloads Clicked</th>
                                                <th>Employees Compromised</th>
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
            <!-- ============================================================== -->
            <!-- End Table View  -->

            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->

            <!-- Modal -->
            <div class="modal fade" id="ModalCampaignList" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true ">
               <div class="modal-dialog modal-large" role="document ">
                  <div class="modal-content">
                     <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Select Email Campaign</h5>
                        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close">&times;</button>
                     </div>
                     <div class="modal-body">
                        <div class="form-group row">
                           <div class="table-responsive">
                              <table id="table_mail_campaign_list" class="table table-striped table-bordered">
                                 <thead>
                                    <tr>
                                       <th>#</th>
                                       <th>Tracker Name</th>
                                       <th>Date Created</th>
                                       <th>Status</th>
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
            <!-- Modal -->
            <div class="modal fade" id="ModalExport" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
               <div class="modal-dialog" role="document">
                  <div class="modal-content">
                     <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Export Report</h5>
                        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close">&times;</button>
                     </div>
                     <div class="modal-body">
                        <div class="form-group row">
                           <label for="Modal_export_file_name" class="col-sm-3 text-left control-label col-form-label">File Name: </label>
                           <div class="col-sm-9 custom-control">
                              <input type="text" class="form-control" id="Modal_export_file_name">
                           </div>
                        </div>
                        <div class="form-group row">
                           <label for="modal_export_report_selector" class="col-sm-3 text-left control-label col-form-label">File Format: </label>
                           <div class="col-sm-9 custom-control">
                              <select class="select2 form-control"  style="height: 36px;width: 100%;" id="modal_export_report_selector">
                                 <option value="csv">Export as CSV</option>
                                 <option value="pdf">Export as PDF</option>
                                 <option value="html">Export as HTML</option>
                              </select>
                           </div>
                        </div>
                     </div>
                     <div class="modal-footer">
                        <button type="button" class="btn btn-success" onclick="exportReportAction($(this))"><i class="fas fa-file-export"></i> Export</button>
                     </div>
                  </div>
               </div>
            </div>
            <!-- Modal -->
            <div class="modal fade" id="modal_reply_mails" tabindex="-1" role="dialog" aria-hidden="true">
               <div class="modal-dialog modal-large" role="document">
                  <div class="modal-content">
                     <div class="modal-header">
                        <h5 class="modal-title">Reply Emails</h5>
                        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close">&times;</button>
                     </div>
                     <div class="modal-body" id="modal_reply_mails_body" >
                        <ul class="nav nav-tabs" role="tablist">  
                        </ul>
                        <!-- Tab panes -->
                        <div class="tab-content tabcontent-border">
                           
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <!-- Modal -->
            <div class="modal fade" id="modal_settings" tabindex="-1" role="dialog" aria-hidden="true">
               <div class="modal-dialog" role="document">
                  <div class="modal-content" style="width: 120%;">
                     <div class="modal-header">
                        <h5 class="modal-title">Dashboard Display Settings</h5>
                        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close">&times;</button>
                     </div>
                     <div class="modal-body">
                        <div class="form-group row">
                           <label class="col-md-3">Table data:</label>
                           <div class="col-md-9">
                              <div class="custom-control custom-radio">
                                 <input type="radio" class="custom-control-input" id="rb1" value="radio_table_data_single" name="radio_table_data" required checked>
                                 <label class="custom-control-label" for="rb1">Show first entry only</label>
                                 <i class="mdi mdi-information cursor-pointer" tabindex="0" data-toggle="popover" data-trigger="focus" data-placement="top" data-content="First tracked data of user's are displayed. Eg: displays user's first visit only"></i>
                              </div>
                              <div class="custom-control custom-radio">
                                 <input type="radio" class="custom-control-input" id="rb2" value="radio_table_data_all" name="radio_table_data" required>
                                 <label class="custom-control-label" for="rb2">Show all entries</label>
                                 <i class="mdi mdi-information cursor-pointer" tabindex="0" data-toggle="popover" data-trigger="focus" data-placement="top" data-content="All tracked data of user's are displayed. Eg: displays all visits of a user"></i>
                              </div> 
                           </div>                           
                        </div>
                        <div class="form-group row">
                           <label class="col-md-3">Mail reply check:</label>
                           <div class="col-md-9">
                              <div class="custom-control custom-radio">
                                 <input type="radio" class="custom-control-input" id="rb3" value="reply_yes" name="radio_mail_reply_check" required checked>
                                 <label class="custom-control-label" for="rb3">Check mail replies</label>
                              </div>
                              <div class="custom-control custom-radio">
                                 <input type="radio" class="custom-control-input" id="rb4" value="reply_no" name="radio_mail_reply_check" required>
                                 <label class="custom-control-label" for="rb4">Do not check mail replies</label>
                              </div> 
                           </div>                           
                        </div>                        
                     </div>
                     <div class="modal-footer">
                        <button type="button" class="btn btn-info" onclick="$('#modal_settings').modal('toggle');refreshDashboard();">Apply</button>
                     </div>
                  </div>
               </div>
            </div>
            <!-- Modal -->
            <div class="modal fade" id="modal_dashboard_link" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
               <div class="modal-dialog modal-large" role="document">
                  <div class="modal-content">
                     <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Dashboard Access Link</h5>
                        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close">&times;</button>
                     </div>
                     <div class="modal-body">
                        <div class="form-group row">
                           <label for="Modal_export_file_name" class="col-sm-4 text-left control-label col-form-label">Public access: </label>
                           <div class="custom-control custom-switch col-sm-2 m-t-5 text-right">
                              <label class="switch">
                                 <input type="checkbox" id="cb_act_dashboard_link">
                                 <span class="slider round"></span>
                              </label>
                           </div>
                        </div>
                        <label for="Modal_export_file_name" class=" text-left control-label col-form-label">Shareable  dashboard link (public):</label>
                        <pre><code class="language-html" id="dashboard_link_url">Error: Please select campaign first</code></pre>
                        <span class="prism_side float-right">
                           <button type="button" id="btn_copy_quick_tracker" class="btn waves-effect waves-light btn-xs btn-dark mdi mdi-content-copy" data-toggle="tooltip" title="Copy Link" data-placement="bottom"></button><button type="button" class="btn waves-effect waves-light btn-xs btn-dark mdi mdi-reload" data-toggle="tooltip" title="Regenerate Link" data-placement="bottom" onclick="enableDisablePublicAccess(true)"></button>
                        </span>
                     </div>
                     <div class="modal-footer col-md-12">
                        <button type="button" class="btn btn-success" data-toggle="modal" data-target="#modal_dashboard_link">Close</button>  
                     </div>
                  </div>
               </div>
            </div>
            <!-- Modal -->
            
            <?php include(dirname(__FILE__).'/components/foot.php'); ?>

           </div>
         </div>
      </div>
      <!-- END MAIN CONTAINER -->


      <?php include(dirname(__FILE__).'/components/script.php'); ?>

      <!-- ============================================================== -->
      <!-- All Jquery -->
      <!-- ============================================================== -->
      <script src="<?php echo url ?>/js/libs/jquery/jquery-3.6.0.min.js"></script>
      <script src="<?php echo url ?>/js/libs/jquery/jquery-ui.min.js"></script>
      <script src="<?php echo url ?>/js/libs/js.cookie.min.js"></script>
      <!-- Bootstrap tether Core JavaScript -->
      <script src="<?php echo url ?>/js/libs/popper.min.js"></script>
      <script src="<?php echo url ?>/js/libs/bootstrap.min.js"></script>
      <!--Menu sidebar -->
      <script src="<?php echo url ?>/js/libs/perfect-scrollbar.jquery.min.js"></script>
      <!--Custom JavaScript -->
      <script src="<?php echo url ?>/js/libs/custom.min.js"></script>
      <!--This page JavaScript --> 
      <script src="<?php echo url ?>/js/libs/select2.min.js"></script>
      <script src="<?php echo url ?>/js/libs/clipboard.min.js"></script> 
      <script src="<?php echo url ?>/js/libs/jquery/datatables.js"></script>
      <script src="<?php echo url ?>/js/libs/moment.min.js"></script>
      <script src="<?php echo url ?>/js/libs/moment-timezone-with-data.min.js"></script>
      <script src="<?php echo url ?>/js/libs/apexcharts.js"></script>
      <script src="<?php echo url ?>/js/common_scripts.js"></script>
      <script src="<?php echo url ?>/js/mail_campaign_dashboard.js"></script>
      <?php
         if(isset($_GET['tk']) && isset($_GET['mcamp']) && amIPublic($_GET['tk'],$_GET['mcamp']) == true)
            echo '<script>
                     var g_tk_id = "'.$_GET['tk'].'"; 
                     hideMeFromPublic(); 
                  </script>';
         else{
             echo '<script>var g_tk_id = getRandomId();</script>';            
            isSessionValid(true);
         }

         //------------------------------------------
         echo '<script>';
         
         if(isset($_GET['mcamp']))
            echo 'var g_campaign_id ="'.doFilter($_GET['mcamp'],'ALPHA_NUM').'";
                  campaignSelected("' . doFilter($_GET['mcamp'],'ALPHA_NUM') . '");';
         else
            echo 'var g_campaign_id ="", g_tracker_id="";
                  $(function() {$("#ModalCampaignList").modal("toggle");});';
         
                  echo'loadTableCampaignResult1()';
         echo '</script>';
      ?>

      <script defer src="<?php echo url ?>/js/libs/sidebarmenu.js"></script>
      <script defer src="<?php echo url ?>/js/libs/toastr.min.js"></script>
      <script defer src="<?php echo url ?>/js/libs/summernote-bs4.min.js"></script>
      <script defer src="<?php echo url ?>/js/libs/prism.js"></script> 
   </body>
</html>