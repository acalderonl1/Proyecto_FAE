<?php
session_start();
require_once "configuracion/conexion.php";
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
    <title>Invoice List - Vuexy - Bootstrap HTML admin template</title>
    <link rel="apple-touch-icon" href="../app-assets/images/ico/apple-icon-120.png">
    <link rel="shortcut icon" type="image/x-icon" href="../app-assets/images/ico/favicon.ico">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;1,400;1,500;1,600" rel="stylesheet">

    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="../app-assets/vendors/css/vendors.min.css">
    <link rel="stylesheet" type="text/css" href="../app-assets/vendors/css/tables/datatable/datatables.min.css">
    <link rel="stylesheet" type="text/css" href="../app-assets/vendors/css/tables/datatable/extensions/dataTables.checkboxes.css">
    <link rel="stylesheet" type="text/css" href="../app-assets/vendors/css/tables/datatable/responsive.bootstrap.min.css">
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
    <link rel="stylesheet" type="text/css" href="../app-assets/css/pages/app-invoice-list.css">
    <!-- END: Page CSS-->

    <!-- BEGIN: Custom CSS-->
    <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
    <!-- END: Custom CSS-->

    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap5.min.js"></script>
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
                <section class="invoice-list-wrapper">
                    <div class="card">
                        <div class="card-datatable table-responsive">
                            <!-- <table id="tabla" class="invoice-list-table table"> -->
                            <table id='tabla' class='table table-striped table-bordered' style='width:100%'>
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Nombres y Apellidos</th>
                                        <th>Celular</th>
                                        <th>Genero</th>
                                        <th>correo</th>
                                        <th>Eliminar</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    $tb_administradores = Conexion::buscarVariosRegistro("SELECT
                                      tba.cod_administrador, tba.nombres, tba.apellidos, tba.celular,
                                     tu.usuario, tu.correo, tu.estado
                                     from tb_administradores tba INNER JOIN tb_usuarios tu on tu.cod_usuario = tba.cod_administrador
                                     where tu.cod_rol = 1 and tu.estado in ('A','I')");
                                    $i = 1;
                                    foreach ($tb_administradores as $d) {
                                        $cod_administrador = $d['cod_administrador'];
                                        $nombres   = $d['nombres'];
                                        $apellidos = $d['apellidos'];
                                        $celular   = $d['celular'];
                                        $correo    = $d['correo'];
                                    ?>
                                        <tr>
                                            <td> <?php echo $i       ?> </td>
                                            <td> <?php echo $nombres ?> </td>
                                            <td> <?php echo $apellidos ?> </td>
                                            <td> <?php echo $celular ?> </td>
                                            <td> <?php echo $correo ?> </td>
                                            <td> <button class="btn btn-danger glyphicon glyphicon-remove" onclick="preguntarSiNo('<?php echo $cod_administrador ?>')"> <i class="fa fa-trash"></i>
                                                </button> </td>
                                        <?php $i++;
                                    } ?>
                                        </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </section>

            </div>
        </div>
    </div>
    <!-- END: Content-->

    <div class="sidenav-overlay"></div>
    <div class="drag-target"></div>

    <!-- BEGIN: Footer-->
    <?php include 'footer.php' ?>
    <!-- END: Footer-->


    <!-- BEGIN: Vendor JS-->
    <script src="../app-assets/vendors/js/vendors.min.js"></script>
    <!-- BEGIN Vendor JS-->

    <!-- BEGIN: Page Vendor JS-->
    <script src="../app-assets/vendors/js/extensions/moment.min.js"></script>
    <script src="../app-assets/vendors/js/tables/datatable/datatables.min.js"></script>
    <script src="../app-assets/vendors/js/tables/datatable/datatables.buttons.min.js"></script>
    <script src="../app-assets/vendors/js/tables/datatable/datatables.bootstrap4.min.js"></script>
    <script src="../app-assets/vendors/js/tables/datatable/datatables.checkboxes.min.js"></script>
    <script src="../app-assets/vendors/js/tables/datatable/dataTables.responsive.min.js"></script>
    <script src="../app-assets/vendors/js/tables/datatable/responsive.bootstrap.min.js"></script>
    <!-- END: Page Vendor JS-->

    <!-- BEGIN: Theme JS-->
    <script src="../app-assets/js/core/app-menu.js"></script>
    <script src="../app-assets/js/core/app.js"></script>
    <!-- END: Theme JS-->

    <!-- BEGIN: Page JS-->
    <!-- <script src="../app-assets/js/scripts/pages/app-invoice-list.js"></script> -->
    <!-- END: Page JS-->

    <script src="https://kit.fontawesome.com/2c36e9b7b1.js"></script>
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

        // DATATABLE
        $(document).ready(function() {
            $('#tabla').DataTable({
                buttons: [{
                    extend: 'excel',
                    text: 'Save current page',
                    exportOptions: {
                        modifier: {
                            page: 'current'
                        }
                    }
                }]
            });

        });

        // ELIMINAR
        function preguntarSiNo(cod_usuario) {
            Swal.fire({
                title: 'Esta seguro de eliminar?',
                // text: "You won't be able to revert this!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Si!',
                customClass: {
                    confirmButton: 'btn btn-primary',
                    cancelButton: 'btn btn-outline-danger ml-1'
                },
                buttonsStyling: false
            }).then(function(result) {
                if (result.value) {

                    eliminarDatos(cod_usuario);

                } else if (result.dismiss === Swal.DismissReason.cancel) {
                    Swal.fire({
                        title: 'Cancelled',
                        text: 'Cancelado',
                        icon: 'error',
                        customClass: {
                            confirmButton: 'btn btn-success'
                        }
                    });
                }
            });
        }

        function eliminarDatos(cod_usuario) {
            console.log(cod_usuario);
            $.ajax({
                dataType: 'json',
                type: "POST",
                url: "php/administrador/administrador.php",
                data: {
                    iduser: <?php echo $_SESSION['datos_login']['iduser']; ?>,
                    cod_usuario: cod_usuario,
                    cod_rol: 1,
                    tipo: "D"
                },
                success: function(response) {
                    if (response['status'] == 'correcto') {
                        alertaExisto(response['mensaje']);
                        setTimeout(function() {
                            window.location = "http://localhost/concurso/sistema/lista-administradores.php";
                        }, 3000);
                    } else {
                        alertaError(response['mensaje']);
                    }
                }
            });
        }
    </script>
</body>
<!-- END: Body-->

</html>