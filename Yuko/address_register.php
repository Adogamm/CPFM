<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="css/theme.css">
  <title>Registrar Terreno</title>
  <link rel="icon" href="images/icons/024-plant.png">
</head>

<body style="background-image: linear-gradient(to bottom, rgba(0, 0, 0, .75), rgba(0, 0, 0, .75)), url(images/main_img/253658.jpg);	background-position: center center, center center;	background-size: cover, cover;	background-repeat: no-repeat; background-attachment: fixed;">
  
<!-- Barra de navegación -->
  <nav class="navbar navbar-dark bg-dark">
    <div class="container" >
      <div class="navbar-brand">
        <img src="images/icons/024-plant.png" width="30" height="30">
        <a class="text-ceter" href="index.html"><b style="color: white;">Cosechando por tu futuro</b></a>
       </div> 
      <button class="navbar-toggler navbar-toggler-right border-0" type="button" data-toggle="collapse" data-target="#navbar18">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbar18"> <a class="navbar-brand d-none d-md-block" href="index.html">
        <ul class="navbar-nav mx-auto">
          <li class="nav-item"> <a class="nav-link" href="index.html">Inicio</a> </li>
            <li class="nav-item"> <a class="nav-link" href="about.html">Acerca de nosotros</a> </li>
            <li class="nav-item"> <a class="nav-link text-white" href="log_in.html">Iniciar sesión</a> </li>
            <li class="nav-item"> <a class="nav-link text-white" href="sing_in.html">Crear una cuenta<br></a> </li>
          </ul>
      </div>
    </div>
  </nav>



      <div class="container py-5">
        <div class="row">
            <div class="py-1 text-center text-white h-100 align-items-center d-flex" ></div>
          <div class="col-md-0 mx-auto">
            <h1 id="uno" class="display-2 mb-3">Registro de terreno</h1>


<!-- Mapa de GoogleMaps -->

<div id="map"></div>
<!-- #TODO Redirigir a una pagina -->
<form action="andosol.html" method="post">
  <input type="hidden" id="coords" name="coords">
  <input type="submit" class="btn btn-lg btn-primary mx-1" value="Registrar Terreno" id="BR"/>
</form>

<script type="text/javascript" src="js/maps.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?callback=initMap"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="js/bootstrap.js"></script>

</div>
</div>
</div>
</div>

<?php
  session_start();
  $varsession = $_SESSION['registro'];

  if($varsession == null || $varsession = ''){
      header('location:php/session_begin.php');
  }
  ?>

</body>
</html>