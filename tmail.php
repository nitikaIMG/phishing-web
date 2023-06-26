<?php
require_once(dirname(__FILE__) . '/config/db.php');
require_once(dirname(__FILE__) . '/manager/common_functions.php');
require_once(dirname(__FILE__) . '/libs/browser_detect/BrowserDetection.php');
date_default_timezone_set('UTC');

if(isset($_GET['rid']))
    $user_id = doFilter($_GET['rid'],'ALPHA_NUM');
else
    $user_id = 'Failed';

if(isset($_GET['mid']))
    $campaign_id = doFilter($_GET['mid'],'ALPHA_NUM');
else
    $campaign_id = 'Failed';
    
if(isset($_GET['mtid'])){
    $mail_template_id = explode('_', $_GET['mtid'])[0];   //expects mtid_<random number>
    $mail_template_id = doFilter($mail_template_id,'ALPHA_NUM');
}
else
    $mail_template_id = 'Failed';

//Verify campaign is active
$user_details = verifyMailCmapaignUser($conn, $campaign_id, $user_id);
if(verifyMailCmapaign($conn, $campaign_id) == true && $user_details != 'empty'){

    $date_time = round(microtime(true) * 1000); //(new DateTime())->format('d-m-Y H:i:s.u');    
    $mail_open_times ='';

    if(empty($user_details['mail_open_times']))
        $mail_open_times = json_encode(array($date_time));
    else{
        $tmp=json_decode($user_details['mail_open_times']);
        array_push($tmp,$date_time);
        $mail_open_times = json_encode($tmp);
    }

    $stmt = $conn->prepare("UPDATE tb_data_mailcamp_live SET mail_open_times=? WHERE campaign_id=? AND rid=?");
    $stmt->bind_param('sss', $mail_open_times,$campaign_id,$user_id);
    $stmt->execute();
    displayImage($mail_template_id);
}

function displayImage($mail_template_id){
  	$images = glob("uploads/timages/".$mail_template_id.".timg");
  	if(empty($images))
  		  $remoteImage = "uploads/timages/default.jpg";
  	else
  		  $remoteImage = $images[0];
  	$imginfo = getimagesize($remoteImage);
  	header("Cache-Control: no-store");
  	header("Content-type: {$imginfo['mime']}");
  	readfile($remoteImage);
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