use cashinventory;

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