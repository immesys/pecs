
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Bootstrap, from Twitter</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link href="static/css/bootstrap.css" rel="stylesheet">
    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
      .tab-content  
    {
    overflow:hidden;
    }
    </style>
    <link href="static/css/bootstrap-responsive.css" rel="stylesheet">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="../assets/js/html5shiv.js"></script>
    <![endif]-->

    <!-- Fav and touch icons -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
      <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
                    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
                                   <link rel="shortcut icon" href="../assets/ico/favicon.png">

    <!--Slider -->
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
  </head>

  <body>

    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="brand" href="#">PECS</a>
          <div class="nav-collapse collapse">
            <ul class="nav">
              <li><a href="/">Home</a></li>
              <li class="active"><a href="/about">About</a></li>
              <li><a href="/contact">Contact</a></li>
            </ul>
            <form class="navbar-form pull-right">
              <input class="span2" type="text" placeholder="User ID">
              <input class="span2" type="password" placeholder="Password">
              <button type="submit" class="btn">Sign in</button>
            </form>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>

    <div class="container">
      <h1>About</h1>
      <p>PECS was started by us: Michael Andersen and Joseph Bynoe. We are both graduate students at the University of California, Berkeley working in conjunction with Centre of the Built Environment (CBE) here at Berkeley. We became involved with this idea as a final project for our Interactive Device Design course. 
      </p>

      <h3>What is PECS?</h3>
      <p>
      PECS or Personal Environmental Control System is a system composed of a heating/cooling fan and chair combined with a footwarmer. The idea is that an individual can sit down at one of these stations and adjust the three devices so that they can feel comfortable, at least thermally. The settings can be controlled via this website or the 
      </p>

      <p>Control of an individual chair was the just the beginning. Our true goal was to establish a platform where users could move between these chair-fan-footwarmer setups and have their heating/cooling profiles uploaded via bluetooth or the internet. By simply scanning the QR code on the chair pre established profiles can be uploaded as well as altered to suit the user's preferences. </p>

      <p>
      Using heating and cooling information from the devices, we can relay important temperature information to building managers so that they can make educated decisions as to temperature set points. If there are many people in the same area feeling warm then the manager can lower the temperature in that particular room. The hope is that this will lead to reduced energy waste.
      </p>

      <br>
      <img src="static/img/pecs_logo.jpg" style = "width: 500px; display:inline"><img src="static/img/cbe.jpg" style="display:inline; width: 500px;">
      
      <footer>
        <p>&copy; PECS - Michael Andersen and Joseph Bynoe 2013</p>
      </footer>

    </div>


    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="static/js/jquery.js"></script>
    <script src="static/js/bootstrap.js"></script>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

  </body>
</html>
