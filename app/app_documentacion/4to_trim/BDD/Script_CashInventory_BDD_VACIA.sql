
-- -----------------------------------------------------
-- Schema CashInventory
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema CashInventory
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `CashInventory` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci ;
USE `CashInventory` ;

-- -----------------------------------------------------
-- Table `CashInventory`.`Rol`
-- -----------------------------------------------------
CREATE TABLE `Rol` (
  `Id_rol` INT NOT NULL AUTO_INCREMENT COMMENT 'Este campo almacena el identificador del rol',
  `nombre_rol` VARCHAR(15) NOT NULL COMMENT 'Este campo almacena el nombre del rol',
  `descripcion_rol` TEXT(100) NULL COMMENT 'En este campo se describe las funciones, posibilidades y limitaciones del rol creado',
  `created_at` DATETIME NULL DEFAULT current_timestamp() COMMENT 'Este atributo almacena la fecha y hora de creación del rol',
  `updated_at` DATETIME NULL DEFAULT current_timestamp() COMMENT 'Este atributo almacena la fecha y hora de actualización del rol',
  `deleted_at` DATETIME NULL COMMENT 'Este atributo almacena la fecha y hora de deshabilitación del rol',
  PRIMARY KEY (`Id_rol`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CashInventory`.`usuario`
-- -----------------------------------------------------
CREATE TABLE `usuario` (
  `Id_usuario` VARCHAR(15) NOT NULL COMMENT 'Este campo captura el Número de identifiación del usuario (puede ser Cedula de ciudadanía C.C, Cedula de extranjería C.E, Tarjeta de Identidad T.I)',
  `nombre_usuario` VARCHAR(64) NOT NULL COMMENT 'Este atributo almacena el nombre del usuario',
  `email` VARCHAR(64) NOT NULL COMMENT 'Este atributo almacena el correo electrónico del usuario',
  `celular` VARCHAR(12) NULL COMMENT 'ste atributo almacena número de contacto celular del usuario',
  `direccion` VARCHAR(32) NOT NULL COMMENT 'Este atributo almacena la dirección de residencia del usuario',
  `password` VARCHAR(32) NOT NULL COMMENT 'Este atributo almacena la contraseña del usuario',
  `habilitado_usuario` CHAR(1) NOT NULL COMMENT 'En este campo se guardará si un usuario se encuentra habilitado o no para su uso',
  `created_at` DATETIME NULL DEFAULT current_timestamp() COMMENT 'Este atributo almacena la fecha y hora de creación del usuario',
  `updated_at` DATETIME NULL DEFAULT current_timestamp() COMMENT 'Este atributo almacena la fecha y hora de actualización del usuario',
  `deleted_at` DATETIME NULL COMMENT 'Este atributo almacena la fecha y hora de deshabilitación del usuario',
  `Rol_id_rol` INT NOT NULL COMMENT 'Este campo relaciona el usuario con el rol que ocupa para sus labores diarias',
  PRIMARY KEY (`Id_usuario`),
  INDEX `fk_usuarios_Rol_idx` (`Rol_id_rol` ASC) ,
  CONSTRAINT `fk_usuarios_Rol`
    FOREIGN KEY (`Rol_id_rol`)
    REFERENCES `CashInventory`.`Rol` (`Id_rol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CashInventory`.`Producto`
-- -----------------------------------------------------
CREATE TABLE `Producto` (
  `Id_producto` INT NOT NULL AUTO_INCREMENT COMMENT 'En este campo se almacenará el identificador del producto',
  `nombre_producto` VARCHAR(45) NOT NULL COMMENT 'Este campo almacenará el nombre del producto',
  `descripcion_producto` VARCHAR(45) NULL COMMENT 'Este campo almacenará la descripción del producto',
  `codigo_barras` BIGINT(15) NOT NULL COMMENT 'Este campo almacenará el codigo de barras impreso en el producto',
  `precio_unitario` DECIMAL(10,2) NOT NULL COMMENT 'Este campo almacenará el valor de venta por unidad del producto',
  `cantidad_disponible_b` INT(4) NOT NULL COMMENT 'Este campo almacenará la cantidad de productos disponibles en Bodega',
  `cantidad_disponible_t` INT(4) NOT NULL COMMENT 'Este campo almacenará la cantidad de productos disponibles en Tienda',
  `Proveedor` VARCHAR(70) NULL COMMENT 'En este campo se almacenará el nombre del proveedor al que se le realiza la compra de insumos',
  `created_at` DATETIME NULL DEFAULT current_timestamp() COMMENT 'Este atributo almacena la fecha y hora de creación del producto',
  `updated_at` DATETIME NULL DEFAULT current_timestamp() COMMENT 'Este atributo almacena la fecha y hora de actualización del producto',
  `deleted_at` DATETIME NULL COMMENT 'Este atributo almacena la fecha y hora de deshabilitación del producto',
  PRIMARY KEY (`Id_producto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CashInventory`.`Movimiento`
-- -----------------------------------------------------
CREATE TABLE `Movimiento` (
  `Id_movimiento` INT NOT NULL AUTO_INCREMENT COMMENT 'Este campo almacenará el identificador del movimiento a realizar',
  `nombre_movimiento` VARCHAR(45) NOT NULL COMMENT 'Este campo almacena el nombre del movimiento a realizar',
  PRIMARY KEY (`Id_movimiento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CashInventory`.`Autorizacion`
-- -----------------------------------------------------
CREATE TABLE `Autorizacion` (
  `Id_autorizacion` INT NOT NULL AUTO_INCREMENT COMMENT 'En este campo se almacenará el identificador de la autorización',
  `nombre_autorizacion` VARCHAR(128) NULL COMMENT 'En este campo se almacenará el nombre de la autorización',
  `aprobacion_autorizacion` CHAR(1) NULL COMMENT 'En este campo se almacenará un dato booleano para validar si la autorización fue aprobada o denegada',
  `Solicitante_id_usuario` VARCHAR(15) NOT NULL COMMENT 'En este campo se almacena el identificador del usuario solicitante de autorización',
  PRIMARY KEY (`Id_autorizacion`),
  INDEX `fk_Autorizacion_usuarios1_idx` (`Solicitante_id_usuario` ASC) ,
  CONSTRAINT `fk_Autorizacion_usuarios1`
    FOREIGN KEY (`Solicitante_id_usuario`)
    REFERENCES `CashInventory`.`usuario` (`Id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CashInventory`.`Factura`
-- -----------------------------------------------------
CREATE TABLE `Factura` (
  `Id_factura` INT NOT NULL AUTO_INCREMENT COMMENT 'Este campo almacenará el identificador de la factura',
  `fecha_factura` DATE NOT NULL COMMENT 'En este campo almacenará la fecha de realización de la factura',
  `valor_total_factura` DECIMAL(10,2) NOT NULL COMMENT 'En este campo se almacenará el valor total de lo comprado por el cliente',
  `ValorRecibidoFactura` DECIMAL(10,2) NOT NULL COMMENT 'Este campo almacenará el valor recibido por el cliente',
  `cambio_factura` DECIMAL(10,2) NOT NULL COMMENT 'Este campo almacenará el cambio o las vueltas que se le debe dar al usuario en caso de que corresponda',
  `Vendedor_id_usuario` VARCHAR(15) NOT NULL COMMENT 'Este campo traerá la información del vendedor que realiza la factura y venta',
  PRIMARY KEY (`Id_factura`),
  INDEX `fk_Factura_usuarios1_idx` (`Vendedor_id_usuario` ASC) ,
  CONSTRAINT `fk_Factura_usuarios1`
    FOREIGN KEY (`Vendedor_id_usuario`)
    REFERENCES `CashInventory`.`usuario` (`Id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CashInventory`.`DetalleMovimiento`
-- -----------------------------------------------------
CREATE TABLE `DetalleMovimiento` (
  `Movimiento_id_movimiento` INT NOT NULL COMMENT 'En este campo se almacenará el identificador del movimiento a realizar',
  `Producto_id_producto` INT NOT NULL COMMENT 'En este campo se almacenará el identificador del producto del cual se realizará un movmiento',
  `cantidad_detalle_movimiento` INT(4) NOT NULL COMMENT 'En este campo se almacenará la cantidad de productos a los cuales se les va a aplicar el movimiento.',
  `valor_detalle_movimiento` INT(10) NULL COMMENT 'En este campo se almacenará el valor de los productos a los cuales se les aplicará el movimiento.',
  `fecha_detalle_movimiento` DATE NOT NULL COMMENT 'En este campo se almacenará hora y fecha de cuando se realice el movimiento',
  `Autorizacion_id_autorizacion` INT NOT NULL COMMENT 'En este campo se almacenará el identificador de la autorización para realizar el respectivo movimiento.',
  PRIMARY KEY (`Movimiento_id_movimiento`, `Producto_id_producto`),
  INDEX `fk_Movimiento_has_Productos_Productos1_idx` (`Producto_id_producto` ASC) ,
  INDEX `fk_Movimiento_has_Productos_Movimiento1_idx` (`Movimiento_id_movimiento` ASC) ,
  INDEX `fk_Movimiento_has_Productos_Autorizacion1_idx` (`Autorizacion_id_autorizacion` ASC) ,
  CONSTRAINT `fk_Movimiento_has_Productos_Movimiento1`
    FOREIGN KEY (`Movimiento_id_movimiento`)
    REFERENCES `CashInventory`.`Movimiento` (`Id_movimiento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Movimiento_has_Productos_Productos1`
    FOREIGN KEY (`Producto_id_producto`)
    REFERENCES `CashInventory`.`Producto` (`Id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Movimiento_has_Productos_Autorizacion1`
    FOREIGN KEY (`Autorizacion_id_autorizacion`)
    REFERENCES `CashInventory`.`Autorizacion` (`Id_autorizacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CashInventory`.`DetalleFactura`
-- -----------------------------------------------------
CREATE TABLE `DetalleFactura` (
  `Producto_id_producto` INT NOT NULL COMMENT 'Este campo almacenará el identificador del producto',
  `Factura_id_factura` INT NOT NULL COMMENT 'Este campo almacenará el identificador de la factura',
  `cantidadProductoFactura` INT NOT NULL COMMENT 'En este campo almacenará la cantidad del producto comprado',
  `precio_unitario` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`Producto_id_producto`, `Factura_id_factura`),
  INDEX `fk_Productos_has_Factura_Factura1_idx` (`Factura_id_factura` ASC) ,
  INDEX `fk_Productos_has_Factura_Productos1_idx` (`Producto_id_producto` ASC) ,
  CONSTRAINT `fk_Productos_has_Factura_Productos1`
    FOREIGN KEY (`Producto_id_producto`)
    REFERENCES `CashInventory`.`Producto` (`Id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Productos_has_Factura_Factura1`
    FOREIGN KEY (`Factura_id_factura`)
    REFERENCES `CashInventory`.`Factura` (`Id_factura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

