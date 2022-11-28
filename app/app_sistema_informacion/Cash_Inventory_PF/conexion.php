<?php

// $conexion = new mysqli("localhost","root","","cashinventory","3306");
// $conexion->set_charset("utf8");

class Conexion {

    private $conexion;
    private $configuracion = [
        "driver" => "mysql",
        "host" => "localhost",
        "database" => "cashinventory",
        "port" => "3306",
        "username" => "root",
        "password" => "",
        "charset" => "utf8mb4"
    ];

    public function __construct(){
    }

    public function conectar(){
        try {
            $CONTROLADOR = $this->configuracion ["driver"];
            $SERVIDOR = $this->configuracion["host"];
            $BASE_DATOS = $this->configuracion ["database"];
            $PUERTO = $this->configuracion ["port"];
            $USUARIO = $this->configuracion["username"];
            $CLAVE = $this->configuracion ["password"];
            $CODIFICACION = $this->configuracion ["charset"];

            $url = "{$CONTROLADOR}: host={$SERVIDOR}:{$PUERTO};"
            . "dbname={$BASE_DATOS}; charset={$CODIFICACION}";

            //SE CREA CONEXIÓN A BASE DE DATOS

            $this->conexion = new PDO ($url, $USUARIO, $CLAVE);
            echo "CONECTADO";       
        }
        catch (Exception $exc){
            echo "NO SE PUDO ESTABLECER CONEXIÓN";
            echo $exc ->getTraceAsString();

        }
    }

}

?>