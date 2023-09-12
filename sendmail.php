<?php
// Import PHPMailer classes into the global namespace
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

// Load Composer's autoloader
require 'vendor/autoload.php';

// Create a new PHPMailer object
$mail = new PHPMailer(true);

try {
    //Server settings
    $mail->SMTPDebug = SMTP::DEBUG_SERVER; // Enable verbose debug output (optional)
    $mail->isSMTP(); // Set mailer to use SMTP
    $mail->Host = 'smtp.gmail.com'; // Specify main SMTP server
    $mail->SMTPAuth = true; // Enable SMTP authentication
    $mail->Username = 'support@techowlshield.com'; // SMTP username
    $mail->Password = 'Ilovegirlion@5831'; // SMTP password
    $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS; // Enable TLS encryption
    $mail->Port = 587; // TCP port to connect to

    //Recipients
    $mail->setFrom('support@techowlshield.com', 'Compliance');
    $mail->addAddress('abhishek@techowl.in', 'Abhishek'); // Add recipient

    // Content
    $mail->isHTML(true); // Set email format to HTML
    $mail->Subject = 'Test Subject New';
    $mail->Body    = 'This is a test email Abhishek.';

    // Send the email
    $mail->send();
    echo 'Message has been sent';
} catch (Exception $e) {
    echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
}
?>
