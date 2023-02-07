
<?php 
require_once '../includes/config.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <?php include('../components/header.php'); ?>
</head>
<body class="layout-boxed alt-menu">
    <!-- BEGIN LOADER -->
    <div id="load_screen"> <div class="loader"> <div class="loader-content">
        <div class="spinner-grow align-self-center"></div>
    </div></div></div>
    <!--  END LOADER -->

    <!--  BEGIN NAVBAR  -->
    <?php include('../components/navbar.php'); ?>
    <!--  END NAVBAR  -->

    <!--  BEGIN MAIN CONTAINER  -->
    <div class="main-container" id="container">

        <div class="overlay"></div>
        <div class="search-overlay"></div>

        <!--  BEGIN SIDEBAR  -->
        <?php include('../components/sidebar.php'); ?>
        <!--  END SIDEBAR  -->

        <!--  BEGIN CONTENT AREA  -->
        <div id="content" class="main-content">

        <div class="layout-px-spacing">

    
            <?php include('../components/foot.php'); ?>

        </div>
        <!--  END CONTENT AREA  -->

    </div>
    <!-- END MAIN CONTAINER -->

    <?php include('../components/script.php'); ?>

</body>
</html>