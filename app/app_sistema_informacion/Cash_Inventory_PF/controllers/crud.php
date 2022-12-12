<?php

class Crud {
    protected $tabla;
    protected $conexion;
    protected $wheres = "";
    protected $sql = null;

    public function __construct($tabla = null){
        $this->conexion = (new Conexion())->conectar();
        $this->tabla = $tabla;
        
    }
}


?>