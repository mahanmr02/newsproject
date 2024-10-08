<!DOCTYPE html>
<html lang="zxx" class="no-js">

<head>
    <!-- Mobile Specific Meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon-->
    <link rel="shortcut icon" href="<?= asset($setting['icon']) ?>">
    <!-- Author Meta -->
    <meta name="author" content="colorlib">
    <!-- Meta Description -->
    <meta name="description" content="<?= $setting['description'] ?>">
    <!-- Meta Keyword -->
    <meta name="keywords" content="<?= $setting['keywords'] ?>">
    <!-- meta character set -->
    <meta charset="UTF-8">
    <!-- Site Title -->
    <title><?= $setting['title'] ?></title>
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet">
    <!--
		CSS
		============================================= -->
     <link rel="stylesheet" href="<?= asset('public/app/css/linearicons.css') ?>">
    <link rel="stylesheet" href="<?= asset('public/app/css/font-awesome.min.css') ?>">
    <link rel="stylesheet" href="<?= asset('public/app/css/bootstrap.css') ?>">
    <link rel="stylesheet" href="<?= asset('public/app/css/magnific-popup.css') ?>">
    <link rel="stylesheet" href="<?= asset('public/app/css/nice-select.css') ?>">
    <link rel="stylesheet" href="<?= asset('public/app/css/animate.min.css') ?>">
    <link rel="stylesheet" href="<?= asset('public/app/css/owl.carousel.css') ?>">
    <link rel="stylesheet" href="<?= asset('public/app/css/jquery-ui.css') ?>">
    <link rel="stylesheet" href="<?= asset('public/app/css/main.css') ?>">
</head>

<body>
    <header>

        <div class="header-top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6 col-6 header-top-left no-padding">
                        <ul>
                        <?php if(isset($_SESSION['user'])) { ?> 
                                           <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="<?=url('logout') ?>">logout</a>
                </div>
                            <?php } else { ?>
                                <a href="<?= url('login') ?>" class="btn btn-success">ورود</a>
                                <a href="<?= url('register') ?>" class="btn btn-info">ثبت نام</a>
                                <?php } ?>
                            <li><a href="https://www.instagram.com/mahanmr02?igsh=MTB0ZjUxbWxwaWpiaQ=="><i class="fa fa-instagram"></i></a></li>
                            <li><a href="https://twitter.com/AnnoYin_O_Yang?s=09"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="https://github.com/mahanmr02"><i class="fa fa-github"></i></a></li>                           
                        </ul>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 col-6 header-top-right no-padding">
                        <ul>
                            <li><a href="tel:+989031979004"><span class="lnr lnr-phone-handset"></span><span>+989031979004</span></a></li>
                            <li><a href="https://mail.google.com/mail/u/0/#inbox?compose=GTvVlcSBmzhGJGJKjPWMPRcRftgCHwNpQWsWzgbwrHPrcWJwLNDxhpnxZJwPPdzHnBNFvWLZtwTMS"><span class="lnr lnr-envelope"></span><span>mahanclash8195@gmail.com</span></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="logo-wrap">
            <div class="container">
                <div class="row justify-content-between align-items-center">
                    <div class="col-lg-4 col-md-4 col-sm-12 logo-left no-padding">
                        <a href="index.html">
                            <img class="img-fluid" src="img/logo.png" alt="">
                        </a>
                    </div>
                    <div class="col-lg-8 col-md-8 col-sm-12 logo-right no-padding ads-banner">
                        <img class="img-fluid" src="img/banner-ad.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>
        <div class="container main-menu" id="main-menu">
            <div class="row align-items-center justify-content-between">
                <nav id="nav-menu-container">
                    <ul class="nav-menu">
                        <?php foreach ($menus as $menu) { ?>
                        <li class="menu-active">
                            <a href="<?= $menu['url'] ?>"><?= $menu['name'] ?></a>
                        </li>
                        <?php } ?>
                    </ul>
                </nav>
                <!-- #nav-menu-container -->
                <div class="navbar-right">
                    <form class="Search">
                        <span class="Search-close">
								<span class="lnr lnr-cross"></span>
                        </span>
                    </form>
                </div>
            </div>
        </div>
    </header>