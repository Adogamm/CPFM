<?php
    session_start();
    $varsession = $_SESSION['registro'];
    $correo = $varsession;
    $coordenadas = $_POST['coords'];
    $tama = "ldldlld";
    
    if($varsession == null || $varsession = ''){
        echo 'No tienes autorización para estar aquí insecto';
        die();
    }

    //Conexion a la base en el servidor
    // $usuario = "id11774952_root";
    // $contrasena = "tacosde.canasta";
    // $servidor = "localhost";
    // $basededatos = "id11774952_cosechando";

    // Conexion a la base de datos
    $usuario = "root";
    $contrasena = "";
    $servidor = "localhost:3306";
    $basededatos = "COSECHANDO";

    $conexion = mysqli_connect( $servidor, $usuario,$contrasena) or die ("No se ha podido conectar al servidor de Base de datos");
    $db = mysqli_select_db( $conexion, $basededatos ) or die ( "Upps! Pues siempre no quizo conectar a la base de datos" );
    
    $consulta = "CALL Creacion_id_terreno('$coordenadas','$correo')";
    $resultado = mysqli_query( $conexion, $consulta ) or die ($conexion->error);
    
    header("Location:../log_in.html");

    mysqli_close( $conexion );
?>
  