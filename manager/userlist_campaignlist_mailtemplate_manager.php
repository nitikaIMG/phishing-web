<?php
require_once(dirname(__FILE__) . '/session_manager.php');
require_once(dirname(__FILE__) . '/common_functions.php');
require_once(dirname(__FILE__,2) . '/libs/symfony/autoload.php');
require_once(dirname(__FILE__,2) . '/libs/qr_barcode/qrcode.php');
require_once(dirname(__FILE__,2) . '/libs/qr_barcode/barcode.php');
use Symfony\Component\Mailer\Transport;
use Symfony\Component\Mailer\Mailer;
use Symfony\Component\Mime\Email;
use PHPMailer\PHPMailer;
use PHPMailer\SMTP;
use PHPMailer\Exception;
use PHPMailer\PHPMailer\PHPMailer as PHPMailerPHPMailer;


require_once(dirname(__FILE__,2).'/vendor/phpmailer/phpmailer/src/Exception.php');
require_once(dirname(__FILE__,2).'/vendor/phpmailer/phpmailer/src/PHPMailer.php');
require_once(dirname(__FILE__,2).'/vendor/phpmailer/phpmailer/src/SMTP.php');

//-------------------------------------------------------
date_default_timezone_set('UTC');
$entry_time = (new DateTime())->format('d-m-Y h:i A');
header('Content-Type: application/json');
$userid = $_SESSION['user'][0];
// $userid = $_SESSION['admincontact_mail'];


if (isset($_POST)){
	
	$POSTJ = json_decode(file_get_contents('php://input'),true);

	if(isset($POSTJ['action_type'])){
		if($POSTJ['action_type'] == "add_user_to_table")
			addUserToTable($conn, $POSTJ);
		if($POSTJ['action_type'] == "save_user_group")
			saveUserGroup($conn, $POSTJ['user_group_id'], $POSTJ['user_group_name'],$userid);
		if($POSTJ['action_type'] == "update_user")
			updateUser($conn,$POSTJ);
		if($POSTJ['action_type'] == "delete_user")
			deleteUser($conn, $POSTJ['user_group_id'], $POSTJ['uid']);
		if($POSTJ['action_type'] == "download_user")
			downloadUser($conn,$POSTJ['user_group_id']);
		if($POSTJ['action_type'] == "get_user_group_list")
			getUserGroupList($conn,$userid );
		if($POSTJ['action_type'] == "upload_user")
			uploadUserCVS($conn,$POSTJ);
		if($POSTJ['action_type'] == "get_user_group_from_group_Id_table")
			getUserGroupFromGroupIdTable($conn,$POSTJ);
		if($POSTJ['action_type'] == "delete_user_group_from_group_id")
			deleteUserGroupFromGroupId($conn,$POSTJ['user_group_id']);
		if($POSTJ['action_type'] == "make_copy_user_group")
			makeCopyUserGroup($conn, $POSTJ['user_group_id'], $POSTJ['new_user_group_id'], $POSTJ['new_user_group_name'],$userid);

		if($POSTJ['action_type'] == "save_mail_template")
			saveMailTemplate($conn,$POSTJ);
		if($POSTJ['action_type'] == "get_mail_html")
			getmailhtml($conn,$POSTJ);
		if($POSTJ['action_type'] == "get_mail_template_list")
			getMailTemplateList($conn);
		if($POSTJ['action_type'] == "get_mail_template_from_template_id")
			getMailTemplateFromTemplateId($conn,$POSTJ['mail_template_id']);
		if($POSTJ['action_type'] == "delete_mail_template_from_template_id")
			deleteMailTemplateFromTemplateId($conn,$POSTJ['mail_template_id']);
		if($POSTJ['action_type'] == "make_copy_mail_template")
			makeCopyMailTemplate($conn, $POSTJ['mail_template_id'], $POSTJ['new_mail_template_id'], $POSTJ['new_mail_template_name']);
		if($POSTJ['action_type'] == "upload_tracker_image")
			uploadTrackerImage($conn,$POSTJ);
		if($POSTJ['action_type'] == "upload_attachments")
			uploadAttachment($conn,$POSTJ);
		if($POSTJ['action_type'] == "upload_mail_body_files")
			uploadMailBodyFiles($conn,$POSTJ);

		if($POSTJ['action_type'] == "save_sender_list")
			saveSenderList($conn, $POSTJ,$userid);
		if($POSTJ['action_type'] == "save_sender_list_by_admin")
			saveSenderListByAdmin($conn, $POSTJ);
		if($POSTJ['action_type'] == "get_sender_list")
			getSenderList($conn,$userid);	
		if($POSTJ['action_type'] == "check_default_integration")
		checkDefaultIntegration($conn);	
		if($POSTJ['action_type'] == "get_sender_list_admin")
			getSenderListAdmin($conn);	
		if($POSTJ['action_type'] == "get_sender_from_sender_list_id")
			getSenderFromSenderListId($conn,$POSTJ['sender_list_id']);	
		if($POSTJ['action_type'] == "delete_mail_sender_list_from_list_id")
			deleteMailSenderListFromSenderId($conn,$POSTJ['sender_list_id']);
		if($POSTJ['action_type'] == "make_copy_sender_list")
			makeCopyMailSenderList($conn,$POSTJ['sender_list_id'],$POSTJ['new_sender_list_id'],$POSTJ['new_sender_list_name'],$userid);
		if($POSTJ['action_type'] == "verify_mailbox_access")
			verifyMailboxAccess($conn,$POSTJ);

		if($POSTJ['action_type'] == "send_test_mail_verification")
			sendTestMailVerification($conn,$POSTJ);
		if($POSTJ['action_type'] == "send_test_mail_sample")
			sendTestMailSample($conn,$POSTJ);
		if($POSTJ['action_type'] == "user_group_domain_verify")
			domainverification($conn,$POSTJ,$userid);
		if($POSTJ['action_type'] == "get_users_list")
			getuserslist($conn,$POSTJ,$userid);
		if($POSTJ['action_type'] == "multi_get_mcampinfo_from_mcamp_list_id_get_live_mcamp_data_admin")
			multi_get_mcampinfo_from_mcamp_list_id_get_live_mcamp_data_admin($conn,$POSTJ);
	}
	if(isset($_POST['action_type'])){
		if($_POST['action_type'] == "add_mail_verification")
			addverificationmail($conn,$_POST,$userid);
		if($_POST['action_type'] == "domain_otp_verfication")
			domainotpverification($conn,$_POST,$userid);
		if($_POST['action_type'] == "delete_domain_verfication")
		delete_domain($conn,$_POST,$userid);
	}
}
//-----------------------------
function addUserToTable($conn, &$POSTJ){
	$user_group_id = $POSTJ['user_group_id'];
	$user_group_name = $POSTJ['user_group_name'];
	if(empty($user_group_name))
		die(json_encode(['result' => 'failed', 'error' => 'Error adding user!']));			

	$row = getUserGroupFromGroupId($conn, $user_group_id);
	if(empty($row) || empty($row["user_data"]))
		$user_data =[];
	else
		$user_data = json_decode($row["user_data"],true);

	$uid = getRandomStr(10);
	array_push($user_data,['uid'=>$uid, 'fname'=>$POSTJ['fname'], 'lname'=>$POSTJ['lname'], 'email'=>$POSTJ['email'], 'company'=>$POSTJ['company'], 'job' =>$POSTJ['job']]);
	$user_data = json_encode(array_unique($user_data, SORT_REGULAR));

	if(checkAnIDExist($conn,$user_group_id,'user_group_id','tb_core_mailcamp_user_group')){
		$stmt = $conn->prepare("UPDATE tb_core_mailcamp_user_group SET user_group_name=?, user_data=? WHERE user_group_id=?");
		$stmt->bind_param('sss', $user_group_name,$user_data,$user_group_id);
	}
	else{
		$stmt = $conn->prepare("INSERT INTO tb_core_mailcamp_user_group(user_group_id,user_group_name,user_data,date) VALUES(?,?,?,?)");
		$stmt->bind_param('ssss', $user_group_id,$user_group_name,$user_data,$GLOBALS['entry_time']);
	}

	if($stmt->execute() === TRUE){
		echo(json_encode(['result' => 'success']));	
	}
	else 
		echo(json_encode(['result' => 'failed', 'error' => 'Error adding user!']));			
}

