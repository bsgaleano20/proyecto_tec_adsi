-- Seleccionar tabla--
select * from producto;

--usar base de datos---
use cashinventory;

------eliminar base de datos----
drop database cashinventory;

-------mostrar todas las tablas----
show tables;

------ mostrar columnas de una tabla------
SHOW COLUMNS FROM producto;

-------insertar una columna en una tabla-------
alter table usuario add edad date;

--------eliminar una columna en una tabla-----
alter table usuario drop edad;

--------muestra la creacion de la tabla----
show create table factura;

------crear llave primaria-----
ALTER TABLE USUARIO ADD PRIMARY KEY (id_usuario);

--------eliminar llave primaria--------
ALTER TABLE USUARIO DROP PRIMARY KEY;

-------eliminar tabla-----
drop table usuario;

---------renombrar tabla------
RENAME TABLE USUARIO TO PERSONAS;

--------union all------
SELECT * FROM factura UNION ALL
SELECT * FROM detallefactura;

---------especificas-----------
SELECT nombre_producto,precio-unitario FROM producto;

---------con criterios-------
SELECT precio_unitario FROM producto
WHERE precio_unitario = 2000;

-------con operador logico--------

SELECT precio_unitario FROM producto 
WHERE cantidad_disponible_b <=100 OR precio_unitario >= 1500;

---------operadores de comparacion-------
SELECT * FROM PRODUCTO WHERE precio_unitario < 2000;

----------------lista in-------------------
SELECT * FROM PRODUCTO 
WHERE cantidad_disponible_t IN (80);



----------INNER JOIN-------------------------------------------------------------------------------------------------------------------------------------------------------

/*USUARIO - ROL*/
select Usuario.Id_Usuario, Usuario.nombre_usuario, Rol.nombre_rol, Rol.descripcion_rol 
from usuario inner join rol on usuario.Rol_id_rol=Rol.Id_rol;

/*FACTURA - DETALLE FACTURA - PRODUCTO*/
select  producto.nombre_producto, producto.precio_unitario, detallefactura.cantidadProductoFactura,factura.id_factura, factura.fecha_factura, factura.valor_total_factura 
from detallefactura inner join producto on detallefactura.Producto_id_producto=producto.id_producto 
inner join factura on detallefactura.Factura_id_factura= factura.id_factura; 

/*USUARIO - AUTORIZACION - DETALLE MOVIMIENTO - MOVIMIENTO*/
select usuario.nombre_usuario, autorizacion.aprobacion_autorizacion, 
detallemovimiento.cantidad_detalle_movimiento, detallemovimiento.fecha_detalle_movimiento, movimiento.nombre_movimiento
from usuario inner join autorizacion on autorizacion.solicitante_id_usuario=usuario.id_usuario
inner join detallemovimiento on detallemovimiento.Autorizacion_id_autorizacion=autorizacion.id_autorizacion
inner join movimiento on detallemovimiento.Movimiento_id_movimiento=movimiento.id_movimiento;

/*MOVIMIENTOS AUTORIZADOS*/
select usuario.nombre_usuario, autorizacion.aprobacion_autorizacion, Rol.nombre_rol,
detallemovimiento.cantidad_detalle_movimiento, detallemovimiento.fecha_detalle_movimiento, movimiento.nombre_movimiento
from usuario inner join autorizacion on autorizacion.solicitante_id_usuario=usuario.id_usuario
inner join rol on usuario.Rol_id_rol=Rol.Id_rol
inner join detallemovimiento on detallemovimiento.Autorizacion_id_autorizacion=autorizacion.id_autorizacion
inner join movimiento on detallemovimiento.Movimiento_id_movimiento=movimiento.id_movimiento
where Autorizacion.aprobacion_autorizacion = "A";