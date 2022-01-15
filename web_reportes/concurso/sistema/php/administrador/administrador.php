<?php
// ini_set('display_errors', '1');
require_once "../../configuracion/conexion.php";
require_once "clases/c_administrador.php";
$administrador = new Administrador();

$tipo = $_POST['tipo'];
if(is_null($tipo)){
    $tipo = $_POST['tipo'];
}

// var_dump($tipo);
switch($tipo){
    case "C":
        $return = $administrador->Crear($_POST); 
        break;
    
    case "UC":
        $return = $administrador->ActualizarCuenta($_POST); 
        break;

    case "UIP":    
        $return = $administrador->ActualizarInfoPersonal($_POST); 
        break;
        
    case "UP":    
        $return = $administrador->ActualizarPassword($_POST); 
        break;
    
    case "CE":    
        $return = $administrador->ActualizarEstado($_POST); 
        break;

     case "D":
        $return = $administrador->EliminarCuenta($_POST);   
        break;


}


header("Content-Type:Application/json");
echo die(json_encode($return))
?>