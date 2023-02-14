<?php

require_once(dirname(__FILE__).'/manager/session_manager.php');
require_once(dirname(__FILE__).'/includes/config.php');
isSessionValid(true);
?>
<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
   <?php
   echo include(dirname(__FILE__).'/components/header.php');
        ?>
      <link rel="stylesheet" type="text/css" href="<?php echo url ?>/customecss/css/select2.min.css">
      <link rel="stylesheet" type="text/css" href="<?php echo url ?>/customecss/css/summernote-lite.min.css">
      <link rel="stylesheet" type="text/css" href="<?php echo url ?>/customecss/css/style.min.css">
      <link rel="stylesheet" type="text/css" href="<?php echo url ?>/customecss/css/dataTables.foundation.min.css">
      <link rel="stylesheet" type="text/css" href="<?php echo url ?>/customecss/css/codemirror.min.css">
    
      <link rel="stylesheet" type="text/css" href="<?php echo url ?>/customecss/css/toastr.min.css">
</head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
          
 <!--  BEGIN CONTENT AREA  -->
 <div id="content" class="main-content">
      <div id="main-wrapper">
            <div class="content" id="mail_content">
            </div>
      </div>
</div>


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
               echo ' var content = getmailhtml("' .$_GET['id'] . '");
               ';      
         echo '</script>';
      ?>
<script defer src="<?php echo url ?>/js/libs/sidebarmenu.js"></script>  
<script defer src="<?php echo url ?>/js/libs/select2.min.js"></script>
<script defer src="<?php echo url ?>/js/libs/toastr.min.js"></script> 
<script defer src="<?php echo url ?>/js/libs/codemirror.xml.min.js"></script>


</body>
</html>
