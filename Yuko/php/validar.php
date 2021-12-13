<?php
$correo=$_POST['correo'];
$contra=$_POST['contra'];

//Conexion a la base en el servidor
// $usuario = "id11774952_root";
// $contrasena = "tacosde.canasta";
// $servidor = "localhost";
// $basededatos = "id11774952_cosechando";

//conexion a la base de datos
$usuario = "root";
//$contrasena = "utec"; //contraseña Yuko
$contrasena = ""; //contraseña universal
$servidor = "localhost:3306";
$basededatos = "COSECHANDO";

$conexion = mysqli_connect( $servidor, $usuario,$contrasena) or die ("No se ha podido conectar al servidor de Base de datos");
$db = mysqli_select_db( $conexion, $basededatos ) or die ( "Upps! Pues siempre no quizo conectar a la base de datos" );

$consulta="SELECT * FROM USUARIO WHERE CORREO_U='$correo' AND PASSWORD_U=MD5('$contra');";
$resultado=mysqli_query($conexion, $consulta);

//validacion
$filas=mysqli_num_rows($resultado);
if ($filas > 0) {
    //Obtener el id 
    $indice = $resultado->fetch_row();
    $id_usuario = $indice[0];
    //Iniciar la sesión
    session_start();
    $_SESSION['usuario'] = $id_usuario;
    header('location:session_begin.php');
}
else {
    header('location:log_in.html');
    echo '<script type="text/javascript">alert("Porfavor verifica tus datos");
    window.location.href="log_in.html";</script>';
}
mysqli_close($conexion);
