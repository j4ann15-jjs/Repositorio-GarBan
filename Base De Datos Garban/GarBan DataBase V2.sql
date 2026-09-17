-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-09-2026 a las 20:56:52
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `garban`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `ID_Carrito` int(11) NOT NULL COMMENT 'Identificador único (PK) del carrito de compras.',
  `Id_Cliente` varchar(20) NOT NULL COMMENT 'Llave foránea (FK) asociada al cliente dueño del carrito (ref: cliente.Id_Cliente).',
  `Estado` tinyint(3) DEFAULT NULL COMMENT 'Estado del carrito: 1 = Activo, 2 = Convertido a pedido, 3 = Abandonado, 0 = Cancelado.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `carrito`
--

INSERT INTO `carrito` (`ID_Carrito`, `Id_Cliente`, `Estado`) VALUES
(1, '1000000001', 1),
(2, '1000000002', 1),
(3, '1000000003', 1),
(4, '1000000004', 1),
(5, '1000000005', 1),
(6, '1000000006', 1),
(7, '1000000007', 1),
(8, '1000000008', 1),
(9, '1000000009', 1),
(10, '1000000010', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `Tipo_ID` char(4) DEFAULT NULL COMMENT 'Tipo de documento de identidad',
  `Id_Cliente` varchar(20) NOT NULL COMMENT 'Número de documento o cédula. Clave primaria (PK).',
  `Nombre` varchar(50) NOT NULL COMMENT 'Nombre(s) del cliente',
  `Apellido` varchar(50) DEFAULT NULL COMMENT 'Apellido(s) del cliente',
  `Correo` varchar(75) NOT NULL COMMENT 'Correo electrónico principal para notificaciones y autenticación.',
  `Telefono` varchar(25) NOT NULL COMMENT 'Número telefónico o de celular de contacto.',
  `Contrasena` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`Tipo_ID`, `Id_Cliente`, `Nombre`, `Apellido`, `Correo`, `Telefono`, `Contrasena`) VALUES
