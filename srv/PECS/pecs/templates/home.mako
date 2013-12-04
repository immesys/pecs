
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>PECS</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" 
      type="image/png" 
      href="static/img/favicon.png">
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
              <li class="active"><a href="#">Home</a></li>
              <li><a href="/about">About</a></li>
              <!--<li><a href="#contact">Trends</a></li> -->
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

      <!-- Main hero unit for a primary marketing message or call to action -->
      <div class="hero-unit">
        <h1>Hello!</h1>
        <p></p>
        <p>Welcome to the Personal Environmental Control System or as we like to call it, PECS. On this page, you will have the ability to control the heating and cooling features of the chair, fan and footwarmer. </p>
        <p><a href="/about" class="btn btn-primary btn-large">Learn more &raquo;</a></p>
      </div>

      <div>
        <h2>Getting Started</h2>
        <p>In order to get started you can:
          <ol>
            <li>Scan the QR code on the chair's screen</li>
            <img src="static/img/qrcode.jpg" style="height:305px">
            <p style = "clear: both;">
            <li>Enter in the number found on the chair's screen</li>
            <img src="static/img/screen_num.png" style="height:350px">
          </ol>
          <p><b>Hint:</b> If you are looking for the screen it is located underneath the left arm of your chair on top of the black control box. </p>
          <p>Scanning this will send you to the controls for your chair, fan and footwarmer.</p>
        </p>
      </div>

      <br>
      <img src="static/img/pecs_logo.jpg" style = "width: 500px; display:inline"><img src="static/img/cbe.jpg" style="display:inline; width: 500px;">

      <footer>
        <p>&copy; PECS - Michael Andersen and Joseph Bynoe 2013</p>
      </footer>

    </div> <!-- /container -->

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="static/js/jquery.js"></script>
    <script src="static/js/bootstrap.js"></script>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <script>
      $(function() { 
        $( "#chaircoolslider" ).slider({
          value: 4,
          orientation: "horizontal",
          min:"0",
          max:"7",
          width:"95%",
          
        });
        $( "#chaircoolvalue" ).html("Cooling level: "+ $( "#chaircoolslider" ).slider( "value" ) );
      });
    </script>
    <script>
      $(function() { 
        $( "#chairheatslider" ).slider({
          value: 0,
          orientation: "horizontal",
          min:"0",
          max:"1",
	  width:"95%",
          backgroundColor: "#0000FF",
          animate: true,
          
        });
        $( "#chairheatvalue" ).html("Heating level: "+ $( "#chairheatslider" ).slider( "value" ) );
      });
    </script>
    <script>
      $(function() { 
        $( "#fancoolslider" ).slider({
          value: 4,
          orientation: "horizontal",
          min:"0",
          max:"7",
          backgroundColor: "#0000FF",
          animate: true,
          
        });
        $( "#fancoolvalue" ).html("Cooling level: "+ $( "#fancoolslider" ).slider( "value" ) );
      });
    </script>
    <script>
      $(function() { 
        $( "#fanheatslider" ).slider({
          value: 0,
          orientation: "horizontal",
          min:"0",
          max:"1",
          backgroundColor: "#0000FF",
          animate: true,
          
        });
        $( "#fanheatvalue" ).html("Heating level: "+ $( "#fanheatslider" ).slider( "value" ) );
      });
    </script>
    <script>
      $(function() { 
        $( "#fwheatslider" ).slider({
          value: 0,
          orientation: "horizontal",
          min:"0",
          max:"1",
          backgroundColor: "#0000FF",
          animate: true,
          
        });
        $( "#fwheatvalue" ).html("Heating level: "+ $( "#fwheatslider" ).slider( "value" ) );
      });
    </script>


  </body>
</html>
