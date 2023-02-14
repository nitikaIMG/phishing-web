<?php
require_once('../manager/common_functions.php');
require_once('../includes/config.php');
require_once('../config/db.php');

use PHPMailer\PHPMailer;
use PHPMailer\SMTP;
use PHPMailer\Exception;
use PHPMailer\PHPMailer\PHPMailer as PHPMailerPHPMailer;


require_once(dirname(__FILE__,2).'/vendor/phpmailer/phpmailer/src/Exception.php');
require_once(dirname(__FILE__,2).'/vendor/phpmailer/phpmailer/src/PHPMailer.php');
require_once(dirname(__FILE__,2).'/vendor/phpmailer/phpmailer/src/SMTP.php');

//-----------------------------
date_default_timezone_set('UTC');
$entry_time = (new DateTime())->format('d-m-Y h:i A');
header('Content-Type: application/json');

if (isset($_POST)) {
	$POSTJ = json_decode(file_get_contents('php://input'),true);

	if(isset($POSTJ['action_type'])){
		if ($POSTJ['action_type'] == "send_pwd_reset")
			sendPwdReset($conn, $POSTJ);
		if ($POSTJ['action_type'] == "do_change_pwd")
			doChangePwd($conn, $POSTJ);
	}
}
else
	die();

//-----------------------------

function sendPwdReset($conn, &$POSTJ){
	$contact_mail = $POSTJ['contact_mail'];
	if(isUserExist($conn, $contact_mail)==1){

		if(sendNewReset($conn, $contact_mail)==1){
			$new_v_hash = md5(uniqid(rand(), true));
			$curr_time = time();
			$stmt = $conn->prepare("UPDATE tb_main SET v_hash=?, v_hash_time=? WHERE contact_mail=?");
			$stmt->bind_param('sss', $new_v_hash,$curr_time,$contact_mail);
			$stmt->execute();
			initResetMail($conn,$new_v_hash,$contact_mail);
		}else{	
			$stmt = $conn->prepare("SELECT v_hash FROM tb_main WHERE contact_mail = ?");
			$stmt->bind_param("s", $contact_mail);
			$stmt->execute();
			$result = $stmt->get_result()->fetch_assoc();
			initResetMail($conn,$result['v_hash'],$contact_mail);
		}

		echo json_encode(['result' => 'success','msg'=>'We will send you reset password link ! Thank You']);	     //send success irrespectively.
	}else{
		echo json_encode(['result' => 'error','msg'=>"Email Does'nt Exist!"]);	     //send success irrespectively.
	}

	
}

function isUserExist($conn, $contact_mail){
	$stmt = $conn->prepare("SELECT v_hash_time FROM tb_main WHERE contact_mail = ?");
	$stmt->bind_param("s", $contact_mail);
	$stmt->execute();
	$result = $stmt->get_result();
	if($result->num_rows > 0)
		return true;
	else
		return false;
}

function sendNewReset($conn, $contact_mail){
	$stmt = $conn->prepare("SELECT v_hash,v_hash_time FROM tb_main WHERE contact_mail = ?");
	$stmt->bind_param("s", $contact_mail);
	$stmt->execute();
	$result = $stmt->get_result()->fetch_assoc();
	if(empty($result['v_hash']) || $result['v_hash_time'] + 86400*2 < time()) //>2 days ==> expired
		return true;
	else
		return false;		
}

