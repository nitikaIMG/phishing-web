<?php
require_once(dirname(__FILE__) . '/config/db.php');
require_once(dirname(__FILE__) . '/manager/common_functions.php');
require_once(dirname(__FILE__) . '/libs/browser_detect/BrowserDetection.php');
date_default_timezone_set('UTC');

if(isset($_GET['payloadrid']))
    $user_id = doFilter($_GET['payloadrid'],'ALPHA_NUM');
else
    $user_id = 'Failed';

if(isset($_GET['payloadmid']))
    $campaign_id = doFilter($_GET['payloadmid'],'ALPHA_NUM');
else
    $campaign_id = 'Failed';
    
$user_details = verifyMailCmapaignUser($conn, $campaign_id, $user_id);
if(verifyMailCmapaign($conn, $campaign_id) == true && $user_details != 'empty'){
    $date_time = round(microtime(true) * 1000);

   
    if(empty($user_details['payloads_clicked'])){
        $payloads_clicked = json_encode(array($date_time));
    }else{
        $tmp=json_decode($user_details['payloads_clicked']);
        array_push($tmp,$date_time);
        $payloads_clicked = json_encode($tmp);
    }

    
    $stmt = $conn->prepare("UPDATE tb_data_mailcamp_live SET payloads_clicked=? WHERE campaign_id=? AND rid=?");
    $stmt->bind_param('sss', $payloads_clicked,$campaign_id,$user_id);
    $stmt->execute();
    displayImage();
}

function displayImage(){
    header("Location: landing.php");
  }

//-----------------------------------------
function verifyMailCmapaign($conn, $campaign_id){
    $stmt = $conn->prepare("SELECT scheduled_time,camp_status FROM tb_core_mailcamp_list where campaign_id = ?");
    $stmt->bind_param("s", $campaign_id);
    $stmt->execute();
    $result = $stmt->get_result();
    if($row = $result->fetch_assoc()){
        if($row['camp_status'] == 2 || $row['camp_status'] == 4)//If in-progress
          return true;
    } 
    return false;
}

function verifyMailCmapaignUser($conn, $campaign_id, $id){
    $stmt = $conn->prepare("SELECT * FROM tb_data_mailcamp_live WHERE campaign_id = ? AND rid=?");
    $stmt->bind_param("ss", $campaign_id,$id);
    $stmt->execute();
    $result = $stmt->get_result();
    if($result->num_rows > 0){
        $row = $result->fetch_assoc() ;
        return $row;
    }
    else    
        return 'empty';
}
?>