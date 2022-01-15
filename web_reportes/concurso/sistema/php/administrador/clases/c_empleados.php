<?php
ini_set('display_errors', '1');
class Administrador
{
    function Crear($datos)
    {
        $iduser    = $_POST['iduser'];
        $usuario   = $_POST['usuario'];
        $nombres   = $_POST['nombres'];
        $apellidos = $_POST['apellidos'];
        $celular   = $_POST['celular'];
        $correo    = $_POST['correo'];
        $password  = $_POST['password'];
        $passwordConf  = $_POST['passwordConf'];

        if($password !== $passwordConf){
            $respuesta['status'] = "error";
            $respuesta['mensaje'] = "La contraseñas no coinciden";
        }
        $fecha_actual = date('Y-m-d');
        // Imagen  
        $hoy = date("YmdHis");

        $carpeta = "../../imagenes/users/administradores/";

        $nombreImagen  = $_FILES['foto']['name'];

        $ext = explode("/", $_FILES['foto']['type']);
        $extension = strtolower(end($ext));
        $nombreFinal = $hoy . '.' . $extension;

        // VALIDACION POR PIXELES
        if ($nombreImagen !== "") {
            $pixeles = getimagesize($_FILES['foto']['tmp_name']);
            $minimo = array(
                'width' => '734',
                'height' => '778'
            );
            $maximo = array(
                'width' => '734',
                'height' => '778'
            );

            $altura  = $pixeles[0];
            $achura  = $pixeles[1];

            $pequeña = "El tamaño minimo es {$minimo['width']} x {$minimo['height']} \n Tu imagen es $altura x $achura ";
            $grande  = "El tamaño maximo es {$maximo['width']} x {$maximo['height']} \n Tu imagen es $altura x $achura ";
        }


        if ($extension == 'jpg' || $extension == 'png' || $extension == 'jpeg') {
            if ($altura < $minimo['width'] || $achura < $minimo['height']) {

                $respuesta['status']  = "error";
                $respuesta['mensaje'] =  $pequeña;
            } else if ($altura > $maximo['width'] || $achura > $maximo['height']) {

                $respuesta['status']  = "error";
                $respuesta['mensaje'] = $grande;
                $respuesta['status']  = "error";
                $respuesta['mensaje'] = $grande;
            } else {
                $verificar = "SELECT * from tb_usuarios where usuario = '$usuario' ";

                $data = Conexion::buscarVariosRegistro($verificar);
                if ($data) {
                    $respuesta['status'] = "existe";
                    $respuesta['mensaje'] = "El usuario ya existe";
                } else {
                    if (move_uploaded_file($_FILES['foto']['tmp_name'], $carpeta . $nombreFinal)) {
                        // $tb_empleados ='1';
                        $tb_empleados = Conexion::UpdateRegistro("INSERT INTO tb_empleados  (nombres,apellidos,celular,fecha_creado,usuario_creado)  VALUES  ('" . htmlentities($nombres) . "','" . htmlentities($apellidos) . "','" . htmlentities($celular) . "', now(),'" . htmlentities($iduser) . "')");
                        if ($tb_empleados) {
                            $pass           = sha1($password);
                            $cod_usuario = Conexion::lastId();

                            // $tb_usuarios = '1';
                            $tb_usuarios = Conexion::UpdateRegistro("INSERT INTO tb_usuarios (cod_usuario,cod_rol,usuario,correo,password,foto,estado,conexion,usuario_creado,fecha_creado) VALUES  ('" . htmlentities($cod_usuario) . "',1,'" . htmlentities($usuario) . "','" . htmlentities($correo) . "', '" . htmlentities($pass) . "','" . htmlentities($nombreFinal) . "','A','D','" . htmlentities($iduser) . "',now())");
                            if ($tb_usuarios) {
                                $respuesta['status'] = "correcto";
                                $respuesta['mensaje'] = "Cuenta creada";
                            } else {
                                $respuesta['status'] = "error";
                                $respuesta['mensaje'] = "Error al guardar";
                            }
                        } else {
                            $respuesta['status'] = "error";
                            $respuesta['mensaje'] = "Los datos no pudiern se guardados";
                        }
                    } else {
                        $respuesta['status'] = "error";
                        $respuesta['mensaje'] = "La foto no pudo ser almacenada en los archivos";
                    }
                }
            }
        } else {
            $respuesta['status']  = "error";
            $respuesta['mensaje'] = "Solo se acepta formatos jpg, png, jpeg";
        }

        return $respuesta;
    }

