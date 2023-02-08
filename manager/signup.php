<?php

if (session_status() === PHP_SESSION_NONE) {
   @ob_start();
   session_start();
   session_write_close();	//prevent access denied lock error
}
	//shows if login page is opened before install 
require_once('../manager/common_functions.php');
require_once('../config/db.php');

date_default_timezone_set('UTC');
$entry_time = (new DateTime())->format('d-m-Y h:i A');
error_reporting(E_ERROR | E_PARSE); //Disable warnings
//-----------------------------

if (isset($_POST)) {
	$POSTJ = json_decode(file_get_contents('php://input'),true);
    $username=$POSTJ['username'];
    $contact_mail=$POSTJ['contact_mail'];
    $pass = hash("sha256", $POSTJ['password'], false);

    $stmt = $conn->prepare("SELECT COUNT(*) FROM tb_main where contact_mail='$contact_mail'");
	$stmt->execute();
    $row = $stmt->get_result()->fetch_row();

    if($row[0] == 0){
        $name='User';
        $dp_name=1;
        $stmt = $conn->prepare("INSERT INTO `tb_main` ( `name`, `username`, `password`, `contact_mail`, `dp_name`, `v_hash`, `v_hash_time`, `date`, `last_login`, `last_logout`) VALUES ( '$name', '$username', '$pass', '$contact_mail', '$dp_name', '', '', '$$entry_time', '$$entry_time', '')");
        $stmt->execute();
        echo "success";
	}
	else{
        echo 'error';
    }
}
else
	die();