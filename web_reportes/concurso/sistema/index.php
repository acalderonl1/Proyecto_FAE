<?php
include 'actualizar.php';
// session_start();
if (!isset($_SESSION['datos_login'])) {
    header("Location: ../");
}
require_once "configuracion/conexion.php";
?>
<!DOCTYPE html>
<html class="loading bordered-layout" lang="en" data-layout="bordered-layout" data-textdirection="ltr">
<!-- BEGIN: Head-->

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=0,minimal-ui">
    <meta name="description" content="Vuexy admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
    <meta name="keywords" content="admin template, Vuexy admin template, dashboard template, flat admin template, responsive admin template, web app">
    <meta name="author" content="PIXINVENT">
    <title>Inicio</title>
    <link rel="apple-touch-icon" href="../app-assets/images/ico/apple-icon-120.png">
    <link rel="shortcut icon" type="image/x-icon" href="../app-assets/images/ico/favicon.ico">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;1,400;1,500;1,600" rel="stylesheet">

    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="../app-assets/vendors/css/vendors.min.css">
    <link rel="stylesheet" type="text/css" href="../app-assets/vendors/css/charts/apexcharts.css">
    <link rel="stylesheet" type="text/css" href="../app-assets/vendors/css/extensions/toastr.min.css">
    <link rel="stylesheet" type="text/css" href="../app-assets/vendors/css/tables/datatable/datatables.min.css">
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
    <link rel="stylesheet" type="text/css" href="../app-assets/css/plugins/charts/chart-apex.css">
    <link rel="stylesheet" type="text/css" href="../app-assets/css/plugins/extensions/ext-component-toastr.css">
    <link rel="stylesheet" type="text/css" href="../app-assets/css/pages/app-invoice-list.css">
    <!-- END: Page CSS-->

    <!-- BEGIN: Custom CSS-->
    <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
    <!-- END: Custom CSS-->

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
                <!-- Dashboard Analytics Start -->
                <section id="dashboard-analytics">
                    <div class="row match-height">
                        <!-- Greetings Card starts -->
                        <!-- <div class="col-lg-6 col-md-12 col-sm-12">
                            <div class="card card-congratulations">
                                <div class="card-body text-center">
                                    <img src="../app-assets/images/elements/decore-left.png" class="congratulations-img-left" alt="card-img-left" />
                                    <img src="../app-assets/images/elements/decore-right.png" class="congratulations-img-right" alt="card-img-right" />
                                    <div class="avatar avatar-xl bg-primary shadow">
                                        <div class="avatar-content">
                                            <i data-feather="award" class="font-large-1"></i>
                                        </div>
                                    </div>
                                    <div class="text-center">
                                        <h1 class="mb-1 text-white">Congratulations John,</h1>
                                        <p class="card-text m-auto w-75">
                                            You have done <strong>57.6%</strong> more sales today. Check your new badge in your profile.
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div> -->
                        <!-- Greetings Card ends -->

                        <!-- Subscribers Chart Card starts -->
                        <?php
                        $query = Conexion::buscarVariosRegistro("SELECT count(*) totalAdministradores from tb_usuarios where cod_rol = '1' ");
                        foreach ($query as $d) {
                            $totalAdministradores = $d['totalAdministradores'];
                        }
                        ?>
                        <div class="col-lg-4 col-sm-6 col-12">
                            <div class="card">
                                <div class="card-header flex-column align-items-start pb-0">
                                    <div class="avatar bg-light-primary p-50 m-0">
                                        <div class="avatar-content">
                                            <i data-feather="users" class="font-medium-5"></i>
                                        </div>
                                    </div>
                                    <h2 class="font-weight-bolder mt-1"> <?php echo $totalAdministradores ?> </h2>
                                    <p class="card-text">Administradores</p>
                                </div>
                                <br clear="all">
                                <!-- <div id="gained-chart"></div> -->
                            </div>
                        </div>
                        <!-- Subscribers Chart Card ends -->

                        <!-- Orders Chart Card starts -->
                        <?php
                        $query = Conexion::buscarVariosRegistro("SELECT count(*) totalEmpleados from tb_usuarios where cod_rol = '2' ");
                        foreach ($query as $d) {
                            $totalEmpleados = $d['totalEmpleados'];
                        }
                        ?>
                        <div class="col-lg-4 col-sm-6 col-12">
                            <div class="card">
                                <div class="card-header flex-column align-items-start pb-0">
                                    <div class="avatar bg-light-warning p-50 m-0">
                                        <div class="avatar-content">
                                            <i data-feather="package" class="font-medium-5"></i>
                                        </div>
                                    </div>
                                    <h2 class="font-weight-bolder mt-1"> <?php echo $totalEmpleados ?> </h2>
                                    <p class="card-text">Empleados</p>
                                </div>
                                <br clear="all">
                                <!-- <div id="order-chart"></div> -->
                            </div>
                        </div>
                        <!-- Orders Chart Card ends -->

                        <!-- Orders Chart Card starts -->
                        <?php
                        $query = Conexion::buscarVariosRegistro("SELECT count(*) totalVoluntarios from tb_voluntarios ");
                        foreach ($query as $d) {
                            $totalVoluntarios = $d['totalVoluntarios'];
                        }
                        ?>
                        <div class="col-lg-4 col-sm-6 col-12">
                            <div class="card">
                                <div class="card-header flex-column align-items-start pb-0">
                                    <div class="avatar bg-light-warning p-50 m-0">
                                        <div class="avatar-content">
                                            <i data-feather="package" class="font-medium-5"></i>
                                        </div>
                                    </div>
                                    <h2 class="font-weight-bolder mt-1">  <?php echo $totalVoluntarios ?>   </h2>
                                    <p class="card-text">Voluntarios</p>
                                </div>
                                <br clear="all">
                                <!-- <div id="order-chart"></div> -->
                            </div>
                        </div>
                        <!-- Orders Chart Card ends -->
                    </div>


                    <!-- List DataTable -->

                    <!--/ List DataTable -->
                </section>
                <!-- Dashboard Analytics end -->

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
    <!-- <script src="../app-assets/vendors/js/charts/apexcharts.min.js"></script> -->
    <script src="../app-assets/vendors/js/extensions/toastr.min.js"></script>
    <script src="../app-assets/vendors/js/extensions/moment.min.js"></script>
    <!-- <script src="../app-assets/vendors/js/tables/datatable/datatables.min.js"></script> -->
    <!-- <script src="../app-assets/vendors/js/tables/datatable/datatables.buttons.min.js"></script> -->
    <!-- <script src="../app-assets/vendors/js/tables/datatable/datatables.bootstrap4.min.js"></script> -->
    <!-- <script src="../app-assets/vendors/js/tables/datatable/dataTables.responsive.min.js"></script> -->
    <!-- <script src="../app-assets/vendors/js/tables/datatable/responsive.bootstrap.min.js"></script> -->
    <!-- END: Page Vendor JS-->

    <!-- BEGIN: Theme JS-->
    <script src="../app-assets/js/core/app-menu.js"></script>
    <script src="../app-assets/js/core/app.js"></script>
    <!-- END: Theme JS-->

    <!-- BEGIN: Page JS-->
    <!-- <script src="../app-assets/js/scripts/pages/dashboard-analytics.js"></script> -->
    <!-- <script src="../app-assets/js/scripts/pages/app-invoice-list.js"></script> -->
    <!-- END: Page JS-->

    <script>
        $(window).on('load', function() {
            if (feather) {
                feather.replace({
                    width: 14,
                    height: 14
                });
            }

            // MENSAJE DE BIENVENIA
            "use strict";
            var o, e, r, t, a, s, i, l, n, d, h, c = "#f3f3f3",
                w = "#EBEBEB",
                p = "#b9b9c3",
                u = document.querySelector("#statistics-order-chart"),
                g = document.querySelector("#statistics-profit-chart"),
                b = document.querySelector("#earnings-chart"),
                y = document.querySelector("#revenue-report-chart"),
                m = document.querySelector("#budget-chart"),
                f = document.querySelector("#browser-state-chart-primary"),
                k = document.querySelector("#browser-state-chart-warning"),
                x = document.querySelector("#browser-state-chart-secondary"),
                C = document.querySelector("#browser-state-chart-info"),
                A = document.querySelector("#browser-state-chart-danger"),
                B = document.querySelector("#goal-overview-radial-bar-chart"),
                S = "rtl" === $("html").attr("data-textdirection");
            setTimeout((function() {
                toastr.success("", "👋 Bienvenido " + '<?php echo  $_SESSION['datos_login']['usuario']; ?>', {
                    closeButton: !0,
                    tapToDismiss: !1,
                    rtl: S
                })
            }), 2e3)

        })
    </script>
</body>
<!-- END: Body-->

</html>