    function CambiarEstado($iduser, $cod_usuario, $estado)
    {
        $tb_empleados = Conexion::UpdateRegistro("update tb_empleados set estado = '$estado',  
                                                               fecha_editado = now(), usuario_editado = '$iduser'
                                                               where cod_empleado = '$cod_usuario'  ");
        if ($tb_empleados) {
            $respuesta['status'] = "correcto";
            $respuesta['mensaje'] = "Estado actualizado";
        } else {
            $respuesta['status'] = "error";
            $respuesta['mensaje'] = "Error al actualizar";
        }


        return $respuesta;
    }
    function ActualizarCuenta($datos)
    {
        $iduser      = $_POST['iduser'];
        $cod_usuario = $_POST['cod_usuario'];
        $cod_rol     = $_POST['cod_rol'];
        $usuario     = $_POST['usuario'];
        $correo      = $_POST['correo'];
        // $data = Conexion::buscarVariosRegistro("SELECT * FROM tb_usuarios where usuario = '$usuario' or email = '$email' ");
        // foreach ($data as $d) {
        //     $usuarioActual = $d['usuario'];
        //     $emailActual = $d['email'];
        // }

        if ($_FILES['imagen']['name'] !== '') {
            $carpeta = "../../imagenes/users/administradores/";
            $imagen = $_FILES['imagen']['name'];

            //imagen.casa.jpg
            $temp = explode('.', $imagen);
            $extension = end($temp);
            $nombreFinal = time() . '.' . $extension;

            if (
                $extension == 'jpg' || $extension == 'png' || $extension == 'jpeg' ||
                $extension == 'JPG' || $extension == 'PNG' || $extension == 'JPEG'
            ) {
                if (move_uploaded_file($_FILES['imagen']['tmp_name'], $carpeta . $nombreFinal)) {
                    $data = Conexion::buscarVariosRegistro("SELECT foto FROM tb_usuarios where id_usuario = '$iduser' ");
                    foreach ($data as $d) {
                        $imagenAntigua = $d['foto'];
                    }
                    if (file_exists('../../imagenes/users/administradores/' . $imagenAntigua)) {
                        unlink('../../imagenes/users/administradores/' . $imagenAntigua);
                    }
                    $tb_usuarios  = Conexion::UpdateRegistro("UPDATE tb_usuarios set foto = '$nombreFinal', usuario = '$usuario', correo = '$correo', usuario_editado ='$iduser', fecha_editado = now()
                     where cod_usuario = '$cod_usuario' and cod_rol = '$cod_rol' ");
                    if ($tb_usuarios) {
                        $respuesta['status'] = "correcto";
                        $respuesta['mensaje'] = "Cuenta actualizada!";
                    } else {
                        $respuesta['status'] = "error";
                        $respuesta['mensaje'] = "Error al actualizar";
                    }
                } else {

                    $respuesta['status'] = "error";
                    var_dump($nombreFinal);
                    $respuesta['mensaje'] = "La imagen no se pudo subir";
                }
            } else {
                $respuesta['status'] = "error";
                $respuesta['mensaje'] = "Solo se aceptan jpg, png, jpeg";
            }
        } else {
            $tb_usuarios  = Conexion::UpdateRegistro("UPDATE tb_usuarios set usuario = '$usuario', correo = '$correo', usuario_editado ='$iduser', fecha_editado = now()
            where cod_usuario = '$cod_usuario' and cod_rol = '$cod_rol' ");
            if ($tb_usuarios) {
                $respuesta['status'] = "correcto";
                $respuesta['mensaje'] = "Cuenta actualizada!";
            } else {
                $respuesta['status'] = "error";
                $respuesta['mensaje'] = "Error al actualizar";
            }
        }


        return $respuesta;
    }

    // ACTUALIZAR INFORMACION PERSOANL
    function ActualizarInfoPersonal($datos)
    {
        $iduser            = $_POST['iduser'];
        $cod_empleado = $_POST['cod_empleado'];
        $nombres           = $_POST['nombres'];
        $apellidos         = $_POST['apellidos'];
        $celular           = $_POST['celular'];

        $tb_empleados  = Conexion::UpdateRegistro("UPDATE tb_empleados set 
            nombres = '$nombres', apellidos = '$apellidos', celular = '$celular',
            fecha_editado = now(), usuario_editado = '$iduser'
            where cod_empleado = '$cod_empleado' ");
        if ($tb_empleados) {
            $respuesta['status'] = "correcto";
            $respuesta['mensaje'] = "Información actualizada!";
        } else {
            $respuesta['status'] = "error";
            $respuesta['mensaje'] = "Error al actualizar";
        }
        return $respuesta;
    }

    // 40bd001563085fc35165329ea1ff5c5ecbdbbeef
    function ActualizarPassword($datos)
    {

        $iduser         = $_POST['iduser'];
        $cod_usuario    = $_POST['cod_usuario'];
        $cod_rol        = $_POST['cod_rol'];
        $passwordActual = $_POST['passwordActual'];
        $passwordNueva  = $_POST['passwordNueva'];
        $passwordConf    = $_POST['passwordConf'];
        if ($passwordNueva != $passwordConf) {
            $respuesta['status'] = "error";
            $respuesta['mensaje'] = "Las contraseñas no coinciden";
        } else {
            $passActual = sha1($passwordActual);
            $data = Conexion::buscarVariosRegistro("SELECT * from tb_usuarios where password = '$passActual' and cod_usuario = '$cod_usuario' and cod_rol = '$cod_rol' ");

            if (!$data) {
                $respuesta['status'] = "error";
                $respuesta['mensaje'] = "La ultima contraseña usada no coincide";
            } else {
                $pass = sha1($passwordNueva);
                $tb_usuarios = Conexion::UpdateRegistro("UPDATE tb_usuarios set  password = '$pass', fecha_editado = now(), usuario_editado = '$iduser' 
                where cod_usuario = '$cod_usuario' and cod_rol = '$cod_rol' ");

                if ($tb_usuarios) {
                    $respuesta['status'] = "correcto";
                    $respuesta['mensaje'] = "Contraseña actualizada!";
                } else {
                    $respuesta['status'] = "error";
                    $respuesta['mensaje'] = "Error al actualizar";
                }
            }
        }

        return $respuesta;
    }

    function EliminarCuenta($datos)
    {
        $iduser         = $_POST['iduser'];
        $cod_usuario    = $_POST['cod_usuario'];
        $cod_rol        = $_POST['cod_rol'];
        $tb_empleados = Conexion::UpdateRegistro("UPDATE tb_usuarios set estado = 'D', usuario_eliminado = '$iduser', fecha_eliminado = now() 
         where cod_usuario = '$cod_usuario' and cod_rol = '$cod_rol' ");
        if ($tb_empleados) {
            $respuesta['status'] = "correcto";
            $respuesta['mensaje'] = "Cuenta eliminada";
        } else {
            $respuesta['status'] = "error";
            $respuesta['mensaje'] = "Error al eliminar ";
        }
        return $respuesta;
    }

    function ActualizarEstado($datos)
    {
        $iduser         = $_POST['iduser'];
        $cod_usuario    = $_POST['cod_usuario'];
        $cod_rol        = $_POST['cod_rol'];
        $estado         = $_POST['estado'];
        $tb_empleados = Conexion::UpdateRegistro("UPDATE tb_usuarios set estado = '$estado', usuario_editado = '$iduser', fecha_editado = now() 
         where cod_usuario = '$cod_usuario' and cod_rol = '$cod_rol' ");
        if ($tb_empleados) {
            $respuesta['status'] = "correcto";
            $respuesta['mensaje'] = "Estado actualizado";
        } else {
            $respuesta['status'] = "error";
            $respuesta['mensaje'] = "Error al eliminar ";
        }
        return $respuesta;
    }
}
