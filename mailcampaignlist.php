
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
      <!-- Custom CSS -->
      <link rel="stylesheet" type="text/css" href="<?php echo url ?>/customecss/css/select2.min.css">
      <link rel="stylesheet" type="text/css" href="<?php echo url ?>/customecss/css/style.min.css">
      <link rel="stylesheet" type="text/css" href="<?php echo url ?>/customecss/css/dataTables.foundation.min.css">
      <link rel="stylesheet" type="text/css" href="<?php echo url ?>/customecss/css/bootstrap-datetimepicker.min.css">
      <style> 
         .tab-header{ list-style-type: none; }
         body.dark .table tbody tr td {
            color: white;
         }
      </style>
      <link rel="stylesheet" type="text/css" href="<?php echo url ?>/customecss/css/toastr.min.css">
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

                  <div class="page-breadcrumb">
                     <div class="row">
                        <div class="col-12 d-flex no-block align-items-center">
                           <h4 class="page-title">Email Campaigns</h4>
                        </div>
                     </div>
                  </div>

                  <div class="container-fluid" id="section_view_list">
                     <div class="card card ms-2 me-2">
                        <div class="card-body">
                           <div class="row">
                              <div class="col-md-12">
                                 <button type="button" class="btn btn-info btn-sm" onclick="document.location='MailCampaignList?action=add&campaign=new'"><i class="fas fa-plus"></i> New Mail Campaign</button>
                              </div>
                           </div>
                           <div class="row">
                              <div class="col-md-12 m-t-20">    
                                 <div class="row">                    
                                    <div class="table-responsive">
                                       <table id="table_mail_campaign_list" class="table table-striped table-bordered">
                                          <thead>
                                             <tr>
                                                <th>#</th>
                                                <th>Campaign Name</th>
                                                <!-- <th>User Group</th> -->
                                                <th>Email Template</th>
                                                <!-- <th>Sender</th> -->
                                                <!-- <th>Configuration</th> -->
                                                <th>Date Created</th>
                                                <!-- <th>Start/Scheduled Time</th> -->
                                                <th>Scheduled Date</th>
                                                <th>Scheduled Time</th>
                                                <th>End Time</th>
                                                <th>Status</th>
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
                     </div>
                  </div>
                  <div class="container-fluid" id="section_addcampaign">
                     <!-- ============================================================== -->
                     <!-- Start Page Content -->
                     <!-- ============================================================== -->
                     <div class="card ms-2 me-2">
                        <div class="card-body">
                           <div class="row">
                              <div class="col-md-6">
                                 <div class="form-group row">
                                    <label for="mail_campaign_name" class="col-sm-4 text-left control-label col-form-label">Name:*</label>
                                    <div class="col-sm-7">
                                       <input type="text" class="form-control" id="mail_campaign_name" placeholder="Campaign name">
                                    </div>
                                 </div>
                                 <div class="form-group row">
                                    <label for="userGroupSelector" class="col-sm-4 text-left control-label col-form-label">User Group:*</label>
                                    <div class="col-sm-7">
                                       <select class="select2 form-control custom-select" id="userGroupSelector" style="height: 36px;width: 100%;">
                                       </select>
                                    </div>
                                 </div>
                                 <div class="form-group row">
                                    <label for="mailTemplateSelector" class="col-sm-4 text-left control-label col-form-label">Mail Template: *</label>
                                    <div class="col-sm-7">
                                       <select class="select2 form-control custom-select" id="mailTemplateSelector" style="height: 36px;width: 100%;">
                                       </select>
                                    </div>
                                 </div>
                                 <div class="form-group row">
                                    <label for="mailSenderSelector" class="col-sm-4 text-left control-label col-form-label">Mail Sender:*</label>
                                    <div class="col-sm-7">
                                       <select class="select2 form-control custom-select" id="mailSenderSelector" style="height: 36px;width: 100%;">
                                       </select>
                                    </div>
                                 </div>
                                 <div class="form-group row">
                                    <label for="mailConfigSelector" class="col-sm-4 text-left control-label col-form-label">Campaign Configuration:</label>
                                    <div class="col-sm-7">
                                       <select class="select2 form-control custom-select" id="mailConfigSelector" style="height: 36px;width: 100%;">
                                       </select>
                                    </div>
                                 </div>         
                              </div>


                              <div class="col-sm-6">
                                 <div class="form-group row">
                                    <label for="datetimepicker_launch" class="col-sm-4 text-left control-label col-form-label">Launch Time:* </label>
                                    <label class="col-sm-6">
                                       <div class="d-flex">
                                       <input type='text' class="form-control" id="datetimepicker_launch" />  
                                       <div class="input-group-append">
                                       <span class="input-group-text" ><i class="fa fa-calendar" ></i></span> 
                                        </div> 
                                       </div> 
                                    </label>
                                 </div>

                                 <div class="form-group row">
                                    <label for=" " class="col-sm-4 text-left control-label col-form-label">Message interval (seconds):</label>
                                    <div class="col-sm-7 row">
                                       <div class="col-sm-5">
                                          <input type='text' id="tb_campaign_time_val" class="form-control range-textinput m-t-5" value="0000-0000" data-mask="____-____" />
                                       </div>
                                       <div class="range-slider col-sm-5 m-t-15">
                                          <input class="input-range input-range1" oninput="rangeCampTimeChange(this.id)" onchange="rangeCampTimeChange(this.id)" id="range_campaign_time_min" type="range" value="0" min="0" max="1800">
                                          <input class="input-range input-range2" oninput="rangeCampTimeChange(this.id)" onchange="rangeCampTimeChange(this.id)" type="range" id="range_campaign_time_max" value="0" min="0" max="1800">
                                       </div> 
                                    </div>
                                 </div>
                                 <div class="form-group row">
                                    <label for=" " class="col-sm-4 text-left control-label col-form-label">Message fail retry:</label>
                                    <div class="col-sm-7 row ">
                                       <div class="col-sm-5">
                                          <input type='text' id="tb_campaign_msg_retry" class="form-control range-textinput m-t-5" value="2"/>
                                       </div>
                                       <div class="range-slider col-sm-5 m-t-15">
                                          <input class="input-range input-range1" id="range_campaign_msg_retry" type="range" value="2" min="0" max="10" oninput="rangeCampRetryFailChange(this.id)" onchange="rangeCampRetryFailChange(this.id)">
                                       </div> 
                                    </div>
                                 </div>
                                 <div class="form-group row">
                                    <label for="cb_read_receipt" class="col-sm-4 text-left control-label col-form-label m-t-10">Activate upon save:</label>
                                    <div class="col-sm-7 row">
                                       <div class="custom-control custom-switch m-t-15 col-sm-7">
                                          <label class="switch">
                                             <input type="checkbox" id="cb_act_deact_campaign" checked="">
                                             <span class="slider round"></span>
                                          </label>
                                       </div>
                                       <div class="col-md-4 text-right m-t-10">
                                          <button type="button" class="btn btn-info" id="bt_saveMailCamp" onclick="promptSaveMailCampaign()"><i class="fa fas fa-save"></i> Save</button>   
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
                  </div>
                  
                  <!-- Modal -->
                  <div class="modal fade" id="modal_prompts" tabindex="-1" role="dialog" aria-hidden="true">
                     <div class="modal-dialog" role="document">
                        <div class="modal-content">
                           <div class="modal-header">
                              <h5 class="modal-title">Are you sure?</h5>
                              <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close">&times;</button>
                           </div>
                           <div class="modal-body" id="modal_prompts_body">
                              content...
                           </div>
                           <div class="modal-footer" >
                              <button type="button" class="btn btn-danger" id="modal_prompts_confirm_button">Delete</button>
                           </div>
                        </div>
                     </div>
                  </div>
                  <!-- Modal -->
                  <div class="modal fade" id="modal_mail_campaign_copy" tabindex="-1" role="dialog" aria-hidden="true">
                     <div class="modal-dialog" role="document">
                        <div class="modal-content">
                           <div class="modal-header">
                              <h5 class="modal-title">Enter new Email campaign name</h5>
                              <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close">&times;</button>
                           </div>
                           <div class="modal-body">
                              <div class="form-group row  m-t-20">
                                 <label for="modal_mail_sender_name" class="col-sm-4 control-label col-form-label">Email Campaign Name</label>
                                 <div class="col-sm-7">
                                    <input type="text" class="form-control" id="modal_mail_campaign_name" placeholder="New Email Campaign Name Here">
                                 </div>
                              </div>
                           </div>
                           <div class="modal-footer" >
                              <button type="button" class="btn btn-success" onclick="mailCampaignCopyAction()"><i class="mdi mdi-content-copy"></i> Copy</button>
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

      <script src="<?php echo url ?>/js/libs/jquery/jquery-3.6.0.min.js"></script>
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
      <script src="<?php echo url ?>/js/mail_campaign.js"></script> 
      <?php
         echo '<script>';
         if(isset($_GET['action'])){
            if(isset($_GET['campaign'])){ 
               if($_GET['action'] == 'add' && $_GET['campaign'] == 'new'){
                  echo '$("#section_view_list").hide();
                        getMailCampaignFromCampaignListId("' . doFilter($_GET['campaign'],'ALPHA_NUM') . '"); pullMailCampaignFieldData ();';
               }
               if($_GET['action'] == 'edit' && $_GET['campaign'] != 'new'){
                  echo '$("#section_view_list").hide();
                        getMailCampaignFromCampaignListId("' . doFilter($_GET['campaign'],'ALPHA_NUM') . '");';
               }
            }
         }
         else
            echo '$("#section_addcampaign").hide();
                    loadTableCampaignList();';
         echo '</script>';
      ?>
      <script defer src="<?php echo url ?>/js/libs/sidebarmenu.js"></script>
      <script defer src="<?php echo url ?>/js/libs/jquery/datatables.js"></script> 
      <script defer src="<?php echo url ?>/js/libs/toastr.min.js"></script>
      <script defer src="<?php echo url ?>/js/libs/select2.min.js"></script>
      <script defer src="<?php echo url ?>/js/libs/moment.min.js"></script>
      <script defer src="<?php echo url ?>/js/libs/bootstrap-datetimepicker.min.js"></script>
      <script defer src="<?php echo url ?>/js/libs/moment.min.js"></script>
      <script defer src="<?php echo url ?>/js/libs/moment-timezone-with-data.min.js"></script>
   </body>

   <style type="text/css">



   </style>
</html>