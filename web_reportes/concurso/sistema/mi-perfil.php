<?php
session_start();
require_once "configuracion/conexion.php";
if (!isset($_SESSION['datos_login'])) {
    header("Location: ../");
}
if (!isset($_GET['id'])) {
    header("Location: inicio.php");
} else if (isset($_GET['id'])) {

    if ($_SESSION['datos_login']['iduser'] == $_GET['id']) {
        $tb_usuarios = Conexion::buscarVariosRegistro("SELECT * FROM tb_usuarios WHERE id_usuario =" . $_GET['id']);
        foreach ($tb_usuarios as $d) {
            $cod_rol     = $d['cod_rol'];
            $cod_usuario = $d['cod_usuario'];
        }

        if ($tb_usuarios) {
            if ($cod_rol == 1) {
                // echo "<script>alert('asd'); </script> ";
                $sql_admin    =  Conexion::buscarVariosRegistro("SELECT  tu.cod_usuario, tu.cod_rol, tu.usuario, tu.correo, tu.foto, tu.estado,
                                    ta.nombres, ta.apellidos, ta.celular FROM tb_usuarios tu
                             INNER JOIN tb_administradores ta ON ta.cod_administrador = tu.cod_usuario 
                             where tu.cod_usuario = '$cod_usuario' and tu.cod_rol = '1' ");
                foreach ($sql_admin as $da) {
                    $cod_usuario = $da['cod_usuario'];
                    $cod_rol     = $da['cod_rol'];
                    $usuario   = $da['usuario'];
                    $nombres   = $da['nombres'];
                    $apellidos = $da['apellidos'];
                    $celular   = $da['celular'];
                    $correo    = $da['correo'];
                    $foto      = $da['foto'];
                }
            } else {
                $sql_admin    =  Conexion::buscarVariosRegistro("SELECT  tu.cod_usuario, tu.cod_rol, tu.usuario, tu.correo, tu.foto, tu.estado,
                ta.nombres, ta.apellidos, ta.celular FROM tb_usuarios tu
         INNER JOIN tb_empleados ta ON ta.cod_empleado = tu.cod_usuario 
         where tu.cod_usuario = '$cod_usuario' and tu.cod_rol = '2' ");
                foreach ($sql_admin as $da) {
                    $cod_usuario = $da['cod_usuario'];
                    $cod_rol     = $da['cod_rol'];
                    $usuario   = $da['usuario'];
                    $nombres   = $da['nombres'];
                    $apellidos = $da['apellidos'];
                    $celular   = $da['celular'];
                    $correo    = $da['correo'];
                    $foto      = $da['foto'];
                }
            }
        }
    }
}
?>
<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
<!-- BEGIN: Head-->

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=0,minimal-ui">
    <meta name="description" content="Vuexy admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
    <meta name="keywords" content="admin template, Vuexy admin template, dashboard template, flat admin template, responsive admin template, web app">
    <meta name="author" content="PIXINVENT">
    <title>Mi perfil</title>
    <link rel="apple-touch-icon" href="../app-assets/images/ico/apple-icon-120.png">
    <link rel="shortcut icon" type="image/x-icon" href="../app-assets/images/ico/favicon.ico">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;1,400;1,500;1,600" rel="stylesheet">

    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="../app-assets/vendors/css/vendors.min.css">
    <link rel="stylesheet" type="text/css" href="../app-assets/vendors/css/forms/select/select2.min.css">
    <link rel="stylesheet" type="text/css" href="../app-assets/vendors/css/pickers/flatpickr/flatpickr.min.css">
    <!-- END: Vendor CSS-->

    <!-- BEGIN: Theme CSS-->
    <link rel="stylesheet" type="text/css" href="../app-assets/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../app-assets/css/bootstrap-extended.css">
    <link rel="stylesheet" type="text/css" href="../app-assets/css/colors.css">
    <link rel="stylesheet" type="text/css" href="../app-assets/css/components.css">
    <link rel="stylesheet" type="text/css" href="../app-assets/css/themes/dark-layout.css">
    <link rel="stylesheet" type="text/css" href="../app-assets/css/themes/bordered-layout.css">
    <link rel="stylesheet" type="text/css" href="../app-assets/css/themes/semi-dark-layout.css">

    <!-- BEGIN: Page CSS-->
    <link rel="stylesheet" type="text/css" href="../app-assets/css/core/menu/menu-types/vertical-menu.css">
    <link rel="stylesheet" type="text/css" href="../app-assets/css/plugins/forms/pickers/form-flat-pickr.css">
    <link rel="stylesheet" type="text/css" href="../app-assets/css/plugins/forms/form-validation.css">
    <link rel="stylesheet" type="text/css" href="../app-assets/css/pages/app-user.css">
    <!-- END: Page CSS-->

    <!-- BEGIN: Custom CSS-->
    <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
    <!-- END: Custom CSS-->
    <link rel="stylesheet" type="text/css" href="../app-assets/css/plugins/extensions/ext-component-sweet-alerts.min.css">
</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body class="vertical-layout vertical-menu-modern  navbar-floating footer-static  " data-open="click" data-menu="vertical-menu-modern" data-col="">

    <!-- BEGIN: Header-->
    <?php include 'menu-barra/barra.php' ?>
    <!-- END: Header-->


    <!-- BEGIN: Main Menu-->
    <?php include 'menu-barra/menu.php' ?>
    <!-- END: Main Menu-->

    <!-- BEGIN: Content-->
    <div class="app-content content ">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
        <div class="content-wrapper">
            <div class="content-header row">
            </div>
            <div class="content-body">
                <!-- users edit start -->
                <section class="app-user-edit">
                    <div class="card">
                        <div class="card-body">
                            <ul class="nav nav-pills" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link d-flex align-items-center active" id="account-tab" data-toggle="tab" href="#account" aria-controls="account" role="tab" aria-selected="true">
                                        <i data-feather="user"></i><span class="d-none d-sm-block">Cuenta</span>
                                    </a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link d-flex align-items-center" id="information-tab" data-toggle="tab" href="#information" aria-controls="information" role="tab" aria-selected="false">
                                        <i data-feather="info"></i><span class="d-none d-sm-block">Informaci&oacute;n</span>
                                    </a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link d-flex align-items-center" id="social-tab" data-toggle="tab" href="#social" aria-controls="social" role="tab" aria-selected="false">
                                        <i data-feather="share-2"></i><span class="d-none d-sm-block">Contrase&ntilde;a</span>
                                    </a>
                                </li>

                            </ul>
                            <div class="tab-content">
                                <!-- Account Tab starts -->
                                <div class="tab-pane active" id="account" aria-labelledby="account-tab" role="tabpanel">
                                    <!-- users edit media object start -->
                                    <!-- <button type="button" class="btn btn-outline-primary" id="fast-duration">Show .5s</button>
                                                        <button type="button" class="btn btn-outline-primary" id="slow-duration">Hide 3s</button>
                                                        <button type="button" class="btn btn-outline-primary" id="timeout">Timeout 5s</button>
                                                        <button type="button" class="btn btn-outline-primary" id="sticky">Sticky Toast</button> -->
                                    <!--  -->
                                    <!-- <button type="button" class="btn btn-outline-success" id="type-success">Success</button>
                                              <button type="button" class="btn btn-outline-danger" id="type-error">Error</button>
                                              <button type="button" class="btn btn-outline-warning" id="type-warning">Warning</button>
                                              <button type="button" class="btn btn-outline-info" id="type-info">Info</button> -->
                                    <form id="frmCuenta" class="form-validate">
                                        <div class="media mb-2">
                                            <?php if ($_SESSION['datos_login']['cod_rol'] == '1') { ?>
                                                <img src="imagenes/users/administradores/<?php echo $foto ?>" alt="<?php echo $foto ?>" class="user-avatar users-avatar-shadow rounded mr-2 my-25 cursor-pointer" height="90" width="90" />
                                            <?php } else { ?>
                                                <img src="imagenes/users/empleados/<?php echo $foto ?>" alt="<?php echo $foto ?>" class="user-avatar users-avatar-shadow rounded mr-2 my-25 cursor-pointer" height="90" width="90" />
                                            <?php } ?>
                                            <div class="media-body mt-50">
                                                <h4> <?php echo $nombres . " " . $apellidos ?> </h4>
                                                <div class="col-12 d-flex mt-1 px-0">
                                                    <label class="btn btn-primary mr-75 mb-0" for="change-picture">
                                                        <span class="d-none d-sm-block">Cambiar</span>

                                                        <input class="form-control" type="file" id="change-picture" name="imagen" hidden accept="image/png, image/jpeg, image/jpg" />
                                                        <span class="d-block d-sm-none">
                                                            <i class="mr-0" data-feather="edit"></i>
                                                        </span>
                                                    </label>
                                                    <!-- <button class="btn btn-outline-secondary d-none d-sm-block">Remove</button> -->
                                                    <button class="btn btn-outline-secondary d-block d-sm-none">
                                                        <i class="mr-0" data-feather="trash-2"></i>
                                                    </button>

                                                </div>
                                            </div>
                                        </div>

                                        <!-- users edit media object ends -->
                                        <!-- users edit account form start -->
                                        <!-- <form id="frmCuenta" class="form-validate"> -->
                                        <input type="text" hidden="" id="iduser" name="iduser" value="<?php echo  $_SESSION['datos_login']['iduser']; ?>">
                                        <input type="text" hidden="" name="cod_usuario" value="<?php echo  $cod_usuario ?>">
                                        <input type="text" hidden="" name="cod_rol" value="<?php echo  $cod_rol ?>">

                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label for="usuario">Usuario</label>
                                                    <input type="text" class="form-control" value="<?php echo $usuario ?>" name="usuario" id="usuario" />
                                                </div>
                                            </div>

                                            <div class="col-md-8">
                                                <div class="form-group">
                                                    <label for="email">Correo</label>
                                                    <input type="email" class="form-control" placeholder="Email" value="<?php echo $correo ?>" name="correo" id="correo" />
                                                </div>
                                            </div>


                                            <div class="col-12 d-flex flex-sm-row flex-column mt-2">
                                                <button type="submit" class="btn btn-primary mb-1 mb-sm-0 mr-0 mr-sm-1" id="ActualizarCuenta">Guardar cambios</button>

                                                <!-- <button type="reset" class="btn btn-outline-secondary">Reset</button> -->
                                            </div>

                                        </div>
                                    </form>
                                    <!-- users edit account form ends -->
                                </div>
                                <!-- Account Tab ends -->

                                <!-- Information Tab starts -->
                                <div class="tab-pane" id="information" aria-labelledby="information-tab" role="tabpanel">
                                    <!-- users edit Info form start -->
                                    <form id="frmPersonal" class="form-validate">
                                        <div class="row mt-1">
                                            <div class="col-12">
                                                <h4 class="mb-1">
                                                    <i data-feather="user" class="font-medium-4 mr-25"></i>
                                                    <span class="align-middle">Informaci&oacute;n Personal</span>
                                                </h4>
                                            </div>
                                            <input type="text" hidden="" name="iduser" value="<?php echo  $_SESSION['datos_login']['iduser']; ?>">
                                            <input type="text" hidden="" name="cod_administrador" value="<?php echo  $cod_usuario ?>">
                                            <input type="text" hidden="" name="cod_rol" value="<?php echo  $cod_rol ?>">
                                            <div class="col-lg-4 col-md-6">
                                                <div class="form-group">
                                                    <label for="birth">Nombres </label>
                                                    <input id="nombres" type="text" class="form-control" name="nombres" value="<?php echo $nombres ?>" />
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-6">
                                                <div class="form-group">
                                                    <label for="mobile">Apellidos</label>
                                                    <input id="apellidos" type="text" class="form-control" name="apellidos" value="<?php echo $apellidos ?>" />
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-6">
                                                <div class="form-group">
                                                    <label for="website">Celular</label>
                                                    <input id="celular" type="text" class="form-control" name="celular" value="<?php echo $celular ?>" />
                                                </div>
                                            </div>

                                            <div class="col-12 d-flex flex-sm-row flex-column mt-2">
                                                <button type="submit" class="btn btn-primary mb-1 mb-sm-0 mr-0 mr-sm-1" id="ActualizarInfoPersonal">Guardar cambios</button>

                                            </div>
                                        </div>
                                    </form>
                                    <!-- users edit Info form ends -->
                                </div>
                                <!-- Information Tab ends -->

                                <!-- Social Tab starts -->
                                <div class="tab-pane" id="social" aria-labelledby="social-tab" role="tabpanel">
                                    <!-- users edit social form start -->
                                    <form id="frmPassword" class="form-validate">

                                        <input type="text" hidden="" name="iduser" value="<?php echo  $_SESSION['datos_login']['iduser']; ?>">
                                        <input type="text" hidden="" name="cod_usuario" value="<?php echo  $cod_usuario ?>">
                                        <input type="text" hidden="" name="cod_rol" value="<?php echo  $cod_rol ?>">

                                        <div class="row">
                                            <div class="col-lg-4 col-md-6 form-group">
                                                <label for="twitter-input">Contrase&ntilde;a actual</label>
                                                <div class="input-group input-group-merge">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="basic-addon3">
                                                            <i class="fas fa-lock"></i>
                                                        </span>
                                                    </div>
                                                    <input type="password" class="form-control" name="passwordActual" placeholder="***************" aria-describedby="basic-addon3" />
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-6 form-group">
                                                <label for="facebook-input">Nueva contra&ntilde;a </label>
                                                <div class="input-group input-group-merge">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="basic-addon4">
                                                            <i class="fas fa-lock"></i>
                                                        </span>
                                                    </div>
                                                    <input type="password" class="form-control" name="passwordNueva" placeholder="***************" aria-describedby="basic-addon4" />
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-6 form-group">
                                                <label for="instagram-input">Confirmar contrase&ntilde;a</label>
                                                <div class="input-group input-group-merge">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="basic-addon5">
                                                            <i class="fas fa-lock"></i>
                                                        </span>
                                                    </div>
                                                    <input type="password" class="form-control" name="passwordConf" placeholder="***************" aria-describedby="basic-addon5" />
                                                </div>
                                            </div>


                                            <div class="col-12 d-flex flex-sm-row flex-column mt-2">
                                                <button type="submit" class="btn btn-primary mb-1 mb-sm-0 mr-0 mr-sm-1" id="ActualizarPassword">Cambiar contrase&ntilde;a</button>
                                                <button type="reset" class="btn btn-outline-secondary">Vaciar</button>
                                            </div>
                                        </div>
                                    </form>
                                    <!-- users edit social form ends -->
                                </div>
                                <!-- Social Tab ends -->
                            </div>
                        </div>
                    </div>
                </section>
                <!-- users edit ends -->

            </div>
        </div>
    </div>
    <!-- END: Content-->

    <div class="sidenav-overlay"></div>
    <div class="drag-target"></div>

    <!-- BEGIN: Footer-->
    <footer class="footer footer-static footer-light">
        <p class="clearfix mb-0"><span class="float-md-left d-block d-md-inline-block mt-25">COPYRIGHT &copy; 2021<a class="ml-25" href="https://1.envato.market/pixinvent_portfolio" target="_blank">Pixinvent</a><span class="d-none d-sm-inline-block">, All rights Reserved</span></span><span class="float-md-right d-none d-md-block">Hand-crafted & Made with<i data-feather="heart"></i></span></p>
    </footer>
    <button class="btn btn-primary btn-icon scroll-top" type="button"><i data-feather="arrow-up"></i></button>
    <!-- END: Footer-->


    <!-- BEGIN: Vendor JS-->
    <script src="../app-assets/vendors/js/vendors.min.js"></script>
    <!-- BEGIN Vendor JS-->

    <!-- BEGIN: Page Vendor JS-->
    <script src="../app-assets/vendors/js/forms/select/select2.full.min.js"></script>
    <script src="../app-assets/vendors/js/forms/validation/jquery.validate.min.js"></script>
    <script src="../app-assets/vendors/js/pickers/flatpickr/flatpickr.min.js"></script>
    <!-- END: Page Vendor JS-->

    <!-- BEGIN: Theme JS-->
    <script src="../app-assets/js/core/app-menu.js"></script>
    <script src="../app-assets/js/core/app.js"></script>
    <!-- END: Theme JS-->

    <!-- BEGIN: Page JS-->
    <script src="../app-assets/js/scripts/pages/app-user-edit.js"></script>
    <script src="../app-assets/js/scripts/components/components-navs.js"></script>
    <!-- END: Page JS-->

    <!-- ALERTAS -->
    <script src="../app-assets/vendors/js/extensions/sweetalert2.all.min.js"></script>
    <script src="../app-assets/vendors/js/extensions/polyfill.min.js"></script>
    <script src="../assets/js/alertasModal.js"></script>
    <script src="https://kit.fontawesome.com/2c36e9b7b1.js"></script>
    <script>
        $(window).on('load', function() {
            if (feather) {
                feather.replace({
                    width: 14,
                    height: 14
                });
            }
        })

        // ACTUALIZAR CUENTA
        $(document).ready(function() {
            $('#ActualizarCuenta').click(function() {
                <?php if ($_SESSION['datos_login']['cod_rol'] == '1') { ?>
                    var ruta = "php/administrador/administrador.php";
                <?php } else { ?>
                    var ruta = "php/empleado/empleado.php";
                <?php } ?>
                var formData = new FormData(document.getElementById("frmCuenta"));
                formData.append('tipo', 'UC');
                for (let [key, value] of formData.entries()) {
                    console.log(key, ':', value);
                }
                $.ajax({
                    type: "POST",
                    url: ruta,
                    dataType: 'json',
                    data: formData,
                    cache: false,
                    contentType: false,
                    processData: false,
                    error: function(mensaje, exception) {
                        console.log(mensaje.responseText);
                        // Your error handling logic here..
                    },
                    success: function(response) {
                        console.log(response);
                        if (response['status'] == 'correcto') {
                            alertaExisto(response['mensaje']);
                        } else {
                            alertaError(response['mensaje']);
                        }
                    }
                });
            });
        });
        // ACTUALIZAR INFORMACION PERSONAL
        $(document).ready(function() {
            $('#ActualizarInfoPersonal').click(function() {
                var formData = new FormData(document.getElementById("frmPersonal"));
                formData.append('tipo', 'UIP');
                for (let [key, value] of formData.entries()) {
                    console.log(key, ':', value);
                }
                $.ajax({
                    type: "POST",
                    url: "php/administrador/administrador.php",
                    dataType: 'json',
                    data: formData,
                    cache: false,
                    contentType: false,
                    processData: false,
                    error: function(mensaje, exception) {
                        console.log(mensaje.responseText);
                        // Your error handling logic here..
                    },
                    success: function(response) {
                        console.log(response);
                        if (response['status'] == 'correcto') {
                            alertaExisto(response['mensaje']);
                        } else {
                            alertaError(response['mensaje']);
                        }
                    }
                });
            });
        });
        // ACTUALIZAR PASSWORD
        $(document).ready(function() {
            $('#ActualizarPassword').click(function() {
                var formData = new FormData(document.getElementById("frmPassword"));
                formData.append('tipo', 'UP');
                for (let [key, value] of formData.entries()) {
                    console.log(key, ':', value);
                }
                $.ajax({
                    type: "POST",
                    url: "php/administrador/administrador.php",
                    dataType: 'json',
                    data: formData,
                    cache: false,
                    contentType: false,
                    processData: false,
                    error: function(mensaje, exception) {
                        console.log(mensaje.responseText);
                        // Your error handling logic here..
                    },
                    success: function(response) {
                        console.log(response);
                        if (response['status'] == 'correcto') {
                            document.getElementById("frmPassword").reset();
                            alertaExisto(response['mensaje']);
                        } else {
                            alertaError(response['mensaje']);
                        }
                    }
                });
            });
        });
    </script>
</body>
<!-- END: Body-->

</html>