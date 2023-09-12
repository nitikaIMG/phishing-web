<?php
require_once(dirname(__FILE__) . '/manager/session_manager.php');
require_once(dirname(__FILE__).'/includes/config.php');
isSessionValid(true);
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
         @import url(https://fonts.googleapis.com/css?family=Lato:700);
         *,
         *:before,
         *:after {
         box-sizing: border-box;
         }

         html,
         body {
         /* background: #ecf0f1; */
         color: #444;
         font-family: "Lato", Tahoma, Geneva, sans-serif;
         font-size: 16px;
         padding: 10px;
         }

         .set-size {
         font-size: 10em;
         }

         .charts-container:after {
         clear: both;
         content: "";
         display: table;
         }

         /* .card {
         display: flex;
         align-items: center;
         justify-content: center;
         flex-direction: column;
         background-color: #ffffff;
         margin: 0 20px;
         width: 280px;
         height: 350px;
         border-radius: 5px;
         box-shadow: 0 10px 20px -10px rgba(0, 0, 0, 0.2);
         } */
         .card2 {
            display: inline-flex;
            justify-content: center;
         }
         .card2 .percent2 {
         position: relative;
         }

         .card2 svg {
            position: relative;
            width: 50px;
            height: 50px;
            transform: rotate(-90deg);
         }

         .card2 svg circle {
         width: 100%;
         height: 100%;
         fill: none;
         stroke: #f0f0f0;
         stroke-width: 2;
         stroke-linecap: round;
         }

         .card2 svg circle:last-of-type {
            stroke-dasharray: 135px;
            stroke-dashoffset: calc(135px - (135px * var(--percent)) / 100);
            stroke: #3498db;
         }

         .card2 .number2 {
         position: absolute;
         top: 50%;
         left: 50%;
         transform: translate(-50%, -50%);
         }

         .card2 .number2 h6 {
            font-weight: 200;
            font-size: 0.7rem;
            margin-bottom: 0;
         }


         .card2 .title h6 {
         margin: 25px 0 0;
         }

         .card2:nth-child(1) svg circle:last-of-type {
            stroke: #00ab55;
         }

         .card2:nth-child(2) svg circle:last-of-type {
            stroke: #f0f0f0;
         }
         body.dark button.dt-button{
          color:white !important;
         }

         div.dataTables_wrapper div.dataTables_filter input {
            background-color: white !important;
         }
         #table_mail_campaign_result1 tbody tr td:first-child {
             cursor: pointer;
             text-decoration: underline;
         }
      </style> 

      <!--Datatable js -->
      <link rel="stylesheet" type="text/css" href=" https://cdn.datatables.net/1.13.3/css/jquery.dataTables.min.css">  
      <link rel="stylesheet" type="text/css" href=" https://cdn.datatables.net/buttons/2.3.5/css/buttons.dataTables.min.css"> 

   </head>
   <body class="layout-boxed alt-menu">
    <!-- BEGIN LOADER -->
    <div id="load_screen"> 
      <div class="loader">
       <div class="loader-content">
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
                     <!-- <a href="<?=base_url?>mailcmpdashboard">
                     <button type="button" class="btn btn-info btn-sm item_private ms-2" data-toggle="modal" ><i class="mdi mdi-hand-pointing-right" title="Select mail campaign" data-toggle="tooltip" data-placement="bottom"></i> All Campaign</button>
                    </a> -->
                  </div>
               </div>
            </div>
            <div class="container-fluid">

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
            <!-- Start Chart View  -->

             <!-- Start Pie Chart View  -->
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
                                 <div id="piechart_mail_total_replied1" class="center"></div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <!-- End Pie Chart View  -->
        
               <!-- Start Area Chart View  -->
               <div class="row">
                  <div class="col-12">
                     <div class="card">
                        <div class="card-body">
                           <div class="row">
                                 <h4 class="card-title">Phishing Success</h4>
                                 <h5 class="card-subtitle">Statistics over the last 12 months (Updated Daily)</h5>
                                 <div id="chartmail">
                                 </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <!-- End Area Chart View  -->

            <!-- ============================================================== -->
            <!-- Ent Chart View  -->

            <!-- ============================================================== -->
            <!-- Start Table View  -->
               <!-- Active Table View  -->
                  <div class="row">
                     <div class="col-12">
                        <div class="card">
                           <div class="card-body">
                              <div class="row">
                                 <div class="col-md-12">
                                    <p>Active Campaigns</p>
                                 </div>
                              </div>
                              <div class="row">
                                 <div class="col-md-12 m-t-20">    
                                    <div class="row">                    
                                       <div class="table-responsive">
                                          <table id="table_mail_campaign_result1" class="table table-striped table-bordered">
                                             <thead>
                                                <tr>
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
               <!-- Active Table View  -->
               <!-- Past Table View  -->
                  <div class="row">
                     <div class="col-12">
                        <div class="card">
                           <div class="card-body">
                              <div class="row">
                                 <div class="col-md-12">
                                    <p>Past Campaigns</p>
                                 </div>
                              </div>
                              <div class="row">
                                 <div class="col-md-12 m-t-20">    
                                    <div class="row">                    
                                       <div class="table-responsive">
                                          <table id="table_mail_campaign_result2" class="table table-striped table-bordered">
                                             <thead>
                                                <tr>
                                                   <th>Campaign Name</th>
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
               <!-- Past Table View  -->
            <!-- ============================================================== -->
            <!-- End Table View  -->

            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->

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

      <!--Datatable js -->
      <script type="text/javascript" src="https://cdn.datatables.net/1.13.3/js/jquery.dataTables.min.js"></script>
      <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.3.5/js/dataTables.buttons.min.js"></script>
      <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
      <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
      <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
      <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.3.5/js/buttons.html5.min.js"></script>

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