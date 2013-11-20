
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
              <li><a href="#about">About</a></li>
              <li><a href="#contact">Trends</a></li>
            </ul>
            <form class="navbar-form pull-right">
              <input class="span2" type="text" placeholder="Email">
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
        <h1>Hello, INSERT PERSONS NAME!</h1>
        <p></p>
        <p>Welcome to the Personal Environmental Control System or as we like to call it, PECS. On this page, you will have the ability to control the heating and cooling features of the chair, fan and footwarmer. </p>
        <p><a href="#about" class="btn btn-primary btn-large">Learn more &raquo;</a></p>
      </div>

      <!-- Example row of columns -->
      <div class="row">
        <div class="span4">
          <h2>Chair</h2>
          <p>Your chair is equipped with 3 fans and 2 two heating strips. You can adjust the sliders below to change the level of heating and cooling within the chair </p>  
          <h4 id="chaircoolvalue"></h4>
          <div id="chaircoolslider"></div>
          <h4 id="chairheatvalue"></h4>
          <div id="chairheatslider"></div> 
        </div>
        <div class="span4">
          <h2>Fan</h2>
          <p>The fan that is residing on your desk is capable of three speeds and has a heating lamp built in for warmth. If you wish, you can have both at the same time. Just toggle the controls below. </p>
          <h4 id="fancoolvalue"></h4>
          <div id="fancoolslider"></div>
          <h4 id="fanheatvalue"></h4>
          <div id="fanheatslider"></div>
       </div>
        <div class="span4">
          <h2>Footwarmer</h2>
          <p>The footwarmer is only capable of providing heat. It is located underneath your desk.</p>
          <h4 id="fwheatvalue"></h4>
          <div id="fwheatslider"></div>
        </div>
      </div>

      <ul class="nav nav-pills">
        <li class="active"><a href="#chair">Chair</a></li>
        <li><a href="#fan">Fan</a></li>
        <li><a href="#footwarmer">Footwarmer</a></li>
      </ul>

      <hr>

      <footer>
        <p>&copy; PECS 2013</p>
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
          backgroundColor: "#0000FF",
          animate: true,
          slide: function( event, ui ) {
            $( "#chaircoolvalue" ).html("Cooling level: "+ ui.value );
          }
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
          backgroundColor: "#0000FF",
          animate: true,
          slide: function( event, ui ) {
            $( "#chairheatvalue" ).html("Heating level: "+ ui.value );
          }
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
          slide: function( event, ui ) {
            $( "#fancoolvalue" ).html("Cooling level: "+ ui.value );
          }
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
          slide: function( event, ui ) {
            $( "#fanheatvalue" ).html("Heating level: "+ ui.value );
          }
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
          slide: function( event, ui ) {
            $( "#fwheatvalue" ).html("Heating level: "+ ui.value );
          }
        });
        $( "#fwheatvalue" ).html("Heating level: "+ $( "#fwheatslider" ).slider( "value" ) );
      });
    </script>


  </body>
</html>
