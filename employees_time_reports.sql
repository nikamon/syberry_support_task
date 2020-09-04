-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Сен 04 2020 г., 14:36
-- Версия сервера: 5.7.15
-- Версия PHP: 7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `employees_time_reports`
--

-- --------------------------------------------------------

--
-- Структура таблицы `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Employees Table';

--
-- Дамп данных таблицы `employees`
--

INSERT INTO `employees` (`id`, `name`) VALUES
(1, 'John'),
(2, 'Jane'),
(3, 'Kane'),
(4, 'Kavin'),
(5, 'Dmitry');

-- --------------------------------------------------------

--
-- Структура таблицы `time_reports`
--

CREATE TABLE `time_reports` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `hours` float NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Employees Time Reports';

--
-- Дамп данных таблицы `time_reports`
--

INSERT INTO `time_reports` (`id`, `employee_id`, `hours`, `date`) VALUES
(1, 1, 4.5, '2020-12-01'),
(2, 1, 7, '2020-12-02'),
(3, 2, 5.5, '2020-12-01'),
(4, 2, 6, '2020-12-02'),
(5, 1, 7, '2020-12-08'),
(6, 4, 8.3, '2020-12-07');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `time_reports`
--
ALTER TABLE `time_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `time_reports`
--
ALTER TABLE `time_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `time_reports`
--
ALTER TABLE `time_reports`
  ADD CONSTRAINT `time_reports_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
