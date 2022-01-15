<?php
// ini_set('display_errors', '1');
require_once "../../configuracion/conexion.php";
require_once "clases/c_voluntarios.php";
$voluntarios = new voluntarios();

$tipo = $_POST['tipo'];
if(is_null($tipo)){
    $tipo = $_POST['tipo'];
}

// var_dump($tipo);
switch($tipo){
    case "UD":
        $return = $voluntarios->ActualizarDatos($_POST); 
        break;
}


header("Content-Type:Application/json");
echo die(json_encode($return))
?>