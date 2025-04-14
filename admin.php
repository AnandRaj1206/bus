<?php
session_start();
if(!isset($_SESSION['aname'])){
  header('location:registration/admin.php');
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Transport</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <link href="img/bus3.jpg" rel="icon">
  <link href="img/bus3.jpg" rel="apple-touch-icon">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Raleway:300,400,500,700,800|Montserrat:300,400,700" rel="stylesheet">
  <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="lib/animate/animate.min.css" rel="stylesheet">
  <link href="lib/ionicons/css/ionicons.min.css" rel="stylesheet">
  <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="lib/magnific-popup/magnific-popup.css" rel="stylesheet">
  <link href="css/style.css" rel="stylesheet">
</head>

<body id="body">

  <section id="topbar" class="d-none d-lg-block">
    <div class="container clearfix">
      <div class="contact-info float-left">
        <i class="fa fa-envelope-o"></i> <a href="mailto:contact@example.com">transpot@gmail.com</a>
        <i class="fa fa-phone"></i> +91 8003649945
      </div>
    </div>
  </section>

  <header id="header">
    <div class="container">
      <div id="logo" class="pull-left">
        <h1><a href="#body" class="scrollto">Tran<span>Sport</span></a></h1>
      </div>
      <nav id="nav-menu-container">
        <ul class="nav-menu">
          <li class="menu-active"><a href="#body">Home</a></li>
          <li><a href="booking.php">Check Booking</a></li>
          <li><a href="bookingdetail.php">Journey Date</a></li>
          <li><a href="#"><?php echo $_SESSION['aname'];?></a></li>
          <li><a href="registration/logout.php">logout</a></li>
        </ul>
      </nav>
    </div>
  </header>

  <section id="intro">
    <div class="intro-content">
      <h2>Making <span>your Ride</span><br>happen!</h2>
      <div>
        <a href="registration/busdetail.php" class="btn-get-started scrollto">Add Bus Details</a>
        <a href="registration/add_driver.php" class="btn-get-started scrollto">Add Driver Details</a>
      </div>
    </div>

    <div id="intro-carousel" class="owl-carousel">
      <div class="item" style="background-image: url('img/bus1.jpg');"></div>
      <div class="item" style="background-image: url('img/bus2.jpg');"></div>
      <div class="item" style="background-image: url('img/bus3.jpg');"></div>
      <div class="item" style="background-image: url('img/bus4.jpg');"></div>
      <div class="item" style="background-image: url('img/bus5.jpg');"></div>
      <div class="item" style="background-image: url('img/bus6.jpg');"></div>
      <div class="item" style="background-image: url('img/bus7.jpg');"></div>
      <div class="item" style="background-image: url('img/intro-carousel/5.jpg');"></div>
    </div>
  </section>

  <main id="main">
    <section id="portfolio" class="wow fadeInUp">
      <div class="container">
        <div class="section-header">
          <h2>Our Portfolio</h2>
          <p>“The Impulse to Travel is one of the hopeful symptoms of life” ... </p>
        </div>
      </div>

      <div class="container-fluid">
        <div class="row no-gutters">
          <?php
          for ($i = 1; $i <= 8; $i++) {
            echo '
              <div class="col-lg-3 col-md-4">
                <div class="portfolio-item wow fadeInUp">
                  <a href="img/port' . $i . '.jpg" class="portfolio-popup">
                    <img src="img/port' . $i . '.jpg" alt="" style="height:350px;">
                    <div class="portfolio-overlay">
                      <div class="portfolio-info"><h2 class="wow fadeInUp"></h2></div>
                    </div>
                  </a>
                </div>
              </div>';
          }
          ?>
        </div>
      </div>
    </section>

    <section id="Partners" class="wow fadeInUp">
      <div class="container">
        <div class="section-header">
          <h2>Partners</h2>
          <p>With their Help and Cooperation we make your travel full of Joy and Memorable</p>
        </div>
        <div class="owl-carousel clients-carousel">
          <img src="img/partner1.png" alt="">
          <img src="img/partners2.jpeg" alt="">
          <img src="img/partner3.jpg" alt="">
          <img src="img/partner4.jpg" alt="">
          <img src="img/partner5.png" alt="">
        </div>
      </div>
    </section>

    <section id="about" class="wow fadeInUp">
      <div class="container">
        <div class="row">
          <div class="col-lg-6 about-img">
            <img src="img/port3.jpg" alt="">
          </div>
        </div>
      </div>
    </section>
  </main>

  <footer id="footer">
    <div class="container">
      <div class="copyright">
        &copy; Copyright <strong>Traveler</strong>. All Rights Reserved
      </div>
      <div class="credits">
        Designed by <a href="#">Bus Transport</a>
      </div>
    </div>
  </footer>

  <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

  <script src="lib/jquery/jquery.min.js"></script>
  <script src="lib/jquery/jquery-migrate.min.js"></script>
  <script src="lib/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="lib/easing/easing.min.js"></script>
  <script src="lib/superfish/hoverIntent.js"></script>
  <script src="lib/superfish/superfish.min.js"></script>
  <script src="lib/wow/wow.min.js"></script>
  <script src="lib/owlcarousel/owl.carousel.min.js"></script>
  <script src="lib/magnific-popup/magnific-popup.min.js"></script>
  <script src="lib/sticky/sticky.js"></script>
  <script src="contactform/contactform.js"></script>
  <script src="js/main.js"></script>

</body>
</html>
