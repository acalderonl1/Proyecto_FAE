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
    <title> Iniciar sesi&oacute;n </title>
    <link rel="apple-touch-icon" href="./app-assets/images/ico/apple-icon-120.png">
    <link rel="shortcut icon" type="image/x-icon" href="./app-assets/images/ico/favicon.ico">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;1,400;1,500;1,600" rel="stylesheet">

    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="./app-assets/vendors/css/vendors.min.css">
    <!-- END: Vendor CSS-->

    <!-- BEGIN: Theme CSS-->
    <link rel="stylesheet" type="text/css" href="./app-assets/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="./app-assets/css/bootstrap-extended.css">
    <link rel="stylesheet" type="text/css" href="./app-assets/css/colors.css">
    <link rel="stylesheet" type="text/css" href="./app-assets/css/components.css">
    <link rel="stylesheet" type="text/css" href="./app-assets/css/themes/dark-layout.css">
    <link rel="stylesheet" type="text/css" href="./app-assets/css/themes/bordered-layout.css">
    <link rel="stylesheet" type="text/css" href="./app-assets/css/themes/semi-dark-layout.css">

    <!-- BEGIN: Page CSS-->
    <link rel="stylesheet" type="text/css" href="./app-assets/css/core/menu/menu-types/vertical-menu.css">
    <link rel="stylesheet" type="text/css" href="./app-assets/css/plugins/forms/form-validation.css">
    <link rel="stylesheet" type="text/css" href="./app-assets/css/pages/page-auth.css">
    <!-- END: Page CSS-->

    <!-- BEGIN: Custom CSS-->
    <link rel="stylesheet" type="text/css" href="./assets/css/style.css">
    <!-- END: Custom CSS-->
    <!-- EXTRAS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/selectize.js/0.12.6/js/standalone/selectize.min.js" integrity="sha256-+C0A5Ilqmu4QcSPxrlGpaZxJ04VjsRjKu+G82kl5UJk=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/selectize.js/0.12.6/css/selectize.bootstrap3.min.css" integrity="sha256-ze/OEYGcFbPRmvCnrSeKbRTtjG4vGLHXgOqsyLFTRjg=" crossorigin="anonymous" />
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body class="vertical-layout vertical-menu-modern blank-page navbar-floating footer-static  " data-open="click" data-menu="vertical-menu-modern" data-col="blank-page">
    <!-- BEGIN: Content-->
    <div class="app-content content ">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
        <div class="content-wrapper">
            <div class="content-header row">
            </div>
            <div class="content-body">
                <div class="auth-wrapper auth-v1 px-2">
                    <div class="auth-inner py-2">
                        <!-- Login v1 -->
                        <div class="card mb-0">
                            <div class="card-body">
                                <a href="javascript:void(0);" class="brand-logo">
                                    <h2 class="brand-text text-primary ml-1"> CONCURSO UPS </h2>
                                </a>

                                <h4 class="card-title mb-1">Welcome to Vuexy! 👋</h4>
                                <p class="card-text mb-2">Please sign-in to your account and start the adventure</p>

                                <form id="frmLogin" class="auth-login-form mt-2">
                                    <div class="form-group">
                                        <label for="login-email" class="form-label">Email</label>
                                        <input type="text" class="form-control" id="correo" name="correo" placeholder="correo@example.com" aria-describedby="login-email" tabindex="1" autofocus />
                                        <p id="agregaCorreo" style="color: red; display:none">Ingresa un correo</p>
                                        <p id="verificarCorreo" style="color: red; display:none">Por favor verifica tu correo</p>
                                    </div>

                                    <div class="form-group">
                                        <div class="d-flex justify-content-between">
                                            <label for="login-password">Password</label>
                                            <!-- <a href="page-auth-forgot-password-v1.html">
                                                <small>Forgot Password?</small>
                                            </a> -->
                                        </div>
                                        <div class="input-group input-group-merge form-password-toggle">
                                            <input type="password" class="form-control form-control-merge" id="password" name="password" tabindex="2" placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;" aria-describedby="login-password" />
                                            <div class="input-group-append">
                                                <span class="input-group-text cursor-pointer"><i data-feather="eye"></i></span>
                                            </div>
                                        </div>
                                        <p id="agregaPassword" style="color: red; display:none">Ingresa una contrase&ntilde;a</p>
                                        <p id="verificarPassword" style="color: red; display:none">Por favor verifica tu contrase&ntilde;a</p>
                                    </div>
                                    <!-- <div class="form-group">
                                        <div class="custom-control custom-checkbox">
                                            <input class="custom-control-input" type="checkbox" id="remember-me" tabindex="3" />
                                            <label class="custom-control-label" for="remember-me"> Remember Me </label>
                                        </div>
                                    </div> -->
                                    <a class="btn btn-primary btn-block" id="btnAgregar">Iniciar sesi&oacute;n </a>
                                    <!-- <button class="btn btn-primary btn-block" id="btnAgregar">Iniciar sesi&oacute;n</button> -->
                                </form>
                                <p id="cuentaBloqueada" style="display:none" class="text-center mt-2">
                                    <span>Cuenta bloqueada, por favor contactese con el administrador</span>
                                
                                </p>
                                <!-- <p class="text-center mt-2">
                                    <span>New on our platform?</span>
                                    <a href="page-auth-register-v1.html">
                                        <span>Create an account</span>
                                    </a>
                                </p> -->

                                <div class="divider my-2">
                                    <div class="divider-text"> </div>
                                </div>


                            </div>
                        </div>
                        <!-- /Login v1 -->
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- END: Content-->


    <!-- BEGIN: Vendor JS-->
    <script src="./app-assets/vendors/js/vendors.min.js"></script>
    <!-- BEGIN Vendor JS-->

    <!-- BEGIN: Page Vendor JS-->
    <script src="./app-assets/vendors/js/forms/validation/jquery.validate.min.js"></script>
    <!-- END: Page Vendor JS-->

    <!-- BEGIN: Theme JS-->
    <script src="./app-assets/js/core/app-menu.js"></script>
    <script src="./app-assets/js/core-login/app.js"></script>
    <!-- END: Theme JS-->

    <!-- BEGIN: Page JS-->
    <script src="./app-assets/js/scripts/pages/page-auth-login.js"></script>
    <!-- END: Page JS-->

    <script>
        $(window).on('load', function() {
            if (feather) {
                feather.replace({
                    width: 14,
                    height: 14
                });
            }
        })
        // 
        $(document).ready(function() {
            $('#btnAgregar').click(function() {
                
               
                if ($('#correo').val() == "") {
                    document.getElementById('agregaCorreo').style.display = 'block';
                    // swal("Alerta!", "Debes agregar el usuario", "warning");
                    return false;
                } else if ($('#password').val() == "") {
                    document.getElementById('agregaCorreo').style.display = 'none';
                    document.getElementById('agregaPassword').style.display = 'block';
                    // swal("Alerta!", "Debes agregar la contraseña", "warning");
                    return false;
                }
                document.getElementById('agregaPassword').style.display = 'none';
                
                var formData = new FormData(document.getElementById("frmLogin"));
                for (let [key, value] of formData.entries()) {
                    console.log(key, ':', value);
                }
                $.ajax({
                    url: "configuracion/logeo.php",
                    type: "POST",
                    dataType: "json",
                    data: formData,
                    cache: false,
                    contentType: false,
                    processData: false,
                    error: function({
                        responseText
                    }) {
                        console.log(responseText)
                    },
                    success: function(response) {
                        console.log(response);

                        if (response['status'] == 'bloqueo') {
                            document.getElementById('cuentaBloqueada').style.display = 'block';
                        }else if (response['status'] == '1') {
                            window.location = "sistema/";
                        }else {
                            document.getElementById('verificarCorreo').style.display = 'block';
                            document.getElementById('verificarPassword').style.display = 'block';
                        }
                    }
                });

            });

        });
    </script>
</body>
<!-- END: Body-->

</html>