function initResetMail($conn, $v_hash, $contact_mail){

		$msg='
		<!DOCTYPE html>
		<html lang="en">
			<head>
				<meta charset="UTF-8">
				<meta name="viewport" content="width=device-width, initial-scale=1.0">
				<title>Document</title>
			</head>
			<body  marginheight="0" marginwidth="0" rightmargin="0" topmargin="0">
				<table bgcolor="#f9f9f9"  border="0" cellspacing="0" cellpadding="0" align="center" style="width:100%; margin:0;">
					<tbody>
						<tr>
						<td>
							<table bgcolor="#fff"   border="0" cellspacing="0" cellpadding="0" align="center" style="max-width:650px; width:100%; margin:0px auto;">
								<tbody>
									<tr>
									<td>
										<table bgcolor="#fff" border="0" cellspacing="0" cellpadding="0" align="center" style="max-width:650px; width:100%; margin:0px auto;">
											<tbody>
											
												<tr>
												<td bgcolor="#ffc000" height="10"></td>
												</tr>
												<tr>
												<td>
													
													<table  bgcolor="#ffc000"  align="center"  border="0" cellspacing="0" cellpadding="0" style="max-width:650px ; width: 100%;  display: table; text-align: center;"  >
														<tr>
															
															<td bgcolor="#fff" height="50"></td>
															
														</tr>
													</table>
													<table   align="center"  border="0" cellspacing="0" cellpadding="0" style="max-width:600px;"  >
														
														<tr>
															<td  style="text-align:left;">
															<p style="font-family:Arial,Helvetica,sans-serif;font-size:15x; ">
															It looks you requested for Phishing password reset.Click Here
															</p>
															<p style="text-align:center;">
															<b>
															<form action="'.App.'ChangePwd?token='.$v_hash.'" method="POST">
															<input type="hidden" name="token" 
															value="'.$v_hash.'">
															<button class="btn btn-primary" style="text-align:center;" type="submit"> Change Password</button>  
															</form>
															</b>
															</p>

															</td>
														</tr>
													</table>                                       

													<table  align="center"  border="0" cellspacing="0" cellpadding="0" style="max-width:600px; "  >
														
														<tr>
															<td bgcolor="#fff" height="50"></td>
														</tr>
													</table>

												</td>
												</tr>
											</tbody>
										</table>
									</td>
									</tr>

									<tr>
										<td bgcolor="#ffc000" height="10"></td>
									</tr>
									
								</tbody>
							</table>
						</td>
						</tr>
					</tbody>
				</table>
			</body>
		</html>
        ';

	$headers = "MIME-Version: 1.0" . "\r\n";
    $headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";


	$mail = new PHPMailerPHPMailer(true);
	$mail->isSMTP();
	$mail->Host = 'smtp.gmail.com';
	$mail->SMTPAuth = true;
	$mail->SMTPSecure = 'tls';
	$mail->Port = 587;
	$mail->Username = 'mamta01.img@gmail.com'; // YOUR email username
	$mail->Password = 'dnegqdzkhyotrqvp'; // YOUR email password

        // Sender and recipient settings
        $mail->setFrom('mamta01.img@gmail.com', 'Phishing');
        $mail->addAddress($contact_mail ,'Test');
        $mail->IsHTML(true);
        $mail->Subject = "Phishing";
        $mail->Body = $msg;

        $ismailsent = $mail->send();


        if(!$ismailsent) {
			die(json_encode(['error' => 'Mail sending failed!'])); 
          }
}

//-----------------------------------

function doChangePwd($conn, &$POSTJ){
	if(!(isset($POSTJ['new_pwd']) && isset($POSTJ['token'])))
		die(json_encode(['error' => 'Invalid request']));

	$new_pwd_hash = hash("sha256", $POSTJ['new_pwd'], false);
	$token = $POSTJ['token'];

	$stmt = $conn->prepare("SELECT COUNT(*) FROM tb_main WHERE v_hash = ?");
	$stmt->bind_param("s", $token);
	$stmt->execute();
	$row = $stmt->get_result()->fetch_row();
	if($row[0] > 0){
		$stmt = $conn->prepare("UPDATE tb_main SET password=?, v_hash=null, v_hash_time=null WHERE v_hash = ?");
		$stmt->bind_param('ss', $new_pwd_hash,$token);
		if ($stmt->execute() === TRUE)
			echo json_encode(['result' => 'success']);
		else 
			echo json_encode(['error' => 'Password change failed!']);	
	}
}
?>