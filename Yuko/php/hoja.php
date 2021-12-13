<?php
//Conexion a la base de datos en el servidor
// $usuario = "id11774952_root";
// $contrasena = "tacosde.canasta";
// $servidor = "localhost";
// $basededatos = "id11774952_cosechando";

//Conexion a la base de datos
$usuario = "root";
$contrasena = ""; //contraseña de Yuko
// //$contasena = ""; //Contraseña universal :v
$servidor = "localhost:3306";
$basededatos = "COSECHANDO";

$conexion = mysqli_connect( $servidor, $usuario,$contrasena) or die ("No se ha podido conectar al servidor de Base de datos");
$db = mysqli_select_db( $conexion, $basededatos ) or die ( "Upps! Pues siempre no quizo conectar a la base de datos" );

$nombre = $_POST['Nombre'];
echo $nombre;
$apellidos = $_POST['Apellidos'];
echo $apellidos;
$correo = $_POST['Correo'];
echo $correo;
$password = $_POST['Password'];
echo $password;
$fecha = $_POST['Fecha'];
echo $fecha;


$consulta = "CALL Creacion_id_usuario('$nombre','$apellidos','$correo',MD5('$password'),'$fecha');";
$resultado = mysqli_query($conexion, $consulta) or die ( "Algo ha ido mal en la consulta verificala");

if(true){
    //Iniciar la sesión
    session_start();
    $_SESSION['registro'] = $correo;
    header("Location:../address_register.php");
}


mysqli_close($conexion);
?>  

