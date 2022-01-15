<?php
// require_once "./conexion.php";
require_once "../sistema/configuracion/conexion.php";
session_start();
$email  = $_POST['correo'];
$password = $_POST['password'];
$pass     = sha1($password);
$tb_usuarios = Conexion::buscarVariosRegistro("SELECT 
tu.id_usuario, tu.cod_usuario, tu.cod_rol, tu.usuario, tu.correo,
ta.nombres, ta.apellidos, tu.foto, tu.estado 
from tb_usuarios tu 
INNER JOIN tb_administradores ta on ta.cod_administrador = tu.cod_usuario 
INNER JOIN tb_empleados    tg on tg.cod_empleado = tu.cod_usuario
where tu.correo = '$email' and tu.password = '$pass' and tu.estado in ('A','I') ");

if ($tb_usuarios) {
    foreach ($tb_usuarios as $d) {
        $iduser      = $d['id_usuario'];
        $cod_usuario = $d['cod_usuario'];
        $cod_rol     = $d['cod_rol'];
        $usuario     = $d['usuario'];
        $nombres     = $d['nombres'];
        $apellidos   = $d['apellidos'];
        $estado      = $d['estado'];
    }
    if ($cod_rol == '1') {
        if ($estado == 'A') {
            $_SESSION['datos_login'] = array(

                'iduser'      => $iduser,
                'cod_usuario' => $cod_usuario,
                'cod_rol'     => $cod_rol,
                'usuario'     => $usuario,
                'nombres'     => $nombres,
                'apellidos'   => $apellidos
            );
            $respuesta['status'] = "1";
            // $respuesta['mensaje'] = "Su cuenta esta admin";
        } else {
            $respuesta['status'] = "bloqueo";
            // $respuesta['mensaje'] = "Su cuenta esta inactiva, contactate con el administrador";
        }
    } else {
        if ($estado == 'A') {
            $_SESSION['datos_login'] = array(

                'iduser'      => $iduser,
                'cod_usuario' => $cod_usuario,
                'cod_rol'     => $cod_rol,
                'usuario'     => $usuario,
                'nombres'     => $nombres,
                'apellidos'   => $apellidos
            );
            $respuesta['status'] = "1";
            // $respuesta['mensaje'] = "Su cuenta esta admin";
        } else {
            $respuesta['status'] = "bloqueo";
            // $respuesta['mensaje'] = "Su cuenta esta inactiva, contactate con el administrador";
        }
    }
} else {
    $respuesta['status'] = "error";
    $respuesta['mensaje'] = "Por favor verificar su usuario o clave";
}


header('Content-Type: application/json');
echo json_encode($respuesta);
