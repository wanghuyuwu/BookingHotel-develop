-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 30, 2024 at 03:28 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `booking-hotel-db`
--

-- --------------------------------------------------------

--
-- Table structure for table `avatars`
--

CREATE TABLE `avatars` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extension` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `hotel_id` bigint UNSIGNED NOT NULL,
  `num_people` int NOT NULL,
  `total_cost` int NOT NULL,
  `check_in` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `check_out` timestamp NULL DEFAULT NULL,
  `accepted` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `hotel_id`, `num_people`, `total_cost`, `check_in`, `check_out`, `accepted`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 1, 5, 200, '2023-10-27 01:29:00', '2023-10-29 01:29:00', '2', '2023-10-26 18:30:00', '2024-05-20 08:22:50', '2024-05-20 08:22:50'),
(2, 2, 2, 10, 200, '2023-10-27 01:32:00', '2023-10-29 01:32:00', '2', '2023-10-26 18:32:33', '2024-05-07 01:18:04', '2024-05-07 01:18:04'),
(3, 2, 2, 10, 100, '2024-05-21 14:52:00', '2024-05-22 14:52:00', '1', '2024-05-20 07:52:50', '2024-05-20 07:52:50', NULL),
(4, 2, 3, 2, 200, '2024-05-21 15:35:00', '2024-05-23 15:35:00', '1', '2024-05-20 08:35:56', '2024-05-20 08:35:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `evaluations`
--

CREATE TABLE `evaluations` (
  `id` bigint UNSIGNED NOT NULL,
  `hotel_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `point` int NOT NULL DEFAULT '0',
  `feedback` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `evaluations`
--

INSERT INTO `evaluations` (`id`, `hotel_id`, `user_id`, `point`, `feedback`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 5, 'Đầy đủ tiện nghi', '2023-10-26 11:50:24', '2023-10-26 11:50:53'),
(2, 3, 2, 10, 'không gian đẹp, thoáng mát', '2023-10-26 11:51:24', '2023-10-26 11:51:24'),
(3, 2, 2, 5, 'Chỗ ở sạch sẽ, dịch vụ tốt', '2023-10-26 11:53:12', '2023-10-26 11:53:12');

-- --------------------------------------------------------

--
-- Table structure for table `hotels`
--

