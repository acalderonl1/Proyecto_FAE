<?php
include 'actualizar.php';
// session_start();
if (!isset($_SESSION['datos_login'])) {
    header("Location: ../");
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
    <title> Crear empleado</title>
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
    <link rel="stylesheet" type="text/css" href="../app-assets/css/plugins/forms/form-validation.css">
    <link rel="stylesheet" type="text/css" href="../app-assets/css/plugins/forms/pickers/form-flat-pickr.css">
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

            <div class="content-body">
                <!-- Validation -->
                <section class="bs-validation">
                    <div class="row">
                        <!-- Bootstrap Validation -->

                        <!-- /Bootstrap Validation -->

                        <!-- jQuery Validation -->
                        <div class="col-md-12 col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title"> NUEVO CLIENTE </h4>
                                </div>
                                <div class="card-body">
                                    <form id="frmEmpleado" method="post">
                                        <input type="hidden" id="iduser" name="iduser" value="<?php echo  $_SESSION['datos_login']['iduser']; ?>">
                                        <div class="form-group row">
                                            <div class="col-sm-4">
                                                <label for="input-10" class="col-12 col-form-label">Nombres</label>
                                                <input type="text" class="form-control" id="nombres" name="nombres" placeholder="Nombres">
                                                <p id="agregaNombres" style="color: red; display:none">Ingresa los nombres</p>
                                            </div>
                                            <div class="col-sm-4">
                                                <label for="input-11" class="col-12 col-form-label">Apellidos</label>
                                                <input type="text" class="form-control" id="apellidos" name="apellidos" placeholder="Apellidos">
                                                <p id="agregaApellidos" style="color: red; display:none">Ingresa los apellidos</p>
                                            </div>
                                            <div class="col-sm-4">
                                                <label for="input-11" class="col-12 col-form-label">Celular</label>
                                                <input type="number" class="form-control" id="celular" name="celular" placeholder="celular">
                                                <p id="agregaCelular" style="color: red; display:none">Ingresa el celular</p>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <div class="col-sm-6">
                                                <label for="input-10" class="col-sm-6 col-form-label">Usuario</label>
                                                <input type="text" class="form-control" id="usuario" name="usuario" placeholder="usuario">
                                                <p id="agregaUsuario" style="color: red; display:none">Ingresa un usuario</p>
                                            </div>
                                            <div class="col-sm-6">
                                                <label for="input-11" class="col-sm-6 col-form-label">Correo</label>
                                                <input type="email" class="form-control" id="correo" name="correo" placeholder="correo@example.com">
                                                <p id="agregaCorreo" style="color: red; display:none">Ingresa un correo</p>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <div class="col-sm-6">
                                                <label for="input-11" class="col-sm-6 col-form-label">Contrase&ntilde;a</label>
                                                <input type="password" class="form-control" id="password" name="password" placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;">
                                                <p id="agregaPassword" style="color: red; display:none">Ingresa una contrase&ntilde;a</p>
                                            </div>
                                            <div class="col-sm-6">
                                                <label for="input-11" class="col-sm-6 col-form-label">Contrase&ntilde;a confirmaci&oacute;n</label>
                                                <input type="password" class="form-control" id="passwordConf" name="passwordConf" placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;">
                                                <p id="agregaPasswordConf" style="color: red; display:none">Ingresa una contrase&ntilde;a</p>
                                            </div>
                                        </div>

                                   
                                        <div class="form-group row">
                                            <div class="col-sm-12">
                                                <label> Foto </label>
                                                <div class="custom-file">
                                                    <input type="file" class="custom-file-input" id="foto" name="foto" />
                                                    <label class="custom-file-label" for="customFile">Escoger</label>
                                                    <p id="agregaFoto" style="color: red; display:none">Escoge una imagen</p>
                                                </div>
                                            </div>
                                        </div>
                                      

                                        <div class="row">
                                            <div class="col-12">
                                                <center><button type="button" class="btn btn-primary" id="btnAgregar">Guardar</button></center>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- /jQuery Validation -->
                    </div>
                </section>
                <!-- /Validation -->

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
    <script src="../app-assets/js/scripts/forms/form-validation.js"></script>
    <!-- END: Page JS-->

    <!-- Alertas -->
    <script src="../app-assets/vendors/js/extensions/sweetalert2.all.min.js"></script>
    <script src="../app-assets/vendors/js/extensions/polyfill.min.js"></script>
    <script src="../assets/js/alertasModal.js"></script>

    <script>
        $(window).on('load', function() {
            if (feather) {
                feather.replace({
                    width: 14,
                    height: 14
                });
            }
        })
        // AGREGAR ADMINISTRADOR
        $(document).ready(function() {
            $('#btnAgregar').click(function() {

                if ($('#nombres').val() == "") {
                    document.getElementById('agregaNombres').style.display = 'block';
                    return false;

                } else if ($('#apellidos').val() == "") {
                    document.getElementById('agregaNombres').style.display = 'none';
                    document.getElementById('agregaApellidos').style.display = 'block';
                    return false;

                } else if ($('#celular').val() == "") {
                    document.getElementById('agregaApellidos').style.display = 'none';
                    document.getElementById('agregaCelular').style.display = 'block';
                    return false;

                } else if ($('#usuario').val() == "") {
                    document.getElementById('agregaCelular').style.display = 'none';
                    document.getElementById('agregaUsuario').style.display = 'block';
                    return false;

                } else if ($('#correo').val() == "") {
                    document.getElementById('agregaUsuario').style.display = 'none';
                    document.getElementById('agregaCorreo').style.display = 'block';
                    return false;

                } else if ($('#password').val() == "") {
                    document.getElementById('agregaCorreo').style.display = 'none';
                    document.getElementById('agregaPassword').style.display = 'block';
                    return false;

                } else if ($('#passwordConf').val() == "") {
                    document.getElementById('agregaPassword').style.display = 'none';
                    document.getElementById('agregaPasswordConf').style.display = 'block';
                    return false;

                } else if ($('#foto').val() == "") {
                    document.getElementById('agregaPasswordConf').style.display = 'none';
                    document.getElementById('agregaFoto').style.display = 'block';
                    return false;
                }
                document.getElementById('agregaFoto').style.display = 'none';

                var formData = new FormData($("#frmEmpleado")[0]);
                    formData.append('tipo', 'C');
                for (let [key, value] of formData.entries()) {
                    console.log(key, ':', value);
                }
                $.ajax({
                    type: "POST",
                    url: "php/empleado/empleado.php",
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
                            document.getElementById("frmEmpleado").reset();
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