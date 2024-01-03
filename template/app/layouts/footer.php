
    <!-- start footer Area -->
    <footer class="footer-area section-gap">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6 single-footer-widget">
                    <h4>اخبار پربازدید</h4>
                    <?php foreach($popularPosts as $popularPost){?>
                    <ul>
                        <li><a href="<?= url('show-post/' . $popularPost['id']) ?>"><?= $popularPost['title']?></a></li>

                    </ul>
                    <?php }?>
                </div>
                <div class="col-lg-4 col-md-6 single-footer-widget">
                    <h4>لینک سریع</h4>
                    <?php foreach($quickLinks as $quickLink){?>
                    <ul>
                        <li><a href="<?=$quickLink['url']?>"><?= $quickLink['name']?></a></li>

                    </ul>
                    <?php }?>
                </div>
                <div class="col-lg-4 col-md-6 single-footer-widget">
                    <ul class="instafeed d-flex flex-wrap">
                        <li><img src="img/i1.jpg" alt=""></li>
                        <li><img src="img/i2.jpg" alt=""></li>
                        <li><img src="img/i3.jpg" alt=""></li>
                        <li><img src="img/i4.jpg" alt=""></li>
                        <li><img src="img/i5.jpg" alt=""></li>
                        <li><img src="img/i6.jpg" alt=""></li>
                        <li><img src="img/i7.jpg" alt=""></li>
                        <li><img src="img/i8.jpg" alt=""></li>
                    </ul>
                </div>
            </div>
            <div class="footer-bottom row align-items-center">
                <div class="col-lg-4 col-md-12 footer-social">
                    <a href="https://www.instagram.com/mahanmr02?igsh=MTB0ZjUxbWxwaWpiaQ=="><i class="fa fa-instagram"></i></a>
                    <a href="https://twitter.com/AnnoYin_O_Yang?s=09"><i class="fa fa-twitter"></i></a>
                    <a href="https://github.com/mahanmr02"><i class="fa fa-github"></i></a>

                </div>
            </div>
        </div>
    </footer>
    <script src="<?= asset('public/app/js/vendor/jquery-2.2.4.min.js') ?>"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="<?= asset('public/app/js/vendor/bootstrap.min.js') ?>"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
    <script src="<?= asset('public/app/js/easing.min.js') ?>"></script>
    <script src="<?= asset('public/app/js/hoverIntent.js') ?>"></script>
    <script src="<?= asset('public/app/js/superfish.min.js') ?>"></script>
    <script src="<?= asset('public/app/js/jquery.ajaxchimp.min.js') ?>"></script>
    <script src="<?= asset('public/app/js/jquery.magnific-popup.min.js') ?>"></script>
    <script src="<?= asset('public/app/js/mn-accordion.js') ?>"></script>
    <script src="<?= asset('public/app/js/jquery-ui.js') ?>"></script>
    <script src="<?= asset('public/app/js/jquery.nice-select.min.js') ?>"></script>
    <script src="<?= asset('public/app/js/owl.carousel.min.js') ?>"></script>
    <script src="<?= asset('public/app/js/mail-script.js') ?>"></script>
    <script src="<?= asset('public/app/js/main.js') ?>"></script>
</body>

</html>
