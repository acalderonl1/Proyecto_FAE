<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'PhpMailer/src/PHPMailer.php';
require 'PhpMailer/src/SMTP.php';
require 'PhpMailer/src/Exception.php';


error_reporting(E_ALL);

            $nombrePaquete = $_POST['nombrePaquete'];
            $correo        = $_POST['correo'];  
            $subtotal_12   = $_POST['subtotal_12'];  
            $subtotal_0    = $_POST['subtotal_0'];  
            $descuentoM    = $_POST['descuentoM'];  
            $subtotal      = $_POST['subtotal'];  
            $iva_12        = $_POST['iva_12'];  
            $valor_total   = $_POST['valor_total'];  
            // $file = "ejemplo.xlsx";
// var_dump($usuario);
// var_dump($confClave);
// var_dump($cedula);
   
$asunto="Punto de partida";
		$mail = new PHPMailer();
		try
		{
		    //INICIO CONEXION AL CORREO
		    $mail->Host = 'macrogramec.com';  			// Specify main and backup SMTP servers
			$mail->SMTPAuth = true;                               // Enable SMTP authentication
			$mail->Username = 'jyepez@lab2de.com';                 // SMTP username
			$mail->Password = 'Entrar123';                           // SMTP password
			$mail->SMTPSecure = 'ssl';                            // Enable TLS encryption, `ssl` also accepted
			$mail->Port = 465; 
			//FIN CONEXION AL CORREO
			
			//Recipients
			
			$mail->setFrom("jyepez@lab2de.com");
        	
			
			//$mail->setFrom("jyepez@lab2de.com", "jyepez@lab2de.com");
			
	        //$mail->From = "info@popup.com";
	        //$mail->FromName = "POP UP Teatro Cafe";
	        $mail->Subject = $asunto;
	       // $mail->AddCC("eliasreyeselias@gmail.com");
	       //	<p align="center"><img src="http://macrogramec.com/seginus/sistema/images/logo_seginus_max.png" width="150px" /></p>
	        $mail->Body = '<html>
                    	 <div class="es-wrapper-color">
		<!-- PARTE INICIAL -->
        <table class="es-wrapper" width="100%" cellspacing="0" cellpadding="0">
            <tbody>
                <tr>
                    <td class="esd-email-paddings" valign="top">
                        <table class="es-content" cellspacing="0" cellpadding="0" align="center">
                            <tbody>
                                <tr>
                                    <td class="esd-stripe" esd-custom-block-id="28181" align="center">
                                        <table class="es-content-body" width="600" cellspacing="0" cellpadding="0" bgcolor="#ffffff" align="center">
                                            <tbody>
                                                <tr>
                                                    <style>
                                                        .prueba{
                                                            padding:60px;
                                                        }
                                                    </style>
                                                    <td  class="prueba esd-structure es-p15t es-p15b es-p20r es-p20l esd-checked" style="background-image:url(https://puntodepartida.ec/web/admin/Imagenes/logo.png);background-color: #ffd500; background-position: center center; background-repeat: no-repeat;" esd-custom-block-id="28206" bgcolor="#ffd500" align="left">
                                                        <table width="100%" cellspacing="0" cellpadding="0">
                                                            <tbody>
                                                                <tr>
                                                                    <td class="esd-container-frame" width="560" valign="top" align="center">
                                                                        <table width="100%" cellspacing="0" cellpadding="0">
                                                                            <tbody>
                                                                                <tr>
                                                                                    <!--<td class="esd-block-image" align="center" style="font-size:0"><a target="_blank" href="https://viewstripo.email"><img src="https://tlr.stripocdn.email/content/guids/CABINET_653e657e5239b3406f7204d1331a0641/images/95591507289454632.png" alt="Quick taxi logo" title="Quick taxi logo" style="display: block;" width="92"></a></td>-->
                                                                                    <!--<td class="esd-block-image" align="center" style="font-size:0"><a target="_blank" href="https://viewstripo.email"><img src="https://puntodepartida.ec/web/admin/Imagenes/logo.png" alt="Quick taxi logo" title="Quick taxi logo" style="display: block;" width="92"></a></td>-->
                                                                                </tr>
                                                                            </tbody>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                        
                                                <tr>
                                                    <td class="esd-structure es-p10b" esd-general-paddings-checked="false" align="left">
                                                        <table width="100%" cellspacing="0" cellpadding="0">
                                                            <tbody>
                                                                <tr>
                                                                    <td class="esd-container-frame" width="600" valign="top" align="center">
                                                                        <table width="100%" cellspacing="0" cellpadding="0">
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td class="esd-block-spacer es-p5b" align="center" style="font-size:0">
                                                                                        <table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
                                                                                            <tbody>
                                                                                                <tr>
                                                                                                    <td style="border-bottom: 1px solid #efefef; background: rgba(0, 0, 0, 0) none repeat scroll 0% 0%; height: 1px; width: 100%; margin: 0px;"></td>
                                                                                                </tr>
                                                                                            </tbody>
                                                                                        </table>
                                                                                    </td>
                                                                                </tr>
                                                                            </tbody>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="esd-structure es-p20t es-p20b es-p20r es-p20l" esd-custom-block-id="2997" style="background-position: center top;" align="left">
                                                        <table width="100%" cellspacing="0" cellpadding="0">
                                                            <tbody>
                                                                <tr>
                                                                    <td class="esd-container-frame" width="560" valign="top" align="center">
                                                                        <table width="100%" cellspacing="0" cellpadding="0">
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td class="esd-block-text" align="center">
                                                                                        <h2>AGENCIAS DE VIAJES</h2>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="esd-block-spacer es-p5t es-p10b es-p20r es-p20l" align="center" style="font-size:0">
                                                                                        <table width="10%" height="100%" cellspacing="0" cellpadding="0" border="0">
                                                                                            <tbody>
                                                                                                <tr>
                                                                                                    <td style="border-bottom: 3px solid #f1c232; background: rgba(0, 0, 0, 0) none repeat scroll 0% 0%; height: 1px; width: 100%; margin: 0px;"></td>
                                                                                                </tr>
                                                                                            </tbody>
                                                                                        </table>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="esd-block-text es-p5t" align="center">
                                                                                        <p style="color: #333333;">  </p>
                                                                                    </td>
                                                                                </tr>
                                                                            </tbody>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="esd-structure es-p10t es-p10b es-p20r es-p20l" esd-general-paddings-checked="false" style="background-position: center center;" align="left">
                                                        <table width="100%" cellspacing="0" cellpadding="0">
                                                            <tbody>
                                                                <tr>
                                                                    <td class="esd-container-frame" width="560" valign="top" align="center">
                                                                        <table width="100%" cellspacing="0" cellpadding="0">
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td class="esd-block-spacer es-p5t es-p5b" align="center" style="font-size:0">
                                                                                        <table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
                                                                                            <tbody>
                                                                                                <tr>
                                                                                                    <td style="border-bottom: 1px solid #efefef; background: rgba(0, 0, 0, 0) none repeat scroll 0% 0%; height: 1px; width: 100%; margin: 0px;"></td>
                                                                                                </tr>
                                                                                            </tbody>
                                                                                        </table>
                                                                                    </td>
                                                                                </tr>
                                                                            </tbody>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="esd-structure es-p10t es-p40b es-p20r es-p20l" style="background-color: #ffffff; background-position: center center;" esd-custom-block-id="28208" bgcolor="#ffffff" align="left">
                                                        <table class="es-left" cellspacing="0" cellpadding="0" align="left">
                                                             <thead>
                                                                <tr>
                                                                    <th>Descripcion</th>
                                                                    <th>Valor Total </th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                    <td class="es-m-p0r es-m-p20b esd-container-frame" width="270" valign="top" align="center">
                                                                        <p>Rembolso de gasto por compra de servicios turisticos  </p>
                                                                    </td>
                                                                    <td class="es-m-p0r es-m-p20b esd-container-frame" width="270" valign="top" align="center">
                                                                        <p> '.$subtotal_0.' </p>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                </tr>
                                                <tr>
                                                        <table cellspacing="0" cellpadding="0" align="right">
                                                            <tbody>
                                                                <tr>
                                                                    <td class="esd-container-frame" width="270" align="left">
                                                                        <table width="100%" cellspacing="0" cellpadding="0">
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td class="esd-block-text es-p10t es-m-txt-l" align="left">
                                                                                        <table style="width:100%;" class="cke_show_border" cellspacing="0" cellpadding="0" border="0">
                                                                                            <tbody>
                                                                                                <tr>
                                                                                                    <td width="50%" align="left">  <h3 style="font-size: 17px; line-height: 150%;">Subtotal 12%       </h3> </td>
                                                                                                    <td align="right">             <h3 style="font-size: 17px; line-height: 150%;"> $'.$subtotal_12.' </h3> </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td width="50%" align="left">  <h3 style="font-size: 17px; line-height: 150%;">Subtotal 0%       </h3>  </td>
                                                                                                    <td align="right">             <h3 style="font-size: 17px; line-height: 150%;"> $'.$subtotal_0.' </h3>  </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td width="50%" align="left">  <h3 style="font-size: 17px; line-height: 150%;">Descuento         </h3>  </td>
                                                                                                    <td align="right">             <h3 style="font-size: 17px; line-height: 150%;"> '.$descuentoM.'  </h3>  </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td width="50%" align="left">  <h3 style="font-size: 17px; line-height: 150%;"> IVA </h3>   </td>
                                                                                                    <td align="right">  <h3 style="font-size: 17px; line-height: 150%;"> $'.$iva_12.'   </h3>   </td>
                                                                                                </tr>
                                                                                                <tr> 
                                                                                                    <td width="50%" align="left"> <h3 style="font-size: 17px; line-height: 150%;"> SUBTOTAL </h3> </td>
                                                                                                    <td align="right"> <h3 style="font-size: 17px; line-height: 150%;"> $'.$subtotal.' </h3> </td>
                                                                                                </tr>
                                                                                            </tbody>
                                                                                        </table>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="esd-block-spacer es-p10t es-p10b" align="center" style="font-size:0">
                                                                                        <table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
                                                                                            <tbody>
                                                                                                <tr>
                                                                                                    <td style="border-bottom: 1px solid #efefef; background: rgba(0, 0, 0, 0) none repeat scroll 0% 0%; height: 1px; width: 100%; margin: 0px;"></td>
                                                                                                </tr>
                                                                                            </tbody>
                                                                                        </table>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="esd-block-text es-m-txt-l" align="left">
                                                                                        <table style="width:100%;" class="cke_show_border" cellspacing="0" cellpadding="0" border="0">
                                                                                            <tbody>
                                                                                                <tr>
                                                                                                    <td width="50%" align="left"> <h3 style="font-size: 17px; line-height: 150%;"><strong>Total</strong></h3> </td>
                                                                                                    <td align="right"> <h3 style="font-size: 17px; line-height: 150%;"><strong>'.$valor_total.'</strong></h3> </td>
                                                                                                </tr>
                                                                                            </tbody>
                                                                                        </table>
                                                                                    </td>
                                                                                </tr>
                                                                            </tbody>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        
                        <!---->
                     
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div style="position:absolute;left:-9999px;top:-9999px;"></div>			
                        	<div style="font-size: 12px;margin-top: 20px; margin-bottom: 20px; font-weight: bold; padding: 10px; width: 80%; margin-left: 8%; text-align: center; box-shadow: 1px 1px 10px #8cc540;">
										<p><address style="font-size: 10px;">Nota: No responder este mensaje ya que es generado automaticamente</address></p>
									</div>
                    		</html>';
            
            
            // $mail->AddAddress("ereyes@macrogramec.com");
            // $mail->addAttachment($file);
            $mail->AddAddress($correo);
            $mail->IsHTML(true); 
            	if (!$mail->send()) {
            		$return["success"]=0;
            		$return["mensaje"]="Error al enviar correo";
            	}
            	else
            	{
            		$return["success"]="correcto";
            	    $return["mensaje"]="Pago realizado, por favor revise su correo";
            	}
            	
		}
		catch (Exception $e) {
		        $return["success"]=0;
				$return["message"]="Error del servidor de correo: ".$mail->ErrorInfo;
		}
header('Content-Type: application/json');
echo json_encode($return);

?>