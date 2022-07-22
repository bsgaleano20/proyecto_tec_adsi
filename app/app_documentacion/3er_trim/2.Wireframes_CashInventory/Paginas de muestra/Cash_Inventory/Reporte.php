<!DOCTYPE html>
<html lang="en">
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Reportes</title>
    </head>
    <body>
    <div class="p-3 mb-2 bg-warning text-dark">
            <nav class="navbar navbar-expand-lg navbar-dark bg-warning">
                <div class="container-fluid">
                    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                        <div class="navbar-nav">
                             <div >
                                <img src="img\logo.png" width=40px>
                             </div>    
                             <a class="navbar-brand" href="#"> Cash Inventory</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">Reportes</a>
                        </li>
                    </ul>                                                                     
                </div>
            </nav>
        </div> 
        <div class="row">
            <div class="col-4">
                <br>

                <div class="w3-sidebar w3-bar-block" style="width:25%">
                    <div style="margin-left:25%"><img src="https://public21.es/wp-content/uploads/2016/10/foto-perfil-redonda.png" width=200px></div>
                    <div style="margin-left:10%">
                        <h3 class="w3-bar-item">REPORTE</h3>
                        <a href="#" class="w3-bar-item w3-button">Reporte de ventas</a>
                        <a href="#" class="w3-bar-item w3-button">Productos mas vendidos</a>
                        <a href="#" class="w3-bar-item w3-button">Reporte vendedores</a>
                        <a href="#" class="w3-bar-item w3-button">Reporte de gastos</a>
                    </div>    
                </div>    
            </div>
            
            <div class="col-7">
            <br>
            <br>
            <br>
                <div class="position-relative">
                    <div class="position-absolute top-0 start-50 translate-middle">
                        <button type="button" class="btn btn-primary">Create</button>
                    </div>
                </div>
                <br>
                <br>
                <br>
                <table class="table table-bordered">
                    <tbody>
                        <tr>
                            <th scope="row">Tipos de archivos</th>
                            <td>Archivos</td>
                        </tr>
                        <tr>
                            <th scope="row">PDF</th>
                            <td>Reporte ventas Enero</td>
                            <td><button type="button" class="btn btn-success">Editar</button> <button type="button" class="btn btn-danger">Eliminar</button></td>
                        </tr>
                        <tr>
                            <th scope="row">PDF</th>
                            <td>Reporte ventas Marzo</td>
                            <td><button type="button" class="btn btn-success">Editar</button> <button type="button" class="btn btn-danger">Eliminar</button></td>
                        </tr>
                        <tr>
                            <th scope="row">PDF</th>
                            <td>Reporte ventas Abril</td>
                            <td><button type="button" class="btn btn-success">Editar</button> <button type="button" class="btn btn-danger">Eliminar</button></td>
                        </tr>
                        <tr>
                            <th scope="row">PDF</th>
                            <td>Reporte ventas Mayo</td>
                            <td><button type="button" class="btn btn-success">Editar</button> <button type="button" class="btn btn-danger">Eliminar</button></td>
                        </tr>
                        <tr>
                            <th scope="row">PDF</th>
                            <td>Reporte ventas Junio</td>
                            <td><button type="button" class="btn btn-success">Editar</button> <button type="button" class="btn btn-danger">Eliminar</button></td>
                        </tr>
                        <tr>
                            <th scope="row">PDF</th>
                            <td>Reporte ventas Julio</td>
                            <td><button type="button" class="btn btn-success">Editar</button> <button type="button" class="btn btn-danger">Eliminar</button></td>
                        </tr>
                    </tbody>
                </table>           
            </div>
        </div>       
    </body>
</html>