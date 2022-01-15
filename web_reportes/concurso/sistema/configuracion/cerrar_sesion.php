<?php 
session_start();
include_once 'conexion.php';
// $id_email=$_SESSION['datos_login']['email'];
// if($_SESSION['datos_login']['conexion'] == 'C'){
// 	$sql="UPDATE tb_usuarios SET conexion='D' WHERE email='$id_email' ";
// 	$result = $conexion->query($sql);
// }
unset($_SESSION['datos_login']);
header("Location: ../../");
session_destroy();
?>