CREATE TABLE `hotels` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `check_in_date` date NOT NULL,
  `price` int NOT NULL,
  `num_guest` int NOT NULL,
  `image1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `owner_id` bigint UNSIGNED DEFAULT NULL,
  `admin_accepted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hotels`
--

INSERT INTO `hotels` (`id`, `name`, `city`, `country`, `description`, `check_in_date`, `price`, `num_guest`, `image1`, `image2`, `image3`, `created_at`, `updated_at`, `deleted_at`, `owner_id`, `admin_accepted`) VALUES
(1, 'Sin Suoi Ho Bungalow và Homestay', 'Lai Châu', 'Việt Nam', 'Nơi ở trong một nhà siêu nhỏ.\r\nChúng tôi đang làm du lịch cộng đồng, chúng tôi có \r\nnhiều hoạt động trong làng như: tham quan thác nước, \r\nkhám phá làng Sin Suối Hồ, ngắm sân thượng, vườn đào, vườn hoa lan….', '2023-10-26', 100, 5, 'uploads/images/hotels/sinsuoihobungalowvàhomestay1.png', 'uploads/images/hotels/sinsuoihobungalowvàhomestay2.png', 'uploads/images/hotels/sinsuoihobungalowvàhomestay3.png', '2023-10-25 10:03:53', '2024-05-20 08:22:50', NULL, 5, 1),
(2, 'Da Lat Resort', 'Đà Lạt', 'Việt Nam', 'Khu nghỉ dưỡng ấm cúng nghỉ ngơi giữa thiên nhiên\r\nVới cánh đồng hoa và bầu không khí tự nhiên tuyệt đẹp,\r\nnó có những cánh đồng hoa đáng yêu và bầu không khí tuyệt đẹp.', '2023-10-25', 100, 10, 'uploads/images/hotels/dalatresort1.png', 'uploads/images/hotels/dalatresort2.png', 'uploads/images/hotels/dalatresort3.png', '2023-10-25 10:11:29', '2024-05-20 07:52:50', '2024-05-20 07:52:50', 5, 1),
(3, 'Tiny House', 'Lạng Sơn', 'Việt Nam', 'Trong khi ngôi nhà được trang bị để đón tiếp 5 người, chúng tôi nghĩ rằng kích thước hoàn hảo là 2-4 người. Chúng tôi rất vui được đón tiếp cả 5 người, nhưng lưu ý rằng nó sẽ ấm cúng hơn một chút.', '2023-10-25', 100, 5, 'uploads/images/hotels/tinyhouse1.png', 'uploads/images/hotels/tinyhouse2.png', 'uploads/images/hotels/tinyhouse3.png', '2023-10-25 10:14:23', '2024-05-20 08:35:56', '2024-05-20 08:35:56', 5, 1),
(4, 'San Giusto Abbey', 'Tuscania', 'Italy', 'Lâu đài. Được xây dựng vào năm 1146, \r\nSan Giusto là một tu viện cistercian thời trung cổ \r\nnằm trong một thung lũng hoang sơ tuyệt đẹp, \r\ncách thị trấn Tuscania 4 km.', '2023-10-26', 120, 10, 'uploads/images/hotels/sangiustoabbey1.png', 'uploads/images/hotels/sangiustoabbey2.png', 'uploads/images/hotels/sangiustoabbey3.png', '2023-10-25 10:20:27', '2023-10-25 10:48:50', NULL, 5, 1),
(5, 'Saint-Germain', 'Seigy', 'France', 'Nhà mái vòm.\r\n2 khách- 1 phòng ngủ \r\n1 giường-1 phòng tắm', '2023-10-26', 110, 2, 'uploads/images/hotels/bongbóng1.png', 'uploads/images/hotels/bongbóng2.png', 'uploads/images/hotels/bongbóng3.png', '2023-10-25 10:25:45', '2023-10-25 10:48:53', NULL, 5, 1),
(6, 'Chateau La Bainerie', 'Tiercé, Pays de la Loire', 'France', 'Phòng trong lâu đài\r\nBạn sẽ có phòng riêng trong một ngôi nhà và được sử dụng những khu vực chung.\r\nKhông gian riêng để làm việc\r\nMột khu vực chung có Wi-fi, phù hợp để làm việc.\r\nTự nhận phòng\r\nTự nhận phòng bằng khóa thông minh.', '2023-10-26', 150, 6, 'uploads/images/hotels/chateaulabainerie1.png', 'uploads/images/hotels/chateaulabainerie2.png', 'uploads/images/hotels/chateaulabainerie3.png', '2023-10-25 10:27:47', '2023-10-25 10:27:47', NULL, 5, 1),
(7, 'COCOON', 'Choye, Bourgogne-Franche-Comté', 'France', 'Cocoon là một môi trường sống có chân thấp, bán ngập tràn để tận hưởng sự thoải mái tự nhiên của quán tính nhiệt của sàn nhà; đó là một tổ ergonomic diễn ra ở nơi sảng khoái này. Nội thất phù hợp với một phong bì cong làm bằng vật liệu sinh học.', '2023-10-26', 105, 3, 'uploads/images/hotels/cocoon1.png', 'uploads/images/hotels/cocoon2.png', 'uploads/images/hotels/cocoon3.png', '2023-10-25 10:34:21', '2023-10-25 10:34:21', NULL, 5, 1),
(8, 'Arang Palace', 'Jeonju-si, North Jeolla Province', 'Hàn Quốc', 'Đây là một ngôi nhà truyền thống yên tĩnh. \r\nNgôi nhà chính, được xây dựng bằng gỗ và đất thân thiện với môi trường, \r\nbao gồm một phòng nhóm gác mái và phòng tình nhân ấm cúng, \r\nvà phòng phụ của cấu trúc nhiều tầng có cửa sổ trời.', '2023-10-25', 100, 5, 'uploads/images/hotels/arangpalace1.png', 'uploads/images/hotels/arangpalace2.png', 'uploads/images/hotels/arangpalace3.png', '2023-10-25 10:37:28', '2023-10-25 10:48:56', NULL, 5, 1),
(9, 'Sol Forest Villa', 'Anmok', 'Hàn Quốc', 'Đó là một ngôi nhà làm bằng tay,\r\nvì vậy mọi thứ ở đây đều được tạo thủ công,\r\nĐây là một không gian được tạo ra một cách cẩn thận để tránh sự bất tiện.', '2023-10-26', 125, 6, 'uploads/images/hotels/solforestvilla1.png', 'uploads/images/hotels/solforestvilla2.png', 'uploads/images/hotels/solforestvilla3.png', '2023-10-25 10:45:32', '2023-10-25 10:45:32', NULL, 5, 1),
(10, 'Hwangnidan-gil', 'Hanok', 'Hàn Quốc', '', '2023-10-26', 50, 2, 'uploads/images/hotels/hwangnidan-gil1.png', 'uploads/images/hotels/hwangnidan-gil2.png', 'uploads/images/hotels/hwangnidan-gil3.png', '2023-10-25 10:52:05', '2023-10-25 10:52:05', NULL, 5, 1),
(11, 'New Hanok Stay Baekseondang', 'Andong, North Gyeongsang Province', 'Hàn Quốc', 'Bạn có thể cảm nhận được tình cảm và sự chu đáo \r\ncủa hanok cũng như mục đích sống với gia đình trong một thời gian dài, \r\nkhông chỉ vì mục đích sống trong một thời gian dài, \r\nkhông chỉ cho công việc kinh doanh.', '2023-10-26', 79, 8, 'uploads/images/hotels/newhanokstaybaekseondang1.png', 'uploads/images/hotels/newhanokstaybaekseondang2.png', 'uploads/images/hotels/newhanokstaybaekseondang3.png', '2023-10-25 10:56:04', '2023-10-25 10:56:04', NULL, 5, 1),
(12, 'Aurora', 'Milano, Lombardia', 'Italy', 'Căn hộ ấm cúng, mọi thứ bạn cần.\r\nBạn có thể sử dụng tất cả các khu vực chung miễn là\r\nnó được duy trì liên quan đến những thứ của người khác. \r\nVui lòng cho chúng tôi biết nếu bạn có bất kỳ câu hỏi nào!', '2023-10-25', 85, 3, 'uploads/images/hotels/phòngđôitrongcănhộ1.png', 'uploads/images/hotels/phòngđôitrongcănhộ2.png', 'uploads/images/hotels/phòngđôitrongcănhộ3.png', '2023-10-25 11:04:13', '2023-10-25 11:04:13', NULL, 5, 1),
(13, 'Alba Resort', 'Loceri, Sardinia', 'Italy', 'Thư giãn với gia đình hoặc bạn bè của bạn\r\ntại địa điểm nghỉ dưỡng yên tĩnh ở vùng nông thôn này.\r\nỞ một địa điểm thuận tiện: đi bộ ngắn đến sông/hồ/biển\r\nvà đường mòn đi bộ đường dài.', '2023-10-25', 130, 12, 'uploads/images/hotels/albaresort1.png', 'uploads/images/hotels/albaresort2.png', 'uploads/images/hotels/albaresort3.png', '2023-10-25 11:07:14', '2023-10-25 11:07:14', NULL, 5, 1),
(14, 'Gombola tower house', 'Gombola, Emilia-Romagna', 'Italy', 'Tháp của chúng tôi là một nơi độc đáo được bao\r\nquanh bởi thiên nhiên của Modena Apennines. \r\nMột tòa nhà chưa bao giờ được sửa đổi và\r\nluôn có người ở kể từ thế kỷ 18.', '2023-10-25', 105, 5, 'uploads/images/hotels/gombolatowerhouse1.png', 'uploads/images/hotels/gombolatowerhouse2.png', 'uploads/images/hotels/gombolatowerhouse3.png', '2023-10-25 11:09:57', '2023-10-25 11:09:57', NULL, 5, 1),
(15, 'Cabane de la Semine', 'La Pesse, Bourgogne-Franche-Comté', 'France', 'Đắm chìm trong thiên nhiên có tầm nhìn ra \r\nthung lũng, âm thanh từ dòng suối ở tầng dưới.\r\nNhiều chuyến đi bộ và thác nước gần đó, \r\ncách trung tâm làng La Pesse 1 km.', '2023-10-25', 120, 8, 'uploads/images/hotels/cabanedelasemine1.png', 'uploads/images/hotels/cabanedelasemine2.png', 'uploads/images/hotels/cabanedelasemine3.png', '2023-10-25 11:12:18', '2023-10-25 11:12:18', NULL, 5, 1),
(16, 'Villa FLC Hạ Long', 'Hạ Long, Quảng Ninh', 'Việt Nam', 'Căn hộ sang trọng, hiện đại, có tầm nhìn tuyệt đẹp ra Vịnh Hạ Long và Biển Đông.\r\nCăn hộ nằm ở vị trí trung tâm của khu đô thị \r\nHạ Long Marina, cách bãi biển chỉ vài bước chân.', '2023-10-25', 205, 6, 'uploads/images/hotels/baysidecondotel1.png', 'uploads/images/hotels/baysidecondotel2.png', 'uploads/images/hotels/baysidecondotel3.png', '2023-10-25 11:18:28', '2023-10-25 11:18:28', NULL, 5, 1),
(17, 'Mia Resort Nha Trang', 'Nha Trang, Khánh Hòa', 'Việt Nam', 'Ngay sát bờ sông, đây là sự lựa chọn hoàn hảo cho cả nhóm và gia đình;\r\nvới 5 phòng ngủ tuyệt đẹp, phòng chờ rộng rãi,\r\nkhông gian sống phong phú và sang trọng trên 3 tầng kết nối.', '2023-10-24', 300, 10, 'uploads/images/hotels/miaresortnhatrang1.png', 'uploads/images/hotels/miaresortnhatrang2.png', 'uploads/images/hotels/miaresortnhatrang3.png', '2023-10-25 11:21:28', '2023-10-25 11:21:28', NULL, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hotel_favorites`
--

