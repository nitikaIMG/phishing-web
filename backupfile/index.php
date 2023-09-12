<?php 

require_once(dirname(__FILE__).'/manager/session_manager.php');
require_once(dirname(__FILE__).'/includes/config.php');
isSessionValid(true);
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <?php include(dirname(__FILE__).'/components/header.php'); ?>
    <link rel="stylesheet" type="text/css" href="<?php echo url ?>/customecss/css/select2.min.css">
   <link rel="stylesheet" type="text/css" href="<?php echo url ?>/customecss/css/style.min.css">
   <link rel="stylesheet" type="text/css" href="<?php echo url ?>/customecss/css/dataTables.foundation.min.css">
   <style>
    .table-bordered{
        /*border: 1px solid #dee2e6 !important;*/
    }
    .apexcharts-legend .apexcharts-legend-series:last-child {
        display: none !important;
    }
   </style>
</head>

<body class="layout-boxed alt-menu">
    <!-- BEGIN LOADER -->
    <div id="load_screen">
        <div class="loader">
            <div class="loader-content">
                <div class="spinner-grow align-self-center"></div>
            </div>
        </div>
    </div>
    <!--  END LOADER -->

    <!--  BEGIN NAVBAR  -->
    <?php include(dirname(__FILE__).'/components/navbar.php'); ?>
    <!--  END NAVBAR  -->

    <!--  BEGIN MAIN CONTAINER  -->
    <div class="main-container" id="container">

        <div class="overlay"></div>
        <div class="search-overlay"></div>

        <!--  BEGIN SIDEBAR  -->
        <?php include(dirname(__FILE__).'/components/sidebar.php'); ?>
        <!--  END SIDEBAR  -->

        <!--  BEGIN CONTENT AREA  -->
        <div id="content" class="main-content">

        <div id="main-wrapper">

            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 ms-2 d-flex no-block align-items-center">
                        <!--<h4 class="page-title">User Dashboard</h4>-->
                    </div>
                </div>
            </div>

            <div class="layout-px-spacing">
                <div class="middle-content container-xxl p-0">
                    <div class="row layout-top-spacing">
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="row">
                                            <!--<h5 class="card-title">User Dashboard </h5>-->
                                            <div class="col-sm-12 col-lg-4">
                                                <h1 class="font-bold mb-1" id="past_camp_last_week">9</h1>
                                                <h6 class="mb-3">Emails Delivered (Past Week)</h6>
                                                <p>A weekly aggregation of all phishing emails delivered across all
                                                    active campaigns. Metrics are updated nightly.</p>
                                                <a class="mt-3 mb-3 btn btn-lg btn-secondary"
                                                    href="<?=base_url?>mailcmpdashboard">View Detailed Reports</a> </div>

                                            <div class="col-sm-12 col-lg-8 border-left m-t-15 d-none d-md-block">

                                                <!-- <h5 class="card-subtitle">Statistics over the last 12 months (Updated Daily)</h5> -->
                                                <div id="dashboardchartmail">
                                                </div>
                                            </div>
                                            <div class="card-body border-top">
                                                <div class="row mb-0">
                                                    <!-- col -->
                                                    <div class="col-lg-3 col-md-6">
                                                        <div class="d-flex align-items-center">
                                                            <div class="mr-2"><span class="text-danger display-5"><i
                                                                        class="mdi mdi-email-fast-outline"></i></span>
                                                            </div>
                                                            <div>
                                                                <span>Active Campaigns</span>
                                                                <h3 class="font-medium mb-0" id="act_camp">0</h3>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- col -->
                                                    <!-- col -->
                                                    <div class="col-lg-3 col-md-6">
                                                        <div class="d-flex align-items-center">
                                                            <div class="mr-2"><span class="text display-5"><i
                                                                        class="mdi mdi-email"></i></span></div>
                                                            <div>
                                                                <span>Emails Delivered</span>
                                                                <h3 class="font-medium mb-0" id='userDelMail'></h3>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- col -->
                                                    <!-- col -->
                                                    <div class="col-lg-3 col-md-6">
                                                        <div class="d-flex align-items-center">
                                                            <div class="mr-2"><span class="text display-5"><i
                                                                        class="mdi mdi-web"></i></span></div>
                                                            <div>
                                                                <span>Past Campaigns</span>
                                                                <h3 class="font-medium mb-0" id="past_comp">0</h3>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- col -->
                                                    <!-- col -->
                                                    <div class="col-lg-3 col-md-6">
                                                        <div class="d-flex align-items-center">
                                                            <div class="mr-2"><span class="text display-5"><i
                                                                        class="mdi mdi-school"></i></span></div>
                                                            <div>
                                                                <span>Training Modules</span>
                                                                <h3 class="font-medium mb-0">0</h3>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- col -->
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row mt-3">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="row">
                                            <h5 class="card-title">Phishing Campaign Success</h5>
                                            <h6>Overview of Phishing Campaign Interactions (Past Week)</h6>
                                            <div class="col-sm-12 col-lg-12 m-t-15 d-none d-md-block">
                                                <div style="text-align:center;">
                                                    <h1 class="font-bold mb-1" id="mail_open"></h1>
                                                    <h6 class="mb-3">Phishing Email Interactions</h6>
                                                </div>
                                                <div id="roundchartmail">
                                                </div>
                                            </div>
                                            <!-- <div class="col-sm-12 col-lg-4">
                                                <h1 class="font-bold mb-1" id="mail_open"></h1>
                                                <h6 class="mb-3">Phishing Email Interactions</h6>
                                            </div> -->

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--<div class="row mt-3">-->
                        <!--    <div class="col-12">-->
                        <!--        <div class="card">-->
                        <!--            <div class="card-body">-->
                        <!--                <div class="row">-->
                        <!--                    <h5 class="card-title">Employee Reported Phishing</h5>-->
                        <!--                    <div class="row">-->
                        <!--                        <div class="col-md-12 m-t-20">-->
                        <!--                            <div class="row">-->
                        <!--                                <div class="table-responsive">-->
                        <!--                                    <table id="table_mail_report_list" class="table table-bordered w-100 style-3 dt-table-hover dataTable no-footer">-->
                        <!--                                        <thead>-->
                        <!--                                            <tr>-->
                        <!--                                                <th>Reported By</th>-->
                        <!--                                                <th>Report Date</th>-->
                        <!--                                                <th>Attribution</th>-->
                        <!--                                                <th>Actions</th>-->
                        <!--                                            </tr>-->
                        <!--                                        </thead>-->
                        <!--                                        <tbody>-->
                        <!--                                        </tbody>-->
                        <!--                                    </table>-->
                        <!--                                </div>-->
                        <!--                            </div>-->
                        <!--                        </div>-->
                        <!--                    </div>-->
                        <!--                </div>-->
                        <!--            </div>-->
                        <!--        </div>-->
                        <!--    </div>-->
                        <!--</div>-->

                    </div>
                </div>
            </div>

            <?php include(dirname(__FILE__).'/components/foot.php'); ?>

        </div>
        <!--  END CONTENT AREA  -->

    </div>
    <!-- END MAIN CONTAINER -->

    <?php include(dirname(__FILE__).'/components/script.php'); ?>

    <script src="<?php echo url ?>/js/mail_campaign_dashboard.js"></script>
    <script src="<?php echo url ?>/js/libs/apexcharts.js"></script>


    <script src="<?php echo url ?>/js/libs/js.cookie.min.js"></script>
      <!-- Bootstrap tether Core JavaScript -->
      <script src="<?php echo url ?>/js/libs/popper.min.js"></script>
      <script src="<?php echo url ?>/js/libs/bootstrap.min.js"></script>
      <!--Menu sidebar -->
      <!-- <script src="<?php echo url ?>/js/libs/perfect-scrollbar.jquery.min.js"></script> -->
      <!--Custom JavaScript -->
      <script src="<?php echo url ?>/js/libs/custom.min.js"></script>
      <!-- this page js -->   
      <script src="<?php echo url ?>/js/common_scripts.js"></script>
      <!-- Employee List libraries -->
      <script src="https://www.virtuosoft.eu/code/bootstrap-duallistbox/bootstrap-duallistbox/v3.0.2/jquery.bootstrap-duallistbox.js"></script>
      <!-- Employee List libraries -->

      <script defer src="<?php echo url ?>/js/libs/sidebarmenu.js"></script>
      <script defer src="<?php echo url ?>/js/libs/jquery/datatables.js"></script> 
      <script defer src="<?php echo url ?>/js/libs/select2.min.js"></script>
      <script defer src="<?php echo url ?>/js/libs/moment.min.js"></script>
      <script defer src="<?php echo url ?>/js/libs/bootstrap-datetimepicker.min.js"></script>
      <script defer src="<?php echo url ?>/js/libs/moment.min.js"></script>
      <script defer src="<?php echo url ?>/js/libs/moment-timezone-with-data.min.js"></script>

      
      <script>
        loadEmpReportData();
        loadTableCampaignResultAccToWeek();
    </script>

</body>

</html>