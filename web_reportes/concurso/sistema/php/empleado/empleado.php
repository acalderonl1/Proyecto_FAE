<?php
// ini_set('display_errors', '1');
require_once "../../configuracion/conexion.php";
require_once "clases/c_empleado.php";
$empleado = new empleado();

$tipo = $_POST['tipo'];
if(is_null($tipo)){
    $tipo = $_POST['tipo'];
}

// var_dump($tipo);
switch($tipo){
    case "C":
        $return = $empleado->Crear($_POST); 
        break;
    
    case "UC":
        $return = $empleado->ActualizarCuenta($_POST); 
        break;

    case "UIP":    
        $return = $empleado->ActualizarInfoPersonal($_POST); 
        break;
        
    case "UP":    
        $return = $empleado->ActualizarPassword($_POST); 
        break;
    
    case "CE":    
        $return = $empleado->ActualizarEstado($_POST); 
        break;

     case "D":
        $return = $empleado->EliminarCuenta($_POST);   
        break;


}


header("Content-Type:Application/json");
echo die(json_encode($return))
?>