
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
    <link href='http://fonts.googleapis.com/css?family=Days+One' rel='stylesheet' type='text/css'>
    
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
        <p id="envbanner" style="font-family: 'Days One', sans-serif; font-size:250%; line-height:120%">It is ${env["tempf"]} &deg;F and ${env["humidity"]} %RH</p>
	<p></p>
        <p>But why not take the time to personalize your environment a little? On this page, you will have the ability to control the heating and cooling features of your chair</p>
        <p><a href="/about" class="btn btn-primary btn-large">Learn more &raquo;</a></p>
      </div>

      <h2>You are currently using chair: ${chair["uid"]}</h2>

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
      var g_last_fan_slide = 0;
      var g_last_heat_slide = 0;
      $(function() { 
        $( "#chaircoolslider" ).slider({
          value: ${chair["fan"]},
          orientation: "horizontal",
          min:"0",
          max:"7",
          width:"95%",
          slide: function( event, ui ) {
            $.getJSON("${code}/fan",{"v":ui.value},function(data, stat)
            {
                console.log("dat",data, "stat",stat);
            });
            $( "#chaircoolvalue" ).html("Cooling level: "+ ui.value );
            g_last_fan_slide = new Date().getTime();
          }
        });
        $( "#chaircoolvalue" ).html("Cooling level: "+ $( "#chaircoolslider" ).slider( "value" ) );
      });
      $(function() { 
        $( "#chairheatslider" ).slider({
          value: ${chair["heat"]},
          orientation: "horizontal",
          min:"0",
          max:"100",
	  width:"95%",
          backgroundColor: "#0000FF",
          animate: true,
          slide: function( event, ui ) {
            console.log("slide triggered");
            $.getJSON("${code}/heat",{"v":ui.value},function(data, stat)
            {
                console.log("dat",data, "stat",stat);
            });
            $( "#chairheatvalue" ).html("Heating level: "+ ui.value );
            g_last_heat_slide = new Date().getTime();
          }
        });
        $( "#chairheatvalue" ).html("Heating level: "+ $( "#chairheatslider" ).slider( "value" ) );
      });
      $(function() { 
        $( "#fancoolslider" ).slider({
          value: 0,
          orientation: "horizontal",
          min:"0",
          max:"7",
          backgroundColor: "#0000FF",
          animate: true,
          slide: function( event, ui ) {
            $.getJSON("${code}/lfan",{"v":ui.value},function(data, stat)
            {
                console.log("dat",data, "stat",stat);
            });
            $( "#fancoolvalue" ).html("Cooling level: "+ ui.value );
          }
        });
        $( "#fancoolvalue" ).html("Cooling level: "+ $( "#fancoolslider" ).slider( "value" ) );
      });
      $(function() { 
        $( "#fanheatslider" ).slider({
          value: 0,
          orientation: "horizontal",
          min:"0",
          max:"100",
          backgroundColor: "#0000FF",
          animate: true,
          slide: function( event, ui ) {
            $.getJSON("${code}/lheat",{"v":ui.value},function(data, stat)
            {
                console.log("dat",data, "stat",stat);
            });
            $( "#fanheatvalue" ).html("Heating level: "+ ui.value );
          }
        });
        $( "#fanheatvalue" ).html("Heating level: "+ $( "#fanheatslider" ).slider( "value" ) );
      });
      $(function() { 
        $( "#fwheatslider" ).slider({
          value: 0,
          orientation: "horizontal",
          min:"0",
          max:"64",
          backgroundColor: "#0000FF",
          animate: true,
          slide: function( event, ui ) {
           $.getJSON("${code}/wheat",{"v":ui.value},function(data, stat)
            {
                console.log("dat",data, "stat",stat);
            });
            $( "#fwheatvalue" ).html("Heating level: "+ ui.value );
          }
        });
        $( "#fwheatvalue" ).html("Heating level: "+ $( "#fwheatslider" ).slider( "value" ) );
      });
    $(document).ready(function() {svars();});
    
    function svars()
    {
        $.getJSON("vars/${uid}",{}, function(data, stat)
        {
            console.log("dat",data, "stat",stat);
            setTimeout("svars()", 2000);
            $("#envbanner").html("It is "+data["tempf"]+" &deg;F and "+data["humidity"]+" %RH");
            var t = new Date().getTime();
            console.log("Last fan slide time was: "+g_last_fan_slide);
            console.log("T is: "+t);
            if (t > g_last_fan_slide + 8000)
            {
                $( "#chaircoolslider" ).slider("value",data["fan"]);
                $( "#chaircoolvalue" ).html("Cooling level: "+ data["fan"] );
            }
            if (t > g_last_heat_slide + 8000)
            {
                $( "#chairheatslider" ).slider("value",data["heat"]);
                $( "#chairheatvalue" ).html("Heating level: "+ data["heat"] );
            }
        });
    }
    </script>


  </body>
</html>