function saveUserGroup($conn, $user_group_id, $user_group_name,$userid ){
	// print_r($_SESSION['user'][0]);die;
	
	if(checkAnIDExist($conn,$user_group_id,'user_group_id','tb_core_mailcamp_user_group')){
		$stmt = $conn->prepare("UPDATE tb_core_mailcamp_user_group SET user_group_name=? WHERE user_group_id=?");
		$stmt->bind_param('ss', $user_group_name,$user_group_id);
	}
	else{
		$stmt = $conn->prepare("INSERT INTO tb_core_mailcamp_user_group(user_group_id,user_group_name,date,userid) VALUES(?,?,?,?)");
		$stmt->bind_param('ssss', $user_group_id,$user_group_name,$GLOBALS['entry_time'],$userid);
	}
	
	if ($stmt->execute() === TRUE)
		echo(json_encode(['result' => 'success']));	
	else 
		echo(json_encode(['result' => 'failed', 'error' => 'Error saving data!']));	
}

function updateUser($conn, &$POSTJ){
	$user_group_id = $POSTJ['user_group_id'];
	$uid = $POSTJ['uid'];

	$row = getUserGroupFromGroupId($conn, $user_group_id);

	if(!empty($row)){
		$user_data = json_decode($row["user_data"],true);

		$index = array_search($uid, array_column($user_data, 'uid'));
		if($index !== false ){	//returns false if not found
			$user_data[$index]= ['uid'=>$uid, 'fname'=>$POSTJ['fname'], 'lname'=>$POSTJ['lname'], 'email'=>$POSTJ['email'], 'company'=>$POSTJ['company'], 'job'=>$POSTJ['job']];
			$user_data = json_encode($user_data);
			$stmt = $conn->prepare("UPDATE tb_core_mailcamp_user_group SET user_data=? WHERE user_group_id=?");
			$stmt->bind_param('ss', $user_data,$user_group_id);
			if($stmt->execute() === TRUE)
				echo(json_encode(['result' => 'success']));				
			else 
				echo(json_encode(['result' => 'failed', 'error' => 'Error updating row!']));		
		}
		else
			echo(json_encode(['result' => 'failed', 'error' => 'Error updating row. User not found!']));
	}
	else
		echo(json_encode(['result' => 'failed', 'error' => 'Error updating row. User group not found!']));	
}

function deleteUser($conn, $user_group_id, $uid){
	$stmt = $conn->prepare("SELECT user_data FROM tb_core_mailcamp_user_group WHERE user_group_id = ?");
	$stmt->bind_param("s", $user_group_id);
	$stmt->execute();
	$result = $stmt->get_result();
	if($result->num_rows != 0){
		$row = $result->fetch_assoc();
		$user_data = json_decode($row["user_data"],true);

		$index = array_search($uid, array_column($user_data, 'uid'));
		if($index !== false ){	//returns false if not found
			unset($user_data[$index]);
			$user_data = json_encode($user_data);
			$stmt = $conn->prepare("UPDATE tb_core_mailcamp_user_group SET user_data=? WHERE user_group_id=?");
			$stmt->bind_param('ss', $user_data,$user_group_id);
			if($stmt->execute() === TRUE)
				echo(json_encode(['result' => 'success']));				
			else 
				echo(json_encode(['result' => 'failed', 'error' => 'Error deleting row!']));		
		}else
			echo(json_encode(['result' => 'failed', 'error' => 'Error deleting row. User not found!']));
	}
	else
		echo(json_encode(['result' => 'failed', 'error' => 'Error deleting row. User group not found!']));	
}

function downloadUser($conn, $user_group_id){
	$stmt = $conn->prepare("SELECT user_data,user_group_name FROM tb_core_mailcamp_user_group WHERE user_group_id = ?");
	$stmt->bind_param("s", $user_group_id);
	$stmt->execute();
	$result = $stmt->get_result();
	if($result->num_rows != 0){
		$row = $result->fetch_assoc();
		$user_data = json_decode($row["user_data"],true);

		$f = fopen('php://memory', 'w'); 
		fputcsv($f, ['First Name', 'Last Name', 'Email', 'Company', 'Job'], ','); 

	    foreach ($user_data as $line) {
	    	unset($line['uid']);	//remove uid field
	        fputcsv($f, $line, ','); 
	    }

	    fseek($f, 0);
	    header('Content-Type: text/csv');
	    header('Content-Disposition: attachment; filename='.$row['user_group_name']);
	    fpassthru($f);
	}
	else
		echo(json_encode(['result' => 'failed', 'error' => 'Error updating row. User group not found!']));	
}

function getUserGroupList($conn,$userid ){
	$resp = [];
	$DTime_info = getTimeInfo($conn);
	$result = mysqli_query($conn, "SELECT user_group_id,user_group_name,user_data,JSON_LENGTH(user_data) as user_count,date FROM tb_core_mailcamp_user_group WHERE userid=$userid");
	$stmt = $conn->prepare("SELECT domain FROM tb_mail_verify WHERE userid = $userid AND status = 1");
	$stmt->execute();
	$result1 = $stmt->get_result();
	$row1 = mysqli_fetch_all($result1, MYSQLI_ASSOC);
	
	$test = array_column($row1, 'domain');

	if(mysqli_num_rows($result) > 0){
		foreach (mysqli_fetch_all($result, MYSQLI_ASSOC) as $row){
		  
		  if ($row["user_data"] != null) {
            $user_data = json_decode($row["user_data"], true);
            if ($user_data) {
                $emails = array_column($user_data, 'email');
                $userem = array();
                foreach ($emails as $key => $useremail) {
                    $usere = end(explode('@', $useremail));
                    if (in_array($usere, $test)) {
                        array_push($userem, '<span class="verdom label-table" style="display: inline-block; margin-bottom: 1px; color:black"><b>' . $usere . '</b></span>');
                    } else {
                        array_push($userem, '<span class="unverdom label-table" style="display: inline-block; margin-bottom: 1px; color:black"><b>' . $usere . '</b></span>');
                    }
                }
                $row["user_data"] = implode(' ', $userem);
            }
        }
			//avoid double json encoding
			$row["date"] = getInClientTime_FD($DTime_info,$row['date'],null,'d-m-Y h:i A');
        	array_push($resp,$row);
		}
		echo json_encode($resp, JSON_INVALID_UTF8_IGNORE);
	}
	else
		echo json_encode(['error' => 'No data']);	
}

function getuserslist($conn,$userid ){
	$resp = [];
	$DTime_info = getTimeInfo($conn);
	$result = mysqli_query($conn, "SELECT id,name,username, contact_mail FROM tb_main Where user_role = 0");
	if(mysqli_num_rows($result) > 0){
		foreach (mysqli_fetch_all($result, MYSQLI_ASSOC) as $row){
        	array_push($resp,$row);
		}
		echo json_encode($resp, JSON_INVALID_UTF8_IGNORE);
	}
	else
		echo json_encode(['error' => 'No data']);	
}

