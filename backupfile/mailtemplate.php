<?php
require_once(dirname(__FILE__).'/manager/session_manager.php');
require_once(dirname(__FILE__).'/includes/config.php');
// isSessionValid(true);
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
    <?php include(dirname(__FILE__).'/components/adminnavbar.php'); ?>
    <!--  END NAVBAR  -->

    <!--  BEGIN MAIN CONTAINER  -->
    <div class="main-container" id="container">

        <div class="overlay"></div>
        <div class="search-overlay"></div>

        <!--  BEGIN SIDEBAR  -->
        <?php include(dirname(__FILE__).'/components/adminsidebar.php'); ?>
        <!--  END SIDEBAR  -->

        <!--  BEGIN CONTENT AREA  -->
        <div id="content" class="main-content">

        <div id="main-wrapper">


            <div class="page-breadcrumb breadcrumb-withbutton">
               <div class="row">
                  <div class="col-12 d-flex no-block align-items-center">
                     <h4 class="page-title">Email Templates</h4>
                     <div class="ml-auto text-right" id="store-area">
                        <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#ModalStore"><i class="fa fas fa-warehouse"></i> Store</button>
                     </div>
                  </div>
               </div>
            </div>
            
            <div class="container-fluid" id="section_view_mail_template_list">
               
               <div class="card">
                  <div class="card-body">
                     <div class="row mb-2">
                        <div class="col-md-12">
                           <button type="button" class="btn btn-info btn-sm" onclick="document.location='mailtemplate?action=add&template=new'"><i class="fas fa-plus"></i> New Email Template</button>
                        </div>
                     </div>
                     <div class="row">
                        <div class="col-md-12 m-t-20">
                           <div class="row">
                              <div class="table-responsive">
                                 <table id="table_mail_template_list" class="table table-striped table-bordered">
                                    <thead>
                                       <tr>
                                          <th>#</th>
                                          <th>Template Name</th>
                                          <th>Subject</th>
                                          <th>Body</th>
                                          <th>Attachment</th>
                                          <th>Date Created</th>
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
            <div class="container-fluid" id="section_add_mail_template">
               
               <div class="card">
                  <div class="card-body">
                     
                     <div class="row">
                        <div class="col-md-9">
                           <div class="form-group row">
                              <label for="mail_template_name" class="col-md-2 text-left control-label col-form-label">Template Name:</label>
                              <div class="col-md-5">
                                 <input type="text" class="form-control" id="mail_template_name" placeholder="Email Template Name">
                              </div>
                              <div class="col-md-5">
                                 <div class="col-md-12 row text-right">
                                    <div class="col-md-9">
                                       <select class="select2 form-control " id="mail_content_type_selector" style="height: 36px;width: 100%;">
                                          <option >Select message type</option>
                                          <option value="text/html" selected>Text/HTML (default)</option>
                                          <option value="text/plain">Plain text</option>
                                       </select>
                                    </div>
                                    <div class="col-md-3 text-right">
                                       <button type="button" class="btn btn-info" onclick="saveMailTemplate($(this))"><i class="fa fas fa-save"> </i> Save </button>
                                    </div>
                                 </div>
                              </div>
                           </div>
                           <div class="form-group row">
                              <label for="mail_template_subject" class="col-md-2 text-left control-label col-form-label">Email Subject:</label>
                              <div class="col-md-5">
                                 <input type="text" class="form-control" id="mail_template_subject" placeholder="Email Subject">
                              </div>
                              <div class="col-md-5 row">
                                 <div class="col-md-12 text-right">
                                     <button type="button" class="btn btn-success" data-toggle="modal" data-target="#modal_test_mail"><i class="fa fas fa-paper-plane"></i> Send Test Mail</button>    
                                 </div> 
                              </div>         
                           </div>

                           <div class="form-group row">
                              <label>Domain:</label>
                              <select class="select2 form-control date-inputmask" required id="domain" onchange="getlanding()" placeholder="Domain">
                                 <option value="" selected disabled>Select Domain</option>
                              </select>
                        </div>
                        <div class="form-group row">
                              <label>Landing Page:</label>
                              <select class="select2 form-control date-inputmask" required id="landing_page" placeholder="Landing Page">
                                 <option value="" selected disabled>Select Landing Page</option>
                              </select>
                        </div>

                        <input type="hidden" name="domain_name" id="domain_name">
                        <input type="hidden" name="landing_name " id="landing_name">
                        
                        </div>                   
                     </div>
                     <div class="row m-t-10">
                        <div class="col-md-12 row">
                           <div class="col-md-9">          
                              <textarea id="summernote"></textarea>
                              <div id="editor_mail_body" hidden=""></div>      
                              <div class="form-group row">
                                 <label class="col-md-8 text-left control-label col-form-label m-t-5">
                                    <span>Tracker image: </span><span class="text-info" id="lb_tracker_image">None added</span>
                                 </label> 
                                 <div class="col-md-4 align-items-right text-right float-right m-t-10">
                                     <button type="button" class="btn btn-success btn-sm" onclick="addRemoveTrackerImage('addDefault')" title="Insert default tracker image" data-toggle="tooltip"><i class="mdi mdi-image"></i></button>
                                     <button type="button" class="btn btn-success btn-sm" onclick="addRemoveTrackerImage('addCustom')" title="Insert custom tracker image" data-toggle="tooltip"><i class="mdi mdi-image-filter-hdr"></i></button>
                                     <button type="button" class="btn btn-success btn-sm" onclick="addRemoveTrackerImage('removeTrackerImage')" title="Clear tracker image" data-toggle="tooltip"><i class="mdi mdi-refresh"></i></button>
                                  </div>
                              </div>   
                              <hr/>      
                              <div class="form-group row">
                                 <label class="col-md-4 text-left control-label col-form-label m-t-5">
                                    <span id="lb_attachment_count">Attachments (0): </span>
                                 </label> 
                                 <div class="col-md-8 align-items-right text-right float-right m-t-10">
                                     <button type="button" class="btn btn-success btn-sm" onclick='$("#attachment-uploader").trigger("click")' title="Add attachment" data-toggle="tooltip"><i class="fa fas fa-plus"></i> Attachment</button>
                                  </div>
                              </div>
                              <div class="form-group attachments-area" id="attachments_area">
                                 
                              </div>                
                           </div> 
                           
                           <div class="col-md-3"> 
                              <div class="panel-group box bg-dark text-white accordion">
                                 <div class="panel panel-default">
                                   <div class="panel-heading card-hover">
                                        <span class="panel-title">
                                            <span>Keywords</span>
                                        <span>
                                   </div>
                                   <div id="collapseOne" class="panel-collapse collapse table-dark row show" data-toggle="collapse" aria-expanded="false">
                                       <div class="panel-body">
                                          <div class="table-responsive">
                                             <table class="table table-full-width">
                                                <tbody>
                                                   <tr>
                                                      <td>{{RID}}</td>
                                                      <td>Remote user's unique ID</td>
                                                   </tr>
                                                   <tr>
                                                      <td>{{MID}}</td>
                                                      <td>Mailcampaign ID</td>
                                                   </tr>
                                                   <tr>
                                                      <td>{{NAME}}</td>
                                                      <td>Full Name of target user</td>
                                                   </tr>
                                                   <tr>
                                                      <td>{{FNAME}}</td>
                                                      <td>First Name of target user</td>
                                                   </tr>
                                                   <tr>
                                                      <td>{{LNAME}}</td>
                                                      <td>Last Name of target user</td>
                                                   </tr>
                                                   <tr>
                                                      <td>{{NOTES}}</td>
                                                      <td>Notes of user</td>
                                                   </tr>
                                                   <tr>
                                                      <td>{{EMAIL}}</td>
                                                      <td>Target user email</td>
                                                   </tr>
                                                   <tr>
                                                      <td>{{FROM}}</td>
                                                      <td>Sender email address</td>
                                                   </tr>
                                                   <tr>
                                                      <td>{{TRACKINGURL}}</td>
                                                      <td>Tracker image URL</td>
                                                   </tr>
                                                   <tr>
                                                      <td>{{TRACKER}}</td>
                                                      <td>Tracker image HTML</td>
                                                   </tr>
                                                   <tr>
                                                      <td>{{BASEURL}}</td>
                                                      <td>SniperPhish base URL</td>
                                                   </tr>
                                                   <tr>
                                                      <td>{{MUSERNAME}}</td>
                                                      <td>Username part of user's mail</td>
                                                   </tr>
                                                   <tr>
                                                      <td>{{MDOMAIN}}</td>
                                                      <td>Domain part of user's mail</td>
                                                   </tr>
                                                   <tr>
                                                      <td>{{RND}}</td>
                                                      <td>Random alpha-num string (default length:5). Eg: {{RND1}}, {{RND2}} etc.</td>
                                                   </tr>
                                                </tbody>
                                             </table>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                              </div>

                              <div class="panel-group box bg-dark text-white accordion m-t-5">
                                 <div class="panel panel-default">
                                   <div class="panel-heading card-hover">
                                        <span class="panel-title">
                                            <span>Hints</span>
                                        <span>
                                   </div>
                                   <div id="collapseOneHint" class="panel-collapse collapse table-dark row" data-toggle="collapse" aria-expanded="false">
                                       <div class="panel-body">
                                          <div class="table-responsive">
                                             <table class="table table-full-width">
                                                <tbody>
                                                   <tr>
                                                      <td>You can link your phishing website to your email. Click Truck icon from the editor menus and select "Insert Web Tracker".</td>
                                                   </tr>
                                                   <tr>
                                                      <td>You can randomize attachment name for each recipient. Provide a custom name once attachment is inserted. Eg: "{{RID}}.jpg"</td>
                                                   </tr>
                                                   <tr>
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
                     <hr/>
                     <input type="file" id="attachment-uploader" onchange="getBase64ofFile(uploadAttachments,this.files[0],this)" hidden="">
                     <input type="file" id="tracker-img-uploader" accept="image/*" onchange="getBase64ofFile(uploadTrackerImage,this.files[0],this)" hidden="">
                  </div>
               </div>
               
            </div>
            
            <!-- Modal -->            
            <div class="modal fade" id="modal_email_template_delete" tabindex="-1" role="dialog" aria-hidden="true">
               <div class="modal-dialog" role="document">
                  <div class="modal-content">
                     <div class="modal-header">
                        <h5 class="modal-title">Are you sure?</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">&times;</button>
                     </div>
                     <div class="modal-body">
                        This will delete email template and the action can't be undone!
                     </div>
                     <div class="modal-footer" >
                        <button type="button" class="btn btn-danger" data-tracker_id="" onclick="mailTemplateDeletionAction()">Delete</button>
                     </div>
                  </div>
               </div>
            </div>
            <!-- Modal -->
            <div class="modal fade" id="modal_mail_template_copy" tabindex="-1" role="dialog" aria-hidden="true">
               <div class="modal-dialog" role="document">
                  <div class="modal-content">
                     <div class="modal-header">
                        <h5 class="modal-title">Enter new email template name</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">&times;</button>
                     </div>
                     <div class="modal-body">
                        <div class="form-group row  m-t-20">
                           <label for="modal_new_mail_template_name" class="col-sm-4 control-label col-form-label">Email Template Name</label>
                           <div class="col-sm-8">
                              <input type="text" class="form-control" id="modal_new_mail_template_name" placeholder="Email Template Name Here">
                           </div>
                        </div>
                     </div>
                     <div class="modal-footer" >
                        <button type="button" class="btn btn-success" onclick="mailTemplateCopy()"><i class="mdi mdi-content-copy"></i> Copy</button>
                     </div>
                  </div>
               </div>
            </div>
            <!-- Modal -->
            <div class="modal fade" id="modal_test_mail" tabindex="-1" role="dialog" aria-hidden="true">
               <div class="modal-dialog" role="document">
                  <div class="modal-content">
                     <div class="modal-header">
                        <h5 class="modal-title">Test Mail Delivery</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">&times;</button>
                     </div>
                     <div class="modal-body">
                        <div class="form-group row m-t-20">
                           <label for="modal_mail_sender_test_mail_to" class="col-sm-4  control-label col-form-label">Select mail sender:</label>
                           <div class="col-md-8">
                              <select class="select2 form-control " id="mail_sender_selector" style="height: 36px;width: 100%;">
                              </select>
                           </div>
                        </div>
                        <div class="form-group row m-t-20">
                           <label for="modal_mail_sender_test_mail_to" class="col-sm-4  control-label col-form-label">Enter To address:</label>
                           <div class="col-sm-8">
                              <input type="text" class="form-control" id="modal_mail_sender_test_mail_to" placeholder="Email address of test recipient">
                           </div>
                        </div>
                     </div>
                     <div class="modal-footer" >
                        <button type="button" class="btn btn-success" onclick="modalTestDeliveryAction($(this))"><i class="fa fas fa-paper-plane"></i> Send</button>
                     </div>
                  </div>
               </div>
            </div>
            <!-- Modal -->
            <div class="modal fade" id="modal_web_tracker_selection" tabindex="-1" role="dialog" aria-hidden="true">
               <div class="modal-dialog" role="document">
                  <div class="modal-content">
                     <div class="modal-header">
                        <h5 class="modal-title">Link Web Tracker</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">&times;</button>
                     </div>
                     <div class="modal-body">
                        <div class="form-group row m-t-20">
                           <label for="web_tracker_selector" class="col-sm-4  control-label col-form-label">Select web tracker:</label>
                           <div class="col-md-8">
                              <select class="select2 form-control " id="web_tracker_selector" style="height: 36px;width: 100%;">
                              </select>
                           </div>
                        </div>
                        <div class="form-group row m-t-20">
                           <label for="web_tracker_style_selector" class="col-sm-4  control-label col-form-label">Display style:</label>
                           <div class="col-md-7">
                              <select class="select2 form-control " id="web_tracker_style_selector" style="height: 36px;width: 100%;">
                                 <option value="1">Style 1 - with {{RID}}</option>
                                 <option value="2">Style 2 - no {{RID}}</option>
                                 <option value="3">Style 3 - with text</option>
                              </select>
                           </div>
                           <i class="mdi mdi-information cursor-pointer m-t-5" tabindex="0" data-toggle="popover" data-trigger="focus" data-placement="top" data-content="Link display style only. You may customize display text from the code view of editor" data-original-title="" title=""></i>
                        </div>
                     </div>
                     <div class="modal-footer">
                        <button type="button" class="btn btn-success" onclick="linkWebTracker()"><i class="fa fas  fa-plus"></i> Link</button>
                     </div>
                  </div>
               </div>
            </div>
            <!-- Modal -->
            <div class="modal fade" id="modal_sniperhost_landpage_selection" tabindex="-1" role="dialog" aria-hidden="true">
               <div class="modal-dialog" role="document">
                  <div class="modal-content">
                     <div class="modal-header">
                        <h5 class="modal-title">Link SniperHost Landing Page</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">&times;</button>
                     </div>
                     <div class="modal-body">
                        <div class="form-group row m-t-20">
                           <label for="landpage_selector" class="col-sm-4  control-label col-form-label">Select landing page:</label>
                           <div class="col-md-8">
                              <select class="select2 form-control " id="landpage_selector" style="height: 36px;width: 100%;">
                              </select>
                           </div>
                        </div>
                     </div>
                     <div class="modal-footer" >
                        <button type="button" class="btn btn-success" onclick="linkLandpage()"><i class="fa fas  fa-plus"></i> Link</button>
                     </div>
                  </div>
               </div>
            </div>
            <!-- Modal -->
            <div class="modal fade" id="ModalStore" tabindex="-1" role="dialog" aria-hidden="true">
               <div class="modal-dialog" role="document">
                  <div class="modal-content">
                     <div class="modal-header">
                        <h5 class="modal-title">Sample Mail Templates</h5>
                        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close">&times;</button>
                     </div>
                     <div class="modal-body">
                        <div class="form-group row m-t-20">
                           <label for="selector_sample_mailtemplates" class="col-sm-4  control-label col-form-label">Select mail template:</label>
                              <div class="col-md-8">
                                 <select class="select2 form-control custom-select" id="selector_sample_mailtemplates" style="height: 36px;width: 100%;">
                                 </select>
                              </div>
                        </div>
                        <i id="lb_selector_common_mail_sender_note"></i>
                     </div>
                     <div class="modal-footer" >
                        <button type="button" class="btn btn-success" onclick="insertMailTemplate()"><i class="mdi mdi-arrow-bottom-left"></i> Insert</button>
                     </div>
                  </div>
               </div>
            </div>
            <!-- Modal -->
            <div class="modal fade" id="modal_media_link" tabindex="-1" role="dialog" aria-hidden="true">
               <div class="modal-dialog" role="document">
                  <div class="modal-content">
                     <div class="modal-body">
                        <div class="form-group row  m-t-20">
                           <label for="modal_media_link_text" class="col-sm-2 control-label col-form-label">Text:</label>
                           <div class="col-sm-10">
                              <input type="text" class="form-control" id="modal_media_link_text">
                           </div>
                        </div>
                        <div class="form-group row  m-t-20">
                           <label for="modal_media_link_url" class="col-sm-2 control-label col-form-label">URL:</label>
                           <div class="col-sm-10">
                              <input type="text" class="form-control" id="modal_media_link_url" placeholder="https://">
                           </div>
                        </div>
                     </div>
                     <div class="modal-footer" >
                        <button type="button" class="btn btn-success" onclick="insertMedia('link')"><i class="mdi mdi-arrow-bottom-left"></i> Insert</button>
                     </div>
                  </div>
               </div>
            </div>
            <!-- Modal -->
            <div class="modal fade" id="modal_media_pic" tabindex="-1" role="dialog" aria-hidden="true">
               <div class="modal-dialog" role="document">
                  <div class="modal-content">
                     <div class="modal-body">
                        <div class="form-group">
                           <div class="text-center dropzone align-items-center box" ondrop="uploadFile(event,uploadMailBodyFiles,this)" onclick="$('#pic-uploader').trigger('click');" >
                              <i class="fas fa-download fa-2x"></i><br/><div id="upload_msg">Drop the image here (or click)</div>    
                           </div>                             
                           <input type="file" accept="image/*" id="pic-uploader" onchange="getBase64ofFile(uploadMailBodyFiles,this.files[0], this)" hidden="">
                        </div>
                        <div class="form-group col-md-12 text-center">
                           Or
                        </div>
                        <div class="form-group row">
                           <label for="modal_media_pic_url" class="col-sm-2 control-label col-form-label">Link:</label>
                           <div class="col-sm-10">
                              <input type="text" class="form-control" id="modal_media_pic_url" placeholder="https://">
                           </div>
                        </div>
                     </div>
                     <div class="modal-footer col-md-12">
                        <button type="button" class="btn btn-success" onclick="insertMedia('pic')"><i class="mdi mdi-arrow-bottom-left"></i> Insert</button>
                     </div>
                  </div>
               </div>
            </div>
            <!-- Modal -->
            <div class="modal fade" id="modal_media_video" tabindex="-1" role="dialog" aria-hidden="true">
               <div class="modal-dialog" role="document">
                  <div class="modal-content">
                     <div class="modal-body">
                        <div class="form-group">
                           <div class="text-center dropzone align-items-center box" ondrop="uploadFile(event,uploadMailBodyFiles,this)" onclick="$('#video-uploader').trigger('click');" >
                              <i class="fas fa-download fa-2x"></i><br/><div id="upload_msg">Drop the video here (or click)</div>    
                           </div>                             
                           <input type="file" id="video-uploader" accept="image/*" onchange="getBase64ofFile(uploadMailBodyFiles,this.files[0],this)" hidden="">
                        </div>
                        <div class="form-group col-md-12 text-center">
                           Or
                        </div>
                        <div class="form-group row">
                           <label for="modal_media_video_url" class="col-sm-2 control-label col-form-label">Link:</label>
                           <div class="col-sm-10">
                              <input type="text" class="form-control" id="modal_media_video_url" placeholder="https://">
                           </div>
                        </div>
                     </div>
                     <div class="modal-footer" >
                        <button type="button" class="btn btn-success" onclick="insertMedia('video')"><i class="mdi mdi-arrow-bottom-left"></i> Insert</button>
                     </div>
                  </div>
               </div>
            </div>
            
         
         <?php include(dirname(__FILE__).'/components/foot.php'); ?>

      </div>

