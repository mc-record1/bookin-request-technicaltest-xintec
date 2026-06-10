-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-06-2026 a las 00:35:26
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
-- Base de datos: `bd_booking_requests`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bookingitem`
--

CREATE TABLE `bookingitem` (
  `id` bigint(20) NOT NULL,
  `sku` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(15,2) NOT NULL,
  `total_amount` decimal(15,2) NOT NULL,
  `bookingrequest_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `bookingitem`
--

INSERT INTO `bookingitem` (`id`, `sku`, `description`, `quantity`, `unit_price`, `total_amount`, `bookingrequest_id`) VALUES
(2, '2600209983', 'Producto de madera', 23, 0.15, 3.45, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bookingrequest`
--

CREATE TABLE `bookingrequest` (
  `id` bigint(20) NOT NULL,
  `booking_code` varchar(150) NOT NULL,
  `issue_date` date NOT NULL,
  `expiration_date` date NOT NULL,
  `currency` varchar(5) NOT NULL,
  `incoterm_code` varchar(20) NOT NULL,
  `freight_mode` varchar(20) NOT NULL,
  `origin_country` varchar(5) NOT NULL,
  `destination_country` varchar(5) NOT NULL,
  `fob_value` decimal(15,2) NOT NULL,
  `status` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `supplier_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `bookingrequest`
--

INSERT INTO `bookingrequest` (`id`, `booking_code`, `issue_date`, `expiration_date`, `currency`, `incoterm_code`, `freight_mode`, `origin_country`, `destination_country`, `fob_value`, `status`, `created_at`, `active`, `supplier_id`) VALUES
(2, 'BC00012344', '2024-06-03', '2026-03-02', 'USD', 'FOB', 'AIR', 'BRA', 'CHL', 99.00, 'DRAFT', '2026-06-08 01:46:31', 1, 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `supplier`
--

CREATE TABLE `supplier` (
  `id` bigint(20) NOT NULL,
  `name` varchar(200) NOT NULL,
  `tax_id` varchar(30) NOT NULL,
  `country` varchar(100) NOT NULL,
  `address` varchar(300) NOT NULL,
  `contact_email` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `supplier`
--

INSERT INTO `supplier` (`id`, `name`, `tax_id`, `country`, `address`, `contact_email`) VALUES
(16, 'ShenLong', '1123456', 'CHN', 'Changan 777, pekin', 'contact@shenlong.cn'),
(26, 'Caipirinha', '1223456', 'BRA', 'Avenida Paulista 888, Sao Paulo', 'contact@caipirinha.br'),
(27, 'Zorlu', '1233456', 'TUR', 'Istiklal 999, Estambul', 'contact@Zorlu.tr'),
(28, 'Toray', '1234456', 'JPN', 'Maronouchi 999, Tokio', 'contact@toray.jp');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bookingitem`
--
ALTER TABLE `bookingitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_bookingitem_bookingrequest` (`bookingrequest_id`);

--
-- Indices de la tabla `bookingrequest`
--
ALTER TABLE `bookingrequest`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKm7rsojxlyea3j71bupcehihf1` (`supplier_id`);

--
-- Indices de la tabla `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_supplier_taxid` (`tax_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bookingitem`
--
ALTER TABLE `bookingitem`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `bookingrequest`
--
ALTER TABLE `bookingrequest`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bookingitem`
--
ALTER TABLE `bookingitem`
  ADD CONSTRAINT `fk_bookingitem_bookingrequest` FOREIGN KEY (`bookingrequest_id`) REFERENCES `bookingrequest` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `bookingrequest`
--
ALTER TABLE `bookingrequest`
  ADD CONSTRAINT `FKm7rsojxlyea3j71bupcehihf1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
