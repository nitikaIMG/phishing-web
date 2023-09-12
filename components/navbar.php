<?php
require_once(dirname(__FILE__,2).'/manager/session_manager.php');
if(isSessionValid() == true){
   $email = $_SESSION['contact_mail'];
   $username = getLoginLogoutInfo($conn, $email)['name'];
}
?>
<?php
// Define an array of page titles and their corresponding URLs
$pageTitles = array(
    'index.php' => 'User Dashboard', 
    'employeelist.php' => 'Employee',
    'mailcmpalldashboard.php' => 'Email Campaign Dashboard',
    'mailcampaignlist.php' => 'Email Campaigns',
    'edit_profile.php' => 'Profile',
    'mailcmpdashboard.php' => 'Email Campaign Dashboard',
    'manage_servers.php' => 'Mail Server Integrations',
    // Add more pages and their titles as needed
);

// Get the current page file name
$currentFile = basename($_SERVER['PHP_SELF']);

// Check if the current page title exists in the array, otherwise set a default title
$pageTitle = isset($pageTitles[$currentFile]) ? $pageTitles[$currentFile] : 'Default Title';
?>


<?php $img = (basename($_SERVER['PHP_SELF'])) == 'LandingPage.php' ? '../' : ''; ?> 
<div class="header-container container-xxl">
        <header class="header navbar navbar-expand-sm expand-header">
        <?php header("X-Robots-Tag: noindex, nofollow", true);  ?>

        <!-- <p>-->
        <!--    Test-->
        <!--</p>-->
        
            <h4 class=""><?php echo $pageTitle; ?></h4>

            <a href="javascript:void(0);" class="sidebarCollapse">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-menu"><line x1="3" y1="12" x2="21" y2="12"></line><line x1="3" y1="6" x2="21" y2="6"></line><line x1="3" y1="18" x2="21" y2="18"></line></svg>
            </a>

            <ul class="navbar-item flex-row ms-lg-auto ms-0">

                <li class="nav-item theme-toggle-item">
                    <a href="javascript:void(0);" class="nav-link theme-toggle">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-moon dark-mode"><path d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z"></path></svg>
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-sun light-mode"><circle cx="12" cy="12" r="5"></circle><line x1="12" y1="1" x2="12" y2="3"></line><line x1="12" y1="21" x2="12" y2="23"></line><line x1="4.22" y1="4.22" x2="5.64" y2="5.64"></line><line x1="18.36" y1="18.36" x2="19.78" y2="19.78"></line><line x1="1" y1="12" x2="3" y2="12"></line><line x1="21" y1="12" x2="23" y2="12"></line><line x1="4.22" y1="19.78" x2="5.64" y2="18.36"></line><line x1="18.36" y1="5.64" x2="19.78" y2="4.22"></line></svg>
                    </a>
                </li>

                <li class="nav-item dropdown user-profile-dropdown  order-lg-0 order-1">
                    <a href="javascript:void(0);" class="nav-link dropdown-toggle user" id="userProfileDropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            
    <div class="rounded-circle avatar-container" style="font-weight: bold; border: 1px solid; width: 100%; height: 100%; -o-object-fit: cover; object-fit: cover; justify-content: center; display: flex; align-items: center;text-transform: uppercase;">
        
        <div class="avatar avatar-sm avatar-indicators avatar-online" style=" display: flex; align-items: center; justify-content: center;">
            <?php
                $firstName = substr($_SESSION['user'][2], 0, 1);
                $avatarUrl = $img . "images/users/" . $_SESSION['user'][5] . ".png";
                
            ?>
            
            <!--<img alt="avatar" class="avatar_profile" src="<?= $avatarUrl ?>" class="rounded-circle">-->
            <span class="user-initial"><?= $firstName ?></span>
        </div>
    </div>
</a>

                    <!--<a href="javascript:void(0);" class="nav-link dropdown-toggle user" id="userProfileDropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">-->
                    <!--    <div class="avatar-container">-->
                    <!--        <div class="avatar avatar-sm avatar-indicators avatar-online">-->
                    <!--            <img alt="avatar" class="avatar_profile" src="<?= $img?>images/users/<?=$_SESSION['user'][5] ?>.png" class="rounded-circle">-->
                    <!--        </div>-->
                    <!--    </div>-->
                    <!--</a>-->

                    <div class="dropdown-menu position-absolute" aria-labelledby="userProfileDropdown">
                        <div class="user-profile-section">
                            <div class="media mx-auto">
                                <div class="emoji me-2">
                                    &#x1F44B;
                                </div>
                                <div class="media-body">
                                    <h5 id="user_name1"><?=$username?></h5>
                                  <p><?= $email?></p>
                                </div>
                            </div>
                        </div>
                        <div class="dropdown-item">
                        <a href="<?=$img?>edit_profile">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-log-out">
                                    <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path>
                                    <polyline points="16 17 21 12 16 7"></polyline>
                                    <line x1="21" y1="12" x2="9" y2="12"></line>
                                </svg> <span>Edit Profile</span>
                            </a>
                        </div> 
                        <div class="dropdown-item">
                        <a href="<?=$img?>manage_servers">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-log-out">
                                    <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path>
                                    <polyline points="16 17 21 12 16 7"></polyline>
                                    <line x1="21" y1="12" x2="9" y2="12"></line>
                                </svg> <span>Manage Mail Servers</span>
                            </a>
                        </div> 
                        <!-- <div class="dropdown-item">
                        <a href="mailserver">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-log-out">
                                    <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path>
                                    <polyline points="16 17 21 12 16 7"></polyline>
                                    <line x1="21" y1="12" x2="9" y2="12"></line>
                                </svg> <span> Manage Mail Servers</span>
                            </a>
                        </div>  -->
                        <div class="dropdown-item">
                            <a href="logout">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-log-out"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path><polyline points="16 17 21 12 16 7"></polyline><line x1="21" y1="12" x2="9" y2="12"></line></svg> <span>Log Out</span>
                            </a>
                    </div>
                    
                </li>
            </ul>
        </header>
    </div>