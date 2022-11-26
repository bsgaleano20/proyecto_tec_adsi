<?php

$usuario = $_POST['usuario'];
$password = $_POST['password'];
$estado_sesion = false;

session_start();

$_SESSION['email'] = $usuario;

include('conexion.php');

$consulta = "SELECT * FROM usuario WHERE email = '$usuario' and password = '$password'";
$resultado = mysqli_query($conexion, $consulta);


$filas = mysqli_num_rows($resultado);

if ($filas){
    header("location:modules/administrador/home.php");
    $estado_sesion = true;
}
else{
    ?>
    <?php
    include("login.php");
    ?>
    <!-- <div class="alert alert-danger" role="alert">
        A simple danger alert—check it out!
    </div> -->
    <h6 class="alert alert-danger text-center">DATOS INCORRECTOS</h6>
    <?php
}

mysqli_free_result($resultado);
mysqli_close($conexion);
?>