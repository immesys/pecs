
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
              <li class="active"><a href="#">Home</a></li>
              <li><a href="#about">About</a></li>
              <li><a href="#contact">Trends</a></li>
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
        <h1>Hello User</h1>
        <p></p>
        <p>Welcome to the Personal Environmental Control System or as we like to call it, PECS. On this page, you will have the ability to control the heating and cooling features of the chair, fan and footwarmer. </p>
        <p><a href="#about" class="btn btn-primary btn-large">Learn more &raquo;</a></p>
      </div>

      <h2>You are currently using chair: ${chair["uid"]}</h2>

      <!-- Example row of columns 
      <div class="row">
        <div class="span4">
          <h2>Chair</h2>
          <p>Your chair is equipped with 3 fans and 2 two heating strips. You can adjust the sliders below to change the level of heating and cooling within the chair </p>  
          <div style="text-align:center">
          <div style="margin:10px 10px 10px 10px">
          <h4 id="chaircoolvalue"></h4>
          <div id="chaircoolslider" style="width:95%"></div>
          <h4 id="chairheatvalue" style="width:95%"></h4>
          <div id="chairheatslider" style="width:95%"></div> 
          </div></div>
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

-->
      <div id="content">
        <ul id="tabs" class="nav nav-tabs" data-tabs="tabs">
          <li class="active"><a href="#chair" data-toggle="tab"><FONT Size=5>Chair</FONT></a></li>
          <li><a href="#fan" data-toggle="tab"><FONT Size=5>Fan</FONT></a></li>
          <li><a href="#footwarmer" data-toggle="tab"><FONT Size=5>Footwarmer</FONT></a></li>
        </ul>
        <div id="my-tab-content" class="tab-content">
          <div class="tab-pane active" id="chair">
             <div style="text-align:center">
          <div style="margin:10px 10px 10px 10px">
          <h4 id="chaircoolvalue"></h4>
          <div id="chaircoolslider" style="width:100%"></div>
          <h4 id="chairheatvalue" style="width:100%"></h4>
          <div id="chairheatslider" style="width:100%"></div>
          </div></div>
          </div>
          <div class="tab-pane" id="fan">
          <p>The fan that is residing on your desk is capable of three speeds and has a heating lamp built in for warmth. If you wish, you can have both at the same time. Just toggle the controls below. </p>
              <h4 id="fancoolvalue"></h4>
              <div id="fancoolslider"></div>
              <h4 id="fanheatvalue"></h4>
              <div id="fanheatslider"></div>
          </div>
          <div class="tab-pane" id="footwarmer">
              <p>The footwarmer is only capable of providing heat. It is located underneath your desk.</p>
              <h4 id="fwheatvalue"></h4>
              <div id="fwheatslider"></div>
          </div>
        </div>
      </div>
      
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
          width:"95%",
          slide: function( event, ui ) {
            $.getJSON(${code}+"/fan",{"v":ui.value},function(data, stat)
            {
                console.log("dat",data, "stat",stat);
            });
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
	  width:"95%",
          backgroundColor: "#0000FF",
          animate: true,
          slide: function( event, ui ) {
            $.getJSON(${code}+"/heat",{"v":ui.value},function(data, stat)
            {
                console.log("dat",data, "stat",stat);
            });
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
