INSERT INTO rol (nombre_rol, descripcion_rol) VALUES 
('admin', 'Este rol es de los administradores'),
('vendedor', 'Este rol es de los vendedores'),
('bodeguista', 'Este rol es de los bodeguistas');


INSERT INTO usuario (Id_usuario, nombre_usuario, email, celular, direccion, password, habilitado_usuario, Rol_id_rol) VALUES
(1182451235, 'Brayan Galeano', 'brayan.galeano@cashinventory.com', '3193574522', 'Cra 88f #35 sur-45', 'Admin.123456', 'A', 1),
(79582325, 'Frank Barrios', 'frank.barrios@cashinventory.com', '3225854100', 'Cll 35 sur #23-89', 'Admin.123456', 'A', 1),
(24155322, 'Johan Rubio', 'johan.rubio@cashinventory.com', '3004558978', 'Cra 40 sur #89-22', 'Admin.123456', 'A', 1),
(1122449820, 'Camilo Robayo', 'camilo.robayo@cashinventory.com', '3054558512', 'Cll 22 sur # 30 -45', 'Admin.123456', 'A', 1),
(75422842, 'Andres Salazar', 'andres.salazar@remateaguila.com', '3194752668', 'Cra 88c #52- 35', 'Admin.123456', 'A', 1),
(41308745, 'Vanessa Muñoz', 'vanessa.munoz@remateaguila.com', '3124527869', 'Cra 88c #52- 35', 'Vendedor.123456', 'A', 2),
(11934517530, 'Carol Rivera', 'carol.rivera@remateaguila.com', '3225456210', 'Cra 88c #52- 35', 'Vendedor.123456', 'A', 2),
(10104527840, 'Michael Cuervo', 'michael.cuervo@remateaguila.com', '3202708000', 'Cra 88c #52- 35', 'Vendedor.123456', 'A', 2),
(72451232, 'Jeisson Arias', 'jeisson.arias@remateaguila.com', '3002125411', 'Cra 88c #52- 35', 'Bodeguista.123456', 'A', 3),
(31252626, 'Andrey Barrera', 'andrey.barrera@remateaguila.com', '3015806337', 'Cra 88c #52- 35', 'Bodeguista.123456', 'A', 3);


INSERT INTO producto (nombre_producto, codigo_barras, precio_unitario, cantidad_disponible_b, cantidad_disponible_t, Proveedor) VALUES
('Block cuadriculado', 788492808274, 7000, 150, 80, 'MUNDOCOM'),
('Marcador borrable NEGRO', 788492808145, 5000, 300, 150, 'MUNDOCOM'),
('Micropunta negro', 788492804163, 6500, 120, 80, 'MUNDOCOM'),
('Cosedora', 788492803548, 12000, 90, 35, 'MUNDOCOM'),
('Pegante en barra PEGASTICK', 788492822301, 4500, 230, 105, 'MUNDOCOM'),
('Perforadora 2 huecos', 788492802458, 9800, 40, 22, 'MUNDOCOM'),
('Cinta transparente ANCHA', 788492808271, 6000, 92, 40, 'MUNDOCOM'),
('Resaltador', 788492808278, 3800, 350, 80, 'MUNDOCOM'),
('Gancho Legajador', 788492803030, 500, 780, 280, 'MUNDOCOM'),
('Resma papel 500 hojas A4', 788492807452, 22500, 30, 10, 'MUNDOCOM'),
('Lapiz Norma mirado 2', 788492803254, 800, 520, 340, 'MUNDOCOM'),
('Tijera Escolar punta roma', 788492801002, 3300, 100, 40, 'MUNDOCOM'),
('Corrector en lapiz', 788492800123, 2000, 220, 80, 'MUNDOCOM'),
('Sticky Notes x100 hojas', 788492800524, 2000, 120, 60, 'MUNDOCOM'),
('Esfero NEGRO BIC', 788492801085, 1100, 450, 120, 'MUNDOCOM'),
('Esfero ROJO BIC', 788492805032, 1100, 230, 80, 'MUNDOCOM'),
('Esfero AZUL BIC', 788492804020, 1100, 240, 95, 'MUNDOCOM'),
('Marcador Sharpie NEGRO', 788492801098, 4500, 230, 90, 'MUNDOCOM'),
('Marcador Sharpie ROJO', 788492809950, 4500, 120, 40, 'MUNDOCOM'),
('Borrador tablero', 788492800099, 5300, 130, 25, 'MUNDOCOM');


INSERT INTO factura (fecha_factura, valor_total_factura, ValorRecibidoFactura, cambio_factura, Vendedor_id_usuario) VALUES
('2022-09-16', 15300, 20000, 4700, '11934517530'),
('2022-09-15', 44800, 50000, 5200, '10104527840');


INSERT INTO detallefactura (Producto_id_producto, Factura_id_factura, cantidadProductoFactura, precio_unitario) VALUES
(1, 1, 1, 7000.00),
(2, 2, 1, 5000.00),
(4, 2, 1, 12000.00),
(8, 1, 1, 3800.00),
(10, 2, 1, 22500.00),
(18, 1, 1, 4500.00),
(20, 2, 1, 5300.00);


INSERT INTO autorizacion (nombre_autorizacion, aprobacion_autorizacion, Solicitante_id_usuario) VALUES
('Traslado esferos negros a tienda', 'P', '72451232'),
('Traslado resmas a tienda', 'A', '72451232'),
('Traslado Marcadores Sharpie a tienda', 'D', '31252626');


INSERT INTO movimiento (nombre_movimiento) VALUES 
('traslado esferos negros a tienda'),
('traslado resmas a tienda'),
('traslado Marcadores sharpie a tienda');

INSERT INTO detallemovimiento (Movimiento_id_movimiento, Producto_id_producto, cantidad_detalle_movimiento, valor_detalle_movimiento, fecha_detalle_movimiento, Autorizacion_id_autorizacion) VALUES 
(1, 15, 80, 88000, '2022-09-16',1),
(2, 10, 5, 112500, '2022-09-15',2),
(3, 18, 160, 720000, '2022-09-15',3);
