-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-08-2023 a las 05:56:29
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `negocio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `Idcategoria` int(11) NOT NULL,
  `Nombrecategoria` varchar(250) NOT NULL,
  `Descripcion` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`Idcategoria`, `Nombrecategoria`, `Descripcion`) VALUES
(1, 'Ropa y Accesorios:', 'Estilo es usar lo que te hace sentir bien'),
(2, 'Bebibas', 'ingerir y absorber alimentos de buena calidad en cantidad suficiente para asegurar su crecimiento, el mantenimiento de sus tejidos y la energia indispensable para su buen funcionamiento'),
(3, 'Snacks y Dulces', 'Esto nos ayuda a llegar a la hora de las comidas principales y sirve de complemento de energia para compensar los esfuerzos fisicos, complemento a las dietas'),
(4, 'Herramienta', 'objeto elaborado que sirve como extension del cuerpo de quien lo usa, para permitir o facilitar una tarea mecanica que sin ella no se podria realizar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleventa`
--

CREATE TABLE `detalleventa` (
  `Iddetalleventa` int(11) NOT NULL,
  `Idventa` int(11) NOT NULL,
  `Idproducto` int(11) NOT NULL,
  `Preciounitario` decimal(10,2) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Descuento` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalleventa`
--

INSERT INTO `detalleventa` (`Iddetalleventa`, `Idventa`, `Idproducto`, `Preciounitario`, `Cantidad`, `Descuento`) VALUES
(1, 0, 1, 10.00, 2, 1.00),
(2, 1, 1, 10.00, 5, 2.00),
(3, 3, 3, 40.00, 5, 3.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `Idempleado` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Dni` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`Idempleado`, `Nombre`, `Apellido`, `Dni`) VALUES
(1, 'ana', 'lopez', '11111111'),
(2, 'juan', 'escobar', '22222222'),
(3, 'Ernesto', 'Pimentel', '3333334'),
(4, 'Norma Esther', 'Reynosa Pachuca', '4545455');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `Idproducto` int(11) NOT NULL,
  `Nombreproducto` varchar(100) NOT NULL,
  `Idproveedor` int(11) NOT NULL,
  `Idcategoria` int(11) NOT NULL,
  `Preciounitario` decimal(10,2) NOT NULL,
  `Unidadesstock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`Idproducto`, `Nombreproducto`, `Idproveedor`, `Idcategoria`, `Preciounitario`, `Unidadesstock`) VALUES
(1, 'Pantalon Jean', 1, 1, 30.00, 50),
(2, 'Agua Mineral', 2, 2, 2.50, 50),
(3, 'Papas Lays', 3, 3, 3.00, 100),
(4, 'Martillo', 4, 4, 28.00, 45);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `Idproveedor` int(11) NOT NULL,
  `Razonsocial` varchar(300) NOT NULL,
  `Representante` varchar(150) NOT NULL,
  `Direccion` varchar(150) NOT NULL,
  `Telefono` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`Idproveedor`, `Razonsocial`, `Representante`, `Direccion`, `Telefono`) VALUES
(1, '201010101010', 'ASOSACION DE ROPAS EN GENERAL S.A.C', 'alfonso ugarte 301', '111111111'),
(2, '202020202020', 'INS BEBIBAS SAC', 'Av.Unanue 505', '222222222'),
(3, '203030303030', 'GOLOSINAS S.A.C', 'Av.Brasil 888', '333333333'),
(4, '201346791220', 'HERRAMIENTAS GLOBAL ', 'JR.FRANCIA 987', '444444444');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `Idventa` int(11) NOT NULL,
  `Cliente` varchar(150) NOT NULL,
  `Idempleado` int(11) NOT NULL,
  `Fechaventa` varchar(100) NOT NULL,
  `Monto` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`Idventa`, `Cliente`, `Idempleado`, `Fechaventa`, `Monto`) VALUES
(0, 'Ernesto Lino1', 1, '2023-10-01', 10.00),
(1, 'Laura Sandoval', 2, '2023-10-01', 20.00),
(2, 'Teodoro Narvaez', 3, '2023-10-02', 50.00),
(3, 'Pablo Benites', 1, '2023-10-02', 20.00),
(4, 'Ana Maria Gonzalez', 2, '2023-10-05', 31.00),
(5, 'Cesar Murillo', 1, '2023-10-05', 11.00);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`Idcategoria`);

--
-- Indices de la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD PRIMARY KEY (`Iddetalleventa`),
  ADD KEY `Idproducto` (`Idproducto`),
  ADD KEY `Idventa` (`Idventa`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`Idempleado`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`Idproducto`),
  ADD KEY `Idproveedor` (`Idproveedor`),
  ADD KEY `Idcategoria` (`Idcategoria`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`Idproveedor`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`Idventa`),
  ADD KEY `Idempleado` (`Idempleado`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD CONSTRAINT `detalleventa_ibfk_1` FOREIGN KEY (`Idproducto`) REFERENCES `producto` (`Idproducto`),
  ADD CONSTRAINT `detalleventa_ibfk_2` FOREIGN KEY (`Idventa`) REFERENCES `venta` (`Idventa`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`Idproveedor`) REFERENCES `proveedor` (`Idproveedor`),
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`Idcategoria`) REFERENCES `categoria` (`Idcategoria`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`Idempleado`) REFERENCES `empleado` (`Idempleado`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