</div>
<!-- END MAIN CONTAINER -->

    <?php include(dirname(__FILE__).'/components/script.php'); ?>

      <!-- All Jquery -->
      <!-- ============================================================== -->
      <script src="<?php echo url ?>/js/libs/js.cookie.min.js"></script>   
      <!-- Bootstrap tether Core JavaScript -->
      <script src="<?php echo url ?>/js/libs/popper.min.js"></script>
      <script src="<?php echo url ?>/js/libs/bootstrap.min.js"></script>
      <!--Menu sidebar -->
      <script src="<?php echo url ?>/js/libs/perfect-scrollbar.jquery.min.js"></script>
      <!--Custom JavaScript -->
      <script src="<?php echo url ?>/js/libs/custom.min.js"></script>
      <!-- this page js -->
      <script src="<?php echo url ?>/js/libs/jquery/datatables.js"></script>  
      <script src="<?php echo url ?>/js/libs/summernote-bs4.min.js"></script>
      <script src="<?php echo url ?>/js/libs/codemirror.min.js"></script>
      <script src="<?php echo url ?>/js/libs/moment.min.js"></script>
      <script src="<?php echo url ?>/js/common_scripts.js"></script>
      <script src="<?php echo url ?>/js/mail_template.js"></script>
      <?php
         echo '<script>';
         if(isset($_GET['action'])){
            echo'
             get_domain_list("' . doFilter($_GET['template'],'ALPHA_NUM') . '");';
         }else{
            echo' get_domain_list(null);';
         }
        
        echo' function getlanding(){
            var id  = $("#domain").val();
            get_landings(id);
          }
       ';
         
       if(isset($_GET['action'])){
         echo'
          get_landings_edit("' . doFilter($_GET['template'],'ALPHA_NUM') . '");';
      }

         if(isset($_GET['action']) && isset($_GET['template']) && $_GET['template'] != ''){
               echo '$("#section_view_mail_template_list").hide();
                        $("#section_add_mail_template").show();';
               echo 'getMailTemplateFromTemplateId("' . doFilter($_GET['template'],'ALPHA_NUM') . '");
                     getStoreList();';      
         }
         else{
            echo '$("#section_add_mail_template").hide();
                    loadTableMailTemplateList();
                    $("#store-area").hide();';
         }

         echo '</script>';
      ?>
      <script defer src="<?php echo url ?>/js/libs/sidebarmenu.js"></script>  
      <script defer src="<?php echo url ?>/js/libs/select2.min.js"></script>
      <script defer src="<?php echo url ?>/js/libs/toastr.min.js"></script> 
      <script defer src="<?php echo url ?>/js/libs/codemirror.xml.min.js"></script>

      
</body>
</html>
