<?php
  session_start();
  $varsession = $_SESSION['registro'];

  if($varsession == null || $varsession = ''){
      header('location:php/session_begin.php');
  }
  ?>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="css/theme.css">
  <title>Perfil</title>
  <link rel="icon" href="images/icons/024-plant.png">
</head>
<body style="background-image: linear-gradient(to bottom, rgba(0, 0, 0, .75), rgba(0, 30, 0,0.75)), url(images/main_img/bonsai.jpg);	background-position: center center, center center;	background-size: cover, cover;	background-repeat: no-repeat; background-attachment: fixed;">

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
    <div class="collapse navbar-collapse" id="navbar18">
      <a class="navbar-brand d-none d-md-block" href="index.html"></a>
      <ul class="navbar-nav mx-auto">
        <li class="nav-item"> <a class="nav-link" href="index.html">Inicio</a> </li>
        <li class="nav-item"> <a class="nav-link" href="about.html">Acerca de nosotros</a> </li>
        <li class="nav-item"> <a class="nav-link" href="address_register.html">Registra tu terreno</a> </li>
        <li class="nav-item"> <a class="nav-link" href="#">En proceso</a> </li>
        <li class="nav-item"> <a class="nav-link" href="#">Logros</a> </li>
        <li class="nav-item"> <a class="nav-link" href="php/log_out.php" style="color: white;">Cerrar sesión</a> </li>
      </ul>
    </div>
  </div>
</nav>
<br><br>

<div class="container">
  <div class="row">

    <!-- Información del perfil -->
    <div class="col-md-3" id="infousr" style="margin-right: 1.5%; border-radius: 20px;">
        <img id="imusr" class="img-fluid" src="images/main_img/user.jpg" style="margin-top: 7%;"><br><br>
        <h3 style="margin-left: 50px;">Peter Parker</h3><br>
      <img src="images/icons/progress/018-medal.png" alt="Logros" height="50px" width="50px">
      <a href="progress.html" style="color: black;">Logros</a><br><br>
      <img src="images/icons/progress/032-progress.png" alt="Progreso" height="50px" width="50px">
      <a href="progress.html" style="color: black;"> Progreso</a><br><br>
      <img src="images/icons/exit.png" alt="Cerrar Sesión" height="45px" width="45px">
      <a href="php/log_out.php" style="color: black;">Cerrar Sesión</a><br><br>
    </div>



    <!--El muro-->
<div class="col-lg-8 p-md-5 p-3 flex-column justify-content-center" id="muro" style="border-radius: 20px;">
  
  <div class="container">
    <div class="row">
      <div class="col-7" style="margin-top: 10%;">
        <img src="images/mainuser/uno.jpg" class="img-fluid" height="250px" width="250px" style="border-radius: 20px;">
      </div>
      <div class="col-4">
        <h5 class="mb-0 justify-content-center">Unete a nuestra primer campaña de reforestación</h5>
        <p class="mb-0 justify-content-center" style="text-align: justify;">Estamos buscando gente que se una a nuestra primer campaña de reforestación, una vez alcanzada la meta 
          de personas, se establecerá el lugar y la fecha. ¡Esperamos contar con tu participación! todo nuestro equipo te espera
        </p>
      </div>
    </div>
  </div><br><br><hr>

  <div class="container">
      <div class="row">
        <div class="col-7" style="margin-top: 10%;">
          <img src="images/mainuser/dos.jpg" class="img-fluid" height="250px" width="250px" style="border-radius: 20px;">
        </div>
        <div class="col-4">
          <h5 class="mb-0 justify-content-center">Hidalgo siembra contigo</h5>
          <p class="mb-0 justify-content-center" style="text-align: justify;">El pasado mes de Junio se llevo a cabo la campaña de reforestación Hidalgo siembre contigo
            en la capital del estado de Hidalgo donde decenas de familias acudieron para ayudar a sembrar árboles.
          </p>
        </div>
      </div>
    </div><br><br><hr>

    <div class="container">
        <div class="row">
          <div class="col-7" style="margin-top: 10%;">
              <video src="video/Cosecha Time Lapse  (Diego Bolinger ) GoPro.mp4" height="250px" width="250px" class="embed-responsive-item" controls="controls"> Your browser does not support HTML5 video. </video>
          </div>
          <div class="col-4" style="margin-top: 15%;">
            <h5 class="mb-0 justify-content-center">¡Hora de cosechar!</h5>
            <p class="mb-0 justify-content-center" style="text-align: justify;">Ya se acerca la época de las cosehas, y tú ¿Estás listo para cosechar?
              recuerda que despues de realizada la cosecha, se tiene que tratar el suelo para volver a sembrar
            </p>
          </div>
        </div>
      </div><br><br><hr>

</div>




<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="js/bootstrap.js"></script>

</body>
</html>
