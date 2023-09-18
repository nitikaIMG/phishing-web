<?php
require_once(dirname(__FILE__) . '/config/db.php');
require_once(dirname(__FILE__) . '/manager/common_functions.php');
require_once(dirname(__FILE__) . '/libs/browser_detect/BrowserDetection.php');
date_default_timezone_set('UTC');

if(isset($_GET['landingrid']))

    $user_id = doFilter($_GET['landingrid'],'ALPHA_NUM');
   
else
    $user_id = 'Failed';

    // echo $user_id;
    // die();

if(isset($_GET['landingmid']))
    $campaign_id = doFilter($_GET['landingmid'],'ALPHA_NUM');
else
    $campaign_id = 'Failed';
    
$ua_info = new Wolfcast\BrowserDetection();
$public_ip = getPublicIP();
  
$user_details = verifyMailCmapaignUser($conn, $campaign_id, $user_id);

if(verifyMailCmapaign($conn, $campaign_id) == true && $user_details != 'empty'){
    $date_time = round(microtime(true) * 1000);
    $user_agent = htmlspecialchars($_SERVER['HTTP_USER_AGENT']);   
    $user_os = $ua_info->getPlatformVersion();
    $mail_client = getMailClient($user_agent); 
    $device_type = $ua_info->isMobile()?"Mobile":"Desktop";
    $allHeaders ='';

    if(empty($user_details['user_agent'])){
        $user_agent = json_encode(array($user_agent));
    }else{
         $tmp=json_decode($user_details['user_agent']);
         array_push($tmp,$user_agent);
         $user_agent = json_encode($tmp);
    }
 
    if(empty($user_details['platform'])){
         $user_os = json_encode(array($user_os));
    }else{
         $tmp=json_decode($user_details['platform']);
         array_push($tmp,$user_os);
         $user_os = json_encode($tmp);
     }
  
 
    if($mail_client == "unknown")
         $mail_client = $ua_info->getName().' '.($ua_info->getVersion() == "unknown"?"":$ua_info->getVersion());
 
    if(empty($user_details['mail_client']))
         $mail_client = json_encode(array($mail_client));
     else{
         $tmp=json_decode($user_details['mail_client']);
         array_push($tmp,$mail_client);
         $mail_client = json_encode($tmp);
     }
     
 
    $ip_info = getIPInfo($conn, $public_ip);
     
    if(empty($user_details['public_ip']))
     $public_ip = json_encode(array($public_ip));
    else{
         $tmp=json_decode($user_details['public_ip']);
         array_push($tmp,$public_ip);
         $public_ip = json_encode($tmp);
    }
 
    if(!empty($user_details['ip_info']))
         $ip_info = $user_details['ip_info'];
 
    if(empty($user_details['payloads_clicked'])){
         $payloads_clicked = json_encode(array($date_time));
    }else{
         $tmp=json_decode($user_details['payloads_clicked']);
         array_push($tmp,$date_time);
         $payloads_clicked = json_encode($tmp);
    }
 
    if(empty($user_details['device_type']))
     $device_type = json_encode(array($device_type));
    else{
         $tmp=json_decode($user_details['device_type']);
         array_push($tmp,$device_type);
         $device_type = json_encode($tmp);
    }
 
    foreach (apache_request_headers() as $headers => $value) { 
         $allHeaders .= htmlspecialchars("$headers: $value\r\n"); 
    } 

    if(empty($user_details['all_headers']))
         $allHeaders = json_encode(array($allHeaders));
    else{
         $tmp=json_decode($user_details['all_headers']);
         array_push($tmp,$allHeaders);
         $allHeaders = json_encode($tmp);
    }

    if(empty($user_details['employees_compromised'])){
        $employees_compromised = json_encode(array($date_time));
    }else{
        $tmp=json_decode($user_details['employees_compromised']);
        array_push($tmp,$date_time);
        $employees_compromised = json_encode($tmp);
    }

    $email_comp = $_POST['email'];
    if(isset($_POST['userpassword'])){
        $pass_comp = $_POST['userpassword'];
    }else{
        $pass_comp = $_POST['text'];
    }

    if (empty($user_details['compromised_email'])) {
        $compromised_email = json_encode(array($email_comp));
    } else {
        $tmp = json_decode($user_details['compromised_email'], true);
        if ($tmp === null) {
            $tmp = array($user_details['compromised_email']);
        }
        array_push($tmp, $email_comp);
        $compromised_email = json_encode($tmp);
    }

    if(empty($user_details['compromised_pass'])){
        $compromised_pass = json_encode(array($pass_comp));
    }else{
        $tmp = json_decode($user_details['compromised_pass'], true);
        if ($tmp === null) {
            $tmp = array($user_details['compromised_pass']);
        }
        array_push($tmp, $pass_comp);
        $compromised_pass = json_encode($tmp);
    }
    
    $stmt = $conn->prepare("UPDATE tb_data_mailcamp_live SET payloads_clicked=?,public_ip=?,mail_client=?,ip_info=?,user_agent=?,platform=?,device_type=?,all_headers=?,employees_compromised=?,compromised_email=? ,compromised_pass=? WHERE campaign_id=? AND rid=?");
    $stmt->bind_param('sssssssssssss', $payloads_clicked,$public_ip,$mail_client,$ip_info,$user_agent,$user_os,$device_type,$allHeaders,$employees_compromised,$compromised_email,$compromised_pass,$campaign_id,$user_id);
    $stmt->execute();

    displayImage();
}

function displayImage() {
    header("Location: landing.php");
    exit; // Ensure that the script exits after sending the header
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