CREATE TABLE `hotel_favorites` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `hotel_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hotel_favorites`
--

INSERT INTO `hotel_favorites` (`id`, `user_id`, `hotel_id`, `created_at`, `updated_at`) VALUES
(1, 2, 1, '2024-01-14 09:14:45', '2024-01-14 09:14:45');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extension` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `user_id`, `name`, `path`, `extension`, `created_at`, `updated_at`) VALUES
(1, 5, 'hotel-vietnam-lai chau-sinsuoihobungalowvàhomestay1.png', 'uploads/images/hotels/sinsuoihobungalowvàhomestay1.png', 'png', '2023-10-25 10:03:53', '2023-10-25 10:03:53'),
(2, 5, 'hotel-vietnam-lai chau-sinsuoihobungalowvàhomestay2.png', 'uploads/images/hotels/sinsuoihobungalowvàhomestay2.png', 'png', '2023-10-25 10:03:53', '2023-10-25 10:03:53'),
(3, 5, 'hotel-vietnam-lai chau-sinsuoihobungalowvàhomestay3.png', 'uploads/images/hotels/sinsuoihobungalowvàhomestay3.png', 'png', '2023-10-25 10:03:53', '2023-10-25 10:03:53'),
(4, 5, 'hotel-vietnam-da lat-phuthairesort1.png', 'uploads/images/hotels/phuthairesort1.png', 'png', '2023-10-25 10:08:44', '2023-10-25 10:08:44'),
(6, 5, 'hotel-vietnam-da lat-phuthairesort3.png', 'uploads/images/hotels/phuthairesort3.png', 'png', '2023-10-25 10:08:44', '2023-10-25 10:08:44'),
(7, 5, 'hotel-vietnam-da lat-dalatresort1.png', 'uploads/images/hotels/dalatresort1.png', 'png', '2023-10-25 10:11:29', '2023-10-25 10:11:29'),
(8, 5, 'hotel-vietnam-da lat-dalatresort2.png', 'uploads/images/hotels/dalatresort2.png', 'png', '2023-10-25 10:11:29', '2023-10-25 10:11:29'),
(9, 5, 'hotel-vietnam-da lat-dalatresort3.png', 'uploads/images/hotels/dalatresort3.png', 'png', '2023-10-25 10:11:29', '2023-10-25 10:11:29'),
(10, 5, 'hotel-vietnam-lang son-tinyhouse1.png', 'uploads/images/hotels/tinyhouse1.png', 'png', '2023-10-25 10:14:00', '2023-10-25 10:14:00'),
(11, 5, 'hotel-vietnam-lang son-tinyhouse2.png', 'uploads/images/hotels/tinyhouse2.png', 'png', '2023-10-25 10:14:00', '2023-10-25 10:14:00'),
(12, 5, 'hotel-vietnam-lang son-tinyhouse3.png', 'uploads/images/hotels/tinyhouse3.png', 'png', '2023-10-25 10:14:00', '2023-10-25 10:14:00'),
(13, 5, 'hotel-italya-tuscania-sangiustoabbey1.png', 'uploads/images/hotels/sangiustoabbey1.png', 'png', '2023-10-25 10:17:49', '2023-10-25 10:17:49'),
(14, 5, 'hotel-italya-tuscania-sangiustoabbey2.png', 'uploads/images/hotels/sangiustoabbey2.png', 'png', '2023-10-25 10:17:49', '2023-10-25 10:17:49'),
(15, 5, 'hotel-italya-tuscania-sangiustoabbey3.png', 'uploads/images/hotels/sangiustoabbey3.png', 'png', '2023-10-25 10:17:49', '2023-10-25 10:17:49'),
(16, 5, 'hotel-italy-tuscania-sangiustoabbey1.png', 'uploads/images/hotels/sangiustoabbey1.png', 'png', '2023-10-25 10:20:27', '2023-10-25 10:20:27'),
(17, 5, 'hotel-italy-tuscania-sangiustoabbey2.png', 'uploads/images/hotels/sangiustoabbey2.png', 'png', '2023-10-25 10:20:27', '2023-10-25 10:20:27'),
(18, 5, 'hotel-italy-tuscania-sangiustoabbey3.png', 'uploads/images/hotels/sangiustoabbey3.png', 'png', '2023-10-25 10:20:27', '2023-10-25 10:20:27'),
(19, 5, 'hotel-france-seigy-bongbóng1.png', 'uploads/images/hotels/bongbóng1.png', 'png', '2023-10-25 10:25:45', '2023-10-25 10:25:45'),
(20, 5, 'hotel-france-seigy-bongbóng2.png', 'uploads/images/hotels/bongbóng2.png', 'png', '2023-10-25 10:25:45', '2023-10-25 10:25:45'),
(21, 5, 'hotel-france-seigy-bongbóng3.png', 'uploads/images/hotels/bongbóng3.png', 'png', '2023-10-25 10:25:45', '2023-10-25 10:25:45'),
(22, 5, 'hotel-france-tiercé, pays de la loire-chateaulabainerie1.png', 'uploads/images/hotels/chateaulabainerie1.png', 'png', '2023-10-25 10:27:47', '2023-10-25 10:27:47'),
(23, 5, 'hotel-france-tiercé, pays de la loire-chateaulabainerie2.png', 'uploads/images/hotels/chateaulabainerie2.png', 'png', '2023-10-25 10:27:47', '2023-10-25 10:27:47'),
(24, 5, 'hotel-france-tiercé, pays de la loire-chateaulabainerie3.png', 'uploads/images/hotels/chateaulabainerie3.png', 'png', '2023-10-25 10:27:47', '2023-10-25 10:27:47'),
(25, 5, 'hotel-france-choye, bourgogne-franche-comté-cocoon1.png', 'uploads/images/hotels/cocoon1.png', 'png', '2023-10-25 10:32:47', '2023-10-25 10:32:47'),
(26, 5, 'hotel-france-choye, bourgogne-franche-comté-cocoon2.png', 'uploads/images/hotels/cocoon2.png', 'png', '2023-10-25 10:32:47', '2023-10-25 10:32:47'),
(27, 5, 'hotel-france-choye, bourgogne-franche-comté-cocoon3.png', 'uploads/images/hotels/cocoon3.png', 'png', '2023-10-25 10:32:47', '2023-10-25 10:32:47'),
(28, 5, 'hotel-hàn quốc-jeonju-si, north jeolla province-arangpalace1.png', 'uploads/images/hotels/arangpalace1.png', 'png', '2023-10-25 10:36:50', '2023-10-25 10:36:50'),
(29, 5, 'hotel-hàn quốc-jeonju-si, north jeolla province-arangpalace2.png', 'uploads/images/hotels/arangpalace2.png', 'png', '2023-10-25 10:36:50', '2023-10-25 10:36:50'),
(30, 5, 'hotel-hàn quốc-jeonju-si, north jeolla province-arangpalace3.png', 'uploads/images/hotels/arangpalace3.png', 'png', '2023-10-25 10:36:50', '2023-10-25 10:36:50'),
(31, 5, 'hotel-hàn quốc-bãi biển anmok-solforestvilla1.png', 'uploads/images/hotels/solforestvilla1.png', 'png', '2023-10-25 10:45:32', '2023-10-25 10:45:32'),
(32, 5, 'hotel-hàn quốc-bãi biển anmok-solforestvilla2.png', 'uploads/images/hotels/solforestvilla2.png', 'png', '2023-10-25 10:45:32', '2023-10-25 10:45:32'),
(33, 5, 'hotel-hàn quốc-bãi biển anmok-solforestvilla3.png', 'uploads/images/hotels/solforestvilla3.png', 'png', '2023-10-25 10:45:32', '2023-10-25 10:45:32'),
(34, 5, 'hotel-hàn quốc-hanok-hwangnidan-gil1.png', 'uploads/images/hotels/hwangnidan-gil1.png', 'png', '2023-10-25 10:52:05', '2023-10-25 10:52:05'),
(35, 5, 'hotel-hàn quốc-hanok-hwangnidan-gil2.png', 'uploads/images/hotels/hwangnidan-gil2.png', 'png', '2023-10-25 10:52:05', '2023-10-25 10:52:05'),
(36, 5, 'hotel-hàn quốc-hanok-hwangnidan-gil3.png', 'uploads/images/hotels/hwangnidan-gil3.png', 'png', '2023-10-25 10:52:05', '2023-10-25 10:52:05'),
(37, 5, 'hotel-hàn quốc-andong, north gyeongsang province-newhanokstaybaekseondang1.png', 'uploads/images/hotels/newhanokstaybaekseondang1.png', 'png', '2023-10-25 10:56:04', '2023-10-25 10:56:04'),
(38, 5, 'hotel-hàn quốc-andong, north gyeongsang province-newhanokstaybaekseondang2.png', 'uploads/images/hotels/newhanokstaybaekseondang2.png', 'png', '2023-10-25 10:56:04', '2023-10-25 10:56:04'),
(39, 5, 'hotel-hàn quốc-andong, north gyeongsang province-newhanokstaybaekseondang3.png', 'uploads/images/hotels/newhanokstaybaekseondang3.png', 'png', '2023-10-25 10:56:04', '2023-10-25 10:56:04'),
(40, 5, 'hotel-italy-milano, lombardia-phòngđôitrongcănhộ1.png', 'uploads/images/hotels/phòngđôitrongcănhộ1.png', 'png', '2023-10-25 11:04:13', '2023-10-25 11:04:13'),
(41, 5, 'hotel-italy-milano, lombardia-phòngđôitrongcănhộ2.png', 'uploads/images/hotels/phòngđôitrongcănhộ2.png', 'png', '2023-10-25 11:04:13', '2023-10-25 11:04:13'),
(42, 5, 'hotel-italy-milano, lombardia-phòngđôitrongcănhộ3.png', 'uploads/images/hotels/phòngđôitrongcănhộ3.png', 'png', '2023-10-25 11:04:13', '2023-10-25 11:04:13'),
(43, 5, 'hotel-italy-loceri, sardinia-albaresort1.png', 'uploads/images/hotels/albaresort1.png', 'png', '2023-10-25 11:07:01', '2023-10-25 11:07:01'),
(44, 5, 'hotel-italy-loceri, sardinia-albaresort2.png', 'uploads/images/hotels/albaresort2.png', 'png', '2023-10-25 11:07:01', '2023-10-25 11:07:01'),
(45, 5, 'hotel-italy-loceri, sardinia-albaresort3.png', 'uploads/images/hotels/albaresort3.png', 'png', '2023-10-25 11:07:01', '2023-10-25 11:07:01'),
(46, 5, 'hotel-italy-gombola, emilia-romagna-gombolatowerhouse1.png', 'uploads/images/hotels/gombolatowerhouse1.png', 'png', '2023-10-25 11:08:59', '2023-10-25 11:08:59'),
(47, 5, 'hotel-italy-gombola, emilia-romagna-gombolatowerhouse2.png', 'uploads/images/hotels/gombolatowerhouse2.png', 'png', '2023-10-25 11:08:59', '2023-10-25 11:08:59'),
(48, 5, 'hotel-italy-gombola, emilia-romagna-gombolatowerhouse3.png', 'uploads/images/hotels/gombolatowerhouse3.png', 'png', '2023-10-25 11:08:59', '2023-10-25 11:08:59'),
(49, 5, 'hotel-france-la pesse, bourgogne-franche-comté-cabanedelasemine1.png', 'uploads/images/hotels/cabanedelasemine1.png', 'png', '2023-10-25 11:12:18', '2023-10-25 11:12:18'),
(50, 5, 'hotel-france-la pesse, bourgogne-franche-comté-cabanedelasemine2.png', 'uploads/images/hotels/cabanedelasemine2.png', 'png', '2023-10-25 11:12:18', '2023-10-25 11:12:18'),
(51, 5, 'hotel-france-la pesse, bourgogne-franche-comté-cabanedelasemine3.png', 'uploads/images/hotels/cabanedelasemine3.png', 'png', '2023-10-25 11:12:18', '2023-10-25 11:12:18'),
(52, 5, 'hotel-việt nam-hạ long, quảng ninh-baysidecondotel1.png', 'uploads/images/hotels/baysidecondotel1.png', 'png', '2023-10-25 11:18:28', '2023-10-25 11:18:28'),
(53, 5, 'hotel-việt nam-hạ long, quảng ninh-baysidecondotel2.png', 'uploads/images/hotels/baysidecondotel2.png', 'png', '2023-10-25 11:18:28', '2023-10-25 11:18:28'),
(54, 5, 'hotel-việt nam-hạ long, quảng ninh-baysidecondotel3.png', 'uploads/images/hotels/baysidecondotel3.png', 'png', '2023-10-25 11:18:28', '2023-10-25 11:18:28'),
(55, 5, 'hotel-việt nam-nha trang, khánh hòa-miaresortnhatrang1.png', 'uploads/images/hotels/miaresortnhatrang1.png', 'png', '2023-10-25 11:21:28', '2023-10-25 11:21:28'),
(56, 5, 'hotel-việt nam-nha trang, khánh hòa-miaresortnhatrang2.png', 'uploads/images/hotels/miaresortnhatrang2.png', 'png', '2023-10-25 11:21:28', '2023-10-25 11:21:28'),
(57, 5, 'hotel-việt nam-nha trang, khánh hòa-miaresortnhatrang3.png', 'uploads/images/hotels/miaresortnhatrang3.png', 'png', '2023-10-25 11:21:28', '2023-10-25 11:21:28'),
(58, 5, 'hotel-việt nam-hà nội-helloworld1.jpg', 'uploads/images/hotels/helloworld1.jpg', 'jpg', '2023-10-26 01:13:46', '2023-10-26 01:13:46'),
(59, 5, 'hotel-việt nam-hà nội-helloworld2.jpg', 'uploads/images/hotels/helloworld2.jpg', 'jpg', '2023-10-26 01:13:46', '2023-10-26 01:13:46'),
(60, 5, 'hotel-việt nam-hà nội-helloworld3.jpg', 'uploads/images/hotels/helloworld3.jpg', 'jpg', '2023-10-26 01:13:46', '2023-10-26 01:13:46'),
(61, 2, 'NguyễnVăn A', 'uploads/avatar', 'jpg', '2023-10-26 03:48:52', '2023-10-26 03:48:52'),
(62, 5, 'hotel-việt nam-hà nội-hoanggiang1.jpg', 'uploads/images/hotels/hoanggiang1.jpg', 'jpg', '2023-10-26 11:35:20', '2023-10-26 11:35:20'),
(63, 5, 'hotel-việt nam-hà nội-hoanggiang2.jpg', 'uploads/images/hotels/hoanggiang2.jpg', 'jpg', '2023-10-26 11:35:20', '2023-10-26 11:35:20'),
(64, 5, 'hotel-việt nam-hà nội-hoanggiang3.jpg', 'uploads/images/hotels/hoanggiang3.jpg', 'jpg', '2023-10-26 11:35:20', '2023-10-26 11:35:20'),
(65, 5, 'hotel-việt nam-hà nội-kháchsạndemo1.jpg', 'uploads/images/hotels/kháchsạndemo1.jpg', 'jpg', '2023-10-26 11:57:47', '2023-10-26 11:57:47'),
(66, 5, 'hotel-việt nam-hà nội-kháchsạndemo2.jpg', 'uploads/images/hotels/kháchsạndemo2.jpg', 'jpg', '2023-10-26 11:57:47', '2023-10-26 11:57:47'),
(67, 5, 'hotel-việt nam-hà nội-kháchsạndemo3.jpg', 'uploads/images/hotels/kháchsạndemo3.jpg', 'jpg', '2023-10-26 11:57:47', '2023-10-26 11:57:47'),
(69, 5, 'hotel-việt nam-hà nội-kháchsạn11.jpg', 'uploads/images/hotels/kháchsạn11.jpg', 'jpg', '2024-05-07 01:17:09', '2024-05-07 01:17:09'),
(70, 5, 'hotel-việt nam-hà nội-kháchsạn12.jpg', 'uploads/images/hotels/kháchsạn12.jpg', 'jpg', '2024-05-07 01:17:09', '2024-05-07 01:17:09'),
(71, 5, 'hotel-việt nam-hà nội-kháchsạn13.jpg', 'uploads/images/hotels/kháchsạn13.jpg', 'jpg', '2024-05-07 01:17:09', '2024-05-07 01:17:09');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(7, '2023_10_11_023057_change_price_column_to_integer_in_hotels', 2),
(16, '2014_10_12_100000_create_password_resets_table', 3),
(17, '2019_12_14_000001_create_personal_access_tokens_table', 3),
(18, '2023_10_04_062000_create_users_table', 3),
(19, '2023_10_04_062647_create_users_info_table', 3),
(20, '2023_10_05_073543_create_avatars_table', 3),
(21, '2023_10_08_071228_create_hotels_table', 3),
(22, '2023_10_11_152606_create_bookings_table', 3),
(23, '2023_10_14_022320_create_evaluations_table', 3),
(24, '2023_10_26_202818_create_hotel_favorites_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '1698250991',
  `updated_at` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '1698250991',
  `expired_at` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `username`, `password`, `email`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'admin', 'admin', '$2y$10$X.qrkJY8sV1IQb9iil9sGu/jfqmArtTcn7MJPedyUISg9ONtyIY6C', 'admin@gmail.com', '2023-10-25 09:23:16', '2023-10-26 07:36:57', NULL),
(2, 'user', 'user1', '$2y$10$bqOWXm39fQ7y8YTGhFk9Fud0.tAhMfxjQuIVj6FkrxRwP7aZT2HVy', 'hoangbaof992@gmail.com', '2023-10-25 09:23:16', '2023-10-26 11:55:10', NULL),
(3, 'user', 'user2', '$2y$10$X.qrkJY8sV1IQb9iil9sGu/jfqmArtTcn7MJPedyUISg9ONtyIY6C', 'user2@gmail.com', '2023-10-25 14:23:16', '2023-10-26 07:37:58', NULL),
(4, 'user', 'user3', '$2y$10$X.qrkJY8sV1IQb9iil9sGu/jfqmArtTcn7MJPedyUISg9ONtyIY6C', 'user3@gmail.com', '2023-10-25 16:33:16', '2023-10-26 07:38:06', NULL),
(5, 'owner', 'owner1', '$2y$10$RfXmrpG8pLPnsiMz73uAs.QsBkuOdh/2HGdsrIoNCYs/RBgkM7zQ.', 'owner1@gmail.com', '2023-10-25 09:58:51', '2024-05-07 01:18:32', NULL),
(6, 'owner', 'owner2', '$2y$10$1v1FuXs.lma2/.GkvU7YOedvA7AQtvYMoJmlqULw2vW1O24v7.Zue', 'owner@gmail.com', '2023-10-25 09:59:52', '2023-10-26 11:59:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_info`
--

