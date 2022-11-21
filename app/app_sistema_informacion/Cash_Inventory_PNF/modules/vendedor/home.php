<!DOCTYPE html>
<html lang="es" dir="ltr">
    <head>
        <meta charset="utf-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
        <title>Cash Inventory | Inicio</title>
        <link rel="shortcut icon" href="../../img/favicon.ico">
        <link rel="stylesheet" href="../../css/main.css">
    </head>
    <body>
        <!-- ++++++++++++++++++++++++++++++ Navbar +++++++++++++++++++++++++++++++ -->
        <nav class="navbar navbar-expand-md navbar-dark bg-dark">
            <div class="container-fluid">
                <!-- ++++++++++++++++++++++++++++++ Marca y Logo +++++++++++++++++++++++++++++++ -->
                <img src="../../img/moneda.png" class="icono_inicial">
                <a class="navbar-brand" id="marca" href="#">Cash Inventory</a>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <!-- ++++++++++++++++++++++++++++++ Itenms Navbar +++++++++++++++++++++++++++++++ -->
                        <li class="nav-item dropdown" id="opciones">
                            <div class="dropdown-dropstart" >
                                <!-- ++++++++++++++++++++++++++++++ Opciones de Usuario +++++++++++++++++++++++++++++++ -->
                                <a href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
                                    <img src="../../img/usuario.png" alt="" class="foto_perfil" >
                                </a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuLink">
                                    <li><a class="dropdown-item" href="mi_perfil.php">Mi perfil</a></li>
                                    <li><a class="dropdown-item" href="../../index.php">Cerrar Sesión</a></li>
                                </ul>
                            </div>
                        </li>
                        <!-- ++++++++++++++++++++++++++++++ Configuración +++++++++++++++++++++++++++++++ -->
                        <li class="nav-item">
                            <a href="#" class="conf_icon" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="bi bi-gear"></i></a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- ++++++++++++++++++++++++++++++ Ventana Emergente de configuración +++++++++++++++++++++++++++++++ -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Configuración</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Habilitar notificaciones
                        <select class="form-select" id="inputGroupSelect01" aria-label="Example select with button addon">
                            <option selected>SI</option>
                            <option value="1">NO</option>
                        </select><br>
                        Notificarme ingresos después de X productos
                        <select class="form-select" id="inputGroupSelect02" aria-label="Example select with button addon">
                            <option selected>10</option>
                            <option value="2">20</option>
                            <option value="2">30</option>
                            <option value="2">40</option>
                            <option value="2">50</option>
                            <option value="2">100</option>
                            <option value="2">Nunca</option>
                        </select><br>
                        Notificarme salidas después de X productos
                        <select class="form-select" id="inputGroupSelect03" aria-label="Example select with button addon">
                            <option selected>10</option>
                            <option value="2">20</option>
                            <option value="2">30</option>
                            <option value="2">40</option>
                            <option value="2">50</option>
                            <option value="2">100</option>
                            <option value="2">Nunca</option>
                        </select><br>
                        Notificarme pocas unidades
                        <select class="form-select" id="inputGroupSelect03" aria-label="Example select with button addon">
                            <option selected>10</option>
                            <option value="2">20</option>
                            <option value="2">30</option>
                            <option value="2">40</option>
                            <option value="2">50</option>
                            <option value="2">100</option>
                            <option value="2">Nunca</option>
                        </select>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                        <button type="button" class="btn btn-primary">Guardar Cambios</button>
                    </div>
                </div>
            </div>
        </div>
        <div id="caja_venta">
            <div class="cuadro_left_ventas"></div>
            <div class="cuadro_right_white"></div>
            <div class="cuadro_left_ventas_container">
                <h1 class="titulo_modulo">MODULOS</h1><br><br>

                <div class="d-grid gap-2">
                <!-- <div class="input-group">   
                    <input type="text" class="form-control" placeholder="Codigo de barras">
                    <button type="button" class="btn btn-warning" id="button-addon2"><i class="bi bi-search"></i> Buscar</button>
                </div> -->

                <!-- Button modal search product-->
                <a class="btn btn-warning btn-lg" role="button" data-bs-toggle="modal" data-bs-target="#searchProduct"><i class="bi bi-search"></i> Consultar producto</a>
                <a class="btn btn-warning btn-lg" role="button" href="gestion_producto/gestion_producto.php"><i class="bi bi-clock-history"></i> Histotial de facturas</a>
                <a class="btn btn-warning btn-lg" role="button"><i class="bi bi-x-circle"></i> Cancelar factura</a>


                <!-- Modal -->
                <div class="modal fade" id="searchProduct" tabindex="-1" aria-labelledby="searchProductLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Consultar Producto</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="input-group">   
                            <input type="text" class="form-control" placeholder="Codigo de barras">
                            <button type="button" class="btn btn-warning" id="button-addon2"><i class="bi bi-search"></i> Buscar</button>
                        </div>
                        <br>
                        <table class="table table-light table-striped">
                            <thead>
                                <tr>
                                    <th class="table-dark" scope="col">Nombre</th>
                                    <th class="table-dark"scope="col">Precio Unitario</th>
                                    <th class="table-dark"scope="col">Cantidad en Tienda</th>
                                    <th class="table-dark"scope="col">Cantidad en Bodega</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="table-light">
                                    <td class="table-light">Block Cuadriculado</td>
                                    <td class="table-light">$7.000</td>
                                    <td class="table-light">80</td>
                                    <td class="table-light">150</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    </div>
                    </div>
                </div>
                </div>

            </div>
            </div>
            <div class="cuadro_right_white_container">
                <div class="input-group">   
                    <input type="text" class="form-control" placeholder="Codigo de barras">
                    <button type="button" class="btn btn-warning" id="button-addon2"><i class="bi bi-cart-plus-fill"></i> Agregar Producto</button>
                </div>
            </div>
            <button type="button" id="fullscreen_button" class="btn btn-dark" onclick="openFullscreen(); exitFullscreen(); ChangeIcon();"><i id="fullscreen_icon" class="bi bi-fullscreen"></i></button>
            
        </div>
        <!-- ++++++++++++++++++++++++++++++ Scripts +++++++++++++++++++++++++++++++ -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="../../js/main.js"></script>
    </body>
</html>
