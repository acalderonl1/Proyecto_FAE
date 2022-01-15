<?php
session_start();
if($_SESSION['datos_login']['iduser'] == ""){
    header("Location: ../");
}
$servidor="localhost";
$nombreBd="concurso";
$usuario="root";
$pass="";
$conexion2 = new mysqli($servidor,$usuario,$pass,$nombreBd);
if($conexion2 -> connect_error ){
    die("No se pudo conectar");
    
}
$conexion2->set_charset('utf8');
$tb_usuarios = $conexion2->query("SELECT * from tb_usuarios where id_usuario ='".$_SESSION['datos_login']['iduser']."'")or die($conexion2->error);

    $datos_usuario = mysqli_fetch_row($tb_usuarios);
    $_SESSION['datos_login']['usuario']     = $datos_usuario[3];
    $_SESSION['datos_login']['correo']       = $datos_usuario[4];
    $_SESSION['datos_login']['password']    = $datos_usuario[5];
    $_SESSION['datos_login']['foto']      = $datos_usuario[6];
    $_SESSION['datos_login']['estado']      = $datos_usuario[7];
    $conexion2->close();