CREATE TABLE `users_info` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users_info`
--

INSERT INTO `users_info` (`id`, `user_id`, `first_name`, `last_name`, `dob`, `address`, `phone_number`, `created_at`, `updated_at`) VALUES
(1, 2, 'Nguyễn', 'Văn A', '1978-10-12', 'Hà Nội', '0123456789', '2023-10-25 09:23:16', '2023-10-25 09:23:16'),
(2, 3, 'Nguyễn', 'Văn B', '1988-10-12', 'Ha Noi', '0123456789', '2023-10-25 10:23:16', '2023-10-25 10:23:16'),
(3, 4, 'Nguyễn', 'Văn C', '1988-11-16', 'Ha Noi', '0123456789', '2023-10-25 10:25:16', '2023-10-25 10:25:16'),
(4, 10, NULL, NULL, NULL, NULL, NULL, '2024-05-07 01:03:48', '2024-05-07 01:03:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `avatars`
--
ALTER TABLE `avatars`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `avatars_user_id_unique` (`user_id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_user_id_foreign` (`user_id`),
  ADD KEY `bookings_hotel_id_foreign` (`hotel_id`);

--
-- Indexes for table `evaluations`
--
ALTER TABLE `evaluations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `evaluations_hotel_id_foreign` (`hotel_id`),
  ADD KEY `evaluations_user_id_foreign` (`user_id`);

