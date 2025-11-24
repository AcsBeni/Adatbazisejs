-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: localhost
-- Létrehozás ideje: 2025. Nov 24. 08:18
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `torpetarna`
--
CREATE DATABASE IF NOT EXISTS `torpetarna` DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE `torpetarna`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kihol`
--

CREATE TABLE `kihol` (
  `torpe_id` int(3) NOT NULL,
  `tarna_id` int(3) NOT NULL,
  `kitermelt_mennyiseg` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `kihol`
--

INSERT INTO `kihol` (`torpe_id`, `tarna_id`, `kitermelt_mennyiseg`) VALUES
(1, 5, 36),
(1, 10, 34),
(2, 1, 21),
(2, 10, 32),
(3, 1, 45),
(3, 2, 33),
(3, 5, 40),
(3, 10, 25),
(4, 5, 25),
(4, 6, 45),
(5, 4, 22),
(5, 5, 12),
(6, 3, 33),
(6, 6, 25),
(6, 9, 40),
(7, 7, 23),
(7, 10, 20),
(8, 8, 35),
(9, 3, 19),
(9, 6, 36),
(10, 1, 30),
(11, 3, 31),
(11, 4, 32),
(11, 8, 40),
(12, 1, 32),
(12, 8, 35),
(13, 3, 23),
(13, 4, 40),
(14, 4, 22),
(14, 7, 30),
(15, 3, 23),
(15, 10, 19),
(16, 7, 27),
(17, 4, 32),
(17, 8, 28),
(18, 1, 24),
(18, 3, 15),
(18, 8, 15),
(19, 2, 16),
(19, 7, 22),
(20, 2, 35),
(20, 3, 25),
(21, 1, 40),
(21, 9, 39),
(22, 2, 22),
(22, 4, 40),
(22, 10, 31),
(23, 5, 25),
(24, 1, 35),
(24, 6, 27),
(25, 1, 20),
(25, 7, 23),
(26, 1, 26),
(26, 2, 15),
(27, 1, 28),
(27, 6, 32),
(28, 1, 12),
(28, 5, 36),
(28, 10, 25),
(29, 3, 33),
(29, 10, 12),
(30, 4, 23),
(31, 1, 43),
(31, 3, 28);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kozetek`
--

CREATE TABLE `kozetek` (
  `id` int(3) NOT NULL,
  `nev` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `kozetek`
--

INSERT INTO `kozetek` (`id`, `nev`) VALUES
(1, 'arany'),
(2, 'ezüst'),
(3, 'réz'),
(4, 'vas');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tarnak`
--

CREATE TABLE `tarnak` (
  `id` int(3) NOT NULL,
  `nev` varchar(30) NOT NULL,
  `kozet_id` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `tarnak`
--

INSERT INTO `tarnak` (`id`, `nev`, `kozet_id`) VALUES
(1, 'Gir Lodur', 1),
(2, 'Tordirth', 4),
(3, 'Moldirth', 3),
(4, 'Gir Dorth', 4),
(5, 'Valthalla', 3),
(6, 'Midgarth', 2),
(7, 'Goldminer', 1),
(8, 'Aurumriver', 1),
(9, 'Argenteus', 2),
(10, 'Aquatinta', 3);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `torpek`
--

CREATE TABLE `torpek` (
  `id` int(3) NOT NULL,
  `nev` varchar(30) NOT NULL,
  `klan` varchar(30) NOT NULL,
  `nem` varchar(1) NOT NULL,
  `suly` int(3) NOT NULL,
  `magassag` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `torpek`
--

INSERT INTO `torpek` (`id`, `nev`, `klan`, `nem`, `suly`, `magassag`) VALUES
(1, 'Terrin Sák', 'Kova', 'F', 62, 130),
(2, 'Bal Eraffa', 'Vasököl', 'N', 45, 129),
(3, 'Sarsi Duri', 'Vasököl', 'F', 59, 141),
(4, 'Dorf Gein', 'Csille', 'F', 62, 138),
(5, 'Bombur Nori', 'Kova', 'N', 48, 132),
(6, 'Dorf Loopa', 'Csille', 'F', 63, 140),
(7, 'Trad Magraimn', 'Acél', 'F', 67, 138),
(8, 'Tardi Falgorran', 'Csille', 'F', 65, 140),
(9, 'Lok Dun', 'Acél', 'F', 70, 142),
(10, 'Sarrof Hro', 'Kova', 'F', 65, 137),
(11, 'Gor Morf', 'Csille', 'F', 58, 135),
(12, 'Heimal Morf', 'Vasököl', 'F', 61, 144),
(13, 'Odi Duri', 'Kova', 'F', 64, 145),
(14, 'Hardi Oggi', 'Vasököl', 'F', 64, 137),
(15, 'Bal Rian', 'Acél', 'N', 48, 134),
(16, 'Tor Edda', 'Vasököl', 'F', 61, 135),
(17, 'Forf Orsan', 'Csille', 'N', 50, 140),
(18, 'Krof Erag', 'Vasököl', 'N', 45, 145),
(19, 'Azul Luer', 'Vasököl', 'N', 43, 141),
(20, 'Forf Sak', 'Acél', 'F', 60, 146),
(21, 'Krof Glueggi', 'Kova', 'F', 62, 135),
(22, 'Tor Zian', 'Vasököl', 'N', 51, 138),
(23, 'Darrin Surroc', 'Acél', 'N', 48, 139),
(24, 'Nallid Grai', 'Vasököl', 'F', 58, 138),
(25, 'Lok Gran', 'Acél', 'F', 67, 140),
(26, 'Sarraain Sugran', 'Kova', 'F', 66, 138),
(27, 'Dorrin Dars', 'Csille', 'F', 68, 144),
(28, 'Nallid Fars', 'Vasököl', 'F', 71, 143),
(29, 'Dor Gerri', 'Kova', 'F', 69, 138),
(30, 'Darrin Rudga', 'Acél', 'F', 90, 140),
(31, 'Trad Morf', 'Vasököl', 'F', 69, 136),
(32, 'Törperős', 'Hupikék', 'F', 50, 120),
(34, 'Törpilla', 'Hupikék', 'N', 45, 113),
(35, 'Lusti', 'Hupikék', 'F', 60, 116);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `kihol`
--
ALTER TABLE `kihol`
  ADD PRIMARY KEY (`torpe_id`,`tarna_id`),
  ADD KEY `torpe_id` (`torpe_id`),
  ADD KEY `tarna_id` (`tarna_id`);

--
-- A tábla indexei `kozetek`
--
ALTER TABLE `kozetek`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `tarnak`
--
ALTER TABLE `tarnak`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kozet_id` (`kozet_id`);

--
-- A tábla indexei `torpek`
--
ALTER TABLE `torpek`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `kozetek`
--
ALTER TABLE `kozetek`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `tarnak`
--
ALTER TABLE `tarnak`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `torpek`
--
ALTER TABLE `torpek`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
