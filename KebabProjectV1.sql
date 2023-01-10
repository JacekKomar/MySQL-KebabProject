-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Czas generowania: 10 Sty 2023, 17:02
-- Wersja serwera: 5.7.40
-- Wersja PHP: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `KebabProject`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `AllKebab`
--

CREATE TABLE `AllKebab` (
  `KebabID` int(11) NOT NULL,
  `KebabName` text COLLATE utf32_polish_ci NOT NULL,
  `Specification` text COLLATE utf32_polish_ci NOT NULL,
  `Price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_polish_ci;

--
-- Zrzut danych tabeli `AllKebab`
--

INSERT INTO `AllKebab` (`KebabID`, `KebabName`, `Specification`, `Price`) VALUES
(1, 'RolloKebab', 'kebabInATortilla', 18),
(2, 'KebabBox', 'KebabInABox', 22),
(3, 'PizzaKebab', 'PizzaWithKebabMeat', 28),
(4, 'BurgerKebab', 'DeliciousBurger', 40);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Ingredients`
--

CREATE TABLE `Ingredients` (
  `Id` int(11) NOT NULL,
  `AllKebabId` int(11) NOT NULL,
  `Meat` text COLLATE utf32_polish_ci NOT NULL,
  `Sauce` text COLLATE utf32_polish_ci NOT NULL,
  `Vegetables` text COLLATE utf32_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_polish_ci;

--
-- Zrzut danych tabeli `Ingredients`
--

INSERT INTO `Ingredients` (`Id`, `AllKebabId`, `Meat`, `Sauce`, `Vegetables`) VALUES
(1, 4, 'Tempeh', 'Spicy', 'Salad'),
(2, 2, 'ChickpeaCutlet', 'Medium', 'Tomato'),
(3, 3, 'Mutton', 'Soft', 'Salad'),
(4, 1, 'Chicken', 'Spicy', 'Salad');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `OrderKebab`
--

CREATE TABLE `OrderKebab` (
  `ID` int(11) NOT NULL,
  `FirstName` text COLLATE utf32_polish_ci NOT NULL,
  `LastName` text COLLATE utf32_polish_ci NOT NULL,
  `PhoneNumber` int(11) NOT NULL,
  `Adress` text COLLATE utf32_polish_ci NOT NULL,
  `AllKebabId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_polish_ci;

--
-- Zrzut danych tabeli `OrderKebab`
--

INSERT INTO `OrderKebab` (`ID`, `FirstName`, `LastName`, `PhoneNumber`, `Adress`, `AllKebabId`, `quantity`) VALUES
(1, 'Jacek', 'Komar', 777888999, 'Jasionka32', 1, 1),
(2, 'Arkadiusz', 'Pan', 123321425, 'Dziewule22', 3, 3),
(3, 'Tadeusz', 'Soplica', 333545908, 'Soplicowo61', 2, 2),
(4, 'Jan', 'Kowalski', 111212312, 'Zbuczyn11', 4, 5);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `AllKebab`
--
ALTER TABLE `AllKebab`
  ADD PRIMARY KEY (`KebabID`);

--
-- Indeksy dla tabeli `Ingredients`
--
ALTER TABLE `Ingredients`
  ADD PRIMARY KEY (`Id`);

--
-- Indeksy dla tabeli `OrderKebab`
--
ALTER TABLE `OrderKebab`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `AllKebabId` (`AllKebabId`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `AllKebab`
--
ALTER TABLE `AllKebab`
  MODIFY `KebabID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `Ingredients`
--
ALTER TABLE `Ingredients`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `OrderKebab`
--
ALTER TABLE `OrderKebab`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `OrderKebab`
--
ALTER TABLE `OrderKebab`
  ADD CONSTRAINT `OrderKebab_ibfk_1` FOREIGN KEY (`AllKebabId`) REFERENCES `AllKebab` (`KebabID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