function multi_get_mcampinfo_from_mcamp_list_id_get_live_mcamp_data_admin($conn, $POSTJ){

    $resp = [];
	// $userid=$_SESSION['user'][0];

	$stmt = $conn->prepare("SELECT tb_core_mailcamp_list.campaign_id as campaign_id , tb_core_mailcamp_list.userid,tb_core_mailcamp_list.campaign_name as campaign_name,tb_core_mailcamp_list.campaign_data,tb_core_mailcamp_list.date,tb_core_mailcamp_list.scheduled_time,tb_core_mailcamp_list.scheduled_date,tb_core_mailcamp_list.stop_time,tb_core_mailcamp_list.camp_status,tb_core_mailcamp_list.employees,tb_core_mailcamp_list.camp_lock,tb_data_mailcamp_live.sending_status,tb_data_mailcamp_live.send_time,tb_data_mailcamp_live.user_name,tb_data_mailcamp_live.user_email,tb_data_mailcamp_live.send_error,tb_data_mailcamp_live.mail_open_times,tb_data_mailcamp_live.public_ip,tb_data_mailcamp_live.ip_info,tb_data_mailcamp_live.user_agent,tb_data_mailcamp_live.mail_client,tb_data_mailcamp_live.platform,tb_data_mailcamp_live.device_type,tb_data_mailcamp_live.all_headers,tb_data_mailcamp_live.payloads_clicked,tb_data_mailcamp_live.employees_compromised,tb_data_mailcamp_live.emails_reported,tb_data_mailcamp_live.mail_replies
	FROM tb_core_mailcamp_list LEFT JOIN tb_data_mailcamp_live 
	ON tb_core_mailcamp_list.campaign_id = tb_data_mailcamp_live.campaign_id ");
	$stmt->execute();
	$result = $stmt->get_result();
	$rows = $result->fetch_all(MYSQLI_ASSOC);
	
	$stmt1 = $conn->prepare("SELECT * FROM tb_core_mailcamp_list LEFT JOIN tb_data_mailcamp_live 
	ON tb_core_mailcamp_list.campaign_id = tb_data_mailcamp_live.campaign_id WHERE tb_core_mailcamp_list.camp_status = '4' AND tb_core_mailcamp_list.date <= DATE_SUB(NOW(),INTERVAL 1 YEAR) AND tb_data_mailcamp_live.sending_status = '2'");
	$stmt1->execute();
	$result1 = $stmt1->get_result();
	$rows1 = $result1->fetch_all(MYSQLI_ASSOC);

	$stmt2 = $conn->prepare("SELECT * FROM tb_core_mailcamp_list WHERE  stop_time != 'NULL' ");
	$stmt2->execute();
	$result2 = $stmt2->get_result();
	$rows2 = $result2->fetch_all(MYSQLI_ASSOC);
	
	$stmt3 = $conn->prepare("SELECT * FROM tb_core_mailcamp_list LEFT JOIN tb_data_mailcamp_live 
	ON tb_core_mailcamp_list.campaign_id = tb_data_mailcamp_live.campaign_id WHERE tb_core_mailcamp_list.camp_status = '4' AND tb_core_mailcamp_list.date <= DATE_SUB(NOW(),INTERVAL 1 YEAR) AND tb_data_mailcamp_live.sending_status = '2' AND tb_data_mailcamp_live.mail_open_times != 'null'");
	$stmt3->execute();
	$result3 = $stmt3->get_result();
	$rows3 = $result3->fetch_all(MYSQLI_ASSOC);

	$stmt4 = $conn->prepare("SELECT * FROM tb_core_mailcamp_list LEFT JOIN tb_data_mailcamp_live 
	ON tb_core_mailcamp_list.campaign_id = tb_data_mailcamp_live.campaign_id WHERE tb_core_mailcamp_list.camp_status != '4' AND tb_core_mailcamp_list.date <= DATE_SUB(NOW(),INTERVAL 1 YEAR) AND tb_data_mailcamp_live.sending_status != '2'");
	$stmt4->execute();
	$result4 = $stmt4->get_result();
	$rows4 = $result4->fetch_all(MYSQLI_ASSOC);

	$stmt5 = $conn->prepare("SELECT * FROM tb_core_mailcamp_list LEFT JOIN tb_data_mailcamp_live 
	ON tb_core_mailcamp_list.campaign_id = tb_data_mailcamp_live.campaign_id WHERE  tb_core_mailcamp_list.camp_status = '4' AND tb_core_mailcamp_list.date <= DATE_SUB(NOW(),INTERVAL 1 YEAR) AND tb_data_mailcamp_live.sending_status = '2' AND tb_data_mailcamp_live.mail_replies != 'null'");
	$stmt5->execute();
	$result5 = $stmt5->get_result();
	$rows5 = $result5->fetch_all(MYSQLI_ASSOC);


	$stmtyear = $conn->prepare("SELECT * FROM tb_core_mailcamp_list LEFT JOIN tb_data_mailcamp_live 
	ON tb_core_mailcamp_list.campaign_id = tb_data_mailcamp_live.campaign_id WHERE tb_core_mailcamp_list.camp_status = '4' AND tb_core_mailcamp_list.date <= DATE_SUB(NOW(),INTERVAL 1 YEAR) ");
	$stmtyear->execute();
	$resultyear = $stmtyear->get_result();
	$rowsyear = $resultyear->fetch_all(MYSQLI_ASSOC);
    
	if(mysqli_num_rows($result) > 0){
		foreach ($rows as $row){
			$row['scheduled_datetime'] = chnageutcformate($row['scheduled_date']);
        	array_push($resp,$row);
		}
	}
		$total = count($rows);
		$year_count = count($rows1);
        $past_camp  = count($rows2);
		$opend_mail = count($rows3);
		$sent_failed_count = count($rows4);
		$mail_replies = count($rows5);

		echo json_encode(['resp'=>$resp,'total'=>$total,'year_count'=>$year_count,'opend_mail'=>$opend_mail,'sent_failed_count'=>$sent_failed_count,'past_camp'=>$past_camp,'mail_replies'=>$mail_replies,'phishingmail'=>$rowsyear], JSON_INVALID_UTF8_IGNORE);
}

function uploadUserCVS($conn, &$POSTJ){
	$user_group_id = $POSTJ['user_group_id'];	
	$user_group_name = $POSTJ['user_group_name'];
	$user_data = explode("\n", $POSTJ['user_data']);
	array_shift($user_data);	//removes column heading 
	$user_data = array_map('trim', $user_data);	//trim array strings
	$user_data = array_filter(($user_data));	//removes empty array
	$arr_users=[];

	foreach ($user_data as $user) {
		$user = explode(",", $user);
		$uid = getRandomStr(10);

		if(isValidEmail($user[1]))
	    	array_push($arr_users,['uid'=>$uid, 'fname'=>$user[0], 'lname'=>null, 'email'=>$user[1], 'company'=>$user[2], 'job'=>$user[3]]);
    	elseif(isValidEmail($user[2]))
	    	array_push($arr_users,['uid'=>$uid, 'fname'=>$user[0], 'lname'=>$user[1], 'email'=>$user[2], 'company'=>$user[3], 'job'=>$user[4]]);
    	else
    		die(json_encode(['result' => 'failed', 'error' => 'Import failed. Invalid email at '. $user[2]]));
	}

	$row = getUserGroupFromGroupId($conn, $user_group_id);
	if(!empty($row['user_data']))
		$old_user_data = json_decode($row["user_data"],true);
	else
		$old_user_data = [];

	$user_data = array_merge($old_user_data,$arr_users);
	$user_data = json_encode($user_data);

	if(checkAnIDExist($conn,$user_group_id,'user_group_id','tb_core_mailcamp_user_group')){
		$stmt = $conn->prepare("UPDATE tb_core_mailcamp_user_group SET user_group_name=?, user_data=? WHERE user_group_id=?");
		$stmt->bind_param('sss', $user_group_name,$user_data,$user_group_id);
	}
	else{
		$stmt = $conn->prepare("INSERT INTO tb_core_mailcamp_user_group(user_group_id,user_group_name,user_data,date) VALUES(?,?,?,?)");
		$stmt->bind_param('ssss', $user_group_id,$user_group_name,$user_data,$GLOBALS['entry_time']);
	}

	if($stmt->execute() === TRUE){
		echo(json_encode(['result' => 'success']));	
	}
	else 
		echo(json_encode(['result' => 'failed', 'error' => 'Error importing user data!']));
}

function getUserGroupFromGroupIdTable($conn,&$POSTJ){
	$offset = htmlspecialchars($POSTJ['start']);
	$limit = htmlspecialchars($POSTJ['length']);
	$draw = htmlspecialchars($POSTJ['draw']);
	$search_value = htmlspecialchars($POSTJ['search']['value']);
	$data = array();
	$columnSortOrder = $POSTJ['order'][0]['dir'] == 'asc'?'asc':'desc'; // asc or desc
	$totalRecords = 0;
	$user_group_id = $POSTJ['user_group_id'];
	if(empty($search_value))
		$totalRecords_with_filter = $totalRecords;
	else
		$totalRecords_with_filter = 0;	//will be updated from below

	$arr_filtered=[];
	$row = getUserGroupFromGroupId($conn, $user_group_id);

	if(!empty($row)){
	    if($row["user_data"] != null){
		$user_data = json_decode($row["user_data"],true);
		foreach ($user_data as $item){
			$item['fname'] = ucfirst($item['fname']);
			$item['lname'] = ucfirst($item['lname']);
			$item['company'] = ucfirst($item['company']);
			$item['job'] = ucfirst($item['job']);
		    $m_array = preg_grep('/.*'.$search_value.'.*/', $item);
		    if(!empty($m_array))
		    	array_push($arr_filtered, $item);
		}

		$totalRecords = sizeof($user_data);
	    }else{
	        $totalRecords = 0;
	    }
		$totalRecords_with_filter = sizeof($arr_filtered);
		$resp = array(
		  "draw" => intval($draw),
		  "recordsTotal" => intval($totalRecords),
		  "recordsFiltered" => intval($totalRecords_with_filter),
		  "data" => array_slice($arr_filtered, $offset, $limit)
		);

		$resp['user_group_name'] = $row['user_group_name'];
		echo json_encode($resp, JSON_INVALID_UTF8_IGNORE);
	}		
	else
		echo json_encode(['error' => 'No data']);	
}

function deleteUserGroupFromGroupId($conn,$user_group_id){	
	$stmt = $conn->prepare("DELETE FROM tb_core_mailcamp_user_group WHERE user_group_id = ?");
	$stmt->bind_param("s", $user_group_id);
	$stmt->execute();
	if($stmt->affected_rows != 0)
		echo json_encode(['result' => 'success']);	
	else
		echo json_encode(['result' => 'failed', 'error' => 'User group does not exist']);	
	$stmt->close();
}

function makeCopyUserGroup($conn, $old_user_group_id, $new_user_group_id, $new_user_group_name,$userid){
	$stmt = $conn->prepare("INSERT INTO tb_core_mailcamp_user_group (user_group_id,user_group_name,userid,user_data,date) SELECT ?, ?,userid,user_data,? FROM tb_core_mailcamp_user_group WHERE user_group_id=?");
	$stmt->bind_param("ssss", $new_user_group_id, $new_user_group_name, $GLOBALS['entry_time'], $old_user_group_id);
	
	if($stmt->execute() === TRUE){
		echo(json_encode(['result' => 'success']));	
	}
	else 
		echo(json_encode(['result' => 'failed', 'error' => 'Error making copy!']));	
	$stmt->close();
}

function getUserGroupFromGroupId($conn, $user_group_id){
	$stmt = $conn->prepare("SELECT * FROM tb_core_mailcamp_user_group WHERE user_group_id = ?");
	$stmt->bind_param("s", $user_group_id);
	$stmt->execute();
	$result = $stmt->get_result();
	if($result->num_rows != 0)
		return $result->fetch_assoc();
	return [];
}
//---------------------------------------Email Template Section --------------------------------

function saveMailTemplate($conn, &$POSTJ){
	
    // $userid = $_SESSION['user'][0];
	$userid = $_SESSION['admin'][0];

    $mail_template_id = $POSTJ['mail_template_id'];
    if($mail_template_id == '')
        $mail_template_id = null;

    $mail_template_name = $POSTJ['mail_template_name'];
    $mail_template_subject = $POSTJ['mail_template_subject'];
    $mail_template_content = $POSTJ['mail_template_content'];
    $timage_type = $POSTJ['timage_type'];
    $attachments = json_encode($POSTJ['attachments']);
    $mail_content_type = $POSTJ['mail_content_type'];
    $entry_time = $GLOBALS['entry_time'];
    $domain = $POSTJ['domain'];
    $landing_page = $POSTJ['landing_page'];
    $domain_name = $POSTJ['domain_name'];
    $landing_name = $POSTJ['landing_name'];

    $mail_template_content = str_replace('{{landing_page}}', 'https://' . $domain_name . '/' . $landing_name, $mail_template_content);

    if (strpos($mail_template_content, 'payloadtrack') === false) {
        $mail_template_content = '<a href="https://' . $domain_name . '/' . $landing_name.'?landingmid={{MID}}&amp;landingrid={{RID}}">' . $mail_template_content . '</a>';
    }

    if(checkAnIDExist($conn, $mail_template_id, 'mail_template_id', 'tb_core_mailcamp_template_list')){
        $stmt = $conn->prepare("UPDATE `tb_core_mailcamp_template_list` SET `mail_template_name`='$mail_template_name', `mail_template_subject`='$mail_template_subject', `mail_template_content`='$mail_template_content', `timage_type`='$timage_type', `mail_content_type`='$mail_content_type', `attachment`='$attachments',`userid`='$userid',`domain`='$domain',`landing_page`='$landing_page' WHERE `mail_template_id`='$mail_template_id'");
    } else {
        $stmt = $conn->prepare("INSERT INTO `tb_core_mailcamp_template_list`(`mail_template_id`, `mail_template_name`, `mail_template_subject`, `mail_template_content`, `timage_type`, `mail_content_type`, `attachment`,`userid`, `date`,`domain`,`landing_page`) VALUES ('$mail_template_id','$mail_template_name','$mail_template_subject','$mail_template_content','$timage_type','$mail_content_type','$attachments',$userid,'$entry_time','$domain','$landing_page')");
    }

    if ($stmt->execute() === TRUE){
        echo(json_encode(['result' => 'success']));    
    } else {
        echo(json_encode(['result' => 'failed', 'error' => $stmt->error]));    
    }
}

function getmailhtml($conn,$POSTJ){
	$resp = [];
	$DTime_info = getTimeInfo($conn);
	$id=$POSTJ['mail_template_id'];
	$result = mysqli_query($conn, "SELECT mail_template_id, mail_template_name, mail_template_subject, mail_template_content,attachment,date FROM tb_core_mailcamp_template_list  Where mail_template_id='$id' ");

	if(mysqli_num_rows($result) > 0){
		foreach (mysqli_fetch_all($result, MYSQLI_ASSOC) as $row){
			$row["attachment"] = json_decode($row["attachment"]);	//avoid double json encoding
			$row["date"] = getInClientTime_FD($DTime_info,$row['date'],null,'M d, Y h:i A');
        	array_push($resp,$row);
		}
		echo json_encode($resp, JSON_INVALID_UTF8_IGNORE);
	}
	else
		echo json_encode(['error' => 'No data']);	
	$result->close();
}

function getMailTemplateList($conn){
	$resp = [];
	$DTime_info = getTimeInfo($conn);
	// $userid=$_SESSION['user'][0];
	// $result = mysqli_query($conn, "SELECT mail_template_id, mail_template_name, LEFT(mail_template_subject , 50) mail_template_subject, LEFT(mail_template_content , 50) mail_template_content,attachment,date FROM tb_core_mailcamp_template_list WHERE userid='$userid'");

	$result = mysqli_query($conn, "SELECT mail_template_id, mail_template_name, LEFT(mail_template_subject , 50) mail_template_subject, LEFT(mail_template_content , 50) mail_template_content,attachment,date FROM tb_core_mailcamp_template_list ");
	if(mysqli_num_rows($result) > 0){
		foreach (mysqli_fetch_all($result, MYSQLI_ASSOC) as $row){
			$row["attachment"] = json_decode($row["attachment"]);	//avoid double json encoding
			$row["date"] = getInClientTime_FD($DTime_info,$row['date'],null,'M d, Y h:i A');
        	array_push($resp,$row);
		}
		echo json_encode($resp, JSON_INVALID_UTF8_IGNORE);
	}
	else
		echo json_encode(['error' => 'No data']);	
	$result->close();
}

function getMailTemplateFromTemplateId($conn, $mail_template_id){
	$stmt = $conn->prepare("SELECT t.*, d.name as domain_name,l.page_file_name FROM tb_core_mailcamp_template_list AS t
                       JOIN tb_domains AS d ON t.domain = d.id
					   JOIN tb_hland_page_list AS l ON t.landing_page = l.hlp_id
                       WHERE t.mail_template_id = ?");
	$stmt->bind_param("s", $mail_template_id);
	$stmt->execute();
	$result = $stmt->get_result();
	if($result->num_rows != 0){
		$row = $result->fetch_assoc() ;
		$row['attachment'] = json_decode($row['attachment']);
		echo json_encode($row, JSON_INVALID_UTF8_IGNORE) ;
	}
	else
		echo json_encode(['error' => 'No data']);				
	$stmt->close();
}

function deleteMailTemplateFromTemplateId($conn,$mail_template_id){	
	$stmt = $conn->prepare("DELETE FROM tb_core_mailcamp_template_list WHERE mail_template_id = ?");
	$stmt->bind_param("s", $mail_template_id);
	$stmt->execute();
	if($stmt->affected_rows != 0)
		echo json_encode(['result' => 'success']);	
	else
		echo json_encode(['result' => 'failed', 'error' => 'Mail template does not exist']);	
	$stmt->close();
}

function makeCopyMailTemplate($conn, $old_mail_template_id, $new_mail_template_id, $new_mail_template_name){
	$userid=$_SESSION['user'][0];
	$stmt = $conn->prepare("INSERT INTO tb_core_mailcamp_template_list (mail_template_id,userid,mail_template_name,mail_template_subject,mail_template_content,timage_type,mail_content_type,attachment,date) SELECT ?,userid,?, mail_template_subject,mail_template_content,timage_type,mail_content_type,attachment,? FROM tb_core_mailcamp_template_list WHERE mail_template_id=?");
	$stmt->bind_param("ssss", $new_mail_template_id, $new_mail_template_name, $GLOBALS['entry_time'], $old_mail_template_id);
	
	if ($stmt->execute() === TRUE)
		echo json_encode(['result' => 'success']);	
	else
		echo json_encode(['result' => 'failed', 'error' => $stmt->error]);	
	$stmt->close();
}

function uploadTrackerImage($conn,&$POSTJ){
	$mail_template_id = $POSTJ['mail_template_id'];
	$file_name = filter_var($POSTJ['file_name'], FILTER_SANITIZE_STRING);
	$file_b64 = explode(',', $POSTJ['file_b64'])[1];
	$binary_data = base64_decode($file_b64);

	$target_file = dirname(__FILE__,2).'/uploads/timages/'.$mail_template_id.'.timg';
	if(getimagesizefromstring($binary_data)){
        try{
        	file_put_contents($target_file,$binary_data);
        	echo(json_encode(['result' => 'success']));	
        }catch(Exception $e) {
			echo(json_encode(['result' => 'failed', 'error' => $e->getMessage()]));	
		}        	
    }
    else
    	echo(json_encode(['result' => 'failed', 'error' => 'Invalid file']));	
}

function uploadAttachment($conn,&$POSTJ){
	$mail_template_id = $POSTJ['mail_template_id'];
	$file_name = filter_var($POSTJ['file_name'], FILTER_SANITIZE_STRING);
	$file_b64 = explode(',', $POSTJ['file_b64'])[1];
	$binary_data = base64_decode($file_b64);
	$file_id = $mail_template_id.'_'.time();

	$target_file = '../uploads/attachments/'.$file_id.'.att';

	if (!is_dir('../uploads/attachments/')) 
		die(json_encode(['result' => 'failed', 'error' => 'Directory spear/uploads/attachments/ does not exist']));
	if (!is_writable('../uploads/attachments/')) 
		die(json_encode(['result' => 'failed', 'error' => 'Directory spear/uploads/attachments/ has no write permission']));

	try{
    	if(file_put_contents($target_file,$binary_data) || file_exists($target_file))	//if 0 size file failed, check if they exist (written)
    		echo(json_encode(['result' => 'success', 'file_id' => $file_id]));	
    	else
			echo(json_encode(['result' => 'failed', 'error' => 'File upload failed!']));	
    }catch(Exception $e) {
		echo(json_encode(['result' => 'failed', 'error' => $e->getMessage()]));	
	}       
}

function uploadMailBodyFiles($conn,&$POSTJ){
	$mail_template_id = $POSTJ['mail_template_id'];
	$file_name = filter_var($POSTJ['file_name'], FILTER_SANITIZE_STRING);
	$file_b64 = explode(',', $POSTJ['file_b64'])[1];
	$binary_data = base64_decode($file_b64);
	$file_id_part = time();
	$file_id = $mail_template_id.'_'.$file_id_part;

	$target_file = dirname(__FILE__,2).'/uploads/attachments/'.$file_id.'.mbf';

	if (!is_dir(dirname(__FILE__,2).'/uploads/attachments/')) 
		die(json_encode(['result' => 'failed', 'error' => 'Directory spear/uploads/attachments/ does not exist']));
	if (!is_writable(dirname(__FILE__,2).'/uploads/attachments/')) 
		die(json_encode(['result' => 'failed', 'error' => 'Directory spear/uploads/attachments/ has no write permission']));

	try{
    	if(file_put_contents($target_file,$binary_data) || file_exists($target_file))	//if 0 size file failed, check if they exist (written)
    		echo(json_encode(['result' => 'success', 'file_id' => $file_id, "mbf" => $file_id_part]));	
    	else
    		echo(json_encode(['result' => 'failed', 'error' => $e->getMessage()]));	
    }catch(Exception $e) {
		echo(json_encode(['result' => 'failed', 'error' =>'File upload failed!']));	
	}       
}

//---------------------------------------Sender List Section --------------------------------
function saveSenderList($conn, &$POSTJ,$userid){

	$user_id = $_SESSION['user'][0];
	$sender_list_id = $POSTJ['sender_list_id'];
	$sender_list_mail_sender_name = $POSTJ['sender_list_mail_sender_name'];
	$sender_list_mail_sender_SMTP_server = $POSTJ['sender_list_mail_sender_SMTP_server'];
	$sender_list_mail_sender_from = $POSTJ['sender_list_mail_sender_from'];
	$sender_list_mail_sender_acc_username = $POSTJ['sender_list_mail_sender_acc_username'];
	$sender_list_mail_sender_acc_pwd = $POSTJ['sender_list_mail_sender_acc_pwd'];
	$auto_mailbox = $POSTJ['cb_auto_mailbox'];
	// $mail_sender_mailbox = $POSTJ['mail_sender_mailbox'];
	$mail_sender_mailbox =(explode(':',$POSTJ['sender_list_mail_sender_SMTP_server'])[0]).':993/imap/ssl}INBOX';
	$sender_list_cust_headers = json_encode($POSTJ['sender_list_cust_headers']); 
	$dsn_type = $POSTJ['dsn_type'];

	if(checkAnIDExist($conn,$sender_list_id,'sender_list_id','tb_core_mailcamp_sender_list')){

		$resultexists = mysqli_query($conn, "SELECT * FROM `tb_core_mailcamp_sender_list` WHERE `userid` = $user_id AND `sender_acc_username` LIKE '$sender_list_mail_sender_acc_username' AND `sender_acc_pwd` LIKE '$sender_list_mail_sender_acc_pwd' AND sender_list_id != '$sender_list_id' ");

		if(mysqli_num_rows($resultexists) > 0 ){
			echo json_encode(['result' => 'failed','msg'=>'sender already exists !']);
			exit();			
		}else{
				if($sender_list_mail_sender_acc_pwd != ''){	//new sender acc pwd
					$stmt = $conn->prepare("UPDATE tb_core_mailcamp_sender_list SET sender_name=?, sender_SMTP_server=?, sender_from=?, sender_acc_username=?, sender_acc_pwd=?, cust_headers=?, dsn_type=? WHERE sender_list_id=?");
					$stmt->bind_param('ssssssss', $sender_list_mail_sender_name,$sender_list_mail_sender_SMTP_server,$sender_list_mail_sender_from,$sender_list_mail_sender_acc_username,$sender_list_mail_sender_acc_pwd,$sender_list_cust_headers,$dsn_type,$sender_list_id);
				}
				else{	//sender acc pwd has no change
					$stmt = $conn->prepare("UPDATE tb_core_mailcamp_sender_list SET sender_name=?, sender_SMTP_server=?, sender_from=?, sender_acc_username=?, cust_headers=?, dsn_type=? WHERE sender_list_id=?");
					$stmt->bind_param('sssssss', $sender_list_mail_sender_name,$sender_list_mail_sender_SMTP_server,$sender_list_mail_sender_from,$sender_list_mail_sender_acc_username,$sender_list_cust_headers,$dsn_type,$sender_list_id);
				}
	    }
	}
	else{

		$resultexists = mysqli_query($conn, "SELECT * FROM `tb_core_mailcamp_sender_list` WHERE `userid` = $user_id AND `sender_acc_username` LIKE '$sender_list_mail_sender_acc_username' AND `sender_acc_pwd` LIKE '$sender_list_mail_sender_acc_pwd'");

		if(mysqli_num_rows($resultexists) > 0 ){
			echo json_encode(['result' => 'failed','msg'=>'sender already exists !']);
			exit();			
		}else{
			$stmt = $conn->prepare("INSERT INTO tb_core_mailcamp_sender_list(sender_list_id,userid,sender_name,sender_SMTP_server,sender_from,sender_acc_username,sender_acc_pwd,auto_mailbox,sender_mailbox,cust_headers,dsn_type,date) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)");
			$stmt->bind_param('ssssssssssss', $sender_list_id,$userid,$sender_list_mail_sender_name,$sender_list_mail_sender_SMTP_server,$sender_list_mail_sender_from,$sender_list_mail_sender_acc_username,$sender_list_mail_sender_acc_pwd,$auto_mailbox,$mail_sender_mailbox,$sender_list_cust_headers,$dsn_type,$GLOBALS['entry_time']);
		}
	}
	
	if ($stmt->execute() === TRUE)
		echo json_encode(['result' => 'success','msg'=>'successfully added !']);
	else 
		echo json_encode(['result' => 'failed' ,'msg'=>'error saving data !']);
    }
function saveSenderListByAdmin($conn, &$POSTJ){

	$adminid = $_SESSION['admincontact_mail'];
	if(isset($adminid)){
		$user_id = 1;
	$status = $POSTJ['status_val'];
	$sender_list_id = $POSTJ['sender_list_id'];
	$sender_list_mail_sender_name = $POSTJ['sender_list_mail_sender_name'];
	$sender_list_mail_sender_SMTP_server = $POSTJ['sender_list_mail_sender_SMTP_server'];
	$sender_list_mail_sender_from = $POSTJ['sender_list_mail_sender_from'];
	$sender_list_mail_sender_acc_username = $POSTJ['sender_list_mail_sender_acc_username'];
	$sender_list_mail_sender_acc_pwd = $POSTJ['sender_list_mail_sender_acc_pwd'];
	$auto_mailbox = $POSTJ['cb_auto_mailbox'];
	// $mail_sender_mailbox = $POSTJ['mail_sender_mailbox'];
	$mail_sender_mailbox =(explode(':',$POSTJ['sender_list_mail_sender_SMTP_server'])[0]).':993/imap/ssl}INBOX';
	$sender_list_cust_headers = json_encode($POSTJ['sender_list_cust_headers']); 
		$dsn_type = $POSTJ['dsn_type'];

	$stmt = $conn->prepare("INSERT INTO tb_core_mailcamp_sender_list(sender_list_id,userid,sender_name,sender_SMTP_server,sender_from,sender_acc_username,sender_acc_pwd,auto_mailbox,sender_mailbox,cust_headers,dsn_type,date,status) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)");
		$stmt->bind_param('sssssssssssss', $sender_list_id,$user_id,$sender_list_mail_sender_name,$sender_list_mail_sender_SMTP_server,$sender_list_mail_sender_from,$sender_list_mail_sender_acc_username,$sender_list_mail_sender_acc_pwd,$auto_mailbox,$mail_sender_mailbox,$sender_list_cust_headers,$dsn_type,$GLOBALS['entry_time'],$status);

		if ($stmt->execute() === TRUE)
		echo json_encode(['result' => 'success']);
	else 
		echo 'false';die();
		echo json_encode(['result' => 'failed']);
	}
}

function getSenderList($conn,$userid){
	
	$resp = [];
	$resp1 = [];
	$DTime_info = getTimeInfo($conn);
	$result = mysqli_query($conn, "SELECT sender_list_id,sender_name,sender_SMTP_server,sender_from,sender_acc_username,sender_mailbox,cust_headers,dsn_type,date,status FROM tb_core_mailcamp_sender_list where userid=$userid");
	$result1 = mysqli_query($conn, "SELECT sender_list_id,sender_name,sender_SMTP_server,sender_from,sender_acc_username,sender_mailbox,cust_headers,dsn_type,date,status FROM tb_core_mailcamp_sender_list where status = 0");
	
	if(mysqli_num_rows($result) > 0 || mysqli_num_rows($result1) > 0){
		foreach (mysqli_fetch_all($result, MYSQLI_ASSOC) as $row){
			$row["cust_headers"] = json_decode($row["cust_headers"]);	//avoid double json encoding
			$row["date"] = getInClientTime_FD($DTime_info,$row['date'],null,'d-m-Y h:i A');
        	array_push($resp,$row);
		}
		foreach (mysqli_fetch_all($result1, MYSQLI_ASSOC) as $row){
			
			$row["cust_headers"] = json_decode($row["cust_headers"]);	//avoid double json encoding
			$row["date"] = getInClientTime_FD($DTime_info,$row['date'],null,'d-m-Y h:i A');
        	array_push($resp1,$row);
		}
		$main_resp = array_merge($resp,$resp1);
		echo json_encode($main_resp, JSON_INVALID_UTF8_IGNORE);
	}
	else
		echo json_encode(['error' => 'No data']);	
	$result->close();
}

function getSenderListAdmin($conn){

	$resp = [];
	$DTime_info = getTimeInfo($conn);
	$result = mysqli_query($conn, "SELECT sender_list_id,sender_name,sender_SMTP_server,sender_from,sender_acc_username,sender_mailbox,cust_headers,dsn_type,date,status FROM tb_core_mailcamp_sender_list where userid=1");
	if(mysqli_num_rows($result) > 0){
		foreach (mysqli_fetch_all($result, MYSQLI_ASSOC) as $row){
			$row["cust_headers"] = json_decode($row["cust_headers"]);	//avoid double json encoding
			$row["date"] = getInClientTime_FD($DTime_info,$row['date'],null,'d-m-Y h:i A');
        	array_push($resp,$row);
		}
    
		echo json_encode($resp, JSON_INVALID_UTF8_IGNORE);
	}
	else
		echo json_encode(['error' => 'No data']);	
	$result->close();
}

function checkDefaultIntegration($conn){
	$myarr = [];
	$sql ="SELECT * FROM tb_core_mailcamp_sender_list where status = 0";
	$result = mysqli_query($conn, $sql);
	foreach (mysqli_fetch_all($result, MYSQLI_ASSOC) as $row){
		array_push($myarr,$row);
	}
     $arr_cnt = count($myarr);
	  if($arr_cnt >= 1){
		  echo json_encode(true, JSON_INVALID_UTF8_IGNORE);
	  }
}

function getSenderFromSenderListId($conn, $sender_list_id){
	$stmt = $conn->prepare("SELECT sender_name,sender_SMTP_server,sender_from,sender_acc_username,auto_mailbox,sender_mailbox,cust_headers,dsn_type FROM tb_core_mailcamp_sender_list WHERE sender_list_id = ?");
	$stmt->bind_param("s", $sender_list_id);
	$stmt->execute();
	$result = $stmt->get_result();
	if($result->num_rows > 0){
		$row = $result->fetch_assoc() ;
		$row["cust_headers"] = json_decode($row["cust_headers"]);	//avoid double json encoding
		echo json_encode($row, JSON_INVALID_UTF8_IGNORE) ;
	}			
	else
		echo json_encode(['error' => 'No data']);	
	$stmt->close();
}

function deleteMailSenderListFromSenderId($conn, $sender_list_id){	
	$stmt = $conn->prepare("DELETE FROM tb_core_mailcamp_sender_list WHERE sender_list_id = ?");
	$stmt->bind_param("s", $sender_list_id);
	$stmt->execute();
	if($stmt->affected_rows != 0)
		echo json_encode(['result' => 'success']);	
	else
		echo json_encode(['result' => 'failed', 'error' => 'Error deleting sender!']);	
	$stmt->close();
}

function makeCopyMailSenderList($conn, $old_sender_list_id, $new_sender_list_id, $new_sender_list_name,$userid){
	$stmt = $conn->prepare("INSERT INTO tb_core_mailcamp_sender_list (sender_list_id,sender_name,userid,sender_SMTP_server,sender_from,sender_acc_username,sender_acc_pwd,auto_mailbox,sender_mailbox,cust_headers,dsn_type,date) SELECT ?, ?, userid, sender_SMTP_server,sender_from,sender_acc_username,sender_acc_pwd,auto_mailbox,sender_mailbox,cust_headers,dsn_type,? FROM tb_core_mailcamp_sender_list WHERE sender_list_id=?");
	$stmt->bind_param("ssss", $new_sender_list_id, $new_sender_list_name, $GLOBALS['entry_time'], $old_sender_list_id);
	
	if ($stmt->execute() === TRUE)
		echo json_encode(['result' => 'success']);	
	else
		echo json_encode(['result' => 'failed', 'error' => $stmt->error]);	
	$stmt->close();
}

function verifyMailboxAccess($conn, $POSTJ){
	$sender_list_id = $POSTJ['sender_list_id'];
	$sender_username = $POSTJ['mail_sender_acc_username'];
	$sender_pwd = $POSTJ['mail_sender_acc_pwd'];
	$sender_mailbox = $POSTJ['mail_sender_mailbox'];

	if(empty($sender_pwd))
		$sender_pwd = getSenderPwd($conn, $sender_list_id);

	if(empty($sender_pwd))
		die(json_encode(['result' => 'failed', 'error' => "Sender list does not exist. Please fill the password field"]));	
	else{
		try{
			$imap_obj = imap_open($sender_mailbox,$sender_username,$sender_pwd);		
	    	$resp = ['result' => 'success', 'total_msg_count' => imap_num_msg($imap_obj)];
		} catch (Exception $e) {
	  		$resp = ['result' => 'failed', 'error' =>$e->getMessage()];
		}

		$imap_err = imap_errors(); //required to capture imap errors
		if(!empty($imap_err))
			$resp = ['result' => 'failed', 'error' => $imap_err];	
	}	

	echo json_encode($resp);
}

//---------------------------------------End Sender List Section --------------------------------
//====================================================================================================
function sendTestMailVerification($conn,$POSTJ){
	$sender_list_id = $POSTJ['sender_list_id'];
	$smtp_server = $POSTJ['sender_list_mail_sender_SMTP_server'];
	$sender_from = $POSTJ['sender_list_mail_sender_from'];
	$sender_username = $POSTJ['sender_list_mail_sender_acc_username'];
	$sender_pwd = $POSTJ['sender_list_mail_sender_acc_pwd'];
	$cust_headers = $POSTJ['sender_list_cust_headers'];
	$test_to_address = $POSTJ['test_to_address'];
	$mail_subject = "SniperPhish Test Mail";
	$mail_body = "Success. Here is the test message body";
	$mail_content_type = "text/plain";
	$dsn_type = $POSTJ['dsn_type'];
	$message = (new Email());

	//-----------------------------------
	if(empty($sender_pwd))
		$sender_pwd = getSenderPwd($conn, $sender_list_id);

	if(empty($sender_pwd))
		die(json_encode(['result' => 'failed', 'error' => "Sender list does not exist. Please fill the password field"]));	
	else
		shootMail($message,$smtp_server,$sender_username,$sender_pwd,$sender_from,$test_to_address,$cust_headers,$mail_subject,$mail_body,$mail_content_type,$dsn_type);
}

function sendTestMailSample($conn,$POSTJ){
	$sender_list_id = $POSTJ['sender_list_id'];
	$smtp_server = $POSTJ['smtp_server'];
	$sender_from = $POSTJ['sender_from'];
	$sender_username = $POSTJ['sender_username'];
	$sender_pwd = $POSTJ['sender_pwd'];
	$cust_headers = $POSTJ['cust_headers'];
	$test_to_address = $POSTJ['test_to_address'];
	$mail_subject = $POSTJ['mail_subject'];
	$mail_body = $POSTJ['mail_body'];
	$mail_content_type = $POSTJ['mail_content_type'];
	$mail_attachment = $POSTJ['attachments'];


	$keyword_vals = array();
	$serv_variables = getServerVariable($conn);
	$RID = getRandomStr(10);

    $keyword_vals['{{RID}}'] = $RID;
    $keyword_vals['{{MID}}'] = "MailCampaign_id";
    $keyword_vals['{{NAME}}'] = "ABC XYZ";
    $keyword_vals['{{FNAME}}'] = "ABC";
    $keyword_vals['{{LNAME}}'] = "XYZ";
    $keyword_vals['{{NOTES}}'] = "Note_content";
    $keyword_vals['{{EMAIL}}'] = $test_to_address;
    $keyword_vals['{{FROM}}'] = $sender_from;
    $keyword_vals['{{TRACKINGURL}}'] = $serv_variables['baseurl'].'/mid='."MailCampaign_id".'&rid='.$RID;
    $keyword_vals['{{TRACKER}}'] = '<img src="'.$keyword_vals['{{TRACKINGURL}}'].'"/>';
    $keyword_vals['{{BASEURL}}'] = $serv_variables['baseurl'];
	$keyword_vals['{{MUSERNAME}}'] = explode('@', $test_to_address)[0];
	$keyword_vals['{{MDOMAIN}}'] = explode('@', $test_to_address)[1];

	if(empty($sender_pwd)){
		$stmt = $conn->prepare("SELECT sender_acc_pwd FROM tb_core_mailcamp_sender_list WHERE sender_list_id = ?");
		$stmt->bind_param("s", $sender_list_id);
		$stmt->execute();
		$result = $stmt->get_result();
		if($row = $result->fetch_assoc())
			$sender_pwd = $row['sender_acc_pwd'];
		else
			die(json_encode(['result' => 'failed', 'error' => "Sender list does not exist. Please fill the password field"]));	
	}

	$message = (new Email());
	$mail_subject = filterKeywords($mail_subject,$keyword_vals);
	$mail_body = filterKeywords($mail_body,$keyword_vals);  	
	$mail_body = filterQRBarCode($mail_body,$keyword_vals,$message);

	foreach ($mail_attachment as $attachment) {
		$file_path = dirname(__FILE__,2).'/uploads/attachments/'.$attachment['file_id'].'.att';
		$file_disp_name = filterKeywords($attachment['file_disp_name'],$keyword_vals);

		if($attachment['inline'])
	    	$message->embedFromPath($file_path, $file_disp_name);
	    else
	    	$message->attachFromPath($file_path, $file_disp_name);
	}

	//---------------------------
	shootMail($message,$smtp_server,$sender_username,$sender_pwd,$sender_from,$test_to_address,$cust_headers,$mail_subject,$mail_body,$mail_content_type);  
}

//===================================================================================================
function getSenderPwd(&$conn, &$sender_list_id){
	$stmt = $conn->prepare("SELECT sender_acc_pwd FROM tb_core_mailcamp_sender_list WHERE sender_list_id = ?");
	$stmt->bind_param("s", $sender_list_id);
	$stmt->execute();
	$result = $stmt->get_result();
	if($row = $result->fetch_assoc())
		return $row['sender_acc_pwd'];
	else
		return "";
}

function domainverification($conn,$POSTJ,$userid){
	$stmt = $conn->prepare("SELECT * FROM tb_mail_verify WHERE userid = $userid");
	$stmt->execute();
	$result = $stmt->get_result();
	$row = mysqli_fetch_all($result, MYSQLI_ASSOC) ;
	$tablecon = '';
	$tablecon .= '
				<form class="needs-validation" novalidate id="targetUserForm2" onsubmit="updateTarget()">
					<div class="card-body">
						<div class="form-group row center-block" id="addUserForm">
							<div class="col-lg-2">
								<button type="button" style="
								height: 41px;
								width: 197px;
							" class="btn btn-primary" id="addTarget2"  data-bs-toggle="modal" data-bs-target="#Modal4">
									<i class="fa fa-handshake"></i> Verify a New Domain
								</button>
							</div>
						</div>
						<div class="card">
							<h4 class="col-md-12 m-t-10" style="text-align:center; border-bottom-style:inset; border-bottom-width:thin">Domain Status</h4>
							<div class="table-responsive">
								<style>
									.domainV td {
										padding: 0.25rem;
									}
								</style>
								<table id="zero_config4" class="table editable-table table-bordered  m-b-0 domainV w-100" style="text-align:center">
									<thead>
										<tr>
											<th>Domain Name</th>
											<th>Email Address</th>
											<th style="width:70px">Status</th>
											<th style="width:70px">Action</th>
										</tr>
									</thead>
									<tbody>';
									foreach($row as $rrow){
										if($rrow["status"] == "0"){
											$name = "Pending";
											$clr = "btn-danger";
										}else{
											$name = "Verified";
											$clr = "btn-success";
										}
											$tablecon .='<tr>
												<td style="width:366px">'.$rrow["domain"].'</td>
												<td>'.$rrow["email"].'</td>
												<td>
														<button type="button" class="btn btn-sm '.$clr.'" disabled=""><i class="mdi mdi-verified"></i> '.$name.'</button>
												</td>
												<td>
													<a style="color:#2962FF; cursor:pointer" data-toggle="tooltip" data-placement="top" title="Delete Domain" onclick="return deleteDomain(\''.$rrow["id"].'\')">
														<i class="mdi mdi-close" style="font-size:large"></i>
													</a>
												</td>
											</tr>';
									}
									$tablecon .= '</tbody>
								</table>
							</div>
						</div>
					</div>
				</form>

				<script>
					//$("#zero_config4").DataTable();
					$("#zero_config4").DataTable({
						"columnDefs": [
							{
								"targets": [1],
								"visible": false,
								"searchable": false
							}
						]
					});
					//$("#zero_config4").DataTable();

					$("#zero_config4").on("click", "a", function () {
						$("#zero_config4").DataTable().row($(this).parents("tr")).remove().draw(false);
					});

					$("#zero_config4").on("click", "button", function () {
						var email = $("#zero_config4").DataTable().row($(this).parents("tr")).data()[1];
						$("#Modal4").modal("toggle");
						$("#eVAddress").val(email);
						$("#codeInputDiv").show();
					});

					function verifyDomain() {
						$("#domainerr").html("");
						$("#verifyDomainForm").addClass("was-validated");
						var domainn = eVAddress.value.split("@")[1];
						var freedomain = ["gmail.com","outlook.com","hotmail.com","yahoo.com"];
						var res = freedomain.indexOf(domainn)
						if(res != -1){
							$("#domainerr").html("Email Delivery Failed - Domain verification of free email services is not supported e.g. gmail, hotmail, etc.")
							return false;
						}

						// toastr.error(result, eVAddress.value);
						if ($("#eVAddress")[0].checkValidity()) {
							var dataPost = {
								emailAddress: eVAddress.value,
								action_type: "add_mail_verification",
								emaildomain: domainn
							};
							console.log(dataPost);
							$.ajax({
								url: "manager/userlist_campaignlist_mailtemplate_manager",
								type: "post",
								traditional: true,
								data: dataPost,
								dataType: "json",
								success: function (response) {
									if(response.result == "success"){
										Swal.fire({
											position: "center",
											icon: "success",
											title: "mail successfully send",
											text: "otp send to your mail please verify your domain",
											showConfirmButton: true,
										})
										$("#codeInputDiv").show();
								}
								else {
										Swal.fire({
											position: "center",
											icon: "error",
											title: "Something went wrong",
											showConfirmButton: true,
										})
									}
								},
								error: function (xhr, status) {
									toastr.error("Email Delivery API Failed - Try Again", "Domain Verification");
								}
							});

							return true;
						}
					}

					function reloadVerification() {
						if ($("#codeInputDiv").is(":visible")) {
							$("#Modal3").modal("toggle");
							$(".modal-backdrop").remove();
							viewDomainVerification();
						}
					}

					function reloadPage() {
						location.href = "/User/TargetUsers";
					}

					function codeVerification() {
						$("#codeInputDiv").addClass("was-validated");
						if ($("#eVCode")[0].checkValidity()) {
							var dataPost = {
								emailAddress: eVAddress.value,
								code: eVCode.value,
								action_type:"domain_otp_verfication"
							};
							$.ajax({
								url: "manager/userlist_campaignlist_mailtemplate_manager",
								type: "post",
								traditional: true,
								data: dataPost,
								dataType: "json",
								contentType: "application/x-www-form-urlencoded",
								success: function (result) {
									if (result.result) {
										Swal.fire({
											position: "center",
											icon: "success",
											title: "OTP Verified",
											showConfirmButton: true,
										})
										$("#vCodeButton").attr("disabled", true);
									}
									else {
										Swal.fire({
											position: "center",
											icon: "error",
											title: "Something went wrong",
											showConfirmButton: true,
										})
									}
								},
								error: function (xhr, status) {
									toastr.error("Code Verification API Failed - Try Again", "Domain Verification");
								}
							});

							return true;
						}
					}

					function deleteDomain(dDomain) {
						var dataPost = {
							domainName: dDomain,
							action_type:"delete_domain_verfication"
						};
						$.ajax({
							url: "manager/userlist_campaignlist_mailtemplate_manager",
							type: "post",
							traditional: true,
							data: dataPost,
							dataType: "json",
							success: function (result) {
								console.log(result)
								if (result.result == "success") {
										Swal.fire({
											position: "center",
											icon: "success",
											title: "Successfully Deleted",
											showConfirmButton: true,
										})
								}
								else {
										Swal.fire({
											position: "center",
											icon: "error",
											title: "Something went wrong",
											showConfirmButton: true,
										})
								}
							},
							error: function (xhr, status) {
								toastr.error("Error deleting domain - Back-end API issue", "Domain Deletion");
							}
						});
						return true;
					}
				</script>';

	echo json_encode(['result' => 'success', 'msg'=>$tablecon]);
}

function addverificationmail($conn,$POST,$userid){

	$email = $POST['emailAddress'];
	$email_domain = $POST['emaildomain'];
	$code = rand(100000,999999);
	$stmt = $conn->prepare("INSERT INTO tb_mail_verify(userid,email,domain,code) VALUES(?,?,?,?)");
	$stmt->bind_param('ssss', $userid,$email,$email_domain,$code);
	if($stmt->execute() === TRUE){
		$msg = "Hi,<p>It looks you requested for SnipierPhish domain verification. Use this code: ".$code." to verify your domain</p>";
		$headers = "MIME-Version: 1.0" . "\r\n";
		$headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";


		$mail = new PHPMailerPHPMailer(true);
		$mail->isSMTP();
		$mail->Host = 'smtp.gmail.com';
		$mail->SMTPAuth = true;
		$mail->SMTPSecure = 'tls';
		$mail->Port = 587;
		$mail->Username = 'abhishek@techowl.in'; // YOUR email username
		$mail->Password = 'Ilovegirtiger@5831'; // YOUR email password
		// Sender and recipient settings
		$mail->setFrom('abhishek@techowl.in', 'Phishing');
		$mail->addAddress($email ,'Test');
		$mail->IsHTML(true);
		$mail->Subject = "Domain Verification";
		$mail->Body = $msg;

		$ismailsent = $mail->send();


		if(!$ismailsent) {
			die(json_encode(['result' => 'failed'])); 
		}else{
			echo(json_encode(['result' => 'success']));
		}
			
	}
	else 
		echo(json_encode(['result' => 'failed', 'error' => 'Domain Verification']));	
}


function domainotpverification($conn,$POST,$userid){
	$stmt = $conn->prepare("SELECT * FROM tb_mail_verify WHERE email = ? AND code = ?");
	$stmt->bind_param("ss",$POST['emailAddress'],$POST['code']);
	$stmt->execute();
	$result = $stmt->get_result();
	if($row = $result->fetch_assoc()){
		$id = $row['id'];
		$status = "1";
		$code = rand(100000,999999);
		$stmt = $conn->prepare("UPDATE tb_mail_verify SET status=?, code=? WHERE id=?");
		$stmt->bind_param('sss', $status,$code,$id);
		if($stmt->execute() === TRUE){
			echo(json_encode(['result' => 'success']));	
		}
		else 
			echo(json_encode(['result' => 'failed', 'error' => 'Error adding user!']));	

	}else{

	}

}

function delete_domain($conn,$POST,$userid){
	$stmt = $conn->prepare("DELETE FROM tb_mail_verify WHERE id = ?");
	$stmt->bind_param("s", $POST["domainName"]);
	$stmt->execute();
	if($stmt->affected_rows != 0)
		echo json_encode(['result' => 'success']);	
	else
		echo json_encode(['result' => 'failed', 'error' => 'Error deleting sender!']);	
	$stmt->close();
}

function chnageutcformate($date){
    $resp = [];
	if($date!=''){
		$dates= explode(" - ",$date);

		$tz = new DateTimeZone('Asia/Kolkata'); 

		$start_date1 = new DateTime($dates[0]);
		$start_date1->setTimezone($tz);
		$start_date = $start_date1->format('Y-m-d h:i A');

		$end_date1 = new DateTime($dates[1]);
		$end_date1->setTimezone($tz);
		$end_date = $end_date1->format('Y-m-d h:i A');

		$date1 = explode(" ",$start_date);
		$date2 = explode(" ",$end_date);

		$start_time = $date1[1].' '.$date1[2];
		$end_time =$date2[1].' '.$date2[2];
		$start_date1= $date1[0];
		$end_date1 =$date2[0];

		$row['start_time'] = $start_time;
		$row['end_time'] = $end_time;
		$row['start_date'] = $start_date1;
		$row['end_date'] = $end_date1;
		array_push($resp,$row);


		return $resp;
	}else{
		return false;
	}
}
