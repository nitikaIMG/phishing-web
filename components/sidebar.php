<div class="sidebar-wrapper sidebar-theme">

<nav id="sidebar">

    <div class="navbar-nav theme-brand flex-row  text-center">
        <div class="nav-logo">
            <div class="nav-item theme-logo">
                <a href="javascript:void(0)">
                    <img src="<?php echo url?>/src/assets/img/logo.png" class="" alt="logo">
                </a>
            </div>
            <div class="nav-item theme-text">
                <a href="javascript:void(0)" class="nav-link"> Phishing </a>
            </div>
        </div>
        <div class="nav-item sidebar-toggle">
            <div class="btn-toggle sidebarCollapse">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevrons-left"><polyline points="11 17 6 12 11 7"></polyline><polyline points="18 17 13 12 18 7"></polyline></svg>
            </div>
        </div>
    </div>
    <div class="shadow-bottom"></div>
    <ul class="list-unstyled menu-categories" id="accordionExample">
       
        <li class="menu <?php echo basename($_SERVER['PHP_SELF']) == 'index.php' ? 'active' : ''; ?>">
            <a href="<?=base_url?>index" aria-expanded="true" class="dropdown-toggle">
                <div class="">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-home"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path><polyline points="9 22 9 12 15 12 15 22"></polyline></svg>
                    <span>Dashboard</span>
                </div>
            </a>
        </li>

        <li class="menu <?php echo basename($_SERVER['PHP_SELF']) == 'mailcampaignlist.php' ? 'active' : ''; ?>">
            <a href="<?=base_url?>mailcampaignlist" aria-expanded="true" class="dropdown-toggle" >
             <div class="">
             <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-mail"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path><polyline points="22,6 12,13 2,6"></polyline></svg>
             <span>Campaign</span>
             </div>
            </a>
        </li>

        <li class="menu <?php echo basename($_SERVER['PHP_SELF']) == 'employeelist.php' ? 'active' : ''; ?>">
            <a href="<?=base_url?>employeelist" aria-expanded="true" class="dropdown-toggle" >
             <div class="">
             <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
             <span>Employee</span>
             </div>
            </a>
        </li>

        <li class="menu <?php echo basename($_SERVER['PHP_SELF']) == 'mailcmpdashboard.php' ? 'active' : ''; ?>">
            <a href="<?=base_url?>mailcmpdashboard" aria-expanded="true" class="dropdown-toggle" >
             <div class="">
             <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-mail"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path><polyline points="22,6 12,13 2,6"></polyline></svg>
             <span>Campagin Reporting</span>
             </div>
            </a>
        </li>

        <li class="menu <?php echo basename($_SERVER['PHP_SELF']) == 'mailcmpalldashboard.php' ? 'active' : ''; ?>">
            <a href="<?=base_url?>mailcmpalldashboard" aria-expanded="true" class="dropdown-toggle" >
             <div class="">
             <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-mail"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path><polyline points="22,6 12,13 2,6"></polyline></svg>
             <span>Reporting</span>
             </div>
            </a>
        </li>

        <!-- <li class="menu <?php echo basename($_SERVER['PHP_SELF']) == 'mailtemplate.php' || basename($_SERVER['PHP_SELF']) =='mailsender.php' || basename($_SERVER['PHP_SELF']) =='LandingPage.php'  ? 'active' : ''; ?>">
                <a href="<?=base_url?>#templates" data-bs-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                <div class="">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-airplay"><path d="M5 17H4a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2h-1"></path><polygon points="12 15 17 21 7 21 12 15"></polygon></svg>
                    <span>Email Campaign</span>
                </div>
                    <div>
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg>
                    </div>
                </a>
                <ul class="collapse submenu list-unstyled" id="templates" data-bs-parent="#accordionExample">
                
                    <li class="menu <?php echo basename($_SERVER['PHP_SELF']) == 'mailtemplate.php' ? 'active' : ''; ?>">
                        <a href="<?=base_url?>mailtemplate"> Email Template </a>
                    </li>
                </ul>
        </li> -->

    </ul>
    
</nav>

</div>