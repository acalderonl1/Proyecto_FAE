<?php
session_start();
// ini_set('display_errors', '1');
require_once "../../configuracion/conexion.php";
require_once "clases/c_voluntarios.php";
$voluntarios = new Voluntarios();

$tipo = "L";
if(is_null($tipo)){
    $tipo = $_POST['tipo'];
}

// var_dump($tipo);
switch($tipo){
   
    case "L":
            $data = $voluntarios->Lista(); 
      
                $tabla = "";
                $i = 1;
                foreach( $data as $d ){      
                  $cod_voluntario   = $d['cod_voluntario'];            
                  $nombres          = $d['nombres'];            
                  $apellidos        = $d['apellidos'];            
                  $NombresApellidos = $nombres." ". $apellidos;  
                  $cedula           = $d['cedula'];            
                  $edad             = $d['edad'];        
                  $celular          = $d['celular'];        
                  $correo           = $d['correo'];            
                  $genero           = $d['genero'];              
                  $fecha_creado     = $d['fecha_creado'];              
                  
                  // VALIDACION
                  if ($genero == 'H') {
                    $generoInfo = 'Hombre';
                  } else {
                    $generoInfo = 'Mujer';
                  }
                  
                  $i = 1;
                  // CAMPOS 
                  $campo0 = '<td>  '.$i.' </td>';
                  $campo1 = '<td> <div class=\"d-flex justify-content-left align-items-center\"> <div class=\"d-flex flex-column\"> <span class=\"emp_post text-muted\"> '.$NombresApellidos.' </span>  <small class=\"emp_post text-muted\"> '.$fecha_creado.' </small> </div> </div> </td>';
                  if($_SESSION['datos_login']['cod_rol'] == '1'){
                  $campo2 = '<td> <div class=\"d-flex justify-content-left align-items-center\"> <div class=\"d-flex flex-column\"> <span class=\"emp_post text-muted\"> <a href=\"informacion-voluntario.php?id='.$cod_voluntario.'\"> '.$cedula.' </a> </span>  </div> </div> </td>';
                  }else{
                    $campo2 = '<td> <div class=\"d-flex justify-content-left align-items-center\"> <div class=\"d-flex flex-column\"> <span class=\"emp_post text-muted\"> '.$cedula.'  </span>  </div> </div> </td>';
                  }
                  $campo3 = '<td class=\"sorting_1\">  '.$edad.' </td>';
                  $campo4 = '<td class=\"sorting_1\">  '.$celular.' </td>';
                  if ($genero == 'H') {
                  $campo5 = '<td><span style=\"color:#00CFE8\" class=\"badge badge-pill\"> '. $generoInfo .' </span></td>';
                } else { 
                  $campo5 = '<td><span style=\"color:#FF33BE\" class=\"badge badge-pill\"> '. $generoInfo .' </span></td>';
                }
                  $campo6 = '<td><span class=\"sorting_1\"> '. $correo .' </span></td>';
               
                  
                  $tabla.='{
                    "enumaracion"     :"'.$campo0.'",
                    "nombres"         :"'.$campo1.'",
                    "cedula"          :"'.$campo2.'",
                    "edad"            :"'.$campo3.'",
                    "celular"         :"'.$campo4.'",
                    "genero"          :"'.$campo5.'",
                    "correo"          :"'.$campo6.'"
                            },';
               $i++;
                }
                //eliminamos la coma que sobra
	$tabla = substr($tabla,0, strlen($tabla) - 1);

}

header("Content-Type:Application/json");
echo '{"data":['.$tabla.']}';	
// echo die(json_encode($json))
?>