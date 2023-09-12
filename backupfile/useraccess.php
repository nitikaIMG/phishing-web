<?php
   require_once(dirname(__FILE__).'/manager/session_manager.php');
//    if(isSessionValid() == true){
//       header("Location: index.php");
//       die();
//   }

   if(isset($_GET['action'])){
        if (!empty($_GET['action']) && !empty($_GET['id'])) {
            $getloginde = getaccessuser($_GET['id']);
            createSession(true,$getloginde['contact_mail']);
            header("Location: index.php");
            die();
        }
    }else{
        die();
    }
?>

<?php 
require_once (dirname(__FILE__).'/includes/config.php');
?>