--
-- Indexes for table `hotels`
--
ALTER TABLE `hotels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hotels_owner_id_foreign` (`owner_id`);

--
-- Indexes for table `hotel_favorites`
--
ALTER TABLE `hotel_favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hotel_favorites_user_id_foreign` (`user_id`),
  ADD KEY `hotel_favorites_hotel_id_foreign` (`hotel_id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `images_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_info`
--
ALTER TABLE `users_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_info_user_id_unique` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `avatars`
--
ALTER TABLE `avatars`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `evaluations`
--
ALTER TABLE `evaluations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hotels`
--
ALTER TABLE `hotels`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hotel_favorites`
--
ALTER TABLE `hotel_favorites`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_info`
--
ALTER TABLE `users_info`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `avatars`
--
ALTER TABLE `avatars`
  ADD CONSTRAINT `avatars_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_hotel_id_foreign` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `evaluations`
--
ALTER TABLE `evaluations`
  ADD CONSTRAINT `evaluations_hotel_id_foreign` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `evaluations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hotels`
--
ALTER TABLE `hotels`
  ADD CONSTRAINT `hotels_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hotel_favorites`
--
ALTER TABLE `hotel_favorites`
  ADD CONSTRAINT `hotel_favorites_hotel_id_foreign` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hotel_favorites_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users_info`
--
ALTER TABLE `users_info`
  ADD CONSTRAINT `users_info_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