('CC', '1000000001', 'Juan', 'Pérez', 'juan.perez@gmail.com', '3001112233', ''),
('CC', '1000000002', 'María', 'Gómez', 'maria.gomez@gmail.com', '3012223344', ''),
('CC', '1000000003', 'Carlos', 'Rodríguez', 'carlos.rodriguez@gmail.com', '3023334455', ''),
('CC', '1000000004', 'Laura', 'Martínez', 'laura.martinez@gmail.com', '3034445566', ''),
('CC', '1000000005', 'Andrés', 'López', 'andres.lopez@gmail.com', '3045556677', ''),
('CC', '1000000006', 'Valentina', 'Torres', 'valentina.torres@gmail.com', '3056667788', ''),
('CC', '1000000007', 'Sebastián', 'Ramírez', 'sebastian.ramirez@gmail.com', '3067778899', ''),
('CC', '1000000008', 'Camila', 'Hernández', 'camila.hernandez@gmail.com', '3078889900', ''),
('CC', '1000000009', 'Daniel', 'Castro', 'daniel.castro@gmail.com', '3089990011', ''),
('CC', '1000000010', 'Sofía', 'Moreno', 'sofia.moreno@gmail.com', '3090001122', ''),
('CC', '1000312331', 'Mariana', 'Garcia', 'hgjhgadgayuwg@gmail.com', '3132454916', ''),
('CC', '1025535890', 'Sofia ', 'caceres', 'cacereesss@gmail.com', '3115546789', '$2y$10$7NFnt7ieQnxNV4hbyc'),
('TI', '123141234', 'David', 'Castillo', 'mamita123@gmail.com', '1234567890', ''),
('TI', '234242356', 'maria', 'Segura', 'Maria@gmail.com', '3115544122', '12345q'),
('CC', '53523246', 'asd', 'wads', 'hgjhgadgayuwg@gmail.com', '314257655', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descuento`
--

CREATE TABLE `descuento` (
  `Id_Descuento` int(11) NOT NULL COMMENT 'Identificador único (PK) del registro de descuento o promoción.',
  `PromocionAplicada` varchar(100) DEFAULT NULL COMMENT 'Nombre de la campaña, cupón o evento promocional (ej: ''Black Friday'').',
  `DescuentoPorcentaje` decimal(5,2) DEFAULT NULL COMMENT 'Porcentaje de descuento en valor numérico de 0.00 a 100.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `descuento`
--

INSERT INTO `descuento` (`Id_Descuento`, `PromocionAplicada`, `DescuentoPorcentaje`) VALUES
(1, 'Black Friday', 30.00),
(2, 'Oferta de Verano', 20.00),
(3, 'Descuento Especial GARBAN', 15.00),
(4, 'Liquidación de Temporada', 40.00),
(5, 'Promoción Fin de Semana', 10.00),
(6, 'Oferta en Accesorios', 25.00),
(7, 'Descuento Moda Hombre', 20.00),
(8, 'Descuento Moda Mujer', 15.00),
(9, 'Oferta Calzado', 25.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_carrito`
--

CREATE TABLE `detalle_carrito` (
  `idDetalleCarrito` int(11) NOT NULL COMMENT 'Identificador único autonumérico (PK) del renglón/ítem en el carrito.',
  `ID_Carrito` int(11) NOT NULL COMMENT 'Llave foránea (FK) referenciando al carrito contenedor (ref: carrito.ID_Carrito).',
  `ID_Producto` int(5) NOT NULL COMMENT 'Llave foránea (FK) del producto añadido (ref: producto.ID_Producto).',
  `cantidad` int(11) NOT NULL COMMENT 'Número de unidades seleccionadas del producto (valor entero mayor a 0).',
  `precioUnitario` decimal(10,2) NOT NULL COMMENT 'Precio por unidad del producto al momento de añadirlo al carrito.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_carrito`
--

INSERT INTO `detalle_carrito` (`idDetalleCarrito`, `ID_Carrito`, `ID_Producto`, `cantidad`, `precioUnitario`) VALUES
(1, 1, 1, 2, 65000.00),
(2, 1, 8, 1, 45000.00),
(3, 2, 2, 1, 120000.00),
(4, 2, 10, 1, 75000.00),
(5, 3, 3, 1, 180000.00),
(6, 3, 9, 1, 210000.00),
(7, 4, 4, 1, 135000.00),
(8, 4, 5, 1, 85000.00),
(9, 5, 6, 1, 110000.00),
(10, 5, 8, 2, 45000.00),
(11, 6, 7, 1, 95000.00),
(12, 6, 10, 1, 75000.00),
(13, 7, 1, 2, 65000.00),
(14, 7, 2, 1, 120000.00),
(15, 7, 8, 1, 45000.00),
(16, 8, 4, 1, 135000.00),
(17, 8, 7, 1, 95000.00),
(18, 9, 9, 1, 210000.00),
(19, 9, 6, 1, 110000.00),
(20, 10, 5, 1, 85000.00),
(21, 10, 10, 1, 75000.00),
(22, 10, 8, 1, 45000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `idDetallePedido` int(11) NOT NULL COMMENT 'Identificador único autonumérico (PK) del renglón o ítem del pedido.',
  `ID_Pedido` int(11) NOT NULL COMMENT 'Llave foránea (FK) que conecta con el encabezado del pedido (ref: pedido.ID_Pedido).',
  `ID_Producto` int(5) NOT NULL COMMENT 'Llave foránea (FK) del producto vendido (ref: producto.ID_Producto).',
  `cantidad` int(11) NOT NULL COMMENT 'Número de unidades compradas de este producto.',
  `precioUnitario` decimal(10,2) NOT NULL COMMENT 'Precio por unidad al momento exacto de concretar la compra (valor congelado para facturación).'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_pedido`
--

INSERT INTO `detalle_pedido` (`idDetallePedido`, `ID_Pedido`, `ID_Producto`, `cantidad`, `precioUnitario`) VALUES
(1, 1, 1, 2, 65000.00),
(2, 1, 8, 1, 45000.00),
(3, 2, 2, 1, 120000.00),
(4, 2, 10, 1, 75000.00),
(5, 3, 3, 1, 180000.00),
(6, 3, 9, 1, 210000.00),
(7, 4, 4, 1, 135000.00),
(8, 4, 5, 1, 85000.00),
(9, 5, 6, 1, 110000.00),
(10, 5, 8, 2, 45000.00),
(11, 6, 7, 1, 95000.00),
(12, 6, 10, 1, 75000.00),
(13, 7, 1, 2, 65000.00),
(14, 7, 2, 1, 120000.00),
(15, 7, 8, 1, 45000.00),
(16, 8, 4, 1, 135000.00),
(17, 8, 7, 1, 95000.00),
(18, 9, 9, 1, 210000.00),
(19, 9, 6, 1, 110000.00),
(20, 10, 5, 1, 85000.00),
(21, 10, 10, 1, 75000.00),
(22, 10, 8, 1, 45000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envio`
--

CREATE TABLE `envio` (
  `ID_Envio` int(11) NOT NULL COMMENT 'Identificador único autonumérico (PK) del registro de envío.',
  `ID_Pedido` int(11) DEFAULT NULL COMMENT 'Llave foránea (FK) asociada al pedido al que pertenece el envío (ref: pedido.ID_Pedido).',
  `DireccionEnvio` varchar(150) DEFAULT NULL COMMENT 'Dirección exacta de entrega del paquete (calle, carrera, apto/casa).',
  `Ciudad` varchar(30) DEFAULT NULL COMMENT 'Ciudad o municipio de destino para el despacho.',
  `NumeroGuia` varchar(30) DEFAULT NULL COMMENT 'Código o número de rastreo asignado por la empresa transportadora/mensajería.',
  `FechaDespacho` datetime DEFAULT NULL COMMENT 'Fecha y hora en que el paquete sale del almacén/bodega hacia la transportadora.',
  `FechaEnvio` datetime DEFAULT NULL COMMENT 'Fecha y hora estimada o confirmada en que el producto se entrega al cliente.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `envio`
--

INSERT INTO `envio` (`ID_Envio`, `ID_Pedido`, `DireccionEnvio`, `Ciudad`, `NumeroGuia`, `FechaDespacho`, `FechaEnvio`) VALUES
(1, 1, 'Calle 10 # 15-20', 'Bogotá', 'GARB001', '2026-08-02 08:00:00', '2026-08-02 10:00:00'),
(2, 2, 'Carrera 45 # 20-15', 'Medellín', 'GARB002', '2026-08-02 09:00:00', '2026-08-02 11:00:00'),
(3, 3, 'Calle 30 # 40-12', 'Cali', 'GARB003', '2026-08-03 08:30:00', '2026-08-03 10:30:00'),
(4, 4, 'Carrera 7 # 80-25', 'Bogotá', 'GARB004', '2026-08-03 09:00:00', '2026-08-03 12:00:00'),
(5, 5, 'Calle 50 # 30-10', 'Barranquilla', 'GARB005', '2026-08-04 08:00:00', '2026-08-04 10:00:00'),
(6, 6, 'Carrera 33 # 15-40', 'Bucaramanga', 'GARB006', '2026-08-04 09:30:00', '2026-08-04 11:30:00'),
(7, 7, 'Calle 20 # 25-30', 'Pereira', 'GARB007', '2026-08-05 08:15:00', '2026-08-05 10:15:00'),
(8, 8, 'Carrera 12 # 18-22', 'Manizales', 'GARB008', '2026-08-05 09:15:00', '2026-08-05 11:15:00'),
(9, 9, 'Calle 70 # 50-18', 'Bogotá', 'GARB009', '2026-08-06 08:45:00', '2026-08-06 10:45:00'),
(10, 10, 'Carrera 60 # 35-16', 'Medellín', 'GARB010', '2026-08-06 09:45:00', '2026-08-06 11:45:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `ID_Estado` int(11) NOT NULL COMMENT 'Identificador único (PK) del catálogo de estados de pedido.\r\n',
  `Estado_Pedido` varchar(20) DEFAULT NULL COMMENT 'Nombre descriptivo del estado (ej: ''Pendiente'', ''Pagado'', ''Enviado'', ''Entregado'', ''Cancelado'').'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`ID_Estado`, `Estado_Pedido`) VALUES
(1, 'Pendiente'),
(2, 'Confirmado'),
(3, 'Preparando'),
(4, 'Empacado'),
(5, 'Enviado'),
(6, 'En tránsito'),
(7, 'Entregado'),
(8, 'Cancelado'),
(9, 'Devuelto'),
(10, 'Reembolsado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `ID_Pago` int(11) NOT NULL COMMENT 'Identificador único (PK) de la transacción monetaria o pago.',
  `Id_Pedido` int(11) NOT NULL COMMENT 'Llave foránea (FK) referenciando al pedido que se paga (ref: pedido.ID_Pedido).',
  `Metodo_Pago` varchar(25) DEFAULT NULL COMMENT 'Medio de pago utilizado (ej: ''Tarjetas'', ''PSE'', ''Nequi'', ''Efectivo'', ''Transferencia'').',
  `Monto` decimal(10,2) DEFAULT NULL COMMENT 'Valor total abonado o procesado en la transacción monetaria.',
  `Fecha_Pago` datetime DEFAULT NULL COMMENT 'Fecha y hora exacta en que la pasarela o sistema confirmó la transacción.',
  `Estado_Pago` varchar(10) DEFAULT NULL COMMENT 'Estado de la transacción (ej: ''Aprobado'', ''Pendiente'', ''Rechazado'', ''Reembolso'').'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`ID_Pago`, `Id_Pedido`, `Metodo_Pago`, `Monto`, `Fecha_Pago`, `Estado_Pago`) VALUES
(1, 1, 'Tarjeta', 175000.00, '2026-08-01 09:20:00', 'Aprobado'),
(2, 2, 'Nequi', 195000.00, '2026-08-01 10:35:00', 'Aprobado'),
(3, 3, 'Daviplata', 390000.00, '2026-08-02 11:50:00', 'Aprobado'),
(4, 4, 'Tarjeta', 220000.00, '2026-08-02 14:25:00', 'Aprobado'),
(5, 5, 'PSE', 200000.00, '2026-08-03 08:55:00', 'Aprobado'),
(6, 6, 'Nequi', 170000.00, '2026-08-03 16:15:00', 'Aprobado'),
(7, 7, 'Tarjeta', 295000.00, '2026-08-04 12:40:00', 'Aprobado'),
(8, 8, 'PSE', 230000.00, '2026-08-04 17:30:00', 'Aprobado'),
(9, 9, 'Tarjeta', 320000.00, '2026-08-05 13:45:00', 'Aprobado'),
(10, 10, 'Nequi', 205000.00, '2026-08-05 18:05:00', 'Aprobado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `ID_Pedido` int(11) NOT NULL COMMENT 'Identificador único (PK) de la orden o pedido de compra.',
  `id_Cliente` varchar(20) DEFAULT NULL COMMENT 'Llave foránea (FK) que identifica al cliente comprador (ref: cliente.Id_Cliente).',
  `Id_Estado` int(11) NOT NULL COMMENT 'Llave foránea (FK) del estado actual de la orden (ref: estado.ID_Estado).',
  `Fecha_Pedido` datetime DEFAULT NULL COMMENT 'Fecha y hora exacta en la que se registró la orden en la plataforma.',
  `Total_Pedido` decimal(10,2) DEFAULT NULL COMMENT 'Monto total final de la compra (suma de ítems + envío - descuentos aplicados).'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`ID_Pedido`, `id_Cliente`, `Id_Estado`, `Fecha_Pedido`, `Total_Pedido`) VALUES
(1, '1000000001', 7, '2026-08-01 09:15:00', 175000.00),
(2, '1000000002', 5, '2026-08-01 10:30:00', 195000.00),
(3, '1000000003', 6, '2026-08-02 11:45:00', 390000.00),
(4, '1000000004', 7, '2026-08-02 14:20:00', 220000.00),
(5, '1000000005', 4, '2026-08-03 08:50:00', 200000.00),
(6, '1000000006', 3, '2026-08-03 16:10:00', 170000.00),
(7, '1000000007', 6, '2026-08-04 12:35:00', 295000.00),
(8, '1000000008', 5, '2026-08-04 17:25:00', 230000.00),
(9, '1000000009', 2, '2026-08-05 13:40:00', 320000.00),
(10, '1000000010', 1, '2026-08-05 18:00:00', 205000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `ID_Producto` int(5) NOT NULL COMMENT 'Identificador único (PK) del producto en el catálogo.',
  `Nombre_Producto` varchar(30) DEFAULT NULL COMMENT 'Nombre comercial del producto',
  `Categoria` varchar(30) DEFAULT NULL COMMENT 'Categoría a la que pertenece el producto para agrupación y filtros.',
  `Stock` int(11) DEFAULT NULL COMMENT 'Unidades disponibles en inventario',
  `Precio` decimal(10,2) DEFAULT NULL COMMENT 'Precio base o de lista del producto',
  `Id_Descuento` int(11) DEFAULT NULL COMMENT 'Llave foránea (FK) con el descuento vigente aplicado al producto (ref: descuento.Id_Descuento).'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`ID_Producto`, `Nombre_Producto`, `Categoria`, `Stock`, `Precio`, `Id_Descuento`) VALUES
(1, 'Camiseta Oversize', 'Hombre', 30, 65000.00, 1),
(2, 'Jean Clásico', 'Hombre', 20, 120000.00, 7),
(3, 'Chaqueta Denim', 'Hombre', 15, 180000.00, 4),
(4, 'Vestido Casual', 'Mujer', 20, 135000.00, 8),
(5, 'Blusa Elegante', 'Mujer', 25, 85000.00, 3),
(6, 'Pantalón Cargo', 'Hombre', 22, 110000.00, 7),
(7, 'Bolso Urbano', 'Accesorios', 18, 95000.00, 6),
(8, 'Gorra GARBAN', 'Accesorios', 35, 45000.00, 6),
(9, 'Tenis Urbanos', 'Calzado', 16, 210000.00, 9),
(10, 'Billetera de Cuero', 'Accesorios', 25, 75000.00, 6);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_producto`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_producto` (
`ID_Producto` int(5)
,`Nombre_Producto` varchar(30)
,`Categoria` varchar(30)
,`Stock` int(11)
,`Precio_COP` varchar(15)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_producto`
--
DROP TABLE IF EXISTS `vista_producto`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_producto`  AS SELECT `producto`.`ID_Producto` AS `ID_Producto`, `producto`.`Nombre_Producto` AS `Nombre_Producto`, `producto`.`Categoria` AS `Categoria`, `producto`.`Stock` AS `Stock`, concat('$ ',format(`producto`.`Precio`,0,'es_CO')) AS `Precio_COP` FROM `producto` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`ID_Carrito`),
  ADD UNIQUE KEY `Id_Cliente` (`Id_Cliente`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Id_Cliente`);

--
-- Indices de la tabla `descuento`
--
ALTER TABLE `descuento`
  ADD PRIMARY KEY (`Id_Descuento`);

--
-- Indices de la tabla `detalle_carrito`
--
ALTER TABLE `detalle_carrito`
  ADD PRIMARY KEY (`idDetalleCarrito`),
  ADD KEY `fk_detalle_carrito` (`ID_Carrito`),
  ADD KEY `ID_Producto` (`ID_Producto`);

--
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`idDetallePedido`),
  ADD KEY `fk_detalle_pedido` (`ID_Pedido`),
  ADD KEY `ID_Producto` (`ID_Producto`);

--
-- Indices de la tabla `envio`
--
ALTER TABLE `envio`
  ADD PRIMARY KEY (`ID_Envio`),
  ADD UNIQUE KEY `ID_Pedido` (`ID_Pedido`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`ID_Estado`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`ID_Pago`),
  ADD UNIQUE KEY `uk_id_pedido` (`Id_Pedido`),
  ADD KEY `Id_Pedido` (`Id_Pedido`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`ID_Pedido`),
  ADD KEY `Id_Estado` (`Id_Estado`),
  ADD KEY `id_Cliente` (`id_Cliente`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`ID_Producto`),
  ADD KEY `Id_Descuento` (`Id_Descuento`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `detalle_carrito`
--
ALTER TABLE `detalle_carrito`
  MODIFY `idDetalleCarrito` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador único autonumérico (PK) del renglón/ítem en el carrito.', AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `idDetallePedido` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador único autonumérico (PK) del renglón o ítem del pedido.', AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `envio`
--
ALTER TABLE `envio`
  MODIFY `ID_Envio` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador único autonumérico (PK) del registro de envío.', AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`Id_Cliente`) REFERENCES `cliente` (`Id_Cliente`);

--
-- Filtros para la tabla `detalle_carrito`
--
ALTER TABLE `detalle_carrito`
  ADD CONSTRAINT `detalle_carrito_ibfk_1` FOREIGN KEY (`ID_Producto`) REFERENCES `producto` (`ID_Producto`),
  ADD CONSTRAINT `fk_detalle_carrito` FOREIGN KEY (`ID_Carrito`) REFERENCES `carrito` (`ID_Carrito`);

--
-- Filtros para la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`ID_Producto`) REFERENCES `producto` (`ID_Producto`),
  ADD CONSTRAINT `fk_detalle_pedido` FOREIGN KEY (`ID_Pedido`) REFERENCES `pedido` (`ID_Pedido`);

--
-- Filtros para la tabla `envio`
--
ALTER TABLE `envio`
  ADD CONSTRAINT `envio_ibfk_1` FOREIGN KEY (`ID_Pedido`) REFERENCES `pedido` (`ID_Pedido`);

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`Id_Pedido`) REFERENCES `pedido` (`ID_Pedido`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`Id_Estado`) REFERENCES `estado` (`ID_Estado`),
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`id_Cliente`) REFERENCES `cliente` (`Id_Cliente`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`Id_Descuento`) REFERENCES `descuento` (`Id_Descuento`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
