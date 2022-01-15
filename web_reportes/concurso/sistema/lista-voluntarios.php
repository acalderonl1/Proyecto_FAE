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
  <title> Lista voluntarios</title>
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
              <table id="tabla" class="invoice-list-table table">
                <thead>
                  <tr>
                    <th>#</th>
                    <th>Nombres y Apellidos</th>
                    <th>C&eacute;dula</th>
                    <th>Edad</th>
                    <th>Celular</th>
                    <th>Genero</th>
                    <th>correo</th>
                  </tr>
                </thead>
                <tbody>

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
  <script type="text/javascript" src="datatable/datatables/datatables.min.js"></script> 
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" crossorigin="anonymous">  
  <!-- <script type="text/javascript" src="main.js"></script>   -->

  <!-- BEGIN: Page JS-->
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
    })

    // DATATABLE
    $(document).ready(function() {
      $('#tabla').DataTable({
        
        "bDeferRender": true,
        "sPaginationType": "full_numbers",
        "ajax": {
          "url": "php/administrador/lista-voluntarios.php",
          "type": "POST"
        },
        "columns": [{
            "data": "enumaracion"
          },
          {
            "data": "nombres"
          },
          {
            "data": "cedula"
          },
          {
            "data": "edad"
          },
          {
            "data": "celular"
          },
          {
            "data": "genero"
          },
          {
            "data": "correo"
          }
        ],
        responsive: "true",
        dom: 'Bfrtilp',       
        buttons:[ 
			{
				extend:    'excelHtml5',
				text:      '<i class="fas fa-file-excel"></i> ',
				titleAttr: 'Exportar a Excel',
				className: 'btn btn-success'
			},
			{
				extend:    'pdfHtml5',
				text:      '<i class="fas fa-file-pdf"></i> ',
				titleAttr: 'Exportar a PDF',
				className: 'btn btn-danger'
			},
			{
				extend:    'print',
				text:      '<i class="fa fa-print"></i> ',
				titleAttr: 'Imprimir',
				className: 'btn btn-info'
			},
		],
        "oLanguage": {
          "sProcessing": "Procesando...",
          "sLengthMenu": 'Mostrar <select class="form-control">' +
            '<option value="10">10</option>' +
            '<option value="20">20</option>' +
            '<option value="30">30</option>' +
            '<option value="40">40</option>' +
            '<option value="50">50</option>' +
            '<option value="-1">All</option>' +
            '</select> registros',
          "sZeroRecords": "No se encontraron resultados",
          "sEmptyTable": "Ningún dato disponible en esta tabla",
          "sInfo": " (_START_ al _END_) de un total de _TOTAL_ registros",
          "sInfoEmpty": "Mostrando del 0 al 0 de un total de 0 registros",
          "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
          "sInfoPostFix": "",
          "sSearch": "Filtrar:",
          "sUrl": "",
          "sInfoThousands": ",",
          "sLoadingRecords": "Por favor espere - cargando...",
          "oPaginate": {
            "sFirst": "Primero",
            "sLast": "Último",
            "sNext": "Siguiente",
            "sPrevious": "Anterior"
          },
          
          "oAria": {
            "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
            "sSortDescending": ": Activar para ordenar la columna de manera descendente"
          }
        }
      });
    });
  </script>
</body>
<!-- END: Body-->

</html>