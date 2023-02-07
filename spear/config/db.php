<?php
<<<<<<< HEAD
  $curr_db = "phishing-web";
=======
  $curr_db = "phishing";
>>>>>>> 25109d6f5861a59f40f010d2e039d714af50b38e
  $conn = mysqli_connect("localhost","root","",$curr_db);

  if (mysqli_connect_errno()) {
    die("DB connection failed!");
  } 
?>