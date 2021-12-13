<?php
    session_start();
    $varsession = $_SESSION['usuario'];

    if($varsession == null || $varsession = ''){
        echo 'No tienes autorización para estar aquí insecto';
        die();
    }
    //echo $_SESSION['usuario'];
    header('location:../main_user.php')

?>
