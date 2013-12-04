
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>PECS</title>
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
              <li><a href="/about">About</a></li>
              <li class="active"><a href="/contact">Contact</a></li>
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
      <h1> Contact </h1>
      <div>
        <p>We are always looking to improve our product. If you have any comments or concerns we would love to hear from you. </p>
      </div>

      <img src="static/img/chair.jpg" style="float:left; height:400px; margin-right:50px">
      <form action="demo_form.asp">
        Name: <br><input type="text" name="name" placeholder="John Doe" style="width:40%"><br>
        Email: <br><input type="text" name="email" placeholder="johndoe@gmail.com" style="width:40%"><br>
        Comment: <br><textarea name="Comment" placeholder="Great Job!" rows="10" style="width:40%"></textarea>
        <br>
        <button type="submit" class="btn">Submit</button>
      </form>

      <p style = "clear: both;">
      
      <br><br><br>
      <img src="static/img/pecs_logo.jpg" style = "width: 500px; display:inline"><img src="static/img/cbe.jpg" style="display:inline; width: 500px; ">

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
