-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-09-2022 a las 21:15:47
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cashinventory`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autorizacion`
--

CREATE TABLE `autorizacion` (
  `Id_autorizacion` int(11) NOT NULL COMMENT 'En este campo se almacenará el identificador de la autorización',
  `nombre_autorizacion` varchar(128) COLLATE utf8_spanish2_ci DEFAULT NULL COMMENT 'En este campo se almacenará el nombre de la autorización',
  `aprobacion_autorizacion` char(1) COLLATE utf8_spanish2_ci DEFAULT NULL COMMENT 'En este campo se almacenará un dato booleano para validar si la autorización fue aprobada o denegada',
  `Solicitante_id_usuario` varchar(15) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'En este campo se almacena el identificador del usuario solicitante de autorización'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `autorizacion`
--

INSERT INTO `autorizacion` (`Id_autorizacion`, `nombre_autorizacion`, `aprobacion_autorizacion`, `Solicitante_id_usuario`) VALUES
(1, 'Traslado esferos negros a tienda', 'P', '72451232'),
(2, 'Traslado resmas a tienda', 'A', '72451232'),
(3, 'Traslado Marcadores Sharpie a tienda', 'D', '31252626');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallefactura`
--

CREATE TABLE `detallefactura` (
  `Producto_id_producto` int(11) NOT NULL COMMENT 'Este campo almacenará el identificador del producto',
  `Factura_id_factura` int(11) NOT NULL COMMENT 'Este campo almacenará el identificador de la factura',
  `cantidadProductoFactura` int(11) NOT NULL COMMENT 'En este campo almacenará la cantidad del producto comprado',
  `precio_unitario` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `detallefactura`
--

INSERT INTO `detallefactura` (`Producto_id_producto`, `Factura_id_factura`, `cantidadProductoFactura`, `precio_unitario`) VALUES
(1, 1, 1, '7000.00'),
(2, 2, 1, '5000.00'),
(4, 2, 1, '12000.00'),
(8, 1, 1, '3800.00'),
(10, 2, 1, '22500.00'),
(18, 1, 1, '4500.00'),
(20, 2, 1, '5300.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallemovimiento`
--

CREATE TABLE `detallemovimiento` (
  `Movimiento_id_movimiento` int(11) NOT NULL COMMENT 'En este campo se almacenará el identificador del movimiento a realizar',
  `Producto_id_producto` int(11) NOT NULL COMMENT 'En este campo se almacenará el identificador del producto del cual se realizará un movmiento',
  `cantidad_detalle_movimiento` int(4) NOT NULL COMMENT 'En este campo se almacenará la cantidad de productos a los cuales se les va a aplicar el movimiento.',
  `valor_detalle_movimiento` int(10) DEFAULT NULL COMMENT 'En este campo se almacenará el valor de los productos a los cuales se les aplicará el movimiento.',
  `fecha_detalle_movimiento` date NOT NULL COMMENT 'En este campo se almacenará hora y fecha de cuando se realice el movimiento',
  `Autorizacion_id_autorizacion` int(11) NOT NULL COMMENT 'En este campo se almacenará el identificador de la autorización para realizar el respectivo movimiento.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `detallemovimiento`
--

INSERT INTO `detallemovimiento` (`Movimiento_id_movimiento`, `Producto_id_producto`, `cantidad_detalle_movimiento`, `valor_detalle_movimiento`, `fecha_detalle_movimiento`, `Autorizacion_id_autorizacion`) VALUES
(1, 15, 80, 88000, '2022-09-16', 1),
(2, 10, 5, 112500, '2022-09-15', 2),
(3, 18, 160, 720000, '2022-09-15', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `Id_factura` int(11) NOT NULL COMMENT 'Este campo almacenará el identificador de la factura',
  `fecha_factura` date NOT NULL COMMENT 'En este campo almacenará la fecha de realización de la factura',
  `valor_total_factura` decimal(10,2) NOT NULL COMMENT 'En este campo se almacenará el valor total de lo comprado por el cliente',
  `ValorRecibidoFactura` decimal(10,2) NOT NULL COMMENT 'Este campo almacenará el valor recibido por el cliente',
  `cambio_factura` decimal(10,2) NOT NULL COMMENT 'Este campo almacenará el cambio o las vueltas que se le debe dar al usuario en caso de que corresponda',
  `Vendedor_id_usuario` varchar(15) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Este campo traerá la información del vendedor que realiza la factura y venta'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`Id_factura`, `fecha_factura`, `valor_total_factura`, `ValorRecibidoFactura`, `cambio_factura`, `Vendedor_id_usuario`) VALUES
(1, '2022-09-16', '15300.00', '20000.00', '4700.00', '11934517530'),
(2, '2022-09-15', '44800.00', '50000.00', '5200.00', '10104527840');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento`
--

CREATE TABLE `movimiento` (
  `Id_movimiento` int(11) NOT NULL COMMENT 'Este campo almacenará el identificador del movimiento a realizar',
  `nombre_movimiento` varchar(45) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Este campo almacena el nombre del movimiento a realizar'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `movimiento`
--

INSERT INTO `movimiento` (`Id_movimiento`, `nombre_movimiento`) VALUES
(1, 'traslado esferos negros a tienda'),
(2, 'traslado resmas a tienda'),
(3, 'traslado Marcadores sharpie a tienda');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `Id_producto` int(11) NOT NULL COMMENT 'En este campo se almacenará el identificador del producto',
  `nombre_producto` varchar(45) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Este campo almacenará el nombre del producto',
  `descripcion_producto` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL COMMENT 'Este campo almacenará la descripción del producto',
  `codigo_barras` bigint(15) NOT NULL COMMENT 'Este campo almacenará el codigo de barras impreso en el producto',
  `precio_unitario` decimal(10,2) NOT NULL COMMENT 'Este campo almacenará el valor de venta por unidad del producto',
  `cantidad_disponible_b` int(4) NOT NULL COMMENT 'Este campo almacenará la cantidad de productos disponibles en Bodega',
  `cantidad_disponible_t` int(4) NOT NULL COMMENT 'Este campo almacenará la cantidad de productos disponibles en Tienda',
  `Proveedor` varchar(70) COLLATE utf8_spanish2_ci DEFAULT NULL COMMENT 'En este campo se almacenará el nombre del proveedor al que se le realiza la compra de insumos',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Este atributo almacena la fecha y hora de creación del producto',
  `updated_at` datetime DEFAULT current_timestamp() COMMENT 'Este atributo almacena la fecha y hora de actualización del producto',
  `deleted_at` datetime DEFAULT NULL COMMENT 'Este atributo almacena la fecha y hora de deshabilitación del producto'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`Id_producto`, `nombre_producto`, `descripcion_producto`, `codigo_barras`, `precio_unitario`, `cantidad_disponible_b`, `cantidad_disponible_t`, `Proveedor`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Block cuadriculado', NULL, 788492808274, '7000.00', 150, 80, 'MUNDOCOM', '2022-09-18 14:15:18', '2022-09-18 14:15:18', NULL),
(2, 'Marcador borrable NEGRO', NULL, 788492808145, '5000.00', 300, 150, 'MUNDOCOM', '2022-09-18 14:15:18', '2022-09-18 14:15:18', NULL),
(3, 'Micropunta negro', NULL, 788492804163, '6500.00', 120, 80, 'MUNDOCOM', '2022-09-18 14:15:18', '2022-09-18 14:15:18', NULL),
(4, 'Cosedora', NULL, 788492803548, '12000.00', 90, 35, 'MUNDOCOM', '2022-09-18 14:15:18', '2022-09-18 14:15:18', NULL),
(5, 'Pegante en barra PEGASTICK', NULL, 788492822301, '4500.00', 230, 105, 'MUNDOCOM', '2022-09-18 14:15:18', '2022-09-18 14:15:18', NULL),
(6, 'Perforadora 2 huecos', NULL, 788492802458, '9800.00', 40, 22, 'MUNDOCOM', '2022-09-18 14:15:18', '2022-09-18 14:15:18', NULL),
(7, 'Cinta transparente ANCHA', NULL, 788492808271, '6000.00', 92, 40, 'MUNDOCOM', '2022-09-18 14:15:18', '2022-09-18 14:15:18', NULL),
(8, 'Resaltador', NULL, 788492808278, '3800.00', 350, 80, 'MUNDOCOM', '2022-09-18 14:15:18', '2022-09-18 14:15:18', NULL),
(9, 'Gancho Legajador', NULL, 788492803030, '500.00', 780, 280, 'MUNDOCOM', '2022-09-18 14:15:18', '2022-09-18 14:15:18', NULL),
(10, 'Resma papel 500 hojas A4', NULL, 788492807452, '22500.00', 30, 10, 'MUNDOCOM', '2022-09-18 14:15:18', '2022-09-18 14:15:18', NULL),
(11, 'Lapiz Norma mirado 2', NULL, 788492803254, '800.00', 520, 340, 'MUNDOCOM', '2022-09-18 14:15:18', '2022-09-18 14:15:18', NULL),
(12, 'Tijera Escolar punta roma', NULL, 788492801002, '3300.00', 100, 40, 'MUNDOCOM', '2022-09-18 14:15:18', '2022-09-18 14:15:18', NULL),
(13, 'Corrector en lapiz', NULL, 788492800123, '2000.00', 220, 80, 'MUNDOCOM', '2022-09-18 14:15:18', '2022-09-18 14:15:18', NULL),
(14, 'Sticky Notes x100 hojas', NULL, 788492800524, '2000.00', 120, 60, 'MUNDOCOM', '2022-09-18 14:15:18', '2022-09-18 14:15:18', NULL),
(15, 'Esfero NEGRO BIC', NULL, 788492801085, '1100.00', 450, 120, 'MUNDOCOM', '2022-09-18 14:15:18', '2022-09-18 14:15:18', NULL),
(16, 'Esfero ROJO BIC', NULL, 788492805032, '1100.00', 230, 80, 'MUNDOCOM', '2022-09-18 14:15:18', '2022-09-18 14:15:18', NULL),
(17, 'Esfero AZUL BIC', NULL, 788492804020, '1100.00', 240, 95, 'MUNDOCOM', '2022-09-18 14:15:18', '2022-09-18 14:15:18', NULL),
(18, 'Marcador Sharpie NEGRO', NULL, 788492801098, '4500.00', 230, 90, 'MUNDOCOM', '2022-09-18 14:15:18', '2022-09-18 14:15:18', NULL),
(19, 'Marcador Sharpie ROJO', NULL, 788492809950, '4500.00', 120, 40, 'MUNDOCOM', '2022-09-18 14:15:18', '2022-09-18 14:15:18', NULL),
(20, 'Borrador tablero', NULL, 788492800099, '5300.00', 130, 25, 'MUNDOCOM', '2022-09-18 14:15:18', '2022-09-18 14:15:18', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `Id_rol` int(11) NOT NULL COMMENT 'Este campo almacena el identificador del rol',
  `nombre_rol` varchar(15) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Este campo almacena el nombre del rol',
  `descripcion_rol` text COLLATE utf8_spanish2_ci DEFAULT NULL COMMENT 'En este campo se describe las funciones, posibilidades y limitaciones del rol creado',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Este atributo almacena la fecha y hora de creación del rol',
  `updated_at` datetime DEFAULT current_timestamp() COMMENT 'Este atributo almacena la fecha y hora de actualización del rol',
  `deleted_at` datetime DEFAULT NULL COMMENT 'Este atributo almacena la fecha y hora de deshabilitación del rol'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`Id_rol`, `nombre_rol`, `descripcion_rol`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'admin', 'Este rol es de los administradores', '2022-09-18 14:15:18', '2022-09-18 14:15:18', NULL),
(2, 'vendedor', 'Este rol es de los vendedores', '2022-09-18 14:15:18', '2022-09-18 14:15:18', NULL),
(3, 'bodeguista', 'Este rol es de los bodeguistas', '2022-09-18 14:15:18', '2022-09-18 14:15:18', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `Id_usuario` varchar(15) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Este campo captura el Número de identifiación del usuario (puede ser Cedula de ciudadanía C.C, Cedula de extranjería C.E, Tarjeta de Identidad T.I)',
  `nombre_usuario` varchar(64) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Este atributo almacena el nombre del usuario',
  `email` varchar(64) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Este atributo almacena el correo electrónico del usuario',
  `celular` varchar(12) COLLATE utf8_spanish2_ci DEFAULT NULL COMMENT 'ste atributo almacena número de contacto celular del usuario',
  `direccion` varchar(32) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Este atributo almacena la dirección de residencia del usuario',
  `password` varchar(32) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Este atributo almacena la contraseña del usuario',
  `habilitado_usuario` char(1) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'En este campo se guardará si un usuario se encuentra habilitado o no para su uso',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Este atributo almacena la fecha y hora de creación del usuario',
  `updated_at` datetime DEFAULT current_timestamp() COMMENT 'Este atributo almacena la fecha y hora de actualización del usuario',
  `deleted_at` datetime DEFAULT NULL COMMENT 'Este atributo almacena la fecha y hora de deshabilitación del usuario',
  `Rol_id_rol` int(11) NOT NULL COMMENT 'Este campo relaciona el usuario con el rol que ocupa para sus labores diarias'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`Id_usuario`, `nombre_usuario`, `email`, `celular`, `direccion`, `password`, `habilitado_usuario`, `created_at`, `updated_at`, `deleted_at`, `Rol_id_rol`) VALUES
('10104527840', 'Michael Cuervo', 'michael.cuervo@remateaguila.com', '3202708000', 'Cra 88c #52- 35', 'Vendedor.123456', 'A', '2022-09-18 14:15:18', '2022-09-18 14:15:18', NULL, 2),
('1122449820', 'Camilo Robayo', 'camilo.robayo@cashinventory.com', '3054558512', 'Cll 22 sur # 30 -45', 'Admin.123456', 'A', '2022-09-18 14:15:18', '2022-09-18 14:15:18', NULL, 1),
('1182451235', 'Brayan Galeano', 'brayan.galeano@cashinventory.com', '3193574522', 'Cra 88f #35 sur-45', 'Admin.123456', 'A', '2022-09-18 14:15:18', '2022-09-18 14:15:18', NULL, 1),
('11934517530', 'Carol Rivera', 'carol.rivera@remateaguila.com', '3225456210', 'Cra 88c #52- 35', 'Vendedor.123456', 'A', '2022-09-18 14:15:18', '2022-09-18 14:15:18', NULL, 2),
('24155322', 'Johan Rubio', 'johan.rubio@cashinventory.com', '3004558978', 'Cra 40 sur #89-22', 'Admin.123456', 'A', '2022-09-18 14:15:18', '2022-09-18 14:15:18', NULL, 1),
('31252626', 'Andrey Barrera', 'andrey.barrera@remateaguila.com', '3015806337', 'Cra 88c #52- 35', 'Bodeguista.123456', 'A', '2022-09-18 14:15:18', '2022-09-18 14:15:18', NULL, 3),
('41308745', 'Vanessa Muñoz', 'vanessa.munoz@remateaguila.com', '3124527869', 'Cra 88c #52- 35', 'Vendedor.123456', 'A', '2022-09-18 14:15:18', '2022-09-18 14:15:18', NULL, 2),
('72451232', 'Jeisson Arias', 'jeisson.arias@remateaguila.com', '3002125411', 'Cra 88c #52- 35', 'Bodeguista.123456', 'A', '2022-09-18 14:15:18', '2022-09-18 14:15:18', NULL, 3),
('75422842', 'Andres Salazar', 'andres.salazar@remateaguila.com', '3194752668', 'Cra 88c #52- 35', 'Admin.123456', 'A', '2022-09-18 14:15:18', '2022-09-18 14:15:18', NULL, 1),
('79582325', 'Frank Barrios', 'frank.barrios@cashinventory.com', '3225854100', 'Cll 35 sur #23-89', 'Admin.123456', 'A', '2022-09-18 14:15:18', '2022-09-18 14:15:18', NULL, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autorizacion`
--
ALTER TABLE `autorizacion`
  ADD PRIMARY KEY (`Id_autorizacion`),
  ADD KEY `fk_Autorizacion_usuarios1_idx` (`Solicitante_id_usuario`);

--
-- Indices de la tabla `detallefactura`
--
ALTER TABLE `detallefactura`
  ADD PRIMARY KEY (`Producto_id_producto`,`Factura_id_factura`),
  ADD KEY `fk_Productos_has_Factura_Factura1_idx` (`Factura_id_factura`),
  ADD KEY `fk_Productos_has_Factura_Productos1_idx` (`Producto_id_producto`);

--
-- Indices de la tabla `detallemovimiento`
--
ALTER TABLE `detallemovimiento`
  ADD PRIMARY KEY (`Movimiento_id_movimiento`,`Producto_id_producto`),
  ADD KEY `fk_Movimiento_has_Productos_Productos1_idx` (`Producto_id_producto`),
  ADD KEY `fk_Movimiento_has_Productos_Movimiento1_idx` (`Movimiento_id_movimiento`),
  ADD KEY `fk_Movimiento_has_Productos_Autorizacion1_idx` (`Autorizacion_id_autorizacion`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`Id_factura`),
  ADD KEY `fk_Factura_usuarios1_idx` (`Vendedor_id_usuario`);

--
-- Indices de la tabla `movimiento`
--
ALTER TABLE `movimiento`
  ADD PRIMARY KEY (`Id_movimiento`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`Id_producto`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`Id_rol`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Id_usuario`),
  ADD KEY `fk_usuarios_Rol_idx` (`Rol_id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autorizacion`
--
ALTER TABLE `autorizacion`
  MODIFY `Id_autorizacion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'En este campo se almacenará el identificador de la autorización', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `Id_factura` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Este campo almacenará el identificador de la factura', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `movimiento`
--
ALTER TABLE `movimiento`
  MODIFY `Id_movimiento` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Este campo almacenará el identificador del movimiento a realizar', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `Id_producto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'En este campo se almacenará el identificador del producto', AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `Id_rol` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Este campo almacena el identificador del rol', AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `autorizacion`
--
ALTER TABLE `autorizacion`
  ADD CONSTRAINT `fk_Autorizacion_usuarios1` FOREIGN KEY (`Solicitante_id_usuario`) REFERENCES `usuario` (`Id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detallefactura`
--
ALTER TABLE `detallefactura`
  ADD CONSTRAINT `fk_Productos_has_Factura_Factura1` FOREIGN KEY (`Factura_id_factura`) REFERENCES `factura` (`Id_factura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Productos_has_Factura_Productos1` FOREIGN KEY (`Producto_id_producto`) REFERENCES `producto` (`Id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detallemovimiento`
--
ALTER TABLE `detallemovimiento`
  ADD CONSTRAINT `fk_Movimiento_has_Productos_Autorizacion1` FOREIGN KEY (`Autorizacion_id_autorizacion`) REFERENCES `autorizacion` (`Id_autorizacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Movimiento_has_Productos_Movimiento1` FOREIGN KEY (`Movimiento_id_movimiento`) REFERENCES `movimiento` (`Id_movimiento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Movimiento_has_Productos_Productos1` FOREIGN KEY (`Producto_id_producto`) REFERENCES `producto` (`Id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `fk_Factura_usuarios1` FOREIGN KEY (`Vendedor_id_usuario`) REFERENCES `usuario` (`Id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuarios_Rol` FOREIGN KEY (`Rol_id_rol`) REFERENCES `rol` (`Id_rol`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
