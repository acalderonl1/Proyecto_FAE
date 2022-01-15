<?php
// ini_set('display_errors', '1');
class Voluntarios
{
    function Lista()
    {

        $data = Conexion::buscarVariosRegistro("SELECT * from tb_voluntarios ");
        $return = $data;
        return $return;
    }

    function ActualizarDatos($datos)
    {

        $iduser         = $_POST['iduser'];
        $cod_voluntario = $_POST['cod_voluntario'];
        $nombres        = $_POST['nombres'];
        $apellidos      = $_POST['apellidos'];
        $edad           = $_POST['edad'];
        $celular        = $_POST['celular'];
        $correo         = $_POST['correo'];
        $tb_voluntarios  = Conexion::UpdateRegistro("UPDATE tb_voluntarios set  
        nombres = '$nombres', apellidos = '$apellidos',  edad    = '$edad' ,   celular = '$celular', correo = '$correo',
        usuario_editado ='$iduser', fecha_editado = now() where cod_voluntario = '$cod_voluntario' ");
        if ($tb_voluntarios) {
            $respuesta['status'] = "correcto";
            $respuesta['mensaje'] = "Datos actualizados!";
        } else {
            $respuesta['status'] = "error";
            $respuesta['mensaje'] = "Error al actualizar";
        }
        return $respuesta;
    }
}