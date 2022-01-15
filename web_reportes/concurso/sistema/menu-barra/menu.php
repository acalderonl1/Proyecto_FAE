<div class="main-menu menu-fixed menu-light menu-accordion menu-shadow" data-scroll-to-active="true">
        <div class="navbar-header">
            <ul class="nav navbar-nav flex-row">
                <li class="nav-item mr-auto"><a class="navbar-brand" href="http://localhost/concurso/sistema/"><span class="brand-logo">
                          
                        </span>
                        <h2 class="brand-text"> Concurso</h2>
                    </a></li>
                <li class="nav-item nav-toggle"><a class="nav-link modern-nav-toggle pr-0" data-toggle="collapse"><i class="d-block d-xl-none text-primary toggle-icon font-medium-4" data-feather="x"></i><i class="d-none d-xl-block collapse-toggle-icon font-medium-4  text-primary" data-feather="disc" data-ticon="disc"></i></a></li>
            </ul>
        </div>
        <div class="shadow-bottom"></div>
        <div class="main-menu-content">
            <ul class="navigation navigation-main" id="main-menu-navigation" data-menu="menu-navigation">
                <li class=" nav-item"><a class="d-flex align-items-center" href="index.html"><i data-feather="home"></i><span class="menu-title text-truncate" data-i18n="Dashboards">Dashboard</span></span></a>
                    <ul class="menu-content">
                        <li class="active"><a class="d-flex align-items-center" href="../sistema/"><i data-feather="circle"></i><span class="menu-item text-truncate">Inicio</span></a>
                        </li>
                    </ul>
                </li>
                <li class=" navigation-header"><span data-i18n="Apps &amp; Pages">Men&uacute; </span><i data-feather="more-horizontal"></i>
                </li>
              
             <?php if($_SESSION['datos_login']['iduser'] == "1"){  ?>
                <li class=" nav-item"><a class="d-flex align-items-center" href="#"><i data-feather="menu"></i><span class="menu-title text-truncate" data-i18n="Menu Levels">Usuarios</span></a>
                    <ul class="menu-content">
                        <!-- <li><a class="d-flex align-items-center" href="#"><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="Second Level">Second Level 2.1</span></a> </li> -->
                        <li>
                          <a class="d-flex align-items-center" href=""><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="Second Level"> Administrador </span></a>
                            <ul class="menu-content">
                                <li>
                                  <a class="d-flex align-items-center" href="crear-administrador.php"><span class="menu-item text-truncate" data-i18n="Third Level"> Crear </span></a>
                                </li>
                                <li>
                                  <a class="d-flex align-items-center" href="lista-administradores.php"><span class="menu-item text-truncate" data-i18n="Third Level"> Lista</span></a>
                                </li>
                            </ul>
                        </li>
                        <li>
                          <a class="d-flex align-items-center" href=""><i data-feather="circle"></i><span class="menu-item text-truncate" data-i18n="Second Level"> Empleados </span></a>
                            <ul class="menu-content">
                                <li>
                                  <a class="d-flex align-items-center" href="crear-empleado.php"><span class="menu-item text-truncate" data-i18n="Third Level"> Crear </span></a>
                                </li>
                                <li>
                                  <a class="d-flex align-items-center" href="lista-empleados.php"><span class="menu-item text-truncate" data-i18n="Third Level"> Lista</span></a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>
            <?php } ?>
                <li class=" nav-item"><a class="d-flex align-items-center" href="lista-voluntarios.php"><i data-feather="menu"></i><span class="menu-title text-truncate" data-i18n="Menu Levels"> Lista </span></a>
            
                </li>
               
              
              
            </ul>
        </div>
    </div>