SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


CREATE TABLE `items_history` (
  `ih_id` int(11) NOT NULL,
  `ih_itw_id` int(11) NOT NULL,
  `ih_buy_price` int(11) NOT NULL,
  `ih_sell_price` int(11) NOT NULL,
  `ih_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `items_to_watch` (
  `itw_id` int(11) NOT NULL,
  `itw_name` varchar(255) NOT NULL,
  `itw_game_id` int(11) NOT NULL,
  `itw_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `items_history`
  ADD PRIMARY KEY (`ih_id`),
  ADD KEY `pk_ih_id` (`ih_id`) USING BTREE;

ALTER TABLE `items_to_watch`
  ADD PRIMARY KEY (`itw_id`,`itw_game_id`) USING BTREE;

ALTER TABLE `items_history`
  MODIFY `ih_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `items_to_watch`
  MODIFY `itw_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;