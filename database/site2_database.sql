-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 14, 2022 at 04:27 AM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `site2`
--

-- --------------------------------------------------------

--
-- Table structure for table `address_book`
--

CREATE TABLE IF NOT EXISTS `address_book` (
  `address_book_id` int(11) NOT NULL,
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `entry_gender` char(1) NOT NULL DEFAULT '',
  `entry_company` varchar(64) DEFAULT NULL,
  `entry_firstname` varchar(32) NOT NULL DEFAULT '',
  `entry_lastname` varchar(32) NOT NULL DEFAULT '',
  `entry_street_address` varchar(64) NOT NULL DEFAULT '',
  `entry_suburb` varchar(32) DEFAULT NULL,
  `entry_postcode` varchar(10) NOT NULL DEFAULT '',
  `entry_city` varchar(32) NOT NULL DEFAULT '',
  `entry_state` varchar(32) DEFAULT NULL,
  `entry_country_id` int(11) NOT NULL DEFAULT '0',
  `entry_zone_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `address_format`
--

CREATE TABLE IF NOT EXISTS `address_format` (
  `address_format_id` int(11) NOT NULL,
  `address_format` varchar(128) NOT NULL DEFAULT '',
  `address_summary` varchar(48) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address_format`
--

INSERT INTO `address_format` (`address_format_id`, `address_format`, `address_summary`) VALUES
(1, '$firstname $lastname$cr$streets$cr$city, $postcode$cr$statecomma$country', '$city / $country'),
(2, '$firstname $lastname$cr$streets$cr$city, $state    $postcode$cr$country', '$city, $state / $country'),
(3, '$firstname $lastname$cr$streets$cr$city$cr$postcode - $statecomma$country', '$state / $country'),
(4, '$firstname $lastname$cr$streets$cr$city ($postcode)$cr$country', '$postcode / $country'),
(5, '$firstname $lastname$cr$streets$cr$postcode $city$cr$country', '$city / $country'),
(6, '$firstname $lastname$cr$streets$cr$city$cr$state$cr$postcode$cr$country', '$postcode / $country'),
(7, '$firstname $lastname$cr$streets$cr$city $state $postcode$cr$country', '$city $state / $country');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(32) NOT NULL DEFAULT '',
  `admin_email` varchar(96) NOT NULL DEFAULT '',
  `admin_profile` int(11) NOT NULL DEFAULT '0',
  `admin_pass` varchar(40) NOT NULL DEFAULT '',
  `prev_pass1` varchar(40) NOT NULL DEFAULT '',
  `prev_pass2` varchar(40) NOT NULL DEFAULT '',
  `prev_pass3` varchar(40) NOT NULL DEFAULT '',
  `pwd_last_change_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset_token` varchar(60) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_login_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '',
  `failed_logins` smallint(4) unsigned NOT NULL DEFAULT '0',
  `lockout_expires` int(11) NOT NULL DEFAULT '0',
  `last_failed_attempt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_failed_ip` varchar(15) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_name`, `admin_email`, `admin_profile`, `admin_pass`, `prev_pass1`, `prev_pass2`, `prev_pass3`, `pwd_last_change_date`, `reset_token`, `last_modified`, `last_login_date`, `last_login_ip`, `failed_logins`, `lockout_expires`, `last_failed_attempt`, `last_failed_ip`) VALUES
(1, 'admin', 'dev@site2.com', 1, '5cc1d8869bf32236df882102ed906faf:29', '7e0e3971eb437d40b134304c48f6f9af:1e', '', '', '2022-10-05 21:08:21', '', '2022-10-05 21:04:03', '2022-10-05 21:08:21', '127.0.0.1', 0, 0, '2022-10-05 21:07:23', '127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `admin_activity_log`
--

CREATE TABLE IF NOT EXISTS `admin_activity_log` (
  `log_id` bigint(15) NOT NULL,
  `access_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `admin_id` int(11) NOT NULL DEFAULT '0',
  `page_accessed` varchar(80) NOT NULL DEFAULT '',
  `page_parameters` text,
  `ip_address` varchar(20) NOT NULL DEFAULT '',
  `flagged` tinyint(4) NOT NULL DEFAULT '0',
  `attention` varchar(255) NOT NULL DEFAULT '',
  `gzpost` mediumblob NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin_activity_log`
--

INSERT INTO `admin_activity_log` (`log_id`, `access_date`, `admin_id`, `page_accessed`, `page_parameters`, `ip_address`, `flagged`, `attention`, `gzpost`) VALUES
(1, '2022-10-05 21:06:44', 0, 'Log found to be empty. Logging started.', '', '127.0.0.1', 0, '', ''),
(2, '2022-10-05 21:06:44', 0, 'alert_page.php ', '', '127.0.0.1', 0, '', ''),
(3, '2022-10-05 21:07:09', 0, 'login.php ', 'camefrom=index.php&', '127.0.0.1', 0, '', ''),
(4, '2022-10-05 21:07:23', 0, 'login.php admin', 'camefrom=index.php&', '127.0.0.1', 0, '', 0xab564a4cc9cdcc8bcf4bcc4d55b282709474948a4b9372334b80023ef9e96081c4e492ccfc3ca0404a7e9a81718ab941aa498aa5498a9181415a5272b28581a941b2a591b1715a8aa581522d00),
(5, '2022-10-05 21:08:21', 0, 'login.php ', '', '127.0.0.1', 0, '', 0xab564a4cc9cdcc8bcf4bcc4dd54d33304e3137483549b13449313230484b4a4eb630303548b63432364e4bb13450b282a856d2512a2e4dcacd2c010a0443183a4a89c92599f9794091a26282e6d40200),
(6, '2022-10-05 21:09:23', 1, 'template_select.php', '', '127.0.0.1', 0, '', ''),
(7, '2022-10-05 21:09:29', 1, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', ''),
(8, '2022-10-05 21:09:32', 1, 'template_select.php', 'page=1&tID=1&action=save&', '127.0.0.1', 0, '', 0xab56cac953b2522ac948cd4d35303052aa0500),
(9, '2022-10-05 21:09:33', 1, 'template_select.php', 'page=1&tID=1&action=edit&', '127.0.0.1', 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `admin_menus`
--

CREATE TABLE IF NOT EXISTS `admin_menus` (
  `menu_key` varchar(255) NOT NULL DEFAULT '',
  `language_key` varchar(255) NOT NULL DEFAULT '',
  `sort_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_menus`
--

INSERT INTO `admin_menus` (`menu_key`, `language_key`, `sort_order`) VALUES
('configuration', 'BOX_HEADING_CONFIGURATION', 1),
('catalog', 'BOX_HEADING_CATALOG', 2),
('modules', 'BOX_HEADING_MODULES', 3),
('customers', 'BOX_HEADING_CUSTOMERS', 4),
('taxes', 'BOX_HEADING_LOCATION_AND_TAXES', 5),
('localization', 'BOX_HEADING_LOCALIZATION', 6),
('reports', 'BOX_HEADING_REPORTS', 7),
('tools', 'BOX_HEADING_TOOLS', 8),
('gv', 'BOX_HEADING_GV_ADMIN', 9),
('access', 'BOX_HEADING_ADMIN_ACCESS', 10),
('extras', 'BOX_HEADING_EXTRAS', 11);

-- --------------------------------------------------------

--
-- Table structure for table `admin_pages`
--

CREATE TABLE IF NOT EXISTS `admin_pages` (
  `page_key` varchar(255) NOT NULL DEFAULT '',
  `language_key` varchar(255) NOT NULL DEFAULT '',
  `main_page` varchar(255) NOT NULL DEFAULT '',
  `page_params` varchar(255) NOT NULL DEFAULT '',
  `menu_key` varchar(255) NOT NULL DEFAULT '',
  `display_on_menu` char(1) NOT NULL DEFAULT 'N',
  `sort_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_pages`
--

INSERT INTO `admin_pages` (`page_key`, `language_key`, `main_page`, `page_params`, `menu_key`, `display_on_menu`, `sort_order`) VALUES
('configMyStore', 'BOX_CONFIGURATION_MY_STORE', 'FILENAME_CONFIGURATION', 'gID=1', 'configuration', 'Y', 1),
('configMinimumValues', 'BOX_CONFIGURATION_MINIMUM_VALUES', 'FILENAME_CONFIGURATION', 'gID=2', 'configuration', 'Y', 2),
('configMaximumValues', 'BOX_CONFIGURATION_MAXIMUM_VALUES', 'FILENAME_CONFIGURATION', 'gID=3', 'configuration', 'Y', 3),
('configImages', 'BOX_CONFIGURATION_IMAGES', 'FILENAME_CONFIGURATION', 'gID=4', 'configuration', 'Y', 4),
('configCustomerDetails', 'BOX_CONFIGURATION_CUSTOMER_DETAILS', 'FILENAME_CONFIGURATION', 'gID=5', 'configuration', 'Y', 5),
('configShipping', 'BOX_CONFIGURATION_SHIPPING_PACKAGING', 'FILENAME_CONFIGURATION', 'gID=7', 'configuration', 'Y', 6),
('configProductListing', 'BOX_CONFIGURATION_PRODUCT_LISTING', 'FILENAME_CONFIGURATION', 'gID=8', 'configuration', 'Y', 7),
('configStock', 'BOX_CONFIGURATION_STOCK', 'FILENAME_CONFIGURATION', 'gID=9', 'configuration', 'Y', 8),
('configLogging', 'BOX_CONFIGURATION_LOGGING', 'FILENAME_CONFIGURATION', 'gID=10', 'configuration', 'Y', 9),
('configEmail', 'BOX_CONFIGURATION_EMAIL_OPTIONS', 'FILENAME_CONFIGURATION', 'gID=12', 'configuration', 'Y', 10),
('configAttributes', 'BOX_CONFIGURATION_ATTRIBUTE_OPTIONS', 'FILENAME_CONFIGURATION', 'gID=13', 'configuration', 'Y', 11),
('configGzipCompression', 'BOX_CONFIGURATION_GZIP_COMPRESSION', 'FILENAME_CONFIGURATION', 'gID=14', 'configuration', 'Y', 12),
('configSessions', 'BOX_CONFIGURATION_SESSIONS', 'FILENAME_CONFIGURATION', 'gID=15', 'configuration', 'Y', 13),
('configRegulations', 'BOX_CONFIGURATION_REGULATIONS', 'FILENAME_CONFIGURATION', 'gID=11', 'configuration', 'Y', 14),
('configGvCoupons', 'BOX_CONFIGURATION_GV_COUPONS', 'FILENAME_CONFIGURATION', 'gID=16', 'configuration', 'Y', 15),
('configCreditCards', 'BOX_CONFIGURATION_CREDIT_CARDS', 'FILENAME_CONFIGURATION', 'gID=17', 'configuration', 'Y', 16),
('configProductInfo', 'BOX_CONFIGURATION_PRODUCT_INFO', 'FILENAME_CONFIGURATION', 'gID=18', 'configuration', 'Y', 17),
('configLayoutSettings', 'BOX_CONFIGURATION_LAYOUT_SETTINGS', 'FILENAME_CONFIGURATION', 'gID=19', 'configuration', 'Y', 18),
('configWebsiteMaintenance', 'BOX_CONFIGURATION_WEBSITE_MAINTENANCE', 'FILENAME_CONFIGURATION', 'gID=20', 'configuration', 'Y', 19),
('configNewListing', 'BOX_CONFIGURATION_NEW_LISTING', 'FILENAME_CONFIGURATION', 'gID=21', 'configuration', 'Y', 20),
('configFeaturedListing', 'BOX_CONFIGURATION_FEATURED_LISTING', 'FILENAME_CONFIGURATION', 'gID=22', 'configuration', 'Y', 21),
('configAllListing', 'BOX_CONFIGURATION_ALL_LISTING', 'FILENAME_CONFIGURATION', 'gID=23', 'configuration', 'Y', 22),
('configIndexListing', 'BOX_CONFIGURATION_INDEX_LISTING', 'FILENAME_CONFIGURATION', 'gID=24', 'configuration', 'Y', 23),
('configDefinePageStatus', 'BOX_CONFIGURATION_DEFINE_PAGE_STATUS', 'FILENAME_CONFIGURATION', 'gID=25', 'configuration', 'Y', 24),
('configEzPagesSettings', 'BOX_CONFIGURATION_EZPAGES_SETTINGS', 'FILENAME_CONFIGURATION', 'gID=30', 'configuration', 'Y', 25),
('categories', 'BOX_CATALOG_CATEGORIES_PRODUCTS', 'FILENAME_CATEGORIES', '', 'catalog', 'Y', 1),
('productTypes', 'BOX_CATALOG_PRODUCT_TYPES', 'FILENAME_PRODUCT_TYPES', '', 'catalog', 'Y', 2),
('priceManager', 'BOX_CATALOG_PRODUCTS_PRICE_MANAGER', 'FILENAME_PRODUCTS_PRICE_MANAGER', '', 'catalog', 'Y', 3),
('optionNames', 'BOX_CATALOG_CATEGORIES_OPTIONS_NAME_MANAGER', 'FILENAME_OPTIONS_NAME_MANAGER', '', 'catalog', 'Y', 4),
('optionValues', 'BOX_CATALOG_CATEGORIES_OPTIONS_VALUES_MANAGER', 'FILENAME_OPTIONS_VALUES_MANAGER', '', 'catalog', 'Y', 5),
('attributes', 'BOX_CATALOG_CATEGORIES_ATTRIBUTES_CONTROLLER', 'FILENAME_ATTRIBUTES_CONTROLLER', '', 'catalog', 'Y', 6),
('downloads', 'BOX_CATALOG_CATEGORIES_ATTRIBUTES_DOWNLOADS_MANAGER', 'FILENAME_DOWNLOADS_MANAGER', '', 'catalog', 'Y', 7),
('optionNameSorter', 'BOX_CATALOG_PRODUCT_OPTIONS_NAME', 'FILENAME_PRODUCTS_OPTIONS_NAME', '', 'catalog', 'Y', 8),
('optionValueSorter', 'BOX_CATALOG_PRODUCT_OPTIONS_VALUES', 'FILENAME_PRODUCTS_OPTIONS_VALUES', '', 'catalog', 'Y', 9),
('manufacturers', 'BOX_CATALOG_MANUFACTURERS', 'FILENAME_MANUFACTURERS', '', 'catalog', 'Y', 10),
('reviews', 'BOX_CATALOG_REVIEWS', 'FILENAME_REVIEWS', '', 'catalog', 'Y', 11),
('specials', 'BOX_CATALOG_SPECIALS', 'FILENAME_SPECIALS', '', 'catalog', 'Y', 12),
('featured', 'BOX_CATALOG_FEATURED', 'FILENAME_FEATURED', '', 'catalog', 'Y', 13),
('salemaker', 'BOX_CATALOG_SALEMAKER', 'FILENAME_SALEMAKER', '', 'catalog', 'Y', 14),
('productsExpected', 'BOX_CATALOG_PRODUCTS_EXPECTED', 'FILENAME_PRODUCTS_EXPECTED', '', 'catalog', 'Y', 15),
('product', 'BOX_CATALOG_PRODUCT', 'FILENAME_PRODUCT', '', 'catalog', 'N', 16),
('productsToCategories', 'BOX_CATALOG_PRODUCTS_TO_CATEGORIES', 'FILENAME_PRODUCTS_TO_CATEGORIES', '', 'catalog', 'N', 17),
('payment', 'BOX_MODULES_PAYMENT', 'FILENAME_MODULES', 'set=payment', 'modules', 'Y', 1),
('shipping', 'BOX_MODULES_SHIPPING', 'FILENAME_MODULES', 'set=shipping', 'modules', 'Y', 2),
('orderTotal', 'BOX_MODULES_ORDER_TOTAL', 'FILENAME_MODULES', 'set=ordertotal', 'modules', 'Y', 3),
('customers', 'BOX_CUSTOMERS_CUSTOMERS', 'FILENAME_CUSTOMERS', '', 'customers', 'Y', 1),
('orders', 'BOX_CUSTOMERS_ORDERS', 'FILENAME_ORDERS', '', 'customers', 'Y', 2),
('groupPricing', 'BOX_CUSTOMERS_GROUP_PRICING', 'FILENAME_GROUP_PRICING', '', 'customers', 'Y', 3),
('paypal', 'BOX_CUSTOMERS_PAYPAL', 'FILENAME_PAYPAL', '', 'customers', 'Y', 4),
('invoice', 'BOX_CUSTOMERS_INVOICE', 'FILENAME_ORDERS_INVOICE', '', 'customers', 'N', 5),
('packingslip', 'BOX_CUSTOMERS_PACKING_SLIP', 'FILENAME_ORDERS_PACKINGSLIP', '', 'customers', 'N', 6),
('linkpointReview', 'BOX_CUSTOMERS_LINKPOINT_REVIEW', 'FILENAME_LINKPOINT_REVIEW', '', 'customers', 'Y', 7),
('countries', 'BOX_TAXES_COUNTRIES', 'FILENAME_COUNTRIES', '', 'taxes', 'Y', 1),
('zones', 'BOX_TAXES_ZONES', 'FILENAME_ZONES', '', 'taxes', 'Y', 2),
('geoZones', 'BOX_TAXES_GEO_ZONES', 'FILENAME_GEO_ZONES', '', 'taxes', 'Y', 3),
('taxClasses', 'BOX_TAXES_TAX_CLASSES', 'FILENAME_TAX_CLASSES', '', 'taxes', 'Y', 4),
('taxRates', 'BOX_TAXES_TAX_RATES', 'FILENAME_TAX_RATES', '', 'taxes', 'Y', 5),
('currencies', 'BOX_LOCALIZATION_CURRENCIES', 'FILENAME_CURRENCIES', '', 'localization', 'Y', 1),
('languages', 'BOX_LOCALIZATION_LANGUAGES', 'FILENAME_LANGUAGES', '', 'localization', 'Y', 2),
('ordersStatus', 'BOX_LOCALIZATION_ORDERS_STATUS', 'FILENAME_ORDERS_STATUS', '', 'localization', 'Y', 3),
('reportCustomers', 'BOX_REPORTS_ORDERS_TOTAL', 'FILENAME_STATS_CUSTOMERS', '', 'reports', 'Y', 1),
('reportReferrals', 'BOX_REPORTS_CUSTOMERS_REFERRALS', 'FILENAME_STATS_CUSTOMERS_REFERRALS', '', 'reports', 'Y', 2),
('reportLowStock', 'BOX_REPORTS_PRODUCTS_LOWSTOCK', 'FILENAME_STATS_PRODUCTS_LOWSTOCK', '', 'reports', 'Y', 3),
('reportProductsSold', 'BOX_REPORTS_PRODUCTS_PURCHASED', 'FILENAME_STATS_PRODUCTS_PURCHASED', '', 'reports', 'Y', 4),
('reportProductsViewed', 'BOX_REPORTS_PRODUCTS_VIEWED', 'FILENAME_STATS_PRODUCTS_VIEWED', '', 'reports', 'Y', 5),
('templateSelect', 'BOX_TOOLS_TEMPLATE_SELECT', 'FILENAME_TEMPLATE_SELECT', '', 'tools', 'Y', 1),
('layoutController', 'BOX_TOOLS_LAYOUT_CONTROLLER', 'FILENAME_LAYOUT_CONTROLLER', '', 'tools', 'Y', 2),
('banners', 'BOX_TOOLS_BANNER_MANAGER', 'FILENAME_BANNER_MANAGER', '', 'tools', 'Y', 3),
('mail', 'BOX_TOOLS_MAIL', 'FILENAME_MAIL', '', 'tools', 'Y', 4),
('newsletters', 'BOX_TOOLS_NEWSLETTER_MANAGER', 'FILENAME_NEWSLETTERS', '', 'tools', 'Y', 5),
('server', 'BOX_TOOLS_SERVER_INFO', 'FILENAME_SERVER_INFO', '', 'tools', 'Y', 6),
('whosOnline', 'BOX_TOOLS_WHOS_ONLINE', 'FILENAME_WHOS_ONLINE', '', 'tools', 'Y', 7),
('storeManager', 'BOX_TOOLS_STORE_MANAGER', 'FILENAME_STORE_MANAGER', '', 'tools', 'Y', 9),
('developersToolKit', 'BOX_TOOLS_DEVELOPERS_TOOL_KIT', 'FILENAME_DEVELOPERS_TOOL_KIT', '', 'tools', 'Y', 10),
('ezpages', 'BOX_TOOLS_EZPAGES', 'FILENAME_EZPAGES_ADMIN', '', 'tools', 'Y', 11),
('definePagesEditor', 'BOX_TOOLS_DEFINE_PAGES_EDITOR', 'FILENAME_DEFINE_PAGES_EDITOR', '', 'tools', 'Y', 12),
('sqlPatch', 'BOX_TOOLS_SQLPATCH', 'FILENAME_SQLPATCH', '', 'tools', 'Y', 13),
('couponAdmin', 'BOX_COUPON_ADMIN', 'FILENAME_COUPON_ADMIN', '', 'gv', 'Y', 1),
('couponRestrict', 'BOX_COUPON_RESTRICT', 'FILENAME_COUPON_RESTRICT', '', 'gv', 'N', 1),
('gvQueue', 'BOX_GV_ADMIN_QUEUE', 'FILENAME_GV_QUEUE', '', 'gv', 'Y', 2),
('gvMail', 'BOX_GV_ADMIN_MAIL', 'FILENAME_GV_MAIL', '', 'gv', 'Y', 3),
('gvSent', 'BOX_GV_ADMIN_SENT', 'FILENAME_GV_SENT', '', 'gv', 'Y', 4),
('profiles', 'BOX_ADMIN_ACCESS_PROFILES', 'FILENAME_PROFILES', '', 'access', 'Y', 1),
('users', 'BOX_ADMIN_ACCESS_USERS', 'FILENAME_USERS', '', 'access', 'Y', 2),
('pageRegistration', 'BOX_ADMIN_ACCESS_PAGE_REGISTRATION', 'FILENAME_ADMIN_PAGE_REGISTRATION', '', 'access', 'Y', 3),
('adminlogs', 'BOX_ADMIN_ACCESS_LOGS', 'FILENAME_ADMIN_ACTIVITY', '', 'access', 'Y', 4),
('recordArtists', 'BOX_CATALOG_RECORD_ARTISTS', 'FILENAME_RECORD_ARTISTS', '', 'extras', 'Y', 1),
('recordCompanies', 'BOX_CATALOG_RECORD_COMPANY', 'FILENAME_RECORD_COMPANY', '', 'extras', 'Y', 2),
('musicGenre', 'BOX_CATALOG_MUSIC_GENRE', 'FILENAME_MUSIC_GENRE', '', 'extras', 'Y', 3),
('mediaManager', 'BOX_CATALOG_MEDIA_MANAGER', 'FILENAME_MEDIA_MANAGER', '', 'extras', 'Y', 4),
('mediaTypes', 'BOX_CATALOG_MEDIA_TYPES', 'FILENAME_MEDIA_TYPES', '', 'extras', 'Y', 5),
('configTMMegamenu', 'BOX_CONFIGURATION_TM_MEGAMENU', 'FILENAME_CONFIGURATION', 'gID=59', 'configuration', 'Y', 59),
('configZXSlideshow', 'BOX_CONFIGURATION_ZX_SLIDESHOW', 'FILENAME_CONFIGURATION', 'gID=60', 'configuration', 'Y', 60),
('configTMCustomblock', 'BOX_CONFIGURATION_TM_CUSTOMBLOCK', 'FILENAME_CONFIGURATION', 'gID=57', 'configuration', 'Y', 57),
('configTMSocialBlock', 'BOX_CONFIGURATION_TM_SOCIAL_BLOCK', 'FILENAME_CONFIGURATION', 'gID=61', 'configuration', 'Y', 61);

-- --------------------------------------------------------

--
-- Table structure for table `admin_pages_to_profiles`
--

CREATE TABLE IF NOT EXISTS `admin_pages_to_profiles` (
  `profile_id` int(11) NOT NULL DEFAULT '0',
  `page_key` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `admin_profiles`
--

CREATE TABLE IF NOT EXISTS `admin_profiles` (
  `profile_id` int(11) NOT NULL,
  `profile_name` varchar(64) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin_profiles`
--

INSERT INTO `admin_profiles` (`profile_id`, `profile_name`) VALUES
(1, 'Superuser');

-- --------------------------------------------------------

--
-- Table structure for table `authorizenet`
--

CREATE TABLE IF NOT EXISTS `authorizenet` (
  `id` int(11) unsigned NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `response_code` int(1) NOT NULL DEFAULT '0',
  `response_text` varchar(255) NOT NULL DEFAULT '',
  `authorization_type` varchar(50) NOT NULL DEFAULT '',
  `transaction_id` bigint(20) DEFAULT NULL,
  `sent` longtext NOT NULL,
  `received` longtext NOT NULL,
  `time` varchar(50) NOT NULL DEFAULT '',
  `session_id` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE IF NOT EXISTS `banners` (
  `banners_id` int(11) NOT NULL,
  `banners_title` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `banners_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `banners_image` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `banners_group` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `banners_html_text` text COLLATE utf8_unicode_ci,
  `expires_impressions` int(7) DEFAULT '0',
  `expires_date` datetime DEFAULT NULL,
  `date_scheduled` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_status_change` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `banners_open_new_windows` int(1) NOT NULL DEFAULT '1',
  `banners_on_ssl` int(1) NOT NULL DEFAULT '1',
  `banners_sort_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`banners_id`, `banners_title`, `banners_url`, `banners_image`, `banners_group`, `banners_html_text`, `expires_impressions`, `expires_date`, `date_scheduled`, `date_added`, `date_status_change`, `status`, `banners_open_new_windows`, `banners_on_ssl`, `banners_sort_order`) VALUES
(1, '<span>Water taps</span>', 'index.php?main_page=index&cPath=2', 'cat_banner_1.jpg', 'category-banner', '', 0, NULL, NULL, '0001-01-01 00:00:00', NULL, 1, 0, 1, 0),
(2, '<span>Shells</span>', 'index.php?main_page=index&cPath=3', 'cat_banner_2.jpg', 'category-banner', '', 0, NULL, NULL, '0001-01-01 00:00:00', NULL, 1, 0, 1, 0),
(3, '<span>Bathrooms</span>', 'index.php?main_page=index&cPath=4', 'cat_banner_3.jpg', 'category-banner', '', 0, NULL, NULL, '0001-01-01 00:00:00', NULL, 1, 0, 1, 0),
(4, '', 'index.php?main_page=index&cPath=5', 'slide1.jpg', 'slider', '', 0, NULL, NULL, '0001-01-01 00:00:00', NULL, 1, 0, 1, 0),
(5, '', 'index.php?main_page=index&cPath=6', 'slide2.jpg', 'slider', '', 0, NULL, NULL, '0001-01-01 00:00:00', NULL, 1, 0, 1, 0),
(6, '', 'index.php?main_page=index&cPath=7', 'slide3.jpg', 'slider', '', 0, NULL, NULL, '0001-01-01 00:00:00', NULL, 1, 0, 1, 0),
(7, '<div class="capt bounce-to-bottom"><h3><b>New</b> Products</h3><p>Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor.</p></div>', 'index.php?main_page=index&cPath=5', 'item1.png', 'banner-3', '', 0, NULL, NULL, '0001-01-01 00:00:00', NULL, 1, 0, 1, 0),
(8, '<div class="capt bounce-to-bottom"><h3><b>Special</b> Offer</h3><p>Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor.</p></div>', 'index.php?main_page=index&cPath=6', 'item2.png', 'banner-3', '', 0, NULL, NULL, '0001-01-01 00:00:00', NULL, 1, 0, 1, 0),
(9, '<div class="capt bounce-to-bottom"><h3><b>About</b> Store</h3><p>Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor.</p></div>', 'index.php?main_page=index&cPath=7', 'item3.png', 'banner-3', '', 0, NULL, NULL, '0001-01-01 00:00:00', NULL, 1, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `banners_history`
--

CREATE TABLE IF NOT EXISTS `banners_history` (
  `banners_history_id` int(11) NOT NULL,
  `banners_id` int(11) NOT NULL DEFAULT '0',
  `banners_shown` int(5) NOT NULL DEFAULT '0',
  `banners_clicked` int(5) NOT NULL DEFAULT '0',
  `banners_history_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00'
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `banners_history`
--

INSERT INTO `banners_history` (`banners_history_id`, `banners_id`, `banners_shown`, `banners_clicked`, `banners_history_date`) VALUES
(1, 3, 1, 0, '2022-10-05 21:06:24'),
(2, 5, 1, 0, '2022-10-05 21:06:24'),
(3, 9, 4, 1, '2022-10-05 21:06:24'),
(4, 8, 4, 0, '2022-10-05 21:06:24'),
(5, 6, 1, 0, '2022-10-05 21:06:24'),
(6, 7, 3, 0, '2022-10-05 21:12:29'),
(7, 7, 1, 0, '2022-10-06 22:46:29'),
(8, 8, 1, 0, '2022-10-06 22:46:29'),
(9, 9, 1, 0, '2022-10-06 22:46:29'),
(10, 7, 1, 0, '2022-10-09 00:24:28'),
(11, 8, 1, 0, '2022-10-09 00:24:28'),
(12, 9, 1, 0, '2022-10-09 00:24:28'),
(13, 7, 2, 0, '2022-10-13 21:41:14'),
(14, 8, 2, 0, '2022-10-13 21:41:14'),
(15, 9, 2, 0, '2022-10-13 21:41:14');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `categories_id` int(11) NOT NULL,
  `categories_image` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(3) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `categories_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categories_id`, `categories_image`, `parent_id`, `sort_order`, `date_added`, `last_modified`, `categories_status`) VALUES
(1, 'cat1.jpg', 0, 1, NULL, NULL, 1),
(2, 'cat2.jpg', 0, 2, NULL, NULL, 1),
(3, 'cat3.jpg', 0, 3, NULL, NULL, 1),
(4, 'cat4.jpg', 0, 4, NULL, NULL, 1),
(5, 'cat5.jpg', 0, 5, NULL, NULL, 1),
(6, 'cat6.jpg', 0, 6, NULL, NULL, 1),
(7, 'cat7.jpg', 0, 7, NULL, NULL, 1),
(8, 'cat8.jpg', 0, 8, NULL, NULL, 1),
(9, 'cat9.jpg', 0, 9, NULL, NULL, 1),
(10, 'cat10.jpg', 0, 10, NULL, NULL, 1),
(31, 'sub1.jpg', 1, 1, NULL, NULL, 1),
(32, 'sub2.jpg', 1, 2, NULL, NULL, 1),
(33, 'sub3.jpg', 1, 3, NULL, NULL, 1),
(34, 'sub4.jpg', 1, 4, NULL, NULL, 1),
(35, 'sub5.jpg', 2, 1, NULL, NULL, 1),
(36, 'sub6.jpg', 2, 2, NULL, NULL, 1),
(37, 'sub7.jpg', 2, 3, NULL, NULL, 1),
(38, 'sub8.jpg', 2, 4, NULL, NULL, 1),
(39, 'sub9.jpg', 3, 1, NULL, NULL, 1),
(40, 'sub10.jpg', 3, 2, NULL, NULL, 1),
(41, 'sub11.jpg', 3, 3, NULL, NULL, 1),
(42, 'sub12.jpg', 4, 1, NULL, NULL, 1),
(43, 'sub13.jpg', 4, 2, NULL, NULL, 1),
(44, 'sub14.jpg', 4, 3, NULL, NULL, 1),
(45, 'sub15.jpg', 5, 1, NULL, NULL, 1),
(46, 'sub16.jpg', 5, 2, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories_description`
--

CREATE TABLE IF NOT EXISTS `categories_description` (
  `categories_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `categories_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `categories_description` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories_description`
--

INSERT INTO `categories_description` (`categories_id`, `language_id`, `categories_name`, `categories_description`) VALUES
(1, 1, 'Bathroom', 'The supplies we sell in our store are of premium quality and will serve you for years. We enrich our Plumbing Supplies Store only with the well tested models which have won trust and are known thanks to their resistance to depreciation. Modern and reliable they will cause you no troubles in further exploitation. Trust our plumbing experience and we will justify it.'),
(2, 1, 'Home & Garden', 'The supplies we sell in our store are of premium quality and will serve you for years. We enrich our Plumbing Supplies Store only with the well tested models which have won trust and are known thanks to their resistance to depreciation. Modern and reliable they will cause you no troubles in further exploitation. Trust our plumbing experience and we will justify it. '),
(3, 1, 'Kitchen', 'The supplies we sell in our store are of premium quality and will serve you for years. We enrich our Plumbing Supplies Store only with the well tested models which have won trust and are known thanks to their resistance to depreciation. Modern and reliable they will cause you no troubles in further exploitation. Trust our plumbing experience and we will justify it. '),
(4, 1, 'Repair Parts', 'The supplies we sell in our store are of premium quality and will serve you for years. We enrich our Plumbing Supplies Store only with the well tested models which have won trust and are known thanks to their resistance to depreciation. Modern and reliable they will cause you no troubles in further exploitation. Trust our plumbing experience and we will justify it.'),
(5, 1, 'Tools', 'Our online shop is the best place to buy bikes, accessories and other related products. Perfect service, reliable shipping system and flexible discount and loyalty programs - these are the main components that have ensured the success of our business. Great team chemistry and flawless customer care will surprise you instantly and you’ll notice that you are in the right place where people know everything about bicycles. '),
(6, 1, 'Water Heaters', 'The supplies we sell in our store are of premium quality and will serve you for years. We enrich our Plumbing Supplies Store only with the well tested models which have won trust and are known thanks to their resistance to depreciation. Modern and reliable they will cause you no troubles in further exploitation. Trust our plumbing experience and we will justify it. '),
(7, 1, 'Supplies', 'The supplies we sell in our store are of premium quality and will serve you for years. We enrich our Plumbing Supplies Store only with the well tested models which have won trust and are known thanks to their resistance to depreciation. Modern and reliable they will cause you no troubles in further exploitation. Trust our plumbing experience and we will justify it.'),
(8, 1, 'Shells', 'The supplies we sell in our store are of premium quality and will serve you for years. We enrich our Plumbing Supplies Store only with the well tested models which have won trust and are known thanks to their resistance to depreciation. Modern and reliable they will cause you no troubles in further exploitation. Trust our plumbing experience and we will justify it.'),
(9, 1, 'Water Taps', 'The supplies we sell in our store are of premium quality and will serve you for years. We enrich our Plumbing Supplies Store only with the well tested models which have won trust and are known thanks to their resistance to depreciation. Modern and reliable they will cause you no troubles in further exploitation. Trust our plumbing experience and we will justify it. '),
(10, 1, 'Accessories', 'The supplies we sell in our store are of premium quality and will serve you for years. We enrich our Plumbing Supplies Store only with the well tested models which have won trust and are known thanks to their resistance to depreciation. Modern and reliable they will cause you no troubles in further exploitation. Trust our plumbing experience and we will justify it.'),
(31, 1, 'Lorem', 'The supplies we sell in our store are of premium quality and will serve you for years. We enrich our Plumbing Supplies Store only with the well tested models which have won trust and are known thanks to their resistance to depreciation. Modern and reliable they will cause you no troubles in further exploitation. Trust our plumbing experience and we will justify it.'),
(32, 1, 'Ipsum', 'The supplies we sell in our store are of premium quality and will serve you for years. We enrich our Plumbing Supplies Store only with the well tested models which have won trust and are known thanks to their resistance to depreciation. Modern and reliable they will cause you no troubles in further exploitation. Trust our plumbing experience and we will justify it. '),
(33, 1, 'Dolor', 'The supplies we sell in our store are of premium quality and will serve you for years. We enrich our Plumbing Supplies Store only with the well tested models which have won trust and are known thanks to their resistance to depreciation. Modern and reliable they will cause you no troubles in further exploitation. Trust our plumbing experience and we will justify it.'),
(34, 1, 'Sit epsum', 'The supplies we sell in our store are of premium quality and will serve you for years. We enrich our Plumbing Supplies Store only with the well tested models which have won trust and are known thanks to their resistance to depreciation. Modern and reliable they will cause you no troubles in further exploitation. Trust our plumbing experience and we will justify it.'),
(35, 1, 'Doloriicus', 'The supplies we sell in our store are of premium quality and will serve you for years. We enrich our Plumbing Supplies Store only with the well tested models which have won trust and are known thanks to their resistance to depreciation. Modern and reliable they will cause you no troubles in further exploitation. Trust our plumbing experience and we will justify it. '),
(36, 1, 'Vivamus', 'The supplies we sell in our store are of premium quality and will serve you for years. We enrich our Plumbing Supplies Store only with the well tested models which have won trust and are known thanks to their resistance to depreciation. Modern and reliable they will cause you no troubles in further exploitation. Trust our plumbing experience and we will justify it.'),
(37, 1, 'Nullam', 'The supplies we sell in our store are of premium quality and will serve you for years. We enrich our Plumbing Supplies Store only with the well tested models which have won trust and are known thanks to their resistance to depreciation. Modern and reliable they will cause you no troubles in further exploitation. Trust our plumbing experience and we will justify it.'),
(38, 1, 'Vivamus fauci', 'The supplies we sell in our store are of premium quality and will serve you for years. We enrich our Plumbing Supplies Store only with the well tested models which have won trust and are known thanks to their resistance to depreciation. Modern and reliable they will cause you no troubles in further exploitation. Trust our plumbing experience and we will justify it. '),
(39, 1, 'Cursus nisi et', 'The supplies we sell in our store are of premium quality and will serve you for years. We enrich our Plumbing Supplies Store only with the well tested models which have won trust and are known thanks to their resistance to depreciation. Modern and reliable they will cause you no troubles in further exploitation. Trust our plumbing experience and we will justify it.'),
(40, 1, 'Vivamus congue', 'The supplies we sell in our store are of premium quality and will serve you for years. We enrich our Plumbing Supplies Store only with the well tested models which have won trust and are known thanks to their resistance to depreciation. Modern and reliable they will cause you no troubles in further exploitation. Trust our plumbing experience and we will justify it.'),
(41, 1, 'Dapibus elit', 'The supplies we sell in our store are of premium quality and will serve you for years. We enrich our Plumbing Supplies Store only with the well tested models which have won trust and are known thanks to their resistance to depreciation. Modern and reliable they will cause you no troubles in further exploitation. Trust our plumbing experience and we will justify it. '),
(42, 1, 'Quisque condi', 'The supplies we sell in our store are of premium quality and will serve you for years. We enrich our Plumbing Supplies Store only with the well tested models which have won trust and are known thanks to their resistance to depreciation. Modern and reliable they will cause you no troubles in further exploitation. Trust our plumbing experience and we will justify it.'),
(43, 1, 'Lorem eget su', 'The supplies we sell in our store are of premium quality and will serve you for years. We enrich our Plumbing Supplies Store only with the well tested models which have won trust and are known thanks to their resistance to depreciation. Modern and reliable they will cause you no troubles in further exploitation. Trust our plumbing experience and we will justify it.'),
(44, 1, 'Nullam eget', 'The supplies we sell in our store are of premium quality and will serve you for years. We enrich our Plumbing Supplies Store only with the well tested models which have won trust and are known thanks to their resistance to depreciation. Modern and reliable they will cause you no troubles in further exploitation. Trust our plumbing experience and we will justify it. '),
(45, 1, 'Facilisis pur', 'The supplies we sell in our store are of premium quality and will serve you for years. We enrich our Plumbing Supplies Store only with the well tested models which have won trust and are known thanks to their resistance to depreciation. Modern and reliable they will cause you no troubles in further exploitation. Trust our plumbing experience and we will justify it.'),
(46, 1, 'Finibus mi', 'The supplies we sell in our store are of premium quality and will serve you for years. We enrich our Plumbing Supplies Store only with the well tested models which have won trust and are known thanks to their resistance to depreciation. Modern and reliable they will cause you no troubles in further exploitation. Trust our plumbing experience and we will justify it.');

-- --------------------------------------------------------

--
-- Table structure for table `configuration`
--

CREATE TABLE IF NOT EXISTS `configuration` (
  `configuration_id` int(11) NOT NULL,
  `configuration_title` text NOT NULL,
  `configuration_key` varchar(255) NOT NULL DEFAULT '',
  `configuration_value` text NOT NULL,
  `configuration_description` text NOT NULL,
  `configuration_group_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(5) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `use_function` text,
  `set_function` text
) ENGINE=MyISAM AUTO_INCREMENT=766 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `configuration`
--

INSERT INTO `configuration` (`configuration_id`, `configuration_title`, `configuration_key`, `configuration_value`, `configuration_description`, `configuration_group_id`, `sort_order`, `last_modified`, `date_added`, `use_function`, `set_function`) VALUES
(1, 'Store Name', 'STORE_NAME', 'Plumbing Supplies Store', 'The name of my store', 1, 1, '2015-04-09 12:03:53', '2014-10-27 13:41:14', NULL, NULL),
(2, 'Store Owner', 'STORE_OWNER', 'admin', 'The name of my store owner', 1, 2, NULL, '2014-10-27 13:41:14', NULL, NULL),
(3, 'Telephone - Customer Service', 'STORE_TELEPHONE_CUSTSERVICE', '(800) 234-5678', 'Enter a telephone number for customers to reach your Customer Service department. This number may be sent as part of payment transaction details.', 1, 3, '2015-04-09 13:59:32', '2014-10-27 13:41:14', NULL, NULL),
(4, 'Country', 'STORE_COUNTRY', '223', 'The country my store is located in <br /><br /><strong>Note: Please remember to update the store zone.</strong>', 1, 6, NULL, '2014-10-27 13:41:14', 'zen_get_country_name', 'zen_cfg_pull_down_country_list('),
(5, 'Zone', 'STORE_ZONE', '1', 'The zone my store is located in', 1, 7, NULL, '2014-10-27 13:41:14', 'zen_cfg_get_zone_name', 'zen_cfg_pull_down_zone_list('),
(6, 'Expected Sort Order', 'EXPECTED_PRODUCTS_SORT', 'desc', 'This is the sort order used in the expected products box.', 1, 8, NULL, '2014-10-27 13:41:14', NULL, 'zen_cfg_select_option(array(''asc'', ''desc''), '),
(7, 'Expected Sort Field', 'EXPECTED_PRODUCTS_FIELD', 'date_expected', 'The column to sort by in the expected products box.', 1, 9, NULL, '2014-10-27 13:41:14', NULL, 'zen_cfg_select_option(array(''products_name'', ''date_expected''), '),
(8, 'Switch To Default Language Currency', 'USE_DEFAULT_LANGUAGE_CURRENCY', 'false', 'Automatically switch to the language''s currency when it is changed', 1, 10, NULL, '2014-10-27 13:41:14', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(9, 'Language Selector', 'LANGUAGE_DEFAULT_SELECTOR', 'Default', 'Should the default language be based on the Store preferences, or the customer''s browser settings?<br /><br />Default: Store''s default settings', 1, 11, NULL, '2014-10-27 13:41:14', NULL, 'zen_cfg_select_option(array(''Default'', ''Browser''), '),
(10, 'Use Search-Engine Safe URLs (still in development)', 'SEARCH_ENGINE_FRIENDLY_URLS', 'false', 'Use search-engine safe urls for all site links', 6, 12, NULL, '2014-10-27 13:41:14', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(11, 'Display Cart After Adding Product', 'DISPLAY_CART', 'false', 'Display the shopping cart after adding a product (or return back to their origin)', 1, 14, '2014-11-05 09:45:24', '2014-10-27 13:41:14', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(12, 'Default Search Operator', 'ADVANCED_SEARCH_DEFAULT_OPERATOR', 'and', 'Default search operators', 1, 17, NULL, '2014-10-27 13:41:14', NULL, 'zen_cfg_select_option(array(''and'', ''or''), '),
(13, 'Store Address and Phone', 'STORE_NAME_ADDRESS', 'Company Inc., 8901 Marmora Road,<br/>\r\nGlasgow, D04 89GR', 'This is the Store Name, Address and Phone used on printable documents and displayed online', 1, 7, '2015-02-13 09:40:43', '2014-10-27 13:41:14', NULL, 'zen_cfg_textarea('),
(14, 'Show Category Counts', 'SHOW_COUNTS', '0', 'Count recursively how many products are in each category', 1, 19, NULL, '2014-10-27 13:41:14', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(15, 'Tax Decimal Places', 'TAX_DECIMAL_PLACES', '0', 'Pad the tax value this amount of decimal places', 1, 20, NULL, '2014-10-27 13:41:14', NULL, NULL),
(16, 'Display Prices with Tax', 'DISPLAY_PRICE_WITH_TAX', 'false', 'Display prices with tax included (true) or add the tax at the end (false)', 1, 21, NULL, '2014-10-27 13:41:14', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(17, 'Display Prices with Tax in Admin', 'DISPLAY_PRICE_WITH_TAX_ADMIN', 'false', 'Display prices with tax included (true) or add the tax at the end (false) in Admin(Invoices)', 1, 21, NULL, '2014-10-27 13:41:14', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(18, 'Basis of Product Tax', 'STORE_PRODUCT_TAX_BASIS', 'Shipping', 'On what basis is Product Tax calculated. Options are<br />Shipping - Based on customers Shipping Address<br />Billing Based on customers Billing address<br />Store - Based on Store address if Billing/Shipping Zone equals Store zone', 1, 21, NULL, '2014-10-27 13:41:14', NULL, 'zen_cfg_select_option(array(''Shipping'', ''Billing'', ''Store''), '),
(19, 'Basis of Shipping Tax', 'STORE_SHIPPING_TAX_BASIS', 'Shipping', 'On what basis is Shipping Tax calculated. Options are<br />Shipping - Based on customers Shipping Address<br />Billing Based on customers Billing address<br />Store - Based on Store address if Billing/Shipping Zone equals Store zone - Can be overriden by correctly written Shipping Module', 1, 21, NULL, '2014-10-27 13:41:14', NULL, 'zen_cfg_select_option(array(''Shipping'', ''Billing'', ''Store''), '),
(20, 'Sales Tax Display Status', 'STORE_TAX_DISPLAY_STATUS', '0', 'Always show Sales Tax even when amount is $0.00?<br />0= Off<br />1= On', 1, 21, NULL, '2014-10-27 13:41:14', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(21, 'Show Split Tax Lines', 'SHOW_SPLIT_TAX_CHECKOUT', 'false', 'If multiple tax rates apply, show each rate as a separate line at checkout', 1, 22, NULL, '2014-10-27 13:41:14', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(22, 'PA-DSS Admin Session Timeout Enforced?', 'PADSS_ADMIN_SESSION_TIMEOUT_ENFORCED', '1', 'PA-DSS Compliance requires that any Admin login sessions expire after 15 minutes of inactivity. <strong>Disabling this makes your site NON-COMPLIANT with PA-DSS rules, thus invalidating any certification.</strong>', 1, 30, '2014-10-27 13:41:14', '2014-10-27 13:41:14', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Non-Compliant''), array(''id''=>''1'', ''text''=>''On'')),'),
(23, 'PA-DSS Strong Password Rules Enforced?', 'PADSS_PWD_EXPIRY_ENFORCED', '1', 'PA-DSS Compliance requires that admin passwords must be changed after 90 days and cannot re-use the last 4 passwords. <strong>Disabling this makes your site NON-COMPLIANT with PA-DSS rules, thus invalidating any certification.</strong>', 1, 30, '2014-10-27 13:41:14', '2014-10-27 13:41:14', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Non-Compliant''), array(''id''=>''1'', ''text''=>''On'')),'),
(24, 'Admin Session Time Out in Seconds', 'SESSION_TIMEOUT_ADMIN', '900', 'Enter the time in seconds.<br />Max allowed is 900 for PCI Compliance Reasons.<br /> Default=900<br />Example: 900= 15 min <br /><br />Note: Too few seconds can result in timeout issues when adding/editing products', 1, 40, NULL, '2014-10-27 13:41:14', NULL, NULL),
(25, 'Admin Set max_execution_time for processes', 'GLOBAL_SET_TIME_LIMIT', '60', 'Enter the time in seconds for how long the max_execution_time of processes should be. Default=60<br />Example: 60= 1 minute<br /><br />Note: Changing the time limit is only needed if you are having problems with the execution time of a process', 1, 42, NULL, '2014-10-27 13:41:14', NULL, NULL),
(26, 'Show if version update available', 'SHOW_VERSION_UPDATE_IN_HEADER', 'true', 'Automatically check to see if a new version of Zen Cart is available. Enabling this can sometimes slow down the loading of Admin pages. (Displayed on main Index page after login, and Server Info page.)', 1, 44, NULL, '2014-10-27 13:41:14', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(27, 'Store Status', 'STORE_STATUS', '0', 'What is your Store Status<br />0= Normal Store<br />1= Showcase no prices<br />2= Showcase with prices', 1, 25, NULL, '2014-10-27 13:41:14', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(28, 'Server Uptime', 'DISPLAY_SERVER_UPTIME', 'true', 'Displaying Server uptime can cause entries in error logs on some servers. (true = Display, false = don''t display)', 1, 46, '2003-11-08 20:24:47', '0001-01-01 00:00:00', '', 'zen_cfg_select_option(array(''true'', ''false''),'),
(29, 'Missing Page Check', 'MISSING_PAGE_CHECK', 'Page Not Found', 'Zen Cart can check for missing pages in the URL and redirect to Index page. For debugging you may want to turn this off. <br /><br /><strong>Default=On</strong><br />On = Send missing pages to ''index''<br />Off = Don''t check for missing pages<br />Page Not Found = display the Page-Not-Found page', 1, 48, '2003-11-08 20:24:47', '0001-01-01 00:00:00', '', 'zen_cfg_select_option(array(''On'', ''Off'', ''Page Not Found''),'),
(30, 'cURL Proxy Status', 'CURL_PROXY_REQUIRED', 'False', 'Does your host require that you use a proxy for cURL communication?', 6, 50, NULL, '2014-10-27 13:41:14', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(31, 'cURL Proxy Address', 'CURL_PROXY_SERVER_DETAILS', '', 'If you have a hosting service that requires use of a proxy to talk to external sites via cURL, enter their proxy address here.<br />format: address:port<br />ie: 127.0.0.1:3128', 6, 51, NULL, '2014-10-27 13:41:14', NULL, NULL),
(32, 'HTML Editor', 'HTML_EDITOR_PREFERENCE', 'NONE', 'Please select the HTML/Rich-Text editor you wish to use for composing Admin-related emails, newsletters, and product descriptions', 1, 110, NULL, '2014-10-27 13:41:14', NULL, 'zen_cfg_pull_down_htmleditors('),
(33, 'Enable phpBB linkage?', 'PHPBB_LINKS_ENABLED', 'false', 'Should Zen Cart synchronize new account information to your (already-installed) phpBB forum?', 1, 120, NULL, '2014-10-27 13:41:14', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(34, 'Show Category Counts - Admin', 'SHOW_COUNTS_ADMIN', 'true', 'Show Category Counts in Admin?', 1, 19, NULL, '2014-10-27 13:41:14', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(35, 'Show linked status for categories', 'SHOW_CATEGORY_PRODUCTS_LINKED_STATUS', 'true', 'Show Category products linked status?', 1, 19, NULL, '2014-10-27 13:41:14', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(36, 'Currency Conversion Ratio', 'CURRENCY_UPLIFT_RATIO', '1.05', 'When auto-updating currencies, what "uplift" ratio should be used to calculate the exchange rate used by your store?<br />ie: the bank rate is obtained from the currency-exchange servers; how much extra do you want to charge in order to make up the difference between the bank rate and the consumer rate?<br /><br /><strong>Default: 1.05 </strong><br />This will cause the published bank rate to be multiplied by 1.05 to set the currency rates in your store.', 1, 55, NULL, '2014-10-27 13:41:14', NULL, NULL),
(37, 'First Name', 'ENTRY_FIRST_NAME_MIN_LENGTH', '2', 'Minimum length of first name', 2, 1, NULL, '2014-10-27 13:41:14', NULL, NULL),
(38, 'Last Name', 'ENTRY_LAST_NAME_MIN_LENGTH', '2', 'Minimum length of last name', 2, 2, NULL, '2014-10-27 13:41:14', NULL, NULL),
(39, 'Date of Birth', 'ENTRY_DOB_MIN_LENGTH', '10', 'Minimum length of date of birth', 2, 3, NULL, '2014-10-27 13:41:14', NULL, NULL),
(40, 'E-Mail Address', 'ENTRY_EMAIL_ADDRESS_MIN_LENGTH', '6', 'Minimum length of e-mail address', 2, 4, NULL, '2014-10-27 13:41:14', NULL, NULL),
(41, 'Street Address', 'ENTRY_STREET_ADDRESS_MIN_LENGTH', '5', 'Minimum length of street address', 2, 5, NULL, '2014-10-27 13:41:14', NULL, NULL),
(42, 'Company', 'ENTRY_COMPANY_MIN_LENGTH', '0', 'Minimum length of company name', 2, 6, NULL, '2014-10-27 13:41:14', NULL, NULL),
(43, 'Post Code', 'ENTRY_POSTCODE_MIN_LENGTH', '4', 'Minimum length of post code', 2, 7, NULL, '2014-10-27 13:41:14', NULL, NULL),
(44, 'City', 'ENTRY_CITY_MIN_LENGTH', '2', 'Minimum length of city', 2, 8, NULL, '2014-10-27 13:41:14', NULL, NULL),
(45, 'State', 'ENTRY_STATE_MIN_LENGTH', '2', 'Minimum length of state', 2, 9, NULL, '2014-10-27 13:41:14', NULL, NULL),
(46, 'Telephone Number', 'ENTRY_TELEPHONE_MIN_LENGTH', '3', 'Minimum length of telephone number', 2, 10, NULL, '2014-10-27 13:41:14', NULL, NULL),
(47, 'Password', 'ENTRY_PASSWORD_MIN_LENGTH', '7', 'Minimum length of password', 2, 11, NULL, '2014-10-27 13:41:14', NULL, NULL),
(48, 'Credit Card Owner Name', 'CC_OWNER_MIN_LENGTH', '3', 'Minimum length of credit card owner name', 2, 12, NULL, '2014-10-27 13:41:14', NULL, NULL),
(49, 'Credit Card Number', 'CC_NUMBER_MIN_LENGTH', '10', 'Minimum length of credit card number', 2, 13, NULL, '2014-10-27 13:41:14', NULL, NULL),
(50, 'Credit Card CVV Number', 'CC_CVV_MIN_LENGTH', '3', 'Minimum length of credit card CVV number', 2, 13, NULL, '2014-10-27 13:41:14', NULL, NULL),
(51, 'Product Review Text', 'REVIEW_TEXT_MIN_LENGTH', '50', 'Minimum length of product review text', 2, 14, NULL, '2014-10-27 13:41:14', NULL, NULL),
(52, 'Best Sellers', 'MIN_DISPLAY_BESTSELLERS', '1', 'Minimum number of best sellers to display', 2, 15, NULL, '2014-10-27 13:41:14', NULL, NULL),
(53, 'Also Purchased Products', 'MIN_DISPLAY_ALSO_PURCHASED', '1', 'Minimum number of products to display in the ''This Customer Also Purchased'' box', 2, 16, NULL, '2014-10-27 13:41:14', NULL, NULL),
(54, 'Nick Name', 'ENTRY_NICK_MIN_LENGTH', '3', 'Minimum length of Nick Name', 2, 1, NULL, '2014-10-27 13:41:14', NULL, NULL),
(55, 'Address Book Entries', 'MAX_ADDRESS_BOOK_ENTRIES', '5', 'Maximum address book entries a customer is allowed to have', 3, 1, NULL, '2014-10-27 13:41:14', NULL, NULL),
(56, 'Admin Search Results Per Page', 'MAX_DISPLAY_SEARCH_RESULTS', '20', 'Number of products to list on an Admin search result page', 3, 2, NULL, '2014-10-27 13:41:14', NULL, NULL),
(57, 'Prev/Next Navigation Page Links', 'MAX_DISPLAY_PAGE_LINKS', '5', 'Number of ''number'' links use for page-sets', 3, 3, NULL, '2014-10-27 13:41:14', NULL, NULL),
(58, 'Products on Special ', 'MAX_DISPLAY_SPECIAL_PRODUCTS', '9', 'Number of products on special to display', 3, 4, '2015-02-20 12:46:57', '2014-10-27 13:41:14', NULL, NULL),
(59, 'New Products Module', 'MAX_DISPLAY_NEW_PRODUCTS', '6', 'Number of new products to display in a category', 3, 5, '2015-02-20 12:46:07', '2014-10-27 13:41:14', NULL, NULL),
(60, 'Upcoming Products ', 'MAX_DISPLAY_UPCOMING_PRODUCTS', '3', 'Number of ''upcoming'' products to display', 3, 6, '2014-11-26 16:22:42', '2014-10-27 13:41:14', NULL, NULL),
(61, 'Manufacturers List - Scroll Box Size/Style', 'MAX_MANUFACTURERS_LIST', '3', 'Number of manufacturers names to be displayed in the scroll box window. Setting this to 1 or 0 will display a dropdown list.', 3, 7, NULL, '2014-10-27 13:41:14', NULL, NULL),
(62, 'Manufacturers List - Verify Product Exist', 'PRODUCTS_MANUFACTURERS_STATUS', '1', 'Verify that at least 1 product exists and is active for the manufacturer name to show<br /><br />Note: When this feature is ON it can produce slower results on sites with a large number of products and/or manufacturers<br />0= off 1= on', 3, 7, NULL, '2014-10-27 13:41:14', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(63, 'Music Genre List - Scroll Box Size/Style', 'MAX_MUSIC_GENRES_LIST', '3', 'Number of music genre names to be displayed in the scroll box window. Setting this to 1 or 0 will display a dropdown list.', 3, 7, NULL, '2014-10-27 13:41:14', NULL, NULL),
(64, 'Record Company List - Scroll Box Size/Style', 'MAX_RECORD_COMPANY_LIST', '3', 'Number of record company names to be displayed in the scroll box window. Setting this to 1 or 0 will display a dropdown list.', 3, 7, NULL, '2014-10-27 13:41:14', NULL, NULL),
(65, 'Length of Record Company Name', 'MAX_DISPLAY_RECORD_COMPANY_NAME_LEN', '15', 'Used in record companies box; maximum length of record company name to display. Longer names will be truncated.', 3, 8, NULL, '2014-10-27 13:41:14', NULL, NULL),
(66, 'Length of Music Genre Name', 'MAX_DISPLAY_MUSIC_GENRES_NAME_LEN', '15', 'Used in music genres box; maximum length of music genre name to display. Longer names will be truncated.', 3, 8, NULL, '2014-10-27 13:41:14', NULL, NULL),
(67, 'Length of Manufacturers Name', 'MAX_DISPLAY_MANUFACTURER_NAME_LEN', '15', 'Used in manufacturers box; maximum length of manufacturers name to display. Longer names will be truncated.', 3, 8, NULL, '2014-10-27 13:41:14', NULL, NULL),
(68, 'New Product Reviews Per Page', 'MAX_DISPLAY_NEW_REVIEWS', '6', 'Number of new reviews to display on each page', 3, 9, NULL, '2014-10-27 13:41:14', NULL, NULL),
(69, 'Random Product Reviews for SideBox', 'MAX_RANDOM_SELECT_REVIEWS', '1', 'Number of random product REVIEWS to rotate in the sidebox<br />Enter the number of products to display in this sidebox at one time.<br /><br />How many products do you want to display in this sidebox?', 3, 10, NULL, '2014-10-27 13:41:14', NULL, NULL),
(70, 'Random New Products for SideBox', 'MAX_RANDOM_SELECT_NEW', '3', 'Number of random NEW products to rotate in the sidebox<br />Enter the number of products to display in this sidebox at one time.<br /><br />How many products do you want to display in this sidebox?', 3, 11, NULL, '2014-10-27 13:41:14', NULL, NULL),
(71, 'Random Products On Special for SideBox', 'MAX_RANDOM_SELECT_SPECIALS', '2', 'Number of random products on SPECIAL to rotate in the sidebox<br />Enter the number of products to display in this sidebox at one time.<br /><br />How many products do you want to display in this sidebox?', 3, 12, NULL, '2014-10-27 13:41:14', NULL, NULL),
(72, 'Categories To List Per Row', 'MAX_DISPLAY_CATEGORIES_PER_ROW', '4', 'How many categories to list per row', 3, 13, NULL, '2014-10-27 13:41:14', NULL, NULL),
(73, 'New Products Listing- Number Per Page', 'MAX_DISPLAY_PRODUCTS_NEW', '10', 'Number of new products listed per page', 3, 14, NULL, '2014-10-27 13:41:14', NULL, NULL),
(74, 'Best Sellers For Box', 'MAX_DISPLAY_BESTSELLERS', '10', 'Number of best sellers to display in box', 3, 15, NULL, '2014-10-27 13:41:14', NULL, NULL),
(75, 'Also Purchased Products', 'MAX_DISPLAY_ALSO_PURCHASED', '6', 'Number of products to display in the ''This Customer Also Purchased'' box', 3, 16, NULL, '2014-10-27 13:41:14', NULL, NULL),
(76, 'Recent Purchases Box- NOTE: box is disabled ', 'MAX_DISPLAY_PRODUCTS_IN_ORDER_HISTORY_BOX', '6', 'Number of products to display in the recent purchases box', 3, 17, NULL, '2014-10-27 13:41:14', NULL, NULL),
(77, 'Customer Order History List Per Page', 'MAX_DISPLAY_ORDER_HISTORY', '10', 'Number of orders to display in the order history list in ''My Account''', 3, 18, NULL, '2014-10-27 13:41:14', NULL, NULL),
(78, 'Maximum Display of Customers on Customers Page', 'MAX_DISPLAY_SEARCH_RESULTS_CUSTOMER', '20', '', 3, 19, NULL, '2014-10-27 13:41:14', NULL, NULL),
(79, 'Maximum Display of Orders on Orders Page', 'MAX_DISPLAY_SEARCH_RESULTS_ORDERS', '20', '', 3, 20, NULL, '2014-10-27 13:41:14', NULL, NULL),
(80, 'Maximum Display of Products on Reports', 'MAX_DISPLAY_SEARCH_RESULTS_REPORTS', '20', '', 3, 21, NULL, '2014-10-27 13:41:14', NULL, NULL),
(81, 'Maximum Categories Products Display List', 'MAX_DISPLAY_RESULTS_CATEGORIES', '10', 'Number of products to list per screen', 3, 22, NULL, '2014-10-27 13:41:14', NULL, NULL),
(82, 'Products Listing- Number Per Page', 'MAX_DISPLAY_PRODUCTS_LISTING', '6', 'Maximum Number of Products to list per page on main page', 3, 30, '2014-12-18 16:06:50', '2014-10-27 13:41:14', NULL, NULL),
(83, 'Products Attributes - Option Names and Values Display', 'MAX_ROW_LISTS_OPTIONS', '10', 'Maximum number of option names and values to display in the products attributes page', 3, 24, NULL, '2014-10-27 13:41:14', NULL, NULL),
(84, 'Products Attributes - Attributes Controller Display', 'MAX_ROW_LISTS_ATTRIBUTES_CONTROLLER', '30', 'Maximum number of attributes to display in the Attributes Controller page', 3, 25, NULL, '2014-10-27 13:41:14', NULL, NULL),
(85, 'Products Attributes - Downloads Manager Display', 'MAX_DISPLAY_SEARCH_RESULTS_DOWNLOADS_MANAGER', '30', 'Maximum number of attributes downloads to display in the Downloads Manager page', 3, 26, NULL, '2014-10-27 13:41:14', NULL, NULL),
(86, 'Featured Products - Number to Display Admin', 'MAX_DISPLAY_SEARCH_RESULTS_FEATURED_ADMIN', '10', 'Number of featured products to list per screen - Admin', 3, 27, NULL, '2014-10-27 13:41:14', NULL, NULL),
(87, 'Maximum Display of Featured Products - Main Page', 'MAX_DISPLAY_SEARCH_RESULTS_FEATURED', '8', 'Number of featured products to list on main page', 3, 28, '2015-04-09 09:32:56', '2014-10-27 13:41:14', NULL, NULL),
(88, 'Maximum Display of Featured Products Page', 'MAX_DISPLAY_PRODUCTS_FEATURED_PRODUCTS', '10', 'Number of featured products to list per screen', 3, 29, NULL, '2014-10-27 13:41:14', NULL, NULL),
(89, 'Random Featured Products for SideBox', 'MAX_RANDOM_SELECT_FEATURED_PRODUCTS', '2', 'Number of random FEATURED products to rotate in the sidebox<br />Enter the number of products to display in this sidebox at one time.<br /><br />How many products do you want to display in this sidebox?', 3, 30, NULL, '2014-10-27 13:41:14', NULL, NULL),
(90, 'Maximum Display of Specials Products - Main Page', 'MAX_DISPLAY_SPECIAL_PRODUCTS_INDEX', '9', 'Number of special products to list on main page', 3, 31, NULL, '2014-10-27 13:41:14', NULL, NULL),
(91, 'New Product Listing - Limited to ...', 'SHOW_NEW_PRODUCTS_LIMIT', '0', 'Limit the New Product Listing to<br />0= All Products<br />1= Current Month<br />7= 7 Days<br />14= 14 Days<br />30= 30 Days<br />60= 60 Days<br />90= 90 Days<br />120= 120 Days', 3, 40, NULL, '2014-10-27 13:41:14', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''7'', ''14'', ''30'', ''60'', ''90'', ''120''), '),
(92, 'Maximum Display of Products All Page', 'MAX_DISPLAY_PRODUCTS_ALL', '10', 'Number of products to list per screen', 3, 45, NULL, '2014-10-27 13:41:14', NULL, NULL),
(93, 'Maximum Display of Language Flags in Language Side Box', 'MAX_LANGUAGE_FLAGS_COLUMNS', '3', 'Number of Language Flags per Row', 3, 50, NULL, '2014-10-27 13:41:14', NULL, NULL),
(94, 'Maximum File Upload Size', 'MAX_FILE_UPLOAD_SIZE', '2048000', 'What is the Maximum file size for uploads?<br />Default= 2048000', 3, 60, NULL, '2014-10-27 13:41:14', NULL, NULL),
(95, 'Allowed Filename Extensions for uploading', 'UPLOAD_FILENAME_EXTENSIONS', 'jpg,jpeg,gif,png,eps,cdr,ai,pdf,tif,tiff,bmp,zip', 'List the permissible filetypes (filename extensions) to be allowed when files are uploaded to your site by customers. Separate multiple values with commas(,). Do not include the dot(.).<br /><br />Suggested setting: "jpg,jpeg,gif,png,eps,cdr,ai,pdf,tif,tiff,bmp,zip"', 3, 61, NULL, '2014-10-27 13:41:14', NULL, 'zen_cfg_textarea('),
(96, 'Maximum Orders Detail Display on Admin Orders Listing', 'MAX_DISPLAY_RESULTS_ORDERS_DETAILS_LISTING', '0', 'Maximum number of Order Details<br />0 = Unlimited', 3, 65, NULL, '2014-10-27 13:41:14', NULL, NULL),
(97, 'Maximum PayPal IPN Display on Admin Listing', 'MAX_DISPLAY_SEARCH_RESULTS_PAYPAL_IPN', '20', 'Maximum number of PayPal IPN Lisings in Admin<br />Default is 20', 3, 66, NULL, '2014-10-27 13:41:14', NULL, NULL),
(98, 'Maximum Display Columns Products to Multiple Categories Manager', 'MAX_DISPLAY_PRODUCTS_TO_CATEGORIES_COLUMNS', '3', 'Maximum Display Columns Products to Multiple Categories Manager<br />3 = Default', 3, 70, NULL, '2014-10-27 13:41:14', NULL, NULL),
(99, 'Maximum Display EZ-Pages', 'MAX_DISPLAY_SEARCH_RESULTS_EZPAGE', '20', 'Maximum Display EZ-Pages<br />20 = Default', 3, 71, NULL, '2014-10-27 13:41:14', NULL, NULL),
(100, 'Small Image Width', 'SMALL_IMAGE_WIDTH', '114', 'The pixel width of small images', 4, 1, NULL, '2014-10-27 13:41:14', NULL, NULL),
(101, 'Small Image Height', 'SMALL_IMAGE_HEIGHT', '114', 'The pixel height of small images', 4, 2, '2014-11-06 10:03:24', '2014-10-27 13:41:14', NULL, NULL),
(102, 'Heading Image Width - Admin', 'HEADING_IMAGE_WIDTH', '57', 'The pixel width of heading images in the Admin<br />NOTE: Presently, this adjusts the spacing on the pages in the Admin Pages or could be used to add images to the heading in the Admin', 4, 3, NULL, '2014-10-27 13:41:14', NULL, NULL),
(103, 'Heading Image Height - Admin', 'HEADING_IMAGE_HEIGHT', '40', 'The pixel height of heading images in the Admin<br />NOTE: Presently, this adjusts the spacing on the pages in the Admin Pages or could be used to add images to the heading in the Admin', 4, 4, NULL, '2014-10-27 13:41:14', NULL, NULL),
(104, 'Subcategory Image Width', 'SUBCATEGORY_IMAGE_WIDTH', '158', 'The pixel width of subcategory images', 4, 5, NULL, '2014-10-27 13:41:14', NULL, NULL),
(105, 'Subcategory Image Height', 'SUBCATEGORY_IMAGE_HEIGHT', '158', 'The pixel height of subcategory images', 4, 6, NULL, '2014-10-27 13:41:14', NULL, NULL),
(106, 'Calculate Image Size', 'CONFIG_CALCULATE_IMAGE_SIZE', 'true', 'Calculate the size of images?', 4, 7, NULL, '2014-10-27 13:41:14', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(107, 'Image Required', 'IMAGE_REQUIRED', 'true', 'Enable to display broken images. Good for development.', 4, 8, NULL, '2014-10-27 13:41:14', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(108, 'Image - Shopping Cart Status', 'IMAGE_SHOPPING_CART_STATUS', '1', 'Show product image in the shopping cart?<br />0= off 1= on', 4, 9, NULL, '2014-10-27 13:41:14', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(109, 'Image - Shopping Cart Width', 'IMAGE_SHOPPING_CART_WIDTH', '150', 'Default = 50', 4, 10, NULL, '2014-10-27 13:41:14', NULL, NULL),
(110, 'Image - Shopping Cart Height', 'IMAGE_SHOPPING_CART_HEIGHT', '150', 'Default = 40', 4, 11, NULL, '2014-10-27 13:41:14', NULL, NULL),
(111, 'Category Icon Image Width - Product Info Pages', 'CATEGORY_ICON_IMAGE_WIDTH', '1170', 'The pixel width of Category Icon heading images for Product Info Pages', 4, 13, '2014-12-10 08:31:59', '2014-10-27 13:41:14', NULL, NULL),
(112, 'Category Icon Image Height - Product Info Pages', 'CATEGORY_ICON_IMAGE_HEIGHT', '400', 'The pixel height of Category Icon heading images for Product Info Pages', 4, 14, '2014-12-10 08:32:08', '2014-10-27 13:41:14', NULL, NULL),
(113, 'Top Subcategory Image Width', 'SUBCATEGORY_IMAGE_TOP_WIDTH', '150', 'The pixel width of Top subcategory images<br />Top subcategory is when the Category contains subcategories', 4, 15, NULL, '2014-10-27 13:41:14', NULL, NULL),
(114, 'Top Subcategory Image Height', 'SUBCATEGORY_IMAGE_TOP_HEIGHT', '150', 'The pixel height of Top subcategory images<br />Top subcategory is when the Category contains subcategories', 4, 16, NULL, '2014-10-27 13:41:14', NULL, NULL),
(115, 'Product Info - Image Width', 'MEDIUM_IMAGE_WIDTH', '200', 'The pixel width of Product Info images', 4, 20, '2015-04-14 07:36:00', '2014-10-27 13:41:14', NULL, NULL),
(116, 'Product Info - Image Height', 'MEDIUM_IMAGE_HEIGHT', '200', 'The pixel height of Product Info images', 4, 21, '2015-04-14 07:36:07', '2014-10-27 13:41:14', NULL, NULL),
(117, 'Product Info - Image Medium Suffix', 'IMAGE_SUFFIX_MEDIUM', '_MED', 'Product Info Medium Image Suffix<br />Default = _MED', 4, 22, NULL, '2014-10-27 13:41:14', NULL, NULL),
(118, 'Product Info - Image Large Suffix', 'IMAGE_SUFFIX_LARGE', '_LRG', 'Product Info Large Image Suffix<br />Default = _LRG', 4, 23, NULL, '2014-10-27 13:41:14', NULL, NULL),
(119, 'Product Info - Number of Additional Images per Row', 'IMAGES_AUTO_ADDED', '3', 'Product Info - Enter the number of additional images to display per row<br />Default = 3', 4, 30, NULL, '2014-10-27 13:41:14', NULL, NULL),
(120, 'Image - Product Listing Width', 'IMAGE_PRODUCT_LISTING_WIDTH', '200', 'Default = 100', 4, 40, NULL, '2014-10-27 13:41:14', NULL, NULL),
(121, 'Image - Product Listing Height', 'IMAGE_PRODUCT_LISTING_HEIGHT', '200', 'Default = 80', 4, 41, NULL, '2014-10-27 13:41:14', NULL, NULL),
(122, 'Image - Product New Listing Width', 'IMAGE_PRODUCT_NEW_LISTING_WIDTH', '200', 'Default = 100', 4, 42, NULL, '2014-10-27 13:41:14', NULL, NULL),
(123, 'Image - Product New Listing Height', 'IMAGE_PRODUCT_NEW_LISTING_HEIGHT', '200', 'Default = 80', 4, 43, NULL, '2014-10-27 13:41:14', NULL, NULL),
(124, 'Image - New Products Width', 'IMAGE_PRODUCT_NEW_WIDTH', '200', 'Default = 100', 4, 44, NULL, '2014-10-27 13:41:14', NULL, NULL),
(125, 'Image - New Products Height', 'IMAGE_PRODUCT_NEW_HEIGHT', '200', 'Default = 80', 4, 45, NULL, '2014-10-27 13:41:14', NULL, NULL),
(126, 'Image - Featured Products Width', 'IMAGE_FEATURED_PRODUCTS_LISTING_WIDTH', '200', 'Default = 100', 4, 46, NULL, '2014-10-27 13:41:14', NULL, NULL),
(127, 'Image - Featured Products Height', 'IMAGE_FEATURED_PRODUCTS_LISTING_HEIGHT', '200', 'Default = 80', 4, 47, NULL, '2014-10-27 13:41:14', NULL, NULL),
(128, 'Image - Product All Listing Width', 'IMAGE_PRODUCT_ALL_LISTING_WIDTH', '200', 'Default = 100', 4, 48, NULL, '2014-10-27 13:41:14', NULL, NULL),
(129, 'Image - Product All Listing Height', 'IMAGE_PRODUCT_ALL_LISTING_HEIGHT', '200', 'Default = 80', 4, 49, NULL, '2014-10-27 13:41:14', NULL, NULL),
(130, 'Product Image - No Image Status', 'PRODUCTS_IMAGE_NO_IMAGE_STATUS', '1', 'Use automatic No Image when none is added to product<br />0= off<br />1= On', 4, 60, NULL, '2014-10-27 13:41:14', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(131, 'Product Image - No Image picture', 'PRODUCTS_IMAGE_NO_IMAGE', 'no_picture.gif', 'Use automatic No Image when none is added to product<br />Default = no_picture.gif', 4, 61, NULL, '2014-10-27 13:41:14', NULL, NULL),
(132, 'Image - Use Proportional Images on Products and Categories', 'PROPORTIONAL_IMAGES_STATUS', '1', 'Use Proportional Images on Products and Categories?<br /><br />NOTE: Do not use 0 height or width settings for Proportion Images<br />0= off 1= on', 4, 75, NULL, '2014-10-27 13:41:14', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(133, 'Email Salutation', 'ACCOUNT_GENDER', 'true', 'Display salutation choice during account creation and with account information', 5, 1, NULL, '2014-10-27 13:41:14', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(134, 'Date of Birth', 'ACCOUNT_DOB', 'true', 'Display date of birth field during account creation and with account information<br />NOTE: Set Minimum Value Date of Birth to blank for not required<br />Set Minimum Value Date of Birth > 0 to require', 5, 2, NULL, '2014-10-27 13:41:14', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(135, 'Company', 'ACCOUNT_COMPANY', 'true', 'Display company field during account creation and with account information', 5, 3, NULL, '2014-10-27 13:41:14', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(136, 'Address Line 2', 'ACCOUNT_SUBURB', 'true', 'Display address line 2 field during account creation and with account information', 5, 4, NULL, '2014-10-27 13:41:14', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(137, 'State', 'ACCOUNT_STATE', 'true', 'Display state field during account creation and with account information', 5, 5, NULL, '2014-10-27 13:41:14', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(138, 'State - Always display as pulldown?', 'ACCOUNT_STATE_DRAW_INITIAL_DROPDOWN', 'false', 'When state field is displayed, should it always be a pulldown menu?', 5, 5, NULL, '2014-10-27 13:41:14', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(139, 'Create Account Default Country ID', 'SHOW_CREATE_ACCOUNT_DEFAULT_COUNTRY', '223', 'Set Create Account Default Country ID to:<br />Default is 223', 5, 6, NULL, '2014-10-27 13:41:14', 'zen_get_country_name', 'zen_cfg_pull_down_country_list_none('),
(140, 'Fax Number', 'ACCOUNT_FAX_NUMBER', 'true', 'Display fax number field during account creation and with account information', 5, 10, NULL, '2014-10-27 13:41:14', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(141, 'Show Newsletter Checkbox', 'ACCOUNT_NEWSLETTER_STATUS', '1', 'Show Newsletter Checkbox<br />0= off<br />1= Display Unchecked<br />2= Display Checked<br /><strong>Note: Defaulting this to accepted may be in violation of certain regulations for your state or country</strong>', 5, 45, NULL, '2014-10-27 13:41:14', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(142, 'Customer Default Email Preference', 'ACCOUNT_EMAIL_PREFERENCE', '0', 'Set the Default Customer Default Email Preference<br />0= Text<br />1= HTML<br />', 5, 46, NULL, '2014-10-27 13:41:14', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(143, 'Customer Product Notification Status', 'CUSTOMERS_PRODUCTS_NOTIFICATION_STATUS', '1', 'Customer should be asked about product notifications after checkout success and in account preferences<br />0= Never ask<br />1= Ask (ignored on checkout if has already selected global notifications)<br /><br />Note: Sidebox must be turned off separately', 5, 50, NULL, '2014-10-27 13:41:14', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(144, 'Customer Shop Status - View Shop and Prices', 'CUSTOMERS_APPROVAL', '0', 'Customer must be approved to shop<br />0= Not required<br />1= Must login to browse<br />2= May browse but no prices unless logged in<br />3= Showroom Only<br /><br />It is recommended that Option 2 be used for the purposes of Spiders if you wish customers to login to see prices.', 5, 55, NULL, '2014-10-27 13:41:14', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''), '),
(145, 'Customer Approval Status - Authorization Pending', 'CUSTOMERS_APPROVAL_AUTHORIZATION', '0', 'Customer must be Authorized to shop<br />0= Not required<br />1= Must be Authorized to Browse<br />2= May browse but no prices unless Authorized<br />3= Customer May Browse and May see Prices but Must be Authorized to Buy<br /><br />It is recommended that Option 2 or 3 be used for the purposes of Spiders', 5, 65, NULL, '2014-10-27 13:41:14', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''), '),
(146, 'Customer Authorization: filename', 'CUSTOMERS_AUTHORIZATION_FILENAME', 'customers_authorization', 'Customer Authorization filename<br />Note: Do not include the extension<br />Default=customers_authorization', 5, 66, NULL, '2014-10-27 13:41:14', NULL, ''),
(147, 'Customer Authorization: Hide Header', 'CUSTOMERS_AUTHORIZATION_HEADER_OFF', 'false', 'Customer Authorization: Hide Header <br />(true=hide false=show)', 5, 67, NULL, '2014-10-27 13:41:14', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(148, 'Customer Authorization: Hide Column Left', 'CUSTOMERS_AUTHORIZATION_COLUMN_LEFT_OFF', 'false', 'Customer Authorization: Hide Column Left <br />(true=hide false=show)', 5, 68, NULL, '2014-10-27 13:41:14', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(149, 'Customer Authorization: Hide Column Right', 'CUSTOMERS_AUTHORIZATION_COLUMN_RIGHT_OFF', 'false', 'Customer Authorization: Hide Column Right <br />(true=hide false=show)', 5, 69, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(150, 'Customer Authorization: Hide Footer', 'CUSTOMERS_AUTHORIZATION_FOOTER_OFF', 'false', 'Customer Authorization: Hide Footer <br />(true=hide false=show)', 5, 70, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(151, 'Customer Authorization: Hide Prices', 'CUSTOMERS_AUTHORIZATION_PRICES_OFF', 'false', 'Customer Authorization: Hide Prices <br />(true=hide false=show)', 5, 71, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(152, 'Customers Referral Status', 'CUSTOMERS_REFERRAL_STATUS', '0', 'Customers Referral Code is created from<br />0= Off<br />1= 1st Discount Coupon Code used<br />2= Customer can add during create account or edit if blank<br /><br />NOTE: Once the Customers Referral Code has been set it can only be changed in the Admin Customer', 5, 80, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(153, 'Installed Modules', 'MODULE_PAYMENT_INSTALLED', 'freecharger.php;moneyorder.php', 'List of payment module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: freecharger.php;cod.php;paypal.php)', 6, 0, NULL, '2014-10-27 13:41:15', NULL, NULL),
(154, 'Installed Modules', 'MODULE_ORDER_TOTAL_INSTALLED', 'ot_subtotal.php;ot_shipping.php;ot_coupon.php;ot_group_pricing.php;ot_tax.php;ot_loworderfee.php;ot_gv.php;ot_total.php', 'List of order_total module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: ot_subtotal.php;ot_tax.php;ot_shipping.php;ot_total.php)', 6, 0, NULL, '2014-10-27 13:41:15', NULL, NULL),
(155, 'Installed Modules', 'MODULE_SHIPPING_INSTALLED', 'flat.php;freeshipper.php;item.php;storepickup.php', 'List of shipping module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: ups.php;flat.php;item.php)', 6, 0, NULL, '2014-10-27 13:41:15', NULL, NULL),
(156, 'Enable Free Shipping', 'MODULE_SHIPPING_FREESHIPPER_STATUS', 'True', 'Do you want to offer Free shipping?', 6, 0, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(157, 'Pickup Locations', 'MODULE_SHIPPING_STOREPICKUP_LOCATIONS_LIST', 'Walk In', 'Enter a list of locations, separated by semicolons (;).<br>Optionally you may specify a fee/surcharge for each location by adding a comma and an amount. If no amount is specified, then the generic Shipping Cost amount from the next setting will be applied.<br><br>Examples:<br>121 Main Street;20 Church Street<br>Sunnyside,4.00;Lee Park,5.00;High Street,0.00<br>Dallas;Tulsa,5.00;Phoenix,0.00<br>For multilanguage use, see the define-statement in the language file for this module.', 6, 0, NULL, '2014-10-27 13:41:15', NULL, NULL),
(158, 'Free Shipping Cost', 'MODULE_SHIPPING_FREESHIPPER_COST', '0.00', 'What is the Shipping cost?', 6, 6, NULL, '2014-10-27 13:41:15', NULL, NULL),
(159, 'Handling Fee', 'MODULE_SHIPPING_FREESHIPPER_HANDLING', '0', 'Handling fee for this shipping method.', 6, 0, NULL, '2014-10-27 13:41:15', NULL, NULL),
(160, 'Tax Class', 'MODULE_SHIPPING_FREESHIPPER_TAX_CLASS', '0', 'Use the following tax class on the shipping fee.', 6, 0, NULL, '2014-10-27 13:41:15', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes('),
(161, 'Shipping Zone', 'MODULE_SHIPPING_FREESHIPPER_ZONE', '0', 'If a zone is selected, only enable this shipping method for that zone.', 6, 0, NULL, '2014-10-27 13:41:15', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes('),
(162, 'Sort Order', 'MODULE_SHIPPING_FREESHIPPER_SORT_ORDER', '0', 'Sort order of display.', 6, 0, NULL, '2014-10-27 13:41:15', NULL, NULL),
(163, 'Enable Store Pickup Shipping', 'MODULE_SHIPPING_STOREPICKUP_STATUS', 'True', 'Do you want to offer In Store rate shipping?', 6, 0, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(164, 'Shipping Cost', 'MODULE_SHIPPING_STOREPICKUP_COST', '0.00', 'The shipping cost for all orders using this shipping method.', 6, 0, NULL, '2014-10-27 13:41:15', NULL, NULL),
(165, 'Tax Class', 'MODULE_SHIPPING_STOREPICKUP_TAX_CLASS', '0', 'Use the following tax class on the shipping fee.', 6, 0, NULL, '2014-10-27 13:41:15', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes('),
(166, 'Tax Basis', 'MODULE_SHIPPING_STOREPICKUP_TAX_BASIS', 'Shipping', 'On what basis is Shipping Tax calculated. Options are<br />Shipping - Based on customers Shipping Address<br />Billing Based on customers Billing address<br />Store - Based on Store address if Billing/Shipping Zone equals Store zone', 6, 0, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''Shipping'', ''Billing''), '),
(167, 'Shipping Zone', 'MODULE_SHIPPING_STOREPICKUP_ZONE', '0', 'If a zone is selected, only enable this shipping method for that zone.', 6, 0, NULL, '2014-10-27 13:41:15', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes('),
(168, 'Sort Order', 'MODULE_SHIPPING_STOREPICKUP_SORT_ORDER', '0', 'Sort order of display.', 6, 0, NULL, '2014-10-27 13:41:15', NULL, NULL),
(169, 'Enable Item Shipping', 'MODULE_SHIPPING_ITEM_STATUS', 'True', 'Do you want to offer per item rate shipping?', 6, 0, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(170, 'Shipping Cost', 'MODULE_SHIPPING_ITEM_COST', '2.50', 'The shipping cost will be multiplied by the number of items in an order that uses this shipping method.', 6, 0, NULL, '2014-10-27 13:41:15', NULL, NULL),
(171, 'Handling Fee', 'MODULE_SHIPPING_ITEM_HANDLING', '0', 'Handling fee for this shipping method.', 6, 0, NULL, '2014-10-27 13:41:15', NULL, NULL),
(172, 'Tax Class', 'MODULE_SHIPPING_ITEM_TAX_CLASS', '0', 'Use the following tax class on the shipping fee.', 6, 0, NULL, '2014-10-27 13:41:15', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes('),
(173, 'Tax Basis', 'MODULE_SHIPPING_ITEM_TAX_BASIS', 'Shipping', 'On what basis is Shipping Tax calculated. Options are<br />Shipping - Based on customers Shipping Address<br />Billing Based on customers Billing address<br />Store - Based on Store address if Billing/Shipping Zone equals Store zone', 6, 0, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''Shipping'', ''Billing'', ''Store''), '),
(174, 'Shipping Zone', 'MODULE_SHIPPING_ITEM_ZONE', '0', 'If a zone is selected, only enable this shipping method for that zone.', 6, 0, NULL, '2014-10-27 13:41:15', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes('),
(175, 'Sort Order', 'MODULE_SHIPPING_ITEM_SORT_ORDER', '0', 'Sort order of display.', 6, 0, NULL, '2014-10-27 13:41:15', NULL, NULL),
(176, 'Enable Free Charge Module', 'MODULE_PAYMENT_FREECHARGER_STATUS', 'True', 'Do you want to accept Free Charge payments?', 6, 1, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(177, 'Sort order of display.', 'MODULE_PAYMENT_FREECHARGER_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-10-27 13:41:15', NULL, NULL),
(178, 'Payment Zone', 'MODULE_PAYMENT_FREECHARGER_ZONE', '0', 'If a zone is selected, only enable this payment method for that zone.', 6, 2, NULL, '2014-10-27 13:41:15', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes('),
(179, 'Set Order Status', 'MODULE_PAYMENT_FREECHARGER_ORDER_STATUS_ID', '0', 'Set the status of orders made with this payment module to this value', 6, 0, NULL, '2014-10-27 13:41:15', 'zen_get_order_status_name', 'zen_cfg_pull_down_order_statuses('),
(180, 'Enable Check/Money Order Module', 'MODULE_PAYMENT_MONEYORDER_STATUS', 'True', 'Do you want to accept Check/Money Order payments?', 6, 1, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(181, 'Make Payable to:', 'MODULE_PAYMENT_MONEYORDER_PAYTO', 'the Store Owner/Website Name', 'Who should payments be made payable to?', 6, 1, NULL, '2014-10-27 13:41:15', NULL, NULL),
(182, 'Sort order of display.', 'MODULE_PAYMENT_MONEYORDER_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-10-27 13:41:15', NULL, NULL),
(183, 'Payment Zone', 'MODULE_PAYMENT_MONEYORDER_ZONE', '0', 'If a zone is selected, only enable this payment method for that zone.', 6, 2, NULL, '2014-10-27 13:41:15', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes('),
(184, 'Set Order Status', 'MODULE_PAYMENT_MONEYORDER_ORDER_STATUS_ID', '0', 'Set the status of orders made with this payment module to this value', 6, 0, NULL, '2014-10-27 13:41:15', 'zen_get_order_status_name', 'zen_cfg_pull_down_order_statuses('),
(185, 'Include Tax', 'MODULE_ORDER_TOTAL_GROUP_PRICING_INC_TAX', 'false', 'Include Tax value in amount before discount calculation?', 6, 6, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(186, 'This module is installed', 'MODULE_ORDER_TOTAL_GROUP_PRICING_STATUS', 'true', '', 6, 1, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''true''), '),
(187, 'Sort Order', 'MODULE_ORDER_TOTAL_GROUP_PRICING_SORT_ORDER', '290', 'Sort order of display.', 6, 2, NULL, '2014-10-27 13:41:15', NULL, NULL),
(188, 'Include Shipping', 'MODULE_ORDER_TOTAL_GROUP_PRICING_INC_SHIPPING', 'false', 'Include Shipping value in amount before discount calculation?', 6, 5, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(189, 'Re-calculate Tax', 'MODULE_ORDER_TOTAL_GROUP_PRICING_CALC_TAX', 'Standard', 'Re-Calculate Tax', 6, 7, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''None'', ''Standard'', ''Credit Note''), '),
(190, 'Tax Class', 'MODULE_ORDER_TOTAL_GROUP_PRICING_TAX_CLASS', '0', 'Use the following tax class when treating Group Discount as Credit Note.', 6, 0, NULL, '2014-10-27 13:41:15', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes('),
(191, 'Enable Flat Shipping', 'MODULE_SHIPPING_FLAT_STATUS', 'True', 'Do you want to offer flat rate shipping?', 6, 0, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(192, 'Shipping Cost', 'MODULE_SHIPPING_FLAT_COST', '5.00', 'The shipping cost for all orders using this shipping method.', 6, 0, NULL, '2014-10-27 13:41:15', NULL, NULL),
(193, 'Tax Class', 'MODULE_SHIPPING_FLAT_TAX_CLASS', '0', 'Use the following tax class on the shipping fee.', 6, 0, NULL, '2014-10-27 13:41:15', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes('),
(194, 'Tax Basis', 'MODULE_SHIPPING_FLAT_TAX_BASIS', 'Shipping', 'On what basis is Shipping Tax calculated. Options are<br />Shipping - Based on customers Shipping Address<br />Billing Based on customers Billing address<br />Store - Based on Store address if Billing/Shipping Zone equals Store zone', 6, 0, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''Shipping'', ''Billing'', ''Store''), '),
(195, 'Shipping Zone', 'MODULE_SHIPPING_FLAT_ZONE', '0', 'If a zone is selected, only enable this shipping method for that zone.', 6, 0, NULL, '2014-10-27 13:41:15', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes('),
(196, 'Sort Order', 'MODULE_SHIPPING_FLAT_SORT_ORDER', '0', 'Sort order of display.', 6, 0, NULL, '2014-10-27 13:41:15', NULL, NULL),
(197, 'Default Currency', 'DEFAULT_CURRENCY', 'USD', 'Default Currency', 6, 0, NULL, '2014-10-27 13:41:15', NULL, NULL),
(198, 'Default Language', 'DEFAULT_LANGUAGE', 'en', 'Default Language', 6, 0, NULL, '2014-10-27 13:41:15', NULL, NULL),
(199, 'Default Order Status For New Orders', 'DEFAULT_ORDERS_STATUS_ID', '1', 'When a new order is created, this order status will be assigned to it.', 6, 0, NULL, '2014-10-27 13:41:15', NULL, NULL),
(200, 'Admin configuration_key shows', 'ADMIN_CONFIGURATION_KEY_ON', '0', 'Manually switch to value of 1 to see the configuration_key name in configuration displays', 6, 0, NULL, '2014-10-27 13:41:15', NULL, NULL),
(201, 'Country of Origin', 'SHIPPING_ORIGIN_COUNTRY', '223', 'Select the country of origin to be used in shipping quotes.', 7, 1, NULL, '2014-10-27 13:41:15', 'zen_get_country_name', 'zen_cfg_pull_down_country_list('),
(202, 'Postal Code', 'SHIPPING_ORIGIN_ZIP', 'NONE', 'Enter the Postal Code (ZIP) of the Store to be used in shipping quotes. NOTE: For USA zip codes, only use your 5 digit zip code.', 7, 2, NULL, '2014-10-27 13:41:15', NULL, NULL),
(203, 'Enter the Maximum Package Weight you will ship', 'SHIPPING_MAX_WEIGHT', '50', 'Carriers have a max weight limit for a single package. This is a common one for all.', 7, 3, NULL, '2014-10-27 13:41:15', NULL, NULL),
(204, 'Package Tare Small to Medium - added percentage:weight', 'SHIPPING_BOX_WEIGHT', '0:3', 'What is the weight of typical packaging of small to medium packages?<br />Example: 10% + 1lb 10:1<br />10% + 0lbs 10:0<br />0% + 5lbs 0:5<br />0% + 0lbs 0:0', 7, 4, NULL, '2014-10-27 13:41:15', NULL, NULL),
(205, 'Larger packages - added packaging percentage:weight', 'SHIPPING_BOX_PADDING', '10:0', 'What is the weight of typical packaging for Large packages?<br />Example: 10% + 1lb 10:1<br />10% + 0lbs 10:0<br />0% + 5lbs 0:5<br />0% + 0lbs 0:0', 7, 5, NULL, '2014-10-27 13:41:15', NULL, NULL),
(206, 'Display Number of Boxes and Weight Status', 'SHIPPING_BOX_WEIGHT_DISPLAY', '3', 'Display Shipping Weight and Number of Boxes?<br /><br />0= off<br />1= Boxes Only<br />2= Weight Only<br />3= Both Boxes and Weight', 7, 15, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''), '),
(207, 'Shipping Estimator Display Settings for Shopping Cart', 'SHOW_SHIPPING_ESTIMATOR_BUTTON', '1', '<br />0= Off<br />1= Display as Button on Shopping Cart<br />2= Display as Listing on Shopping Cart Page', 7, 20, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(208, 'Display Order Comments on Admin Invoice', 'ORDER_COMMENTS_INVOICE', '1', 'Do you want to display the Order Comments on the Admin Invoice?<br />0= OFF<br />1= First Comment by Customer only<br />2= All Comments for the Order', 7, 25, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(209, 'Display Order Comments on Admin Packing Slip', 'ORDER_COMMENTS_PACKING_SLIP', '1', 'Do you want to display the Order Comments on the Admin Packing Slip?<br />0= OFF<br />1= First Comment by Customer only<br />2= All Comments for the Order', 7, 26, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(210, 'Order Free Shipping 0 Weight Status', 'ORDER_WEIGHT_ZERO_STATUS', '0', 'If there is no weight to the order, does the order have Free Shipping?<br />0= no<br />1= yes<br /><br />Note: When using Free Shipping, Enable the Free Shipping Module this will only show when shipping is free.', 7, 15, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(211, 'Display Product Image', 'PRODUCT_LIST_IMAGE', '1', 'Do you want to display the Product Image?', 8, 1, NULL, '2014-10-27 13:41:15', NULL, NULL),
(212, 'Display Product Manufacturer Name', 'PRODUCT_LIST_MANUFACTURER', '0', 'Do you want to display the Product Manufacturer Name?', 8, 2, NULL, '2014-10-27 13:41:15', NULL, NULL),
(213, 'Display Product Model', 'PRODUCT_LIST_MODEL', '0', 'Do you want to display the Product Model?', 8, 3, NULL, '2014-10-27 13:41:15', NULL, NULL),
(214, 'Display Product Name', 'PRODUCT_LIST_NAME', '2', 'Do you want to display the Product Name?', 8, 4, NULL, '2014-10-27 13:41:15', NULL, NULL),
(215, 'Display Product Price/Add to Cart', 'PRODUCT_LIST_PRICE', '3', 'Do you want to display the Product Price/Add to Cart', 8, 5, NULL, '2014-10-27 13:41:15', NULL, NULL);
INSERT INTO `configuration` (`configuration_id`, `configuration_title`, `configuration_key`, `configuration_value`, `configuration_description`, `configuration_group_id`, `sort_order`, `last_modified`, `date_added`, `use_function`, `set_function`) VALUES
(216, 'Display Product Quantity', 'PRODUCT_LIST_QUANTITY', '0', 'Do you want to display the Product Quantity?', 8, 6, NULL, '2014-10-27 13:41:15', NULL, NULL),
(217, 'Display Product Weight', 'PRODUCT_LIST_WEIGHT', '0', 'Do you want to display the Product Weight?', 8, 7, NULL, '2014-10-27 13:41:15', NULL, NULL),
(218, 'Display Product Price/Add to Cart Column Width', 'PRODUCTS_LIST_PRICE_WIDTH', '125', 'Define the width of the Price/Add to Cart column<br />Default= 125', 8, 8, NULL, '2014-10-27 13:41:15', NULL, NULL),
(219, 'Display Category/Manufacturer Filter (0=off; 1=on)', 'PRODUCT_LIST_FILTER', '1', 'Do you want to display the Category/Manufacturer Filter?', 8, 9, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(220, 'Prev/Next Split Page Navigation (1-top, 2-bottom, 3-both)', 'PREV_NEXT_BAR_LOCATION', '3', 'Sets the location of the Prev/Next Split Page Navigation', 8, 10, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''1'', ''2'', ''3''), '),
(221, 'Display Product Listing Default Sort Order', 'PRODUCT_LISTING_DEFAULT_SORT_ORDER', '', 'Product Listing Default sort order?<br />NOTE: Leave Blank for Product Sort Order. Sort the Product Listing in the order you wish for the default display to start in to get the sort order setting. Example: 2a', 8, 15, NULL, '2014-10-27 13:41:15', NULL, NULL),
(222, 'Display Product Add to Cart Button (0=off; 1=on; 2=on with Qty Box per Product)', 'PRODUCT_LIST_PRICE_BUY_NOW', '1', 'Do you want to display the Add to Cart Button?<br /><br /><strong>NOTE:</strong> Turn OFF Display Multiple Products Qty Box Status to use Option 2 on with Qty Box per Product', 8, 20, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(223, 'Display Multiple Products Qty Box Status and Set Button Location', 'PRODUCT_LISTING_MULTIPLE_ADD_TO_CART', '3', 'Do you want to display Add Multiple Products Qty Box and Set Button Location?<br />0= off<br />1= Top<br />2= Bottom<br />3= Both', 8, 25, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''), '),
(224, 'Display Product Description', 'PRODUCT_LIST_DESCRIPTION', '400', 'Do you want to display the Product Description?<br /><br />0= OFF<br />150= Suggested Length, or enter the maximum number of characters to display', 8, 30, '2015-01-05 15:19:43', '2014-10-27 13:41:15', NULL, NULL),
(225, 'Product Listing Ascending Sort Order', 'PRODUCT_LIST_SORT_ORDER_ASCENDING', '+', 'What do you want to use to indicate Sort Order Ascending?<br />Default = +', 8, 40, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_textarea_small('),
(226, 'Product Listing Descending Sort Order', 'PRODUCT_LIST_SORT_ORDER_DESCENDING', '-', 'What do you want to use to indicate Sort Order Descending?<br />Default = -', 8, 41, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_textarea_small('),
(227, 'Include Product Listing Alpha Sorter Dropdown', 'PRODUCT_LIST_ALPHA_SORTER', 'true', 'Do you want to include an Alpha Filter dropdown on the Product Listing?', 8, 50, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(228, 'Include Product Listing Sub Categories Image', 'PRODUCT_LIST_CATEGORIES_IMAGE_STATUS', 'true', 'Do you want to include the Sub Categories Image on the Product Listing?', 8, 52, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(229, 'Include Product Listing Top Categories Image', 'PRODUCT_LIST_CATEGORIES_IMAGE_STATUS_TOP', 'true', 'Do you want to include the Top Categories Image on the Product Listing?', 8, 53, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(230, 'Show SubCategories on Main Page while navigating', 'PRODUCT_LIST_CATEGORY_ROW_STATUS', '1', 'Show Sub-Categories on Main Page while navigating through Categories<br /><br />0= off<br />1= on', 8, 60, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(231, 'Check stock level', 'STOCK_CHECK', 'true', 'Check to see if sufficent stock is available', 9, 1, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(232, 'Subtract stock', 'STOCK_LIMITED', 'true', 'Subtract product in stock by product orders', 9, 2, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(233, 'Allow Checkout', 'STOCK_ALLOW_CHECKOUT', 'true', 'Allow customer to checkout even if there is insufficient stock', 9, 3, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(234, 'Mark product out of stock', 'STOCK_MARK_PRODUCT_OUT_OF_STOCK', '***', 'Display something on screen so customer can see which product has insufficient stock', 9, 4, NULL, '2014-10-27 13:41:15', NULL, NULL),
(235, 'Stock Re-order level', 'STOCK_REORDER_LEVEL', '5', 'Define when stock needs to be re-ordered', 9, 5, NULL, '2014-10-27 13:41:15', NULL, NULL),
(236, 'Products status in Catalog when out of stock should be set to', 'SHOW_PRODUCTS_SOLD_OUT', '0', 'Show Products when out of stock<br /><br />0= set product status to OFF<br />1= leave product status ON', 9, 10, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(237, 'Show Sold Out Image in place of Add to Cart', 'SHOW_PRODUCTS_SOLD_OUT_IMAGE', '1', 'Show Sold Out Image instead of Add to Cart Button<br /><br />0= off<br />1= on', 9, 11, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(238, 'Product Quantity Decimals', 'QUANTITY_DECIMALS', '0', 'Allow how many decimals on Quantity<br /><br />0= off', 9, 15, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''), '),
(239, 'Show Shopping Cart - Delete Checkboxes or Delete Button', 'SHOW_SHOPPING_CART_DELETE', '3', 'Show on Shopping Cart Delete Button and/or Checkboxes<br /><br />1= Delete Button Only<br />2= Checkbox Only<br />3= Both Delete Button and Checkbox', 9, 20, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''1'', ''2'', ''3''), '),
(240, 'Show Shopping Cart - Update Cart Button Location', 'SHOW_SHOPPING_CART_UPDATE', '3', 'Show on Shopping Cart Update Cart Button Location as:<br /><br />1= Next to each Qty Box<br />2= Below all Products<br />3= Both Next to each Qty Box and Below all Products', 9, 22, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''1'', ''2'', ''3''), '),
(241, 'Show New Products on empty Shopping Cart Page', 'SHOW_SHOPPING_CART_EMPTY_NEW_PRODUCTS', '1', 'Show New Products on empty Shopping Cart Page<br />0= off or set the sort order', 9, 30, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(242, 'Show Featured Products on empty Shopping Cart Page', 'SHOW_SHOPPING_CART_EMPTY_FEATURED_PRODUCTS', '2', 'Show Featured Products on empty Shopping Cart Page<br />0= off or set the sort order', 9, 31, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(243, 'Show Special Products on empty Shopping Cart Page', 'SHOW_SHOPPING_CART_EMPTY_SPECIALS_PRODUCTS', '3', 'Show Special Products on empty Shopping Cart Page<br />0= off or set the sort order', 9, 32, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(244, 'Show Upcoming Products on empty Shopping Cart Page', 'SHOW_SHOPPING_CART_EMPTY_UPCOMING', '4', 'Show Upcoming Products on empty Shopping Cart Page<br />0= off or set the sort order', 9, 33, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(245, 'Show Notice of Combining Shopping Cart on Login', 'SHOW_SHOPPING_CART_COMBINED', '1', 'When a customer logs in and has a previously stored shopping cart, the products are combined with the existing shopping cart.<br /><br />Do you wish to display a Notice to the customer?<br /><br />0= OFF, do not display a notice<br />1= Yes show notice and go to shopping cart<br />2= Yes show notice, but do not go to shopping cart', 9, 35, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(246, 'Log Page Parse Time', 'STORE_PAGE_PARSE_TIME', 'false', 'Record (to a log file) the time it takes to parse a page', 10, 1, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(247, 'Log Destination', 'STORE_PAGE_PARSE_TIME_LOG', 'D:/wamp_2/www/zen-860/cache/page_parse_time.log', 'Directory and filename of the page parse time log', 10, 2, NULL, '2014-10-27 13:41:15', NULL, NULL),
(248, 'Log Date Format', 'STORE_PARSE_DATE_TIME_FORMAT', '%d/%m/%Y %H:%M:%S', 'The date format', 10, 3, NULL, '2014-10-27 13:41:15', NULL, NULL),
(249, 'Display The Page Parse Time', 'DISPLAY_PAGE_PARSE_TIME', 'false', 'Display the page parse time on the bottom of each page<br />(Note: This DISPLAYS them. You do NOT need to LOG them to merely display them on your site.)', 10, 4, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(250, 'Log Database Queries', 'STORE_DB_TRANSACTIONS', 'false', 'Record the database queries to files in the system /logs/ folder. USE WITH CAUTION. This can seriously degrade your site performance and blow out your disk space storage quotas.<br><strong>Enabling this makes your site NON-COMPLIANT with PCI DSS rules, thus invalidating any certification.</strong>', 10, 5, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(251, 'E-Mail Transport Method', 'EMAIL_TRANSPORT', 'PHP', 'Defines the method for sending mail.<br /><strong>PHP</strong> is the default, and uses built-in PHP wrappers for processing.<br />Servers running on Windows and MacOS should change this setting to <strong>SMTP</strong>.<br /><br /><strong>SMTPAUTH</strong> should only be used if your server requires SMTP authorization to send messages. You must also configure your SMTPAUTH settings in the appropriate fields in this admin section.<br /><br /><strong>sendmail</strong> is for linux/unix hosts using the sendmail program on the server<br /><strong>"sendmail-f"</strong> is only for servers which require the use of the -f parameter to send mail. This is a security setting often used to prevent spoofing. Will cause errors if your host mailserver is not configured to use it.<br /><br /><strong>Qmail</strong> is used for linux/unix hosts running Qmail as sendmail wrapper at /var/qmail/bin/sendmail.', 12, 1, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''PHP'', ''sendmail'', ''sendmail-f'', ''smtp'', ''smtpauth'', ''Qmail''),'),
(252, 'SMTP Email Account Mailbox', 'EMAIL_SMTPAUTH_MAILBOX', 'YourEmailAccountNameHere', 'Enter the mailbox account name (me@mydomain.com) supplied by your host. This is the account name that your host requires for SMTP authentication.<br />Only required if using SMTP Authentication for email.', 12, 101, NULL, '2014-10-27 13:41:15', NULL, NULL),
(253, 'SMTP Email Account Password', 'EMAIL_SMTPAUTH_PASSWORD', 'YourPasswordHere', 'Enter the password for your SMTP mailbox. <br />Only required if using SMTP Authentication for email.', 12, 101, NULL, '2014-10-27 13:41:15', 'zen_cfg_password_display', NULL),
(254, 'SMTP Email Mail Host', 'EMAIL_SMTPAUTH_MAIL_SERVER', 'mail.EnterYourDomain.com', 'Enter the DNS name of your SMTP mail server.<br />ie: mail.mydomain.com<br />or 55.66.77.88<br />Only required if using SMTP Authentication for email.', 12, 101, NULL, '2014-10-27 13:41:15', NULL, NULL),
(255, 'SMTP Email Mail Server Port', 'EMAIL_SMTPAUTH_MAIL_SERVER_PORT', '25', 'Enter the IP port number that your SMTP mailserver operates on.<br />Only required if using SMTP Authentication for email.', 12, 101, NULL, '2014-10-27 13:41:15', NULL, NULL),
(256, 'E-Mail Linefeeds', 'EMAIL_LINEFEED', 'LF', 'Defines the character sequence used to separate mail headers.', 12, 2, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''LF'', ''CRLF''),'),
(257, 'Enable HTML Emails?', 'EMAIL_USE_HTML', 'false', 'Send emails in HTML format if recipient has enabled it in their preferences.', 12, 3, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(258, 'Verify E-Mail Addresses Through DNS', 'ENTRY_EMAIL_ADDRESS_CHECK', 'false', 'Verify e-mail address through a DNS server', 6, 6, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(259, 'Send E-Mails', 'SEND_EMAILS', 'true', 'Send out e-mails', 12, 5, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(260, 'Email Archiving Active?', 'EMAIL_ARCHIVE', 'false', 'If you wish to have email messages archived/stored when sent, set this to "true".', 12, 6, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(261, 'E-Mail Friendly-Errors', 'EMAIL_FRIENDLY_ERRORS', 'true', 'Do you want to display friendly errors if emails fail?  Setting this to false will display PHP errors and likely cause the script to fail. Only set to false while troubleshooting, and true for a live shop.', 12, 7, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(262, 'Email Address (Displayed to Contact you)', 'STORE_OWNER_EMAIL_ADDRESS', 'admin@tm.com', 'Email address of Store Owner.  Used as "display only" when informing customers of how to contact you.', 12, 10, NULL, '2014-10-27 13:41:15', NULL, NULL),
(263, 'Email Address (sent FROM)', 'EMAIL_FROM', 'admin@tm.com', 'Address from which email messages will be "sent" by default. Can be over-ridden at compose-time in admin modules.', 12, 11, NULL, '2014-10-27 13:41:15', NULL, NULL),
(264, 'Emails must send from known domain?', 'EMAIL_SEND_MUST_BE_STORE', 'Yes', 'Does your mailserver require that all outgoing emails have their "from" address match a known domain that exists on your webserver?<br /><br />This is often required in order to prevent spoofing and spam broadcasts.  If set to Yes, this will cause the email address (sent FROM) to be used as the "from" address on all outgoing mail.', 12, 11, NULL, '0001-01-01 00:00:00', NULL, 'zen_cfg_select_option(array(''No'', ''Yes''), '),
(265, 'Email Admin Format?', 'ADMIN_EXTRA_EMAIL_FORMAT', 'TEXT', 'Please select the Admin extra email format (Note: Enable HTML Emails must be on for HTML option to work)', 12, 12, NULL, '0001-01-01 00:00:00', NULL, 'zen_cfg_select_option(array(''TEXT'', ''HTML''), '),
(266, 'Send Copy of Order Confirmation Emails To', 'SEND_EXTRA_ORDER_EMAILS_TO', 'admin@tm.com', 'Send COPIES of order confirmation emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', 12, 12, NULL, '2014-10-27 13:41:15', NULL, NULL),
(267, 'Send Copy of Create Account Emails To - Status', 'SEND_EXTRA_CREATE_ACCOUNT_EMAILS_TO_STATUS', '0', 'Send copy of Create Account Status<br />0= off 1= on', 12, 13, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(268, 'Send Copy of Create Account Emails To', 'SEND_EXTRA_CREATE_ACCOUNT_EMAILS_TO', 'admin@tm.com', 'Send copy of Create Account emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', 12, 14, NULL, '2014-10-27 13:41:15', NULL, NULL),
(269, 'Send Copy of Customer GV Send Emails To - Status', 'SEND_EXTRA_GV_CUSTOMER_EMAILS_TO_STATUS', '0', 'Send copy of Customer GV Send Status<br />0= off 1= on', 12, 17, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(270, 'Send Copy of Customer GV Send Emails To', 'SEND_EXTRA_GV_CUSTOMER_EMAILS_TO', 'admin@tm.com', 'Send copy of Customer GV Send emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', 12, 18, NULL, '2014-10-27 13:41:15', NULL, NULL),
(271, 'Send Copy of Admin GV Mail Emails To - Status', 'SEND_EXTRA_GV_ADMIN_EMAILS_TO_STATUS', '0', 'Send copy of Admin GV Mail Status<br />0= off 1= on', 12, 19, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(272, 'Send Copy of Customer Admin GV Mail Emails To', 'SEND_EXTRA_GV_ADMIN_EMAILS_TO', 'admin@tm.com', 'Send copy of Admin GV Mail emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', 12, 20, NULL, '2014-10-27 13:41:15', NULL, NULL),
(273, 'Send Copy of Admin Discount Coupon Mail Emails To - Status', 'SEND_EXTRA_DISCOUNT_COUPON_ADMIN_EMAILS_TO_STATUS', '0', 'Send copy of Admin Discount Coupon Mail Status<br />0= off 1= on', 12, 21, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(274, 'Send Copy of Customer Admin Discount Coupon Mail Emails To', 'SEND_EXTRA_DISCOUNT_COUPON_ADMIN_EMAILS_TO', 'admin@tm.com', 'Send copy of Admin Discount Coupon Mail emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', 12, 22, NULL, '2014-10-27 13:41:15', NULL, NULL),
(275, 'Send Copy of Admin Orders Status Emails To - Status', 'SEND_EXTRA_ORDERS_STATUS_ADMIN_EMAILS_TO_STATUS', '0', 'Send copy of Admin Orders Status Status<br />0= off 1= on', 12, 23, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(276, 'Send Copy of Admin Orders Status Emails To', 'SEND_EXTRA_ORDERS_STATUS_ADMIN_EMAILS_TO', 'admin@tm.com', 'Send copy of Admin Orders Status emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', 12, 24, NULL, '2014-10-27 13:41:15', NULL, NULL),
(277, 'Send Notice of Pending Reviews Emails To - Status', 'SEND_EXTRA_REVIEW_NOTIFICATION_EMAILS_TO_STATUS', '0', 'Send copy of Pending Reviews Status<br />0= off 1= on', 12, 25, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(278, 'Send Notice of Pending Reviews Emails To', 'SEND_EXTRA_REVIEW_NOTIFICATION_EMAILS_TO', 'admin@tm.com', 'Send copy of Pending Reviews emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', 12, 26, NULL, '2014-10-27 13:41:15', NULL, NULL),
(279, 'Set "Contact Us" Email Dropdown List', 'CONTACT_US_LIST', '', 'On the "Contact Us" Page, set the list of email addresses , in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', 12, 40, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_textarea('),
(280, 'Contact Us - Show Store Name and Address', 'CONTACT_US_STORE_NAME_ADDRESS', '1', 'Include Store Name and Address<br />0= off 1= on', 12, 50, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(281, 'Send Low Stock Emails', 'SEND_LOWSTOCK_EMAIL', '0', 'When stock level is at or below low stock level send an email<br />0= off<br />1= on', 12, 60, '2014-10-27 13:41:15', '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(282, 'Send Low Stock Emails To', 'SEND_EXTRA_LOW_STOCK_EMAILS_TO', 'admin@tm.com', 'When stock level is at or below low stock level send an email to this address, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', 12, 61, NULL, '2014-10-27 13:41:15', NULL, NULL),
(283, 'Display "Newsletter Unsubscribe" Link?', 'SHOW_NEWSLETTER_UNSUBSCRIBE_LINK', 'true', 'Show "Newsletter Unsubscribe" link in the "Information" side-box?', 12, 70, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(284, 'Audience-Select Count Display', 'AUDIENCE_SELECT_DISPLAY_COUNTS', 'true', 'When displaying lists of available audiences/recipients, should the recipients-count be included? <br /><em>(This may make things slower if you have a lot of customers or complex audience queries)</em>', 12, 90, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(285, 'Enable Downloads', 'DOWNLOAD_ENABLED', 'true', 'Enable the products download functions.', 13, 1, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(286, 'Download by Redirect', 'DOWNLOAD_BY_REDIRECT', 'true', 'Use browser redirection for download. Disable on non-Unix systems.<br /><br />Note: Set /pub to 777 when redirect is true', 13, 2, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(287, 'Download by streaming', 'DOWNLOAD_IN_CHUNKS', 'false', 'If download-by-redirect is disabled, and your PHP memory_limit setting is under 8 MB, you might need to enable this setting so that files are streamed in smaller segments to the browser.<br /><br />Has no effect if Download By Redirect is enabled.', 13, 2, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(288, 'Download Expiration (Number of Days)', 'DOWNLOAD_MAX_DAYS', '7', 'Set number of days before the download link expires. 0 means no limit.', 13, 3, NULL, '2014-10-27 13:41:15', NULL, ''),
(289, 'Number of Downloads Allowed - Per Product', 'DOWNLOAD_MAX_COUNT', '5', 'Set the maximum number of downloads. 0 means no download authorized.', 13, 4, NULL, '2014-10-27 13:41:15', NULL, ''),
(290, 'Downloads Controller Update Status Value', 'DOWNLOADS_ORDERS_STATUS_UPDATED_VALUE', '4', 'What orders_status resets the Download days and Max Downloads - Default is 4', 13, 10, '2014-10-27 13:41:15', '2014-10-27 13:41:15', NULL, NULL),
(291, 'Downloads Controller Order Status Value >= lower value', 'DOWNLOADS_CONTROLLER_ORDERS_STATUS', '2', 'Downloads Controller Order Status Value - Default >= 2<br /><br />Downloads are available for checkout based on the orders status. Orders with orders status greater than this value will be available for download. The orders status is set for an order by the Payment Modules. Set the lower range for this range.', 13, 12, '2014-10-27 13:41:15', '2014-10-27 13:41:15', NULL, NULL),
(292, 'Downloads Controller Order Status Value <= upper value', 'DOWNLOADS_CONTROLLER_ORDERS_STATUS_END', '4', 'Downloads Controller Order Status Value - Default <= 4<br /><br />Downloads are available for checkout based on the orders status. Orders with orders status less than this value will be available for download. The orders status is set for an order by the Payment Modules.  Set the upper range for this range.', 13, 13, '2014-10-27 13:41:15', '2014-10-27 13:41:15', NULL, NULL),
(293, 'Enable Price Factor', 'ATTRIBUTES_ENABLED_PRICE_FACTOR', 'true', 'Enable the Attributes Price Factor.', 13, 25, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(294, 'Enable Qty Price Discount', 'ATTRIBUTES_ENABLED_QTY_PRICES', 'true', 'Enable the Attributes Quantity Price Discounts.', 13, 26, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(295, 'Enable Attribute Images', 'ATTRIBUTES_ENABLED_IMAGES', 'true', 'Enable the Attributes Images.', 13, 28, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(296, 'Enable Text Pricing by word or letter', 'ATTRIBUTES_ENABLED_TEXT_PRICES', 'true', 'Enable the Attributes Text Pricing by word or letter.', 13, 35, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(297, 'Text Pricing - Spaces are Free', 'TEXT_SPACES_FREE', '1', 'On Text pricing Spaces are Free<br /><br />0= off 1= on', 13, 36, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(298, 'Read Only option type - Ignore for Add to Cart', 'PRODUCTS_OPTIONS_TYPE_READONLY_IGNORED', '1', 'When a Product only uses READONLY attributes, should the Add to Cart button be On or Off?<br />0= OFF<br />1= ON', 13, 37, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(299, 'Enable GZip Compression', 'GZIP_LEVEL', '0', '0= off 1= on', 14, 1, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(300, 'Session Directory', 'SESSION_WRITE_DIRECTORY', 'D:\\wamp\\www\\2015\\zen\\zen-860/cache', 'This should point to the folder specified in your DIR_FS_SQL_CACHE setting in your configure.php files.', 15, 1, NULL, '2014-10-27 13:41:15', NULL, NULL),
(301, 'Cookie Domain', 'SESSION_USE_FQDN', 'False', 'If True the full domain name will be used to store the cookie, e.g. www.mydomain.com. If False only a partial domain name will be used, e.g. mydomain.com. If you are unsure about this, always leave set to true.', 15, 2, '2015-04-14 11:56:25', '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(302, 'Force Cookie Use', 'SESSION_FORCE_COOKIE_USE', 'False', 'Force the use of sessions when cookies are only enabled.', 15, 2, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(303, 'Check SSL Session ID', 'SESSION_CHECK_SSL_SESSION_ID', 'False', 'Validate the SSL_SESSION_ID on every secure HTTPS page request.', 15, 3, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(304, 'Check User Agent', 'SESSION_CHECK_USER_AGENT', 'False', 'Validate the clients browser user agent on every page request.', 15, 4, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(305, 'Check IP Address', 'SESSION_CHECK_IP_ADDRESS', 'False', 'Validate the clients IP address on every page request.', 15, 5, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(306, 'Prevent Spider Sessions', 'SESSION_BLOCK_SPIDERS', 'False', 'Prevent known spiders from starting a session.', 15, 6, '2015-04-14 11:56:04', '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(307, 'Recreate Session', 'SESSION_RECREATE', 'False', 'Recreate the session to generate a new session ID when the customer logs on or creates an account (PHP >=4.1 needed).', 15, 7, '2015-04-14 11:56:09', '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(308, 'IP to Host Conversion Status', 'SESSION_IP_TO_HOST_ADDRESS', 'false', 'Convert IP Address to Host Address<br /><br />Note: on some servers this can slow down the initial start of a session or execution of Emails', 15, 10, '2015-04-14 11:56:13', '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(309, 'Length of the redeem code', 'SECURITY_CODE_LENGTH', '10', 'Enter the length of the redeem code<br />The longer the more secure', 16, 1, NULL, '2014-10-27 13:41:15', NULL, NULL),
(310, 'Default Order Status For Zero Balance Orders', 'DEFAULT_ZERO_BALANCE_ORDERS_STATUS_ID', '2', 'When an order''s balance is zero, this order status will be assigned to it.', 16, 0, NULL, '2014-10-27 13:41:15', 'zen_get_order_status_name', 'zen_cfg_pull_down_order_statuses('),
(311, 'New Signup Discount Coupon ID#', 'NEW_SIGNUP_DISCOUNT_COUPON', '', 'Select the coupon<br />', 16, 75, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_coupon_id('),
(312, 'New Signup Gift Voucher Amount', 'NEW_SIGNUP_GIFT_VOUCHER_AMOUNT', '', 'Leave blank for none<br />Or enter an amount ie. 10 for $10.00', 16, 76, NULL, '2014-10-27 13:41:15', NULL, NULL),
(313, 'Maximum Discount Coupons Per Page', 'MAX_DISPLAY_SEARCH_RESULTS_DISCOUNT_COUPONS', '20', 'Number of Discount Coupons to list per Page', 16, 81, NULL, '2014-10-27 13:41:15', NULL, NULL),
(314, 'Maximum Discount Coupon Report Results Per Page', 'MAX_DISPLAY_SEARCH_RESULTS_DISCOUNT_COUPONS_REPORTS', '20', 'Number of Discount Coupons to list on Reports Page', 16, 81, NULL, '2014-10-27 13:41:15', NULL, NULL),
(315, 'Credit Card Enable Status - VISA', 'CC_ENABLED_VISA', '1', 'Accept VISA 0= off 1= on', 17, 1, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(316, 'Credit Card Enable Status - MasterCard', 'CC_ENABLED_MC', '1', 'Accept MasterCard 0= off 1= on', 17, 2, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(317, 'Credit Card Enable Status - AmericanExpress', 'CC_ENABLED_AMEX', '0', 'Accept AmericanExpress 0= off 1= on', 17, 3, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(318, 'Credit Card Enable Status - Diners Club', 'CC_ENABLED_DINERS_CLUB', '0', 'Accept Diners Club 0= off 1= on', 17, 4, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(319, 'Credit Card Enable Status - Discover Card', 'CC_ENABLED_DISCOVER', '0', 'Accept Discover Card 0= off 1= on', 17, 5, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(320, 'Credit Card Enable Status - JCB', 'CC_ENABLED_JCB', '0', 'Accept JCB 0= off 1= on', 17, 6, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(321, 'Credit Card Enable Status - AUSTRALIAN BANKCARD', 'CC_ENABLED_AUSTRALIAN_BANKCARD', '0', 'Accept AUSTRALIAN BANKCARD 0= off 1= on', 17, 7, NULL, '2014-10-27 13:41:15', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(322, 'Credit Card Enable Status - SOLO', 'CC_ENABLED_SOLO', '0', 'Accept SOLO Card 0= off 1= on', 17, 8, NULL, '2014-10-27 13:41:16', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(323, 'Credit Card Enable Status - Switch', 'CC_ENABLED_SWITCH', '0', 'Accept SWITCH Card 0= off 1= on', 17, 9, NULL, '2014-10-27 13:41:16', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(324, 'Credit Card Enable Status - Maestro', 'CC_ENABLED_MAESTRO', '0', 'Accept MAESTRO Card 0= off 1= on', 17, 10, NULL, '2014-10-27 13:41:16', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(325, 'Credit Card Enabled - Show on Payment', 'SHOW_ACCEPTED_CREDIT_CARDS', '0', 'Show accepted credit cards on Payment page?<br />0= off<br />1= As Text<br />2= As Images<br /><br />Note: images and text must be defined in both the database and language file for specific credit card types.', 17, 50, NULL, '2014-10-27 13:41:16', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(326, 'This module is installed', 'MODULE_ORDER_TOTAL_GV_STATUS', 'true', '', 6, 1, NULL, '2003-10-30 22:16:40', NULL, 'zen_cfg_select_option(array(''true''),'),
(327, 'Sort Order', 'MODULE_ORDER_TOTAL_GV_SORT_ORDER', '840', 'Sort order of display.', 6, 2, NULL, '2003-10-30 22:16:40', NULL, NULL),
(328, 'Queue Purchases', 'MODULE_ORDER_TOTAL_GV_QUEUE', 'true', 'Do you want to queue purchases of the Gift Voucher?', 6, 3, NULL, '2003-10-30 22:16:40', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(329, 'Include Shipping', 'MODULE_ORDER_TOTAL_GV_INC_SHIPPING', 'true', 'Include Shipping in calculation', 6, 5, NULL, '2003-10-30 22:16:40', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(330, 'Include Tax', 'MODULE_ORDER_TOTAL_GV_INC_TAX', 'true', 'Include Tax in calculation.', 6, 6, NULL, '2003-10-30 22:16:40', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(331, 'Re-calculate Tax', 'MODULE_ORDER_TOTAL_GV_CALC_TAX', 'None', 'Re-Calculate Tax', 6, 7, NULL, '2003-10-30 22:16:40', NULL, 'zen_cfg_select_option(array(''None'', ''Standard'', ''Credit Note''),'),
(332, 'Tax Class', 'MODULE_ORDER_TOTAL_GV_TAX_CLASS', '0', 'Use the following tax class when treating Gift Voucher as Credit Note.', 6, 0, NULL, '2003-10-30 22:16:40', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes('),
(333, 'Credit including Tax', 'MODULE_ORDER_TOTAL_GV_CREDIT_TAX', 'false', 'Add tax to purchased Gift Voucher when crediting to Account', 6, 8, NULL, '2003-10-30 22:16:40', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(334, 'Set Order Status', 'MODULE_ORDER_TOTAL_GV_ORDER_STATUS_ID', '0', 'Set the status of orders made where GV covers full payment', 6, 0, NULL, '2014-10-27 13:41:16', 'zen_get_order_status_name', 'zen_cfg_pull_down_order_statuses('),
(335, 'This module is installed', 'MODULE_ORDER_TOTAL_LOWORDERFEE_STATUS', 'true', '', 6, 1, NULL, '2003-10-30 22:16:43', NULL, 'zen_cfg_select_option(array(''true''),'),
(336, 'Sort Order', 'MODULE_ORDER_TOTAL_LOWORDERFEE_SORT_ORDER', '400', 'Sort order of display.', 6, 2, NULL, '2003-10-30 22:16:43', NULL, NULL),
(337, 'Allow Low Order Fee', 'MODULE_ORDER_TOTAL_LOWORDERFEE_LOW_ORDER_FEE', 'false', 'Do you want to allow low order fees?', 6, 3, NULL, '2003-10-30 22:16:43', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(338, 'Order Fee For Orders Under', 'MODULE_ORDER_TOTAL_LOWORDERFEE_ORDER_UNDER', '50', 'Add the low order fee to orders under this amount.', 6, 4, NULL, '2003-10-30 22:16:43', 'currencies->format', NULL),
(339, 'Order Fee', 'MODULE_ORDER_TOTAL_LOWORDERFEE_FEE', '5', 'For Percentage Calculation - include a % Example: 10%<br />For a flat amount just enter the amount - Example: 5 for $5.00', 6, 5, NULL, '2003-10-30 22:16:43', '', NULL),
(340, 'Attach Low Order Fee On Orders Made', 'MODULE_ORDER_TOTAL_LOWORDERFEE_DESTINATION', 'both', 'Attach low order fee for orders sent to the set destination.', 6, 6, NULL, '2003-10-30 22:16:43', NULL, 'zen_cfg_select_option(array(''national'', ''international'', ''both''),'),
(341, 'Tax Class', 'MODULE_ORDER_TOTAL_LOWORDERFEE_TAX_CLASS', '0', 'Use the following tax class on the low order fee.', 6, 7, NULL, '2003-10-30 22:16:43', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes('),
(342, 'No Low Order Fee on Virtual Products', 'MODULE_ORDER_TOTAL_LOWORDERFEE_VIRTUAL', 'false', 'Do not charge Low Order Fee when cart is Virtual Products Only', 6, 8, NULL, '2004-04-20 22:16:43', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(343, 'No Low Order Fee on Gift Vouchers', 'MODULE_ORDER_TOTAL_LOWORDERFEE_GV', 'false', 'Do not charge Low Order Fee when cart is Gift Vouchers Only', 6, 9, NULL, '2004-04-20 22:16:43', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(344, 'This module is installed', 'MODULE_ORDER_TOTAL_SHIPPING_STATUS', 'true', '', 6, 1, NULL, '2003-10-30 22:16:46', NULL, 'zen_cfg_select_option(array(''true''),'),
(345, 'Sort Order', 'MODULE_ORDER_TOTAL_SHIPPING_SORT_ORDER', '200', 'Sort order of display.', 6, 2, NULL, '2003-10-30 22:16:46', NULL, NULL),
(346, 'Allow Free Shipping', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING', 'false', 'Do you want to allow free shipping?', 6, 3, NULL, '2003-10-30 22:16:46', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(347, 'Free Shipping For Orders Over', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING_OVER', '50', 'Provide free shipping for orders over the set amount.', 6, 4, NULL, '2003-10-30 22:16:46', 'currencies->format', NULL),
(348, 'Provide Free Shipping For Orders Made', 'MODULE_ORDER_TOTAL_SHIPPING_DESTINATION', 'national', 'Provide free shipping for orders sent to the set destination.', 6, 5, NULL, '2003-10-30 22:16:46', NULL, 'zen_cfg_select_option(array(''national'', ''international'', ''both''),'),
(349, 'This module is installed', 'MODULE_ORDER_TOTAL_SUBTOTAL_STATUS', 'true', '', 6, 1, NULL, '2003-10-30 22:16:49', NULL, 'zen_cfg_select_option(array(''true''),'),
(350, 'Sort Order', 'MODULE_ORDER_TOTAL_SUBTOTAL_SORT_ORDER', '100', 'Sort order of display.', 6, 2, NULL, '2003-10-30 22:16:49', NULL, NULL),
(351, 'This module is installed', 'MODULE_ORDER_TOTAL_TAX_STATUS', 'true', '', 6, 1, NULL, '2003-10-30 22:16:52', NULL, 'zen_cfg_select_option(array(''true''),'),
(352, 'Sort Order', 'MODULE_ORDER_TOTAL_TAX_SORT_ORDER', '300', 'Sort order of display.', 6, 2, NULL, '2003-10-30 22:16:52', NULL, NULL),
(353, 'This module is installed', 'MODULE_ORDER_TOTAL_TOTAL_STATUS', 'true', '', 6, 1, NULL, '2003-10-30 22:16:55', NULL, 'zen_cfg_select_option(array(''true''),'),
(354, 'Sort Order', 'MODULE_ORDER_TOTAL_TOTAL_SORT_ORDER', '999', 'Sort order of display.', 6, 2, NULL, '2003-10-30 22:16:55', NULL, NULL),
(355, 'Tax Class', 'MODULE_ORDER_TOTAL_COUPON_TAX_CLASS', '0', 'Use the following tax class when treating Discount Coupon as Credit Note.', 6, 0, NULL, '2003-10-30 22:16:36', 'zen_get_tax_class_title', 'zen_cfg_pull_down_tax_classes('),
(356, 'Include Tax', 'MODULE_ORDER_TOTAL_COUPON_INC_TAX', 'false', 'Include Tax in calculation.', 6, 6, NULL, '2003-10-30 22:16:36', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(357, 'Sort Order', 'MODULE_ORDER_TOTAL_COUPON_SORT_ORDER', '280', 'Sort order of display.', 6, 2, NULL, '2003-10-30 22:16:36', NULL, NULL),
(358, 'Include Shipping', 'MODULE_ORDER_TOTAL_COUPON_INC_SHIPPING', 'false', 'Include Shipping in calculation', 6, 5, NULL, '2003-10-30 22:16:36', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(359, 'This module is installed', 'MODULE_ORDER_TOTAL_COUPON_STATUS', 'true', '', 6, 1, NULL, '2003-10-30 22:16:36', NULL, 'zen_cfg_select_option(array(''true''),'),
(360, 'Re-calculate Tax', 'MODULE_ORDER_TOTAL_COUPON_CALC_TAX', 'Standard', 'Re-Calculate Tax', 6, 7, NULL, '2003-10-30 22:16:36', NULL, 'zen_cfg_select_option(array(''None'', ''Standard'', ''Credit Note''),'),
(361, 'Admin Demo Status', 'ADMIN_DEMO', '0', 'Admin Demo should be on?<br />0= off 1= on', 6, 0, NULL, '2014-10-27 13:41:16', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(362, 'Product option type Select', 'PRODUCTS_OPTIONS_TYPE_SELECT', '0', 'The number representing the Select type of product option.', 6, NULL, '2014-10-27 13:41:16', '2014-10-27 13:41:16', NULL, NULL),
(363, 'Text product option type', 'PRODUCTS_OPTIONS_TYPE_TEXT', '1', 'Numeric value of the text product option type', 6, NULL, '2014-10-27 13:41:16', '2014-10-27 13:41:16', NULL, NULL),
(364, 'Radio button product option type', 'PRODUCTS_OPTIONS_TYPE_RADIO', '2', 'Numeric value of the radio button product option type', 6, NULL, '2014-10-27 13:41:16', '2014-10-27 13:41:16', NULL, NULL),
(365, 'Check box product option type', 'PRODUCTS_OPTIONS_TYPE_CHECKBOX', '3', 'Numeric value of the check box product option type', 6, NULL, '2014-10-27 13:41:16', '2014-10-27 13:41:16', NULL, NULL),
(366, 'File product option type', 'PRODUCTS_OPTIONS_TYPE_FILE', '4', 'Numeric value of the file product option type', 6, NULL, '2014-10-27 13:41:16', '2014-10-27 13:41:16', NULL, NULL),
(367, 'ID for text and file products options values', 'PRODUCTS_OPTIONS_VALUES_TEXT_ID', '0', 'Numeric value of the products_options_values_id used by the text and file attributes.', 6, NULL, '2014-10-27 13:41:16', '2014-10-27 13:41:16', NULL, NULL),
(368, 'Upload prefix', 'UPLOAD_PREFIX', 'upload_', 'Prefix used to differentiate between upload options and other options', 6, NULL, '2014-10-27 13:41:16', '2014-10-27 13:41:16', NULL, NULL),
(369, 'Text prefix', 'TEXT_PREFIX', 'txt_', 'Prefix used to differentiate between text option values and other option values', 6, NULL, '2014-10-27 13:41:16', '2014-10-27 13:41:16', NULL, NULL),
(370, 'Read Only option type', 'PRODUCTS_OPTIONS_TYPE_READONLY', '5', 'Numeric value of the file product option type', 6, NULL, '2014-10-27 13:41:16', '2014-10-27 13:41:16', NULL, NULL),
(371, 'login mode https', 'SSLPWSTATUSCHECK', '', 'System setting. Do not edit.', 6, 99, NULL, '2014-10-27 13:41:16', NULL, NULL),
(372, 'Products Info - Products Option Name Sort Order', 'PRODUCTS_OPTIONS_SORT_ORDER', '0', 'Sort order of Option Names for Products Info<br />0= Sort Order, Option Name<br />1= Option Name', 18, 35, '2014-10-27 13:41:16', '2014-10-27 13:41:16', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(373, 'Products Info - Product Option Value of Attributes Sort Order', 'PRODUCTS_OPTIONS_SORT_BY_PRICE', '1', 'Sort order of Product Option Values of Attributes for Products Info<br />0= Sort Order, Price<br />1= Sort Order, Option Value Name', 18, 36, '2014-10-27 13:41:16', '2014-10-27 13:41:16', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(374, 'Product Info - Show Option Values Name Below Attributes Image', 'PRODUCT_IMAGES_ATTRIBUTES_NAMES', '1', 'Product Info - Show the name of the Option Value beneath the Attribute Image?<br />0= off 1= on', 18, 41, NULL, '2014-10-27 13:41:16', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(375, 'Product Info - Show Sales Discount Savings Status', 'SHOW_SALE_DISCOUNT_STATUS', '1', 'Product Info - Show the amount of discount savings?<br />0= off 1= on', 18, 45, NULL, '2014-10-27 13:41:16', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(376, 'Product Info - Show Sales Discount Savings Dollars or Percentage', 'SHOW_SALE_DISCOUNT', '1', 'Product Info - Show the amount of discount savings display as:<br />1= % off 2= $amount off', 18, 46, NULL, '2014-10-27 13:41:16', NULL, 'zen_cfg_select_option(array(''1'', ''2''), '),
(377, 'Product Info - Show Sales Discount Savings Percentage Decimals', 'SHOW_SALE_DISCOUNT_DECIMALS', '0', 'Product Info - Show discount savings display as a Percentage with how many decimals?:<br />Default= 0', 18, 47, NULL, '2014-10-27 13:41:16', NULL, NULL),
(378, 'Product Info - Price is Free Image or Text Status', 'OTHER_IMAGE_PRICE_IS_FREE_ON', '1', 'Product Info - Show the Price is Free Image or Text on Displayed Price<br />0= Text<br />1= Image', 18, 50, NULL, '2014-10-27 13:41:16', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(379, 'Product Info - Price is Call for Price Image or Text Status', 'PRODUCTS_PRICE_IS_CALL_IMAGE_ON', '1', 'Product Info - Show the Price is Call for Price Image or Text on Displayed Price<br />0= Text<br />1= Image', 18, 51, NULL, '2014-10-27 13:41:16', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(380, 'Product Quantity Box Status - Adding New Products', 'PRODUCTS_QTY_BOX_STATUS', '1', 'What should the Default Quantity Box Status be set to when adding New Products?<br /><br />0= off<br />1= on<br />NOTE: This will show a Qty Box when ON and default the Add to Cart to 1', 18, 55, NULL, '2014-10-27 13:41:16', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(381, 'Product Reviews Require Approval', 'REVIEWS_APPROVAL', '1', 'Do product reviews require approval?<br /><br />Note: When Review Status is off, it will also not show<br /><br />0= off 1= on', 18, 62, NULL, '2014-10-27 13:41:16', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(382, 'Meta Tags - Include Product Model in Title', 'META_TAG_INCLUDE_MODEL', '1', 'Do you want to include the Product Model in the Meta Tag Title?<br /><br />0= off 1= on', 18, 69, NULL, '2014-10-27 13:41:16', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(383, 'Meta Tags - Include Product Price in Title', 'META_TAG_INCLUDE_PRICE', '1', 'Do you want to include the Product Price in the Meta Tag Title?<br /><br />0= off 1= on', 18, 70, NULL, '2014-10-27 13:41:16', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(384, 'Meta Tags Generated Description Maximum Length?', 'MAX_META_TAG_DESCRIPTION_LENGTH', '50', 'Set Generated Meta Tag Description Maximum Length to (words) Default 50:', 18, 71, NULL, '2014-10-27 13:41:16', '', ''),
(385, 'Also Purchased Products Columns per Row', 'SHOW_PRODUCT_INFO_COLUMNS_ALSO_PURCHASED_PRODUCTS', '4', 'Also Purchased Products Columns per Row<br />0= off or set the sort order', 18, 72, NULL, '2014-10-27 13:41:16', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4'', ''5'', ''6'', ''7'', ''8'', ''9'', ''10'', ''11'', ''12''), '),
(386, 'Previous Next - Navigation Bar Position', 'PRODUCT_INFO_PREVIOUS_NEXT', '1', 'Location of Previous/Next Navigation Bar<br />0= off<br />1= Top of Page<br />2= Bottom of Page<br />3= Both Top and Bottom of Page', 18, 21, '2014-10-27 13:41:16', '2014-10-27 13:41:16', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Off''), array(''id''=>''1'', ''text''=>''Top of Page''), array(''id''=>''2'', ''text''=>''Bottom of Page''), array(''id''=>''3'', ''text''=>''Both Top & Bottom of Page'')),'),
(387, 'Previous Next - Sort Order', 'PRODUCT_INFO_PREVIOUS_NEXT_SORT', '1', 'Products Display Order by<br />0= Product ID<br />1= Product Name<br />2= Model<br />3= Price, Product Name<br />4= Price, Model<br />5= Product Name, Model<br />6= Product Sort Order', 18, 22, '2014-10-27 13:41:16', '2014-10-27 13:41:16', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Product ID''), array(''id''=>''1'', ''text''=>''Name''), array(''id''=>''2'', ''text''=>''Product Model''), array(''id''=>''3'', ''text''=>''Product Price - Name''), array(''id''=>''4'', ''text''=>''Product Price - Model''), array(''id''=>''5'', ''text''=>''Product Name - Model''), array(''id''=>''6'', ''text''=>''Product Sort Order'')),'),
(388, 'Previous Next - Button and Image Status', 'SHOW_PREVIOUS_NEXT_STATUS', '0', 'Button and Product Image status settings are:<br />0= Off<br />1= On', 18, 20, '2014-10-27 13:41:16', '2014-10-27 13:41:16', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Off''), array(''id''=>''1'', ''text''=>''On'')),'),
(389, 'Previous Next - Button and Image Settings', 'SHOW_PREVIOUS_NEXT_IMAGES', '0', 'Show Previous/Next Button and Product Image Settings<br />0= Button Only<br />1= Button and Product Image<br />2= Product Image Only', 18, 21, '2014-10-27 13:41:16', '2014-10-27 13:41:16', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Button Only''), array(''id''=>''1'', ''text''=>''Button and Product Image''), array(''id''=>''2'', ''text''=>''Product Image Only'')),'),
(390, 'Previous Next - Image Width?', 'PREVIOUS_NEXT_IMAGE_WIDTH', '50', 'Previous/Next Image Width?', 18, 22, NULL, '2014-10-27 13:41:16', '', ''),
(391, 'Previous Next - Image Height?', 'PREVIOUS_NEXT_IMAGE_HEIGHT', '40', 'Previous/Next Image Height?', 18, 23, NULL, '2014-10-27 13:41:16', '', ''),
(392, 'Previous Next - Navigation Includes Category Position', 'PRODUCT_INFO_CATEGORIES', '1', 'Product''s Category Image and Name Alignment Above Previous/Next Navigation Bar<br />0= off<br />1= Align Left<br />2= Align Center<br />3= Align Right', 18, 20, '2014-10-27 13:41:16', '2014-10-27 13:41:16', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Off''), array(''id''=>''1'', ''text''=>''Align Left''), array(''id''=>''2'', ''text''=>''Align Center''), array(''id''=>''3'', ''text''=>''Align Right'')),'),
(393, 'Previous Next - Navigation Includes Category Name and Image Status', 'PRODUCT_INFO_CATEGORIES_IMAGE_STATUS', '2', 'Product''s Category Image and Name Status<br />0= Category Name and Image always shows<br />1= Category Name only<br />2= Category Name and Image when not blank', 18, 20, '2014-10-27 13:41:16', '2014-10-27 13:41:16', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Category Name and Image Always''), array(''id''=>''1'', ''text''=>''Category Name only''), array(''id''=>''2'', ''text''=>''Category Name and Image when not blank'')),'),
(394, 'Column Width - Left Boxes', 'BOX_WIDTH_LEFT', '270px', 'Width of the Left Column Boxes<br />px may be included<br />Default = 150px', 19, 1, '2014-11-18 10:45:53', '2003-11-21 22:16:36', NULL, NULL),
(395, 'Column Width - Right Boxes', 'BOX_WIDTH_RIGHT', '270px', 'Width of the Right Column Boxes<br />px may be included<br />Default = 150px', 19, 2, '2014-11-18 10:46:03', '2003-11-21 22:16:36', NULL, NULL),
(396, 'Bread Crumbs Navigation Separator', 'BREAD_CRUMBS_SEPARATOR', '&nbsp;::&nbsp;', 'Enter the separator symbol to appear between the Navigation Bread Crumb trail<br />Note: Include spaces with the &amp;nbsp; symbol if you want them part of the separator.<br />Default = &amp;nbsp;::&amp;nbsp;', 19, 3, NULL, '2003-11-21 22:16:36', NULL, 'zen_cfg_textarea_small('),
(397, 'Define Breadcrumb Status', 'DEFINE_BREADCRUMB_STATUS', '2', 'Enable the Breadcrumb Trail Links?<br />0= OFF<br />1= ON<br />2= Off for Home Page Only', 19, 4, '2014-10-28 10:19:46', '2014-10-27 13:41:16', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(398, 'Bestsellers - Number Padding', 'BEST_SELLERS_FILLER', '&nbsp;', 'What do you want to Pad the numbers with?<br />Default = &amp;nbsp;', 19, 5, NULL, '2003-11-21 22:16:36', NULL, 'zen_cfg_textarea_small('),
(399, 'Bestsellers - Truncate Product Names', 'BEST_SELLERS_TRUNCATE', '35', 'What size do you want to truncate the Product Names?<br />Default = 35', 19, 6, NULL, '2003-11-21 22:16:36', NULL, NULL),
(400, 'Bestsellers - Truncate Product Names followed by ...', 'BEST_SELLERS_TRUNCATE_MORE', 'true', 'When truncated Product Names follow with ...<br />Default = true', 19, 7, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(401, 'Categories Box - Show Specials Link', 'SHOW_CATEGORIES_BOX_SPECIALS', 'true', 'Show Specials Link in the Categories Box', 19, 8, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(402, 'Categories Box - Show Products New Link', 'SHOW_CATEGORIES_BOX_PRODUCTS_NEW', 'true', 'Show Products New Link in the Categories Box', 19, 9, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(403, 'Shopping Cart Box Status', 'SHOW_SHOPPING_CART_BOX_STATUS', '1', 'Shopping Cart Shows<br />0= Always<br />1= Only when full<br />2= Only when full but not when viewing the Shopping Cart', 19, 10, '2014-11-05 09:44:41', '2014-10-27 13:41:16', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(404, 'Categories Box - Show Featured Products Link', 'SHOW_CATEGORIES_BOX_FEATURED_PRODUCTS', 'true', 'Show Featured Products Link in the Categories Box', 19, 11, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(405, 'Categories Box - Show Products All Link', 'SHOW_CATEGORIES_BOX_PRODUCTS_ALL', 'true', 'Show Products All Link in the Categories Box', 19, 12, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(406, 'Column Left Status - Global', 'COLUMN_LEFT_STATUS', '1', 'Show Column Left, unless page override exists?<br />0= Column Left is always off<br />1= Column Left is on, unless page override', 19, 15, '2014-12-19 10:22:18', '2014-10-27 13:41:16', NULL, 'zen_cfg_select_option(array(''0'', ''1''), ');
INSERT INTO `configuration` (`configuration_id`, `configuration_title`, `configuration_key`, `configuration_value`, `configuration_description`, `configuration_group_id`, `sort_order`, `last_modified`, `date_added`, `use_function`, `set_function`) VALUES
(407, 'Column Right Status - Global', 'COLUMN_RIGHT_STATUS', '0', 'Show Column Right, unless page override exists?<br />0= Column Right is always off<br />1= Column Right is on, unless page override', 19, 16, '2014-12-25 15:30:15', '2014-10-27 13:41:16', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(408, 'Column Width - Left', 'COLUMN_WIDTH_LEFT', '270px', 'Width of the Left Column<br />px may be included<br />Default = 150px', 19, 20, '2014-11-18 10:45:37', '2003-11-21 22:16:36', NULL, NULL),
(409, 'Column Width - Right', 'COLUMN_WIDTH_RIGHT', '270px', 'Width of the Right Column<br />px may be included<br />Default = 150px', 19, 21, '2014-11-18 10:45:46', '2003-11-21 22:16:36', NULL, NULL),
(410, 'Categories Separator between links Status', 'SHOW_CATEGORIES_SEPARATOR_LINK', '1', 'Show Category Separator between Category Names and Links?<br />0= off<br />1= on', 19, 24, NULL, '2014-10-27 13:41:16', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(411, 'Categories Separator between the Category Name and Count', 'CATEGORIES_SEPARATOR', '-&gt;', 'What separator do you want between the Category name and the count?<br />Default = -&amp;gt;', 19, 25, NULL, '2003-11-21 22:16:36', NULL, 'zen_cfg_textarea_small('),
(412, 'Categories Separator between the Category Name and Sub Categories', 'CATEGORIES_SEPARATOR_SUBS', '', 'What separator do you want between the Category name and Sub Category Name?<br />Default = |_&amp;nbsp;', 19, 26, NULL, '2004-03-25 22:16:36', NULL, 'zen_cfg_textarea_small('),
(413, 'Categories Count Prefix', 'CATEGORIES_COUNT_PREFIX', '', 'What do you want to Prefix the count with?<br />Default= (', 19, 27, '2014-11-19 10:35:46', '2003-01-21 22:16:36', NULL, 'zen_cfg_textarea_small('),
(414, 'Categories Count Suffix', 'CATEGORIES_COUNT_SUFFIX', '', 'What do you want as a Suffix to the count?<br />Default= )', 19, 28, '2014-11-19 10:35:50', '2003-01-21 22:16:36', NULL, 'zen_cfg_textarea_small('),
(415, 'Categories SubCategories Indent', 'CATEGORIES_SUBCATEGORIES_INDENT', '&nbsp;&nbsp;', 'What do you want to use as the subcategories indent?<br />Default= &nbsp;&nbsp;', 19, 29, NULL, '2004-06-24 22:16:36', NULL, 'zen_cfg_textarea_small('),
(416, 'Categories with 0 Products Status', 'CATEGORIES_COUNT_ZERO', '0', 'Show Category Count for 0 Products?<br />0= off<br />1= on', 19, 30, NULL, '2014-10-27 13:41:16', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(417, 'Split Categories Box', 'CATEGORIES_SPLIT_DISPLAY', 'True', 'Split the categories box display by product type', 19, 31, NULL, '2014-10-27 13:41:16', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(418, 'Shopping Cart - Show Totals', 'SHOW_TOTALS_IN_CART', '1', 'Show Totals Above Shopping Cart?<br />0= off<br />1= on: Items Weight Amount<br />2= on: Items Weight Amount, but no weight when 0<br />3= on: Items Amount', 19, 31, NULL, '2014-10-27 13:41:16', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''), '),
(419, 'Customer Greeting - Show on Index Page', 'SHOW_CUSTOMER_GREETING', '0', 'Always Show Customer Greeting on Index?<br />0= off<br />1= on', 19, 40, NULL, '2014-10-27 13:41:16', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(420, 'Categories - Always Show on Main Page', 'SHOW_CATEGORIES_ALWAYS', '0', 'Always Show Categories on Main Page<br />0= off<br />1= on<br />Default category can be set to Top Level or a Specific Top Level', 19, 45, NULL, '2014-10-27 13:41:16', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(421, 'Main Page - Opens with Category', 'CATEGORIES_START_MAIN', '0', '0= Top Level Categories<br />Or enter the Category ID#<br />Note: Sub Categories can also be used Example: 3_10', 19, 46, NULL, '2014-10-27 13:41:16', '', ''),
(422, 'Categories - Always Open to Show SubCategories', 'SHOW_CATEGORIES_SUBCATEGORIES_ALWAYS', '1', 'Always Show Categories and SubCategories<br />0= off, just show Top Categories<br />1= on, Always show Categories and SubCategories when selected', 19, 47, NULL, '2014-10-27 13:41:16', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(423, 'Banner Display Groups - Header Position 1', 'SHOW_BANNERS_GROUP_SET1', 'banner-1', 'The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Header Position 1?<br />Leave blank for none', 19, 55, NULL, '2014-10-27 13:41:16', '', ''),
(424, 'Banner Display Groups - Header Position 2', 'SHOW_BANNERS_GROUP_SET2', 'banner-2', 'The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Header Position 2?<br />Leave blank for none', 19, 56, NULL, '2014-10-27 13:41:16', '', ''),
(425, 'Banner Display Groups - Header Position 3', 'SHOW_BANNERS_GROUP_SET3', 'banner-3', 'The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Header Position 3?<br />Leave blank for none', 19, 57, NULL, '2014-10-27 13:41:16', '', ''),
(426, 'Banner Display Groups - Footer Position 1', 'SHOW_BANNERS_GROUP_SET4', 'banner-4', 'The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Footer Position 1?<br />Leave blank for none', 19, 65, NULL, '2014-10-27 13:41:16', '', ''),
(427, 'Banner Display Groups - Footer Position 2', 'SHOW_BANNERS_GROUP_SET5', 'banner-5', 'The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Footer Position 2?<br />Leave blank for none', 19, 66, NULL, '2014-10-27 13:41:16', '', ''),
(428, 'Banner Display Groups - Footer Position 3', 'SHOW_BANNERS_GROUP_SET6', '', 'The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br /><br />Default Group is Wide-Banners<br /><br />What Banner Group(s) do you want to use in the Footer Position 3?<br />Leave blank for none', 19, 67, NULL, '2014-10-27 13:41:16', '', ''),
(429, 'Banner Display Groups - Side Box banner_box', 'SHOW_BANNERS_GROUP_SET7', 'SideBox-Banners', 'The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br />Default Group is SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Side Box - banner_box?<br />Leave blank for none', 19, 70, NULL, '2014-10-27 13:41:16', '', ''),
(430, 'Banner Display Groups - Side Box banner_box2', 'SHOW_BANNERS_GROUP_SET8', 'SideBox-Banners', 'The Banner Display Groups can be from 1 Banner Group or Multiple Banner Groups<br /><br />For Multiple Banner Groups enter the Banner Group Name separated by a colon <strong>:</strong><br /><br />Example: Wide-Banners:SideBox-Banners<br />Default Group is SideBox-Banners<br /><br />What Banner Group(s) do you want to use in the Side Box - banner_box2?<br />Leave blank for none', 19, 71, NULL, '2014-10-27 13:41:16', '', ''),
(431, 'Banner Display Group - Side Box banner_box_all', 'SHOW_BANNERS_GROUP_SET_ALL', 'BannersAll', 'The Banner Display Group may only be from one (1) Banner Group for the Banner All sidebox<br /><br />Default Group is BannersAll<br /><br />What Banner Group do you want to use in the Side Box - banner_box_all?<br />Leave blank for none', 19, 72, NULL, '2014-10-27 13:41:16', '', ''),
(432, 'Footer - Show IP Address status', 'SHOW_FOOTER_IP', '0', 'Show Customer IP Address in the Footer<br />0= off<br />1= on<br />Should the Customer IP Address show in the footer?', 19, 80, '2014-12-08 15:42:26', '2014-10-27 13:41:16', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(433, 'Product Discount Quantities - Add how many blank discounts?', 'DISCOUNT_QTY_ADD', '5', 'How many blank discount quantities should be added for Product Pricing?', 19, 90, NULL, '2014-10-27 13:41:16', '', ''),
(434, 'Product Discount Quantities - Display how many per row?', 'DISCOUNT_QUANTITY_PRICES_COLUMN', '5', 'How many discount quantities should show per row on Product Info Pages?', 19, 95, NULL, '2014-10-27 13:41:16', '', ''),
(435, 'Categories/Products Display Sort Order', 'CATEGORIES_PRODUCTS_SORT_ORDER', '0', 'Categories/Products Display Sort Order<br />0= Categories/Products Sort Order/Name<br />1= Categories/Products Name<br />2= Products Model<br />3= Products Qty+, Products Name<br />4= Products Qty-, Products Name<br />5= Products Price+, Products Name<br />6= Products Price-, Products Name', 19, 100, NULL, '2014-10-27 13:41:16', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4'', ''5'', ''6''), '),
(436, 'Option Names and Values Global Add, Copy and Delete Features Status', 'OPTION_NAMES_VALUES_GLOBAL_STATUS', '1', 'Option Names and Values Global Add, Copy and Delete Features Status<br />0= Hide Features<br />1= Show Features<br />(Default=1)', 19, 110, NULL, '2014-10-27 13:41:16', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(437, 'Categories-Tabs Menu ON/OFF', 'CATEGORIES_TABS_STATUS', '0', 'Categories-Tabs<br />This enables the display of your store''s categories as a menu across the top of your header. There are many potential creative uses for this.<br />0= Hide Categories Tabs<br />1= Show Categories Tabs', 19, 112, '2014-12-10 08:18:07', '2014-10-27 13:41:16', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(438, 'Site Map - include My Account Links?', 'SHOW_ACCOUNT_LINKS_ON_SITE_MAP', 'No', 'Should the links to My Account show up on the site-map?<br />Note: Spiders will try to index this page, and likely should not be sent to secure pages, since there is no benefit in indexing a login page.<br /><br />Default: false', 19, 115, NULL, '2014-10-27 13:41:16', NULL, 'zen_cfg_select_option(array(''Yes'', ''No''), '),
(439, 'Skip 1-prod Categories', 'SKIP_SINGLE_PRODUCT_CATEGORIES', 'True', 'Skip single-product categories<br />If this option is set to True, then if the customer clicks on a link to a category which only contains a single item, then Zen Cart will take them directly to that product-page, rather than present them with another link to click in order to see the product.<br />Default: True', 19, 120, NULL, '2014-10-27 13:41:16', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(440, 'Use split-login page', 'USE_SPLIT_LOGIN_MODE', 'False', 'The login page can be displayed in two modes: Split or Vertical.<br />In Split mode, the create-account options are accessed by clicking a button to get to the create-account page.  In Vertical mode, the create-account input fields are all displayed inline, below the login field, making one less click for the customer to create their account.<br />Default: False', 19, 121, NULL, '2014-10-27 13:41:16', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(441, 'CSS Buttons', 'IMAGE_USE_CSS_BUTTONS', 'Yes', 'CSS Buttons<br />Use CSS buttons instead of images (GIF/JPG)?<br />Button styles must be configured in the stylesheet if you enable this option.', 19, 147, '2014-10-28 13:43:27', '2014-10-27 13:41:16', NULL, 'zen_cfg_select_option(array(''No'', ''Yes''), '),
(442, '<strong>Down for Maintenance: ON/OFF</strong>', 'DOWN_FOR_MAINTENANCE', 'false', 'Down for Maintenance <br />(true=on false=off)', 20, 1, NULL, '2014-10-27 13:41:16', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(443, 'Down for Maintenance: filename', 'DOWN_FOR_MAINTENANCE_FILENAME', 'down_for_maintenance', 'Down for Maintenance filename<br />Note: Do not include the extension<br />Default=down_for_maintenance', 20, 2, NULL, '2014-10-27 13:41:16', NULL, ''),
(444, 'Down for Maintenance: Hide Header', 'DOWN_FOR_MAINTENANCE_HEADER_OFF', 'false', 'Down for Maintenance: Hide Header <br />(true=hide false=show)', 20, 3, NULL, '2014-10-27 13:41:16', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(445, 'Down for Maintenance: Hide Column Left', 'DOWN_FOR_MAINTENANCE_COLUMN_LEFT_OFF', 'false', 'Down for Maintenance: Hide Column Left <br />(true=hide false=show)', 20, 4, NULL, '2014-10-27 13:41:16', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(446, 'Down for Maintenance: Hide Column Right', 'DOWN_FOR_MAINTENANCE_COLUMN_RIGHT_OFF', 'false', 'Down for Maintenance: Hide Column Right <br />(true=hide false=show)', 20, 5, NULL, '2014-10-27 13:41:16', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(447, 'Down for Maintenance: Hide Footer', 'DOWN_FOR_MAINTENANCE_FOOTER_OFF', 'false', 'Down for Maintenance: Hide Footer <br />(true=hide false=show)', 20, 6, NULL, '2014-10-27 13:41:16', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(448, 'Down for Maintenance: Hide Prices', 'DOWN_FOR_MAINTENANCE_PRICES_OFF', 'false', 'Down for Maintenance: Hide Prices <br />(true=hide false=show)', 20, 7, NULL, '2014-10-27 13:41:16', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(449, 'Down For Maintenance (exclude this IP-Address)', 'EXCLUDE_ADMIN_IP_FOR_MAINTENANCE', 'your IP (ADMIN)', 'This IP Address is able to access the website while it is Down For Maintenance (like webmaster)<br />To enter multiple IP Addresses, separate with a comma. If you do not know your IP Address, check in the Footer of your Shop.', 20, 8, '2003-03-21 13:43:22', '2003-03-21 21:20:07', NULL, NULL),
(450, 'NOTICE PUBLIC Before going Down for Maintenance: ON/OFF', 'WARN_BEFORE_DOWN_FOR_MAINTENANCE', 'false', 'Give a WARNING some time before you put your website Down for Maintenance<br />(true=on false=off)<br />If you set the ''Down For Maintenance: ON/OFF'' to true this will automaticly be updated to false', 20, 9, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(451, 'Date and hours for notice before maintenance', 'PERIOD_BEFORE_DOWN_FOR_MAINTENANCE', '15/05/2003  2-3 PM', 'Date and hours for notice before maintenance website, enter date and hours for maintenance website', 20, 10, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, NULL),
(452, 'Display when webmaster has enabled maintenance', 'DISPLAY_MAINTENANCE_TIME', 'false', 'Display when Webmaster has enabled maintenance <br />(true=on false=off)<br />', 20, 11, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(453, 'Display website maintenance period', 'DISPLAY_MAINTENANCE_PERIOD', 'false', 'Display Website maintenance period <br />(true=on false=off)<br />', 20, 12, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(454, 'Website maintenance period', 'TEXT_MAINTENANCE_PERIOD_TIME', '2h00', 'Enter Website Maintenance period (hh:mm)', 20, 13, '2003-03-21 13:08:25', '2003-03-21 11:42:47', NULL, NULL),
(455, 'Confirm Terms and Conditions During Checkout Procedure', 'DISPLAY_CONDITIONS_ON_CHECKOUT', 'false', 'Show the Terms and Conditions during the checkout procedure which the customer must agree to.', 11, 1, NULL, '2014-10-27 13:41:16', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(456, 'Confirm Privacy Notice During Account Creation Procedure', 'DISPLAY_PRIVACY_CONDITIONS', 'false', 'Show the Privacy Notice during the account creation procedure which the customer must agree to.', 11, 2, NULL, '2014-10-27 13:41:16', NULL, 'zen_cfg_select_option(array(''true'', ''false''), '),
(457, 'Display Product Image', 'PRODUCT_NEW_LIST_IMAGE', '1102', 'Do you want to display the Product Image?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 21, 1, NULL, '2014-10-27 13:41:16', NULL, NULL),
(458, 'Display Product Quantity', 'PRODUCT_NEW_LIST_QUANTITY', '1202', 'Do you want to display the Product Quantity?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 21, 2, NULL, '2014-10-27 13:41:16', NULL, NULL),
(459, 'Display Product Buy Now Button', 'PRODUCT_NEW_BUY_NOW', '1300', 'Do you want to display the Product Buy Now Button<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 21, 3, NULL, '2014-10-27 13:41:16', NULL, NULL),
(460, 'Display Product Name', 'PRODUCT_NEW_LIST_NAME', '2101', 'Do you want to display the Product Name?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 21, 4, '2014-12-17 14:42:55', '2014-10-27 13:41:16', NULL, NULL),
(461, 'Display Product Model', 'PRODUCT_NEW_LIST_MODEL', '2201', 'Do you want to display the Product Model?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 21, 5, NULL, '2014-10-27 13:41:16', NULL, NULL),
(462, 'Display Product Manufacturer Name', 'PRODUCT_NEW_LIST_MANUFACTURER', '2302', 'Do you want to display the Product Manufacturer Name?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 21, 6, NULL, '2014-10-27 13:41:16', NULL, NULL),
(463, 'Display Product Price', 'PRODUCT_NEW_LIST_PRICE', '2402', 'Do you want to display the Product Price<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 21, 7, NULL, '2014-10-27 13:41:16', NULL, NULL),
(464, 'Display Product Weight', 'PRODUCT_NEW_LIST_WEIGHT', '2502', 'Do you want to display the Product Weight?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 21, 8, NULL, '2014-10-27 13:41:16', NULL, NULL),
(465, 'Display Product Date Added', 'PRODUCT_NEW_LIST_DATE_ADDED', '2601', 'Do you want to display the Product Date Added?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 21, 9, NULL, '2014-10-27 13:41:16', NULL, NULL),
(466, 'Display Product Description', 'PRODUCT_NEW_LIST_DESCRIPTION', '450', 'How many characters do you want to display of the Product Description?<br /><br />0= OFF<br />150= Suggested Length, or enter the maximum number of characters to display', 21, 10, '2015-01-05 15:20:31', '2014-10-27 13:41:16', NULL, NULL),
(467, 'Display Product Display - Default Sort Order', 'PRODUCT_NEW_LIST_SORT_DEFAULT', '6', 'What Sort Order Default should be used for New Products Display?<br />Default= 6 for Date New to Old<br /><br />1= Products Name<br />2= Products Name Desc<br />3= Price low to high, Products Name<br />4= Price high to low, Products Name<br />5= Model<br />6= Date Added desc<br />7= Date Added<br />8= Product Sort Order', 21, 11, '2015-04-14 07:43:03', '2014-10-27 13:41:16', NULL, 'zen_cfg_select_option(array(''1'', ''2'', ''3'', ''4'', ''5'', ''6'', ''7'', ''8''), '),
(468, 'Default Products New Group ID', 'PRODUCT_NEW_LIST_GROUP_ID', '21', 'Warning: Only change this if your Products New Group ID has changed from the default of 21<br />What is the configuration_group_id for New Products Listings?', 21, 12, NULL, '2014-10-27 13:41:16', NULL, NULL),
(469, 'Display Multiple Products Qty Box Status and Set Button Location', 'PRODUCT_NEW_LISTING_MULTIPLE_ADD_TO_CART', '3', 'Do you want to display Add Multiple Products Qty Box and Set Button Location?<br />0= off<br />1= Top<br />2= Bottom<br />3= Both', 21, 25, NULL, '2014-10-27 13:41:16', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''), '),
(470, 'Mask Upcoming Products from being include as New Products', 'SHOW_NEW_PRODUCTS_UPCOMING_MASKED', '0', 'Do you want to mask Upcoming Products from being included as New Products in Listing, Sideboxes and Centerbox?<br />0= off<br />1= on', 21, 30, NULL, '2014-10-27 13:41:16', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(471, 'Display Product Image', 'PRODUCT_FEATURED_LIST_IMAGE', '1102', 'Do you want to display the Product Image?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 22, 1, NULL, '2014-10-27 13:41:16', NULL, NULL),
(472, 'Display Product Quantity', 'PRODUCT_FEATURED_LIST_QUANTITY', '1202', 'Do you want to display the Product Quantity?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 22, 2, NULL, '2014-10-27 13:41:16', NULL, NULL),
(473, 'Display Product Buy Now Button', 'PRODUCT_FEATURED_BUY_NOW', '2701', 'Do you want to display the Product Buy Now Button<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 22, 3, NULL, '2014-10-27 13:41:16', NULL, NULL),
(474, 'Display Product Name', 'PRODUCT_FEATURED_LIST_NAME', '2562', 'Do you want to display the Product Name?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 22, 4, NULL, '2014-10-27 13:41:16', NULL, NULL),
(475, 'Display Product Model', 'PRODUCT_FEATURED_LIST_MODEL', '2301', 'Do you want to display the Product Model?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 22, 5, NULL, '2014-10-27 13:41:16', NULL, NULL),
(476, 'Display Product Manufacturer Name', 'PRODUCT_FEATURED_LIST_MANUFACTURER', '2401', 'Do you want to display the Product Manufacturer Name?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 22, 6, NULL, '2014-10-27 13:41:16', NULL, NULL),
(477, 'Display Product Price', 'PRODUCT_FEATURED_LIST_PRICE', '2601', 'Do you want to display the Product Price<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 22, 7, NULL, '2014-10-27 13:41:16', NULL, NULL),
(478, 'Display Product Weight', 'PRODUCT_FEATURED_LIST_WEIGHT', '2502', 'Do you want to display the Product Weight?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 22, 8, NULL, '2014-10-27 13:41:16', NULL, NULL),
(479, 'Display Product Date Added', 'PRODUCT_FEATURED_LIST_DATE_ADDED', '2102', 'Do you want to display the Product Date Added?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 22, 9, NULL, '2014-10-27 13:41:16', NULL, NULL),
(480, 'Display Product Description', 'PRODUCT_FEATURED_LIST_DESCRIPTION', '450', 'How many characters do you want to display of the Product Description?<br /><br />0= OFF<br />150= Suggested Length, or enter the maximum number of characters to display', 22, 10, NULL, '2014-10-27 13:41:16', NULL, NULL),
(481, 'Display Product Display - Default Sort Order', 'PRODUCT_FEATURED_LIST_SORT_DEFAULT', '1', 'What Sort Order Default should be used for Featured Product Display?<br />Default= 1 for Product Name<br /><br />1= Products Name<br />2= Products Name Desc<br />3= Price low to high, Products Name<br />4= Price high to low, Products Name<br />5= Model<br />6= Date Added desc<br />7= Date Added<br />8= Product Sort Order', 22, 11, NULL, '2014-10-27 13:41:16', NULL, 'zen_cfg_select_option(array(''1'', ''2'', ''3'', ''4'', ''5'', ''6'', ''7'', ''8''), '),
(482, 'Default Featured Products Group ID', 'PRODUCT_FEATURED_LIST_GROUP_ID', '22', 'Warning: Only change this if your Featured Products Group ID has changed from the default of 22<br />What is the configuration_group_id for Featured Products Listings?', 22, 12, NULL, '2014-10-27 13:41:16', NULL, NULL),
(483, 'Display Multiple Products Qty Box Status and Set Button Location', 'PRODUCT_FEATURED_LISTING_MULTIPLE_ADD_TO_CART', '0', 'Do you want to display Add Multiple Products Qty Box and Set Button Location?<br />0= off<br />1= Top<br />2= Bottom<br />3= Both', 22, 25, NULL, '2014-10-27 13:41:16', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''), '),
(484, 'Display Product Image', 'PRODUCT_ALL_LIST_IMAGE', '1102', 'Do you want to display the Product Image?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 23, 1, NULL, '2014-10-27 13:41:16', NULL, NULL),
(485, 'Display Product Quantity', 'PRODUCT_ALL_LIST_QUANTITY', '1202', 'Do you want to display the Product Quantity?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 23, 2, NULL, '2014-10-27 13:41:16', NULL, NULL),
(486, 'Display Product Buy Now Button', 'PRODUCT_ALL_BUY_NOW', '2701', 'Do you want to display the Product Buy Now Button<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 23, 3, NULL, '2014-10-27 13:41:16', NULL, NULL),
(487, 'Display Product Name', 'PRODUCT_ALL_LIST_NAME', '2562', 'Do you want to display the Product Name?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 23, 4, '2014-12-17 14:42:18', '2014-10-27 13:41:16', NULL, NULL),
(488, 'Display Product Model', 'PRODUCT_ALL_LIST_MODEL', '2301', 'Do you want to display the Product Model?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 23, 5, NULL, '2014-10-27 13:41:16', NULL, NULL),
(489, 'Display Product Manufacturer Name', 'PRODUCT_ALL_LIST_MANUFACTURER', '2401', 'Do you want to display the Product Manufacturer Name?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 23, 6, NULL, '2014-10-27 13:41:16', NULL, NULL),
(490, 'Display Product Price', 'PRODUCT_ALL_LIST_PRICE', '2601', 'Do you want to display the Product Price<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 23, 7, NULL, '2014-10-27 13:41:16', NULL, NULL),
(491, 'Display Product Weight', 'PRODUCT_ALL_LIST_WEIGHT', '2502', 'Do you want to display the Product Weight?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 23, 8, NULL, '2014-10-27 13:41:16', NULL, NULL),
(492, 'Display Product Date Added', 'PRODUCT_ALL_LIST_DATE_ADDED', '2102', 'Do you want to display the Product Date Added?<br /><br />0= off<br />1st digit Left or Right<br />2nd and 3rd digit Sort Order<br />4th digit number of breaks after<br />', 23, 9, NULL, '2014-10-27 13:41:16', NULL, NULL),
(493, 'Display Product Description', 'PRODUCT_ALL_LIST_DESCRIPTION', '450', 'How many characters do you want to display of the Product Description?<br /><br />0= OFF<br />150= Suggested Length, or enter the maximum number of characters to display', 23, 10, '2014-12-19 10:25:32', '2014-10-27 13:41:17', NULL, NULL),
(494, 'Display Product Display - Default Sort Order', 'PRODUCT_ALL_LIST_SORT_DEFAULT', '1', 'What Sort Order Default should be used for All Products Display?<br />Default= 1 for Product Name<br /><br />1= Products Name<br />2= Products Name Desc<br />3= Price low to high, Products Name<br />4= Price high to low, Products Name<br />5= Model<br />6= Date Added desc<br />7= Date Added<br />8= Product Sort Order', 23, 11, NULL, '2014-10-27 13:41:17', NULL, 'zen_cfg_select_option(array(''1'', ''2'', ''3'', ''4'', ''5'', ''6'', ''7'', ''8''), '),
(495, 'Default Products All Group ID', 'PRODUCT_ALL_LIST_GROUP_ID', '23', 'Warning: Only change this if your Products All Group ID has changed from the default of 23<br />What is the configuration_group_id for Products All Listings?', 23, 12, NULL, '2014-10-27 13:41:17', NULL, NULL),
(496, 'Display Multiple Products Qty Box Status and Set Button Location', 'PRODUCT_ALL_LISTING_MULTIPLE_ADD_TO_CART', '3', 'Do you want to display Add Multiple Products Qty Box and Set Button Location?<br />0= off<br />1= Top<br />2= Bottom<br />3= Both', 23, 25, NULL, '2014-10-27 13:41:17', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''), '),
(497, 'Show New Products on Main Page', 'SHOW_PRODUCT_INFO_MAIN_NEW_PRODUCTS', '0', 'Show New Products on Main Page<br />0= off or set the sort order', 24, 65, '2015-04-14 07:46:16', '2014-10-27 13:41:17', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(498, 'Show Featured Products on Main Page', 'SHOW_PRODUCT_INFO_MAIN_FEATURED_PRODUCTS', '1', 'Show Featured Products on Main Page<br />0= off or set the sort order', 24, 66, '2015-04-14 07:46:40', '2014-10-27 13:41:17', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(499, 'Show Special Products on Main Page', 'SHOW_PRODUCT_INFO_MAIN_SPECIALS_PRODUCTS', '0', 'Show Special Products on Main Page<br />0= off or set the sort order', 24, 67, '2015-04-14 07:46:25', '2014-10-27 13:41:17', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(500, 'Show Upcoming Products on Main Page', 'SHOW_PRODUCT_INFO_MAIN_UPCOMING', '0', 'Show Upcoming Products on Main Page<br />0= off or set the sort order', 24, 68, '2014-12-08 14:27:36', '2014-10-27 13:41:17', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(501, 'Show New Products on Main Page - Category with SubCategories', 'SHOW_PRODUCT_INFO_CATEGORY_NEW_PRODUCTS', '1', 'Show New Products on Main Page - Category with SubCategories<br />0= off or set the sort order', 24, 70, '2014-12-10 09:26:47', '2014-10-27 13:41:17', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(502, 'Show Featured Products on Main Page - Category with SubCategories', 'SHOW_PRODUCT_INFO_CATEGORY_FEATURED_PRODUCTS', '2', 'Show Featured Products on Main Page - Category with SubCategories<br />0= off or set the sort order', 24, 71, NULL, '2014-10-27 13:41:17', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(503, 'Show Special Products on Main Page - Category with SubCategories', 'SHOW_PRODUCT_INFO_CATEGORY_SPECIALS_PRODUCTS', '0', 'Show Special Products on Main Page - Category with SubCategories<br />0= off or set the sort order', 24, 72, '2014-12-11 08:25:45', '2014-10-27 13:41:17', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(504, 'Show Upcoming Products on Main Page - Category with SubCategories', 'SHOW_PRODUCT_INFO_CATEGORY_UPCOMING', '4', 'Show Upcoming Products on Main Page - Category with SubCategories<br />0= off or set the sort order', 24, 73, NULL, '2014-10-27 13:41:17', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(505, 'Show New Products on Main Page - Errors and Missing Products Page', 'SHOW_PRODUCT_INFO_MISSING_NEW_PRODUCTS', '1', 'Show New Products on Main Page - Errors and Missing Product<br />0= off or set the sort order', 24, 75, NULL, '2014-10-27 13:41:17', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(506, 'Show Featured Products on Main Page - Errors and Missing Products Page', 'SHOW_PRODUCT_INFO_MISSING_FEATURED_PRODUCTS', '2', 'Show Featured Products on Main Page - Errors and Missing Product<br />0= off or set the sort order', 24, 76, NULL, '2014-10-27 13:41:17', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(507, 'Show Special Products on Main Page - Errors and Missing Products Page', 'SHOW_PRODUCT_INFO_MISSING_SPECIALS_PRODUCTS', '3', 'Show Special Products on Main Page - Errors and Missing Product<br />0= off or set the sort order', 24, 77, NULL, '2014-10-27 13:41:17', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(508, 'Show Upcoming Products on Main Page - Errors and Missing Products Page', 'SHOW_PRODUCT_INFO_MISSING_UPCOMING', '4', 'Show Upcoming Products on Main Page - Errors and Missing Product<br />0= off or set the sort order', 24, 78, NULL, '2014-10-27 13:41:17', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(509, 'Show New Products - below Product Listing', 'SHOW_PRODUCT_INFO_LISTING_BELOW_NEW_PRODUCTS', '0', 'Show New Products below Product Listing<br />0= off or set the sort order', 24, 85, '2014-12-10 15:41:44', '2014-10-27 13:41:17', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(510, 'Show Featured Products - below Product Listing', 'SHOW_PRODUCT_INFO_LISTING_BELOW_FEATURED_PRODUCTS', '0', 'Show Featured Products below Product Listing<br />0= off or set the sort order', 24, 86, '2014-12-10 15:41:56', '2014-10-27 13:41:17', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(511, 'Show Special Products - below Product Listing', 'SHOW_PRODUCT_INFO_LISTING_BELOW_SPECIALS_PRODUCTS', '0', 'Show Special Products below Product Listing<br />0= off or set the sort order', 24, 87, '2014-12-10 15:42:01', '2014-10-27 13:41:17', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(512, 'Show Upcoming Products - below Product Listing', 'SHOW_PRODUCT_INFO_LISTING_BELOW_UPCOMING', '0', 'Show Upcoming Products below Product Listing<br />0= off or set the sort order', 24, 88, '2014-12-10 15:42:04', '2014-10-27 13:41:17', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4''), '),
(513, 'New Products Columns per Row', 'SHOW_PRODUCT_INFO_COLUMNS_NEW_PRODUCTS', '4', 'New Products Columns per Row', 24, 95, '2015-04-14 07:34:21', '2014-10-27 13:41:17', NULL, 'zen_cfg_select_option(array(''1'', ''2'', ''3'', ''4'', ''5'', ''6'', ''7'', ''8'', ''9'', ''10'', ''11'', ''12''), '),
(514, 'Featured Products Columns per Row', 'SHOW_PRODUCT_INFO_COLUMNS_FEATURED_PRODUCTS', '4', 'Featured Products Columns per Row', 24, 96, '2015-04-09 09:32:16', '2014-10-27 13:41:17', NULL, 'zen_cfg_select_option(array(''1'', ''2'', ''3'', ''4'', ''5'', ''6'', ''7'', ''8'', ''9'', ''10'', ''11'', ''12''), '),
(515, 'Special Products Columns per Row', 'SHOW_PRODUCT_INFO_COLUMNS_SPECIALS_PRODUCTS', '4', 'Special Products Columns per Row', 24, 97, '2015-04-14 07:34:29', '2014-10-27 13:41:17', NULL, 'zen_cfg_select_option(array(''1'', ''2'', ''3'', ''4'', ''5'', ''6'', ''7'', ''8'', ''9'', ''10'', ''11'', ''12''), '),
(516, 'Filter Product Listing for Current Top Level Category When Enabled', 'SHOW_PRODUCT_INFO_ALL_PRODUCTS', '1', 'Filter the products when Product Listing is enabled for current Main Category or show products from all categories?<br />0= Filter Off 1=Filter On ', 24, 100, NULL, '2014-10-27 13:41:17', NULL, 'zen_cfg_select_option(array(''0'', ''1''), '),
(517, 'Define Main Page Status', 'DEFINE_MAIN_PAGE_STATUS', '1', 'Enable the Defined Main Page Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', 25, 60, '2014-10-27 13:41:17', '2014-10-27 13:41:17', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(518, 'Define Contact Us Status', 'DEFINE_CONTACT_US_STATUS', '1', 'Enable the Defined Contact Us Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', 25, 61, '2014-10-27 13:41:17', '2014-10-27 13:41:17', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(519, 'Define Privacy Status', 'DEFINE_PRIVACY_STATUS', '1', 'Enable the Defined Privacy Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', 25, 62, '2014-10-27 13:41:17', '2014-10-27 13:41:17', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(520, 'Define Shipping & Returns', 'DEFINE_SHIPPINGINFO_STATUS', '1', 'Enable the Defined Shipping & Returns Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', 25, 63, '2014-10-27 13:41:17', '2014-10-27 13:41:17', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(521, 'Define Conditions of Use', 'DEFINE_CONDITIONS_STATUS', '1', 'Enable the Defined Conditions of Use Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', 25, 64, '2014-10-27 13:41:17', '2014-10-27 13:41:17', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(522, 'Define Checkout Success', 'DEFINE_CHECKOUT_SUCCESS_STATUS', '1', 'Enable the Defined Checkout Success Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', 25, 65, '2014-10-27 13:41:17', '2014-10-27 13:41:17', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(523, 'Define Discount Coupon', 'DEFINE_DISCOUNT_COUPON_STATUS', '1', 'Enable the Defined Discount Coupon Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', 25, 66, '2014-10-27 13:41:17', '2014-10-27 13:41:17', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(524, 'Define Site Map Status', 'DEFINE_SITE_MAP_STATUS', '1', 'Enable the Defined Site Map Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', 25, 67, '2014-10-27 13:41:17', '2014-10-27 13:41:17', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(525, 'Define Page-Not-Found Status', 'DEFINE_PAGE_NOT_FOUND_STATUS', '1', 'Enable the Defined Page-Not-Found Text from define-pages?<br />0= Define Text OFF<br />1= Define Text ON', 25, 67, '2014-10-27 13:41:17', '2014-10-27 13:41:17', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(526, 'Define Page 2', 'DEFINE_PAGE_2_STATUS', '1', 'Enable the Defined Page 2 Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', 25, 82, '2014-10-27 13:41:17', '2014-10-27 13:41:17', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(527, 'Define Page 3', 'DEFINE_PAGE_3_STATUS', '1', 'Enable the Defined Page 3 Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', 25, 83, '2014-10-27 13:41:17', '2014-10-27 13:41:17', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(528, 'Define Page 4', 'DEFINE_PAGE_4_STATUS', '1', 'Enable the Defined Page 4 Link/Text?<br />0= Link ON, Define Text OFF<br />1= Link ON, Define Text ON<br />2= Link OFF, Define Text ON<br />3= Link OFF, Define Text OFF', 25, 84, '2014-10-27 13:41:17', '2014-10-27 13:41:17', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3''),'),
(529, 'EZ-Pages Display Status - HeaderBar', 'EZPAGES_STATUS_HEADER', '1', 'Display of EZ-Pages content can be Globally enabled/disabled for the Header Bar<br />0 = Off<br />1 = On<br />2= On ADMIN IP ONLY located in Website Maintenance<br />NOTE: Warning only shows to the Admin and not to the public', 30, 10, NULL, '2014-10-27 13:41:17', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(530, 'EZ-Pages Display Status - FooterBar', 'EZPAGES_STATUS_FOOTER', '1', 'Display of EZ-Pages content can be Globally enabled/disabled for the Footer Bar<br />0 = Off<br />1 = On<br />2= On ADMIN IP ONLY located in Website Maintenance<br />NOTE: Warning only shows to the Admin and not to the public', 30, 11, NULL, '2014-10-27 13:41:17', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(531, 'EZ-Pages Display Status - Sidebox', 'EZPAGES_STATUS_SIDEBOX', '1', 'Display of EZ-Pages content can be Globally enabled/disabled for the Sidebox<br />0 = Off<br />1 = On<br />2= On ADMIN IP ONLY located in Website Maintenance<br />NOTE: Warning only shows to the Admin and not to the public', 30, 12, NULL, '2014-10-27 13:41:17', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(532, 'EZ-Pages Header Link Separator', 'EZPAGES_SEPARATOR_HEADER', '', 'EZ-Pages Header Link Separator<br />Default = &amp;nbsp;::&amp;nbsp;', 30, 20, NULL, '2014-10-27 13:41:17', NULL, 'zen_cfg_textarea_small('),
(533, 'EZ-Pages Footer Link Separator', 'EZPAGES_SEPARATOR_FOOTER', '&nbsp;&nbsp;|&nbsp;&nbsp;', 'EZ-Pages Footer Link Separator<br />Default = &amp;nbsp;::&amp;nbsp;', 30, 21, NULL, '2014-10-27 13:41:17', NULL, 'zen_cfg_textarea_small('),
(534, 'EZ-Pages Prev/Next Buttons', 'EZPAGES_SHOW_PREV_NEXT_BUTTONS', '2', 'Display Prev/Continue/Next buttons on EZ-Pages pages?<br />0=OFF (no buttons)<br />1="Continue"<br />2="Prev/Continue/Next"<br /><br />Default setting: 2.', 30, 30, NULL, '2014-10-27 13:41:17', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2''), '),
(535, 'EZ-Pages Table of Contents for Chapters Status', 'EZPAGES_SHOW_TABLE_CONTENTS', '1', 'Enable EZ-Pages Table of Contents for Chapters?<br />0= OFF<br />1= ON', 30, 35, '2014-10-27 13:41:17', '2014-10-27 13:41:17', NULL, 'zen_cfg_select_option(array(''0'', ''1''),'),
(536, 'EZ-Pages Pages to disable headers', 'EZPAGES_DISABLE_HEADER_DISPLAY_LIST', '', 'EZ-Pages "pages" on which to NOT display the normal "header" for your site.<br />Simply list page ID numbers separated by commas with no spaces.<br />Page ID numbers can be obtained from the EZ-Pages screen under Admin->Tools.<br />ie: 1,5,2<br />or leave blank.', 30, 40, NULL, '2014-10-27 13:41:17', NULL, 'zen_cfg_textarea_small('),
(537, 'EZ-Pages Pages to disable footers', 'EZPAGES_DISABLE_FOOTER_DISPLAY_LIST', '', 'EZ-Pages "pages" on which to NOT display the normal "footer" for your site.<br />Simply list page ID numbers separated by commas with no spaces.<br />Page ID numbers can be obtained from the EZ-Pages screen under Admin->Tools.<br />ie: 3,7<br />or leave blank.', 30, 41, NULL, '2014-10-27 13:41:17', NULL, 'zen_cfg_textarea_small('),
(538, 'EZ-Pages Pages to disable left-column', 'EZPAGES_DISABLE_LEFTCOLUMN_DISPLAY_LIST', '', 'EZ-Pages "pages" on which to NOT display the normal "left" column (of sideboxes) for your site.<br />Simply list page ID numbers separated by commas with no spaces.<br />Page ID numbers can be obtained from the EZ-Pages screen under Admin->Tools.<br />ie: 21<br />or leave blank.', 30, 42, NULL, '2014-10-27 13:41:17', NULL, 'zen_cfg_textarea_small('),
(539, 'EZ-Pages Pages to disable right-column', 'EZPAGES_DISABLE_RIGHTCOLUMN_DISPLAY_LIST', '', 'EZ-Pages "pages" on which to NOT display the normal "right" column (of sideboxes) for your site.<br />Simply list page ID numbers separated by commas with no spaces.<br />Page ID numbers can be obtained from the EZ-Pages screen under Admin->Tools.<br />ie: 3,82,13<br />or leave blank.', 30, 43, NULL, '2014-10-27 13:41:17', NULL, 'zen_cfg_textarea_small('),
(540, 'Convert currencies for Text emails', 'CURRENCIES_TRANSLATIONS', '&pound;,£:&euro;,€:&reg;,®:&trade;,™', 'What currency conversions do you need for Text emails?<br />Example = &amp;pound;,&pound;:&amp;euro;,&euro;', 12, 120, NULL, '2003-11-21 00:00:00', NULL, 'zen_cfg_textarea_small('),
(541, 'Use root path for cookie path', 'SESSION_USE_ROOT_COOKIE_PATH', 'False', 'Normally Zen Cart will use the directory that a store resides in as the cookie path. This can cause problems with some servers. This setting allows you to set the cookie path to the root of the server, rather than the store directory. It should only be used if you have problems with sessions. <strong>Default Value = False</strong><br /><br /><strong>Changing this setting may mean you have problems logging into your admin, you should clear your browser cookies to overcome this.</strong>', 15, 999, NULL, '0001-01-01 00:00:00', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(542, 'Add period prefix to cookie domain', 'SESSION_ADD_PERIOD_PREFIX', 'False', 'Normally Zen Cart will add a period prefix to the cookie domain, e.g.  .www.mydomain.com. This can sometimes cause problems with some server configurations. If you are having session problems you may want to try setting this to False. <strong>Default Value = True</strong>', 15, 999, '2015-04-14 11:56:18', '0001-01-01 00:00:00', NULL, 'zen_cfg_select_option(array(''True'', ''False''), '),
(737, 'Specials block description', 'TM_MEGAMENU_SPECIALS_TEXT', 'true', 'Enable description on TM Megamenu', 59, 21, NULL, '2022-10-05 21:11:39', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(738, 'Specials block description text', 'TM_MEGAMENU_SPECIALS_DESC_TEXT', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque porttitor egestas dictum. Proin dolor lacus, placerat non magna in, ultricies molestie nisl. Aliquam dui dolor, bibendum eget diam ac, pellentesque ultricies dui. Pellentesque mattis sit amet nibh eget pulvinar. Curabitur nec turpis porta dui sollicitudin dignissim. Duis cursus leo sit amet quam posuere, in iaculis quam dignissim. Donec est nulla, tristique quis dignissim at, rutrum non massa. In ultrices tellus turpis, at vehicula justo fringilla ut. Cras a eros sagittis, placerat nulla ac, condimentum mi. Mauris ornare sem vel laoreet fermentum. In hac habitasse platea dictumst. ', 'Specials block text', 59, 22, NULL, '2022-10-05 21:11:39', NULL, NULL),
(736, 'Specials block label', 'TM_MEGAMENU_SPECIALS_LABEL', 'Sale!', 'Specials block label', 59, 20, NULL, '2022-10-05 21:11:39', NULL, NULL),
(734, 'Custom block label', 'TM_MEGAMENU_CUSTOM_LABEL', '', 'Contacts block label', 59, 18, NULL, '2022-10-05 21:11:39', NULL, NULL),
(735, 'Specials block', 'TM_MEGAMENU_SPECIALS', 'true', 'Enable specials products on TM Megamenu', 59, 19, NULL, '2022-10-05 21:11:39', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(733, 'Custom block', 'TM_MEGAMENU_CUSTOM', 'true', 'Enable shipping info', 59, 16, NULL, '2022-10-05 21:11:39', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(732, 'Info block label', 'TM_MEGAMENU_INFORMATION_LABEL', '', 'Info block label', 59, 13, NULL, '2022-10-05 21:11:39', NULL, NULL),
(731, 'Info', 'TM_MEGAMENU_INFO', 'true', 'Enable info links', 59, 12, NULL, '2022-10-05 21:11:39', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(730, 'Manufacturers block label', 'TM_MEGAMENU_BRANDS_LABEL', '', 'Manufacturers label', 59, 11, NULL, '2022-10-05 21:11:39', NULL, NULL),
(729, 'Manufacturers images', 'TM_MEGAMENU_BRANDS_IMAGES', 'true', 'Show manufacturers images "true" or "false"', 59, 10, NULL, '2022-10-05 21:11:39', NULL, NULL),
(728, 'Manufacturers', 'TM_MEGAMENU_BRANDS', 'true', 'Drop-down manufacturers', 59, 9, NULL, '2022-10-05 21:11:39', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(727, 'Categories block label', 'TM_MEGAMENU_CATEGORIES_LABEL', 'New!', 'Category label', 59, 8, NULL, '2022-10-05 21:11:39', NULL, NULL),
(726, 'Categories banners', 'TM_MEGAMENU_CATEGORIES_BANNERS', 'true', 'Enable banners in Drop-down categories ', 59, 7, NULL, '2022-10-05 21:11:39', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(725, 'Categories block width', 'TM_MEGAMENU_CATEGORIES_COL_WIDTH', '9', 'width dropdown menu 2-9', 59, 6, NULL, '2022-10-05 21:11:39', NULL, 'zen_cfg_select_option(array(''2'', ''3'', ''4'', ''5'', ''6'', ''7'', ''8'', ''9''),'),
(724, 'Categories', 'TM_MEGAMENU_CATEGORIES', 'true', 'Drop-down categories', 59, 5, NULL, '2022-10-05 21:11:39', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(723, 'Quick links block label', 'TM_MEGAMENU_QICKLINKS_LABEL', '', 'Quick links block label', 59, 4, NULL, '2022-10-05 21:11:39', NULL, NULL),
(567, 'Results Per Page', 'MAX_DISPLAY_SUGGESTION', '5', 'Number of results per page', 32, 1, NULL, '2014-11-06 09:53:41', NULL, ''),
(568, 'Result Image Width', 'SUGGESTION_IMAGE_WIDTH', '50', 'Image width of result', 32, 2, NULL, '2014-11-06 09:53:41', NULL, ''),
(569, 'Result Image Height', 'SUGGESTION_IMAGE_HEIGHT', '50', 'Image height of result', 32, 3, NULL, '2014-11-06 09:53:41', NULL, ''),
(722, 'Quick links', 'TM_MEGAMENU_QUICK', 'true', 'EZ-Pages in header', 59, 3, NULL, '2022-10-05 21:11:39', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(721, 'Stick up', 'TM_MEGAMENU_STICK', 'true', 'Stick up menu?', 59, 2, NULL, '2022-10-05 21:11:39', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(720, 'TM Megamenu', 'TM_MEGAMENU_STATUS', 'true', 'Activate TM Megamenu', 59, 1, NULL, '2022-10-05 21:11:39', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(758, 'Banner Display Groups - Slide9', 'ZX_SLIDESHOW_BANNERS_GROUP_SET17', 'slide9', 'Slide 9', 60, 38, NULL, '2022-10-05 21:12:02', NULL, NULL),
(756, 'Banner Display Groups - Slide7', 'ZX_SLIDESHOW_BANNERS_GROUP_SET15', 'slide7', 'Slide 7', 60, 36, NULL, '2022-10-05 21:12:02', NULL, NULL),
(757, 'Banner Display Groups - Slide8', 'ZX_SLIDESHOW_BANNERS_GROUP_SET16', 'slide8', 'Slide 8', 60, 37, NULL, '2022-10-05 21:12:02', NULL, NULL);
INSERT INTO `configuration` (`configuration_id`, `configuration_title`, `configuration_key`, `configuration_value`, `configuration_description`, `configuration_group_id`, `sort_order`, `last_modified`, `date_added`, `use_function`, `set_function`) VALUES
(754, 'Banner Display Groups - Slide5', 'ZX_SLIDESHOW_BANNERS_GROUP_SET13', 'slide5', 'Slide 5', 60, 34, NULL, '2022-10-05 21:12:02', NULL, NULL),
(755, 'Banner Display Groups - Slide6', 'ZX_SLIDESHOW_BANNERS_GROUP_SET14', 'slide6', 'Slide 6', 60, 35, NULL, '2022-10-05 21:12:02', NULL, NULL),
(753, 'Banner Display Groups - Slide4', 'ZX_SLIDESHOW_BANNERS_GROUP_SET12', 'slide4', 'Slide 4', 60, 33, NULL, '2022-10-05 21:12:02', NULL, NULL),
(752, 'Banner Display Groups - Slide3', 'ZX_SLIDESHOW_BANNERS_GROUP_SET11', 'slider', 'Slide 3', 60, 32, NULL, '2022-10-05 21:12:02', NULL, NULL),
(751, 'Banner Display Groups - Slide2', 'ZX_SLIDESHOW_BANNERS_GROUP_SET10', 'slider', 'Slide 2', 60, 31, NULL, '2022-10-05 21:12:02', NULL, NULL),
(749, 'Slideshow Captions', 'ZX_SLIDESHOW_CAPTION_OPACITY', '0.8', 'Caption opacity (set to 0 for invisible)', 60, 10, NULL, '2022-10-05 21:12:02', NULL, NULL),
(750, 'Banner Display Groups - Slide1', 'ZX_SLIDESHOW_BANNERS_GROUP_SET9', 'slider', 'Slide 1', 60, 30, NULL, '2022-10-05 21:12:02', NULL, NULL),
(748, 'Slideshow Pause on Hover', 'ZX_SLIDESHOW_HOVER_PAUSE', 'true', 'Stop animation while hovering', 60, 9, NULL, '2022-10-05 21:12:02', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(747, 'Slideshow Numbered Navigation', 'ZX_SLIDESHOW_CONTROL_NAV', 'false', 'Show 1,2,3... navigation', 60, 8, NULL, '2022-10-05 21:12:02', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(746, 'Slideshow Navigation Hide', 'ZX_SLIDESHOW_NAV_HIDE', 'true', 'Show Prev/Next navigation arrows only on hover', 60, 7, NULL, '2022-10-05 21:12:02', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(745, 'Slideshow Navigation Arrows', 'ZX_SLIDESHOW_NAV', 'true', 'Show Prev/Next navigation arrows', 60, 6, NULL, '2022-10-05 21:12:02', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(744, 'Slideshow Pause Time', 'ZX_SLIDESHOW_PAUSE', '4000', 'How long each slide will show in miliseconds', 60, 5, NULL, '2022-10-05 21:12:02', NULL, NULL),
(743, 'Slideshow Animation Speed', 'ZX_SLIDESHOW_ANIM_SPEED', '500', 'Slide transition speed in miliseconds', 60, 4, NULL, '2022-10-05 21:12:02', NULL, NULL),
(742, ' Effect', 'ZX_SLIDESHOW_EFFECT', 'fold', 'Effect used for image transition', 60, 3, NULL, '2022-10-05 21:12:02', NULL, 'zen_cfg_select_option(array(''sliceDown'', ''sliceDownLeft'', ''sliceUp'', ''sliceUpLeft'', ''sliceUpDown'', ''sliceUpDownLeft'', ''fold'', ''fade'', ''random'', ''slideInRight'', ''slideInLeft'', ''boxRandom'', ''boxRain'', ''boxRainReverse'', ''boxRainGrow'', ''boxRainGrowReverse''),'),
(740, 'ZX Slideshow', 'ZX_SLIDESHOW_STATUS', 'true', 'Activate ZX Slideshow for the main page', 60, 1, NULL, '2022-10-05 21:12:02', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(741, 'Slideshow Theme', 'ZX_SLIDESHOW_THEME', 'default', 'Select your theme', 60, 2, NULL, '2022-10-05 21:12:02', NULL, 'zen_cfg_select_option(array(''default'', ''light'', ''dark'', ''bar''),'),
(695, 'Related Products Columns per Row', 'SHOW_PRODUCT_INFO_COLUMNS_RELATED_PRODUCTS', '3', 'Related Products Columns per Row<br />0= off or set the sort order', 18, 100, NULL, '2015-01-05 14:56:53', NULL, 'zen_cfg_select_option(array(''0'', ''1'', ''2'', ''3'', ''4'', ''5'', ''6'', ''7'', ''8'', ''9'', ''10'', ''11'', ''12''),'),
(714, 'TM Customblock Version', 'TM_CUSTOMBLOCK_VERSION', '1.0', 'Currently using: <strong>v1.0</strong><br />Module brought to you by meddif', 57, 5, NULL, '2015-08-14 10:49:49', NULL, 'zen_cfg_select_option(array(''1.0''),'),
(710, 'TM Customblock', 'TM_CUSTOMBLOCK_STATUS', 'false', 'Activate TM Customblock', 57, 1, NULL, '2015-08-14 10:49:49', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(711, '1st custom block', 'TM_CUSTOMBLOCK_TEXT1', '<h2>Custom block 1</h2><img class="img-responsive" src="images/custom_img_1.png" alt=""/><p>Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>', 'Custom block 1', 57, 2, NULL, '2015-08-14 10:49:49', NULL, NULL),
(712, '2nd custom block', 'TM_CUSTOMBLOCK_TEXT2', '<h2>Custom block 1</h2><img class="img-responsive" src="images/custom_img_2.png" alt=""/><p>Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>', 'Custom block 2', 57, 3, NULL, '2015-08-14 10:49:49', NULL, NULL),
(713, '3rd custom block', 'TM_CUSTOMBLOCK_TEXT3', '<h2>Custom block 1</h2><img class="img-responsive" src="images/custom_img_3.png" alt=""/><p>Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>', 'Custom block 3', 57, 4, NULL, '2015-08-14 10:49:49', NULL, NULL),
(765, 'Pinterest button', 'TM_SOCIAL_BLOCK_STATUS_PN', 'true', 'Pinterest button status', 61, 5, NULL, '2022-10-05 21:12:09', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(764, 'Facebook button', 'TM_SOCIAL_BLOCK_STATUS_FB', 'true', 'Facebook button status', 61, 4, NULL, '2022-10-05 21:12:09', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(763, 'Google +1 button', 'TM_SOCIAL_BLOCK_STATUS_GO', 'true', 'Google +1 button status', 61, 3, NULL, '2022-10-05 21:12:09', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(762, 'Twitter button', 'TM_SOCIAL_BLOCK_STATUS_TW', 'true', 'Twitter button status', 61, 2, NULL, '2022-10-05 21:12:09', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(761, 'TM Social Block', 'TM_SOCIAL_BLOCK_STATUS', 'true', 'Activate TM Megamenu', 61, 1, NULL, '2022-10-05 21:12:09', NULL, 'zen_cfg_select_option(array(''true'', ''false''),'),
(739, 'TM Megamenu Version', 'TM_MEGAMENU_VERSION', '1.0', 'Currently using: <strong>v1.0</strong><br />Module brought to you by meddif', 59, 50, NULL, '2022-10-05 21:11:39', NULL, 'zen_cfg_select_option(array(''1.0''),'),
(759, 'Banner Display Groups - Slide10', 'ZX_SLIDESHOW_BANNERS_GROUP_SET18', 'slide10', 'Slide 10', 60, 39, NULL, '2022-10-05 21:12:02', NULL, NULL),
(760, 'ZX Slideshow Version', 'ZX_SLIDESHOW_VERSION', '2.0', 'Currently using: <strong>v2.0</strong><br />Module brought to you by <a href="http://www.zenexpert.com" target="_blank">ZenExpert</a>', 60, 50, NULL, '2022-10-05 21:12:02', NULL, 'zen_cfg_select_option(array(''2.0''),');

-- --------------------------------------------------------

--
-- Table structure for table `configuration_group`
--

CREATE TABLE IF NOT EXISTS `configuration_group` (
  `configuration_group_id` int(11) NOT NULL,
  `configuration_group_title` varchar(64) NOT NULL DEFAULT '',
  `configuration_group_description` varchar(255) NOT NULL DEFAULT '',
  `sort_order` int(5) DEFAULT NULL,
  `visible` int(1) DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `configuration_group`
--

INSERT INTO `configuration_group` (`configuration_group_id`, `configuration_group_title`, `configuration_group_description`, `sort_order`, `visible`) VALUES
(1, 'My Store', 'General information about my store', 1, 1),
(2, 'Minimum Values', 'The minimum values for functions / data', 2, 1),
(3, 'Maximum Values', 'The maximum values for functions / data', 3, 1),
(4, 'Images', 'Image parameters', 4, 1),
(5, 'Customer Details', 'Customer account configuration', 5, 1),
(6, 'Module Options', 'Hidden from configuration', 6, 0),
(7, 'Shipping/Packaging', 'Shipping options available at my store', 7, 1),
(8, 'Product Listing', 'Product Listing configuration options', 8, 1),
(9, 'Stock', 'Stock configuration options', 9, 1),
(10, 'Logging', 'Logging configuration options', 10, 1),
(11, 'Regulations', 'Regulation options', 16, 1),
(12, 'E-Mail Options', 'General settings for E-Mail transport and HTML E-Mails', 12, 1),
(13, 'Attribute Settings', 'Configure products attributes settings', 13, 1),
(14, 'GZip Compression', 'GZip compression options', 14, 1),
(15, 'Sessions', 'Session options', 15, 1),
(16, 'GV Coupons', 'Gift Vouchers and Coupons', 16, 1),
(17, 'Credit Cards', 'Credit Cards Accepted', 17, 1),
(18, 'Product Info', 'Product Info Display Options', 18, 1),
(19, 'Layout Settings', 'Layout Options', 19, 1),
(20, 'Website Maintenance', 'Website Maintenance Options', 20, 1),
(21, 'New Listing', 'New Products Listing', 21, 1),
(22, 'Featured Listing', 'Featured Products Listing', 22, 1),
(23, 'All Listing', 'All Products Listing', 23, 1),
(24, 'Index Listing', 'Index Products Listing', 24, 1),
(25, 'Define Page Status', 'Define Main Pages and HTMLArea Options', 25, 1),
(30, 'EZ-Pages Settings', 'EZ-Pages Settings', 30, 1),
(59, 'TM Megamenu', 'Set Megamenu Options', 59, 1),
(32, 'Suggestion Box', 'Set Suggestion Box Configuration', 32, 1),
(60, 'ZX Slideshow', 'Set Slideshow Options', 60, 1),
(34, 'Modules Carousel Manager', 'Manager Carousel Option for Modules', 34, 1),
(57, 'TM Customblock', 'Set Customblock Options', 57, 1),
(61, 'TM Social Block', 'Set Social Block Options', 61, 1);

-- --------------------------------------------------------

--
-- Table structure for table `counter`
--

CREATE TABLE IF NOT EXISTS `counter` (
  `startdate` char(8) DEFAULT NULL,
  `counter` int(12) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `counter`
--

INSERT INTO `counter` (`startdate`, `counter`) VALUES
('20150407', 2394);

-- --------------------------------------------------------

--
-- Table structure for table `counter_history`
--

CREATE TABLE IF NOT EXISTS `counter_history` (
  `startdate` char(8) NOT NULL DEFAULT '',
  `counter` int(12) DEFAULT NULL,
  `session_counter` int(12) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `counter_history`
--

INSERT INTO `counter_history` (`startdate`, `counter`, `session_counter`) VALUES
('20150407', 372, 3),
('20150408', 238, 2),
('20150409', 535, 3),
('20150410', 193, 4),
('20150414', 430, 5),
('20150415', 128, 1),
('20150812', 32, 1),
('20150813', 230, 5),
('20150814', 191, 2),
('20221006', 35, 7),
('20221007', 3, 1),
('20221009', 3, 1),
('20221014', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE IF NOT EXISTS `countries` (
  `countries_id` int(11) NOT NULL,
  `countries_name` varchar(64) NOT NULL DEFAULT '',
  `countries_iso_code_2` char(2) NOT NULL DEFAULT '',
  `countries_iso_code_3` char(3) NOT NULL DEFAULT '',
  `address_format_id` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=247 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`countries_id`, `countries_name`, `countries_iso_code_2`, `countries_iso_code_3`, `address_format_id`, `status`) VALUES
(240, 'Aaland Islands', 'AX', 'ALA', 1, 1),
(1, 'Afghanistan', 'AF', 'AFG', 1, 1),
(2, 'Albania', 'AL', 'ALB', 1, 1),
(3, 'Algeria', 'DZ', 'DZA', 1, 1),
(4, 'American Samoa', 'AS', 'ASM', 1, 1),
(5, 'Andorra', 'AD', 'AND', 1, 1),
(6, 'Angola', 'AO', 'AGO', 1, 1),
(7, 'Anguilla', 'AI', 'AIA', 1, 1),
(8, 'Antarctica', 'AQ', 'ATA', 1, 1),
(9, 'Antigua and Barbuda', 'AG', 'ATG', 1, 1),
(10, 'Argentina', 'AR', 'ARG', 1, 1),
(11, 'Armenia', 'AM', 'ARM', 1, 1),
(12, 'Aruba', 'AW', 'ABW', 1, 1),
(13, 'Australia', 'AU', 'AUS', 7, 1),
(14, 'Austria', 'AT', 'AUT', 5, 1),
(15, 'Azerbaijan', 'AZ', 'AZE', 1, 1),
(16, 'Bahamas', 'BS', 'BHS', 1, 1),
(17, 'Bahrain', 'BH', 'BHR', 1, 1),
(18, 'Bangladesh', 'BD', 'BGD', 1, 1),
(19, 'Barbados', 'BB', 'BRB', 1, 1),
(20, 'Belarus', 'BY', 'BLR', 1, 1),
(21, 'Belgium', 'BE', 'BEL', 5, 1),
(22, 'Belize', 'BZ', 'BLZ', 1, 1),
(23, 'Benin', 'BJ', 'BEN', 1, 1),
(24, 'Bermuda', 'BM', 'BMU', 1, 1),
(25, 'Bhutan', 'BT', 'BTN', 1, 1),
(26, 'Bolivia', 'BO', 'BOL', 1, 1),
(27, 'Bosnia and Herzegowina', 'BA', 'BIH', 1, 1),
(28, 'Botswana', 'BW', 'BWA', 1, 1),
(29, 'Bouvet Island', 'BV', 'BVT', 1, 1),
(30, 'Brazil', 'BR', 'BRA', 1, 1),
(31, 'British Indian Ocean Territory', 'IO', 'IOT', 1, 1),
(32, 'Brunei Darussalam', 'BN', 'BRN', 1, 1),
(33, 'Bulgaria', 'BG', 'BGR', 1, 1),
(34, 'Burkina Faso', 'BF', 'BFA', 1, 1),
(35, 'Burundi', 'BI', 'BDI', 1, 1),
(36, 'Cambodia', 'KH', 'KHM', 1, 1),
(37, 'Cameroon', 'CM', 'CMR', 1, 1),
(38, 'Canada', 'CA', 'CAN', 2, 1),
(39, 'Cape Verde', 'CV', 'CPV', 1, 1),
(40, 'Cayman Islands', 'KY', 'CYM', 1, 1),
(41, 'Central African Republic', 'CF', 'CAF', 1, 1),
(42, 'Chad', 'TD', 'TCD', 1, 1),
(43, 'Chile', 'CL', 'CHL', 1, 1),
(44, 'China', 'CN', 'CHN', 1, 1),
(45, 'Christmas Island', 'CX', 'CXR', 1, 1),
(46, 'Cocos (Keeling) Islands', 'CC', 'CCK', 1, 1),
(47, 'Colombia', 'CO', 'COL', 1, 1),
(48, 'Comoros', 'KM', 'COM', 1, 1),
(49, 'Congo', 'CG', 'COG', 1, 1),
(50, 'Cook Islands', 'CK', 'COK', 1, 1),
(51, 'Costa Rica', 'CR', 'CRI', 1, 1),
(52, 'Cote D''Ivoire', 'CI', 'CIV', 1, 1),
(53, 'Croatia', 'HR', 'HRV', 1, 1),
(54, 'Cuba', 'CU', 'CUB', 1, 1),
(55, 'Cyprus', 'CY', 'CYP', 1, 1),
(56, 'Czech Republic', 'CZ', 'CZE', 1, 1),
(57, 'Denmark', 'DK', 'DNK', 1, 1),
(58, 'Djibouti', 'DJ', 'DJI', 1, 1),
(59, 'Dominica', 'DM', 'DMA', 1, 1),
(60, 'Dominican Republic', 'DO', 'DOM', 1, 1),
(61, 'Timor-Leste', 'TL', 'TLS', 1, 1),
(62, 'Ecuador', 'EC', 'ECU', 1, 1),
(63, 'Egypt', 'EG', 'EGY', 1, 1),
(64, 'El Salvador', 'SV', 'SLV', 1, 1),
(65, 'Equatorial Guinea', 'GQ', 'GNQ', 1, 1),
(66, 'Eritrea', 'ER', 'ERI', 1, 1),
(67, 'Estonia', 'EE', 'EST', 1, 1),
(68, 'Ethiopia', 'ET', 'ETH', 1, 1),
(69, 'Falkland Islands (Malvinas)', 'FK', 'FLK', 1, 1),
(70, 'Faroe Islands', 'FO', 'FRO', 1, 1),
(71, 'Fiji', 'FJ', 'FJI', 1, 1),
(72, 'Finland', 'FI', 'FIN', 1, 1),
(73, 'France', 'FR', 'FRA', 1, 1),
(75, 'French Guiana', 'GF', 'GUF', 1, 1),
(76, 'French Polynesia', 'PF', 'PYF', 1, 1),
(77, 'French Southern Territories', 'TF', 'ATF', 1, 1),
(78, 'Gabon', 'GA', 'GAB', 1, 1),
(79, 'Gambia', 'GM', 'GMB', 1, 1),
(80, 'Georgia', 'GE', 'GEO', 1, 1),
(81, 'Germany', 'DE', 'DEU', 5, 1),
(82, 'Ghana', 'GH', 'GHA', 1, 1),
(83, 'Gibraltar', 'GI', 'GIB', 1, 1),
(84, 'Greece', 'GR', 'GRC', 1, 1),
(85, 'Greenland', 'GL', 'GRL', 1, 1),
(86, 'Grenada', 'GD', 'GRD', 1, 1),
(87, 'Guadeloupe', 'GP', 'GLP', 1, 1),
(88, 'Guam', 'GU', 'GUM', 1, 1),
(89, 'Guatemala', 'GT', 'GTM', 1, 1),
(90, 'Guinea', 'GN', 'GIN', 1, 1),
(91, 'Guinea-bissau', 'GW', 'GNB', 1, 1),
(92, 'Guyana', 'GY', 'GUY', 1, 1),
(93, 'Haiti', 'HT', 'HTI', 1, 1),
(94, 'Heard and Mc Donald Islands', 'HM', 'HMD', 1, 1),
(95, 'Honduras', 'HN', 'HND', 1, 1),
(96, 'Hong Kong', 'HK', 'HKG', 1, 1),
(97, 'Hungary', 'HU', 'HUN', 1, 1),
(98, 'Iceland', 'IS', 'ISL', 1, 1),
(99, 'India', 'IN', 'IND', 1, 1),
(100, 'Indonesia', 'ID', 'IDN', 1, 1),
(101, 'Iran (Islamic Republic of)', 'IR', 'IRN', 1, 1),
(102, 'Iraq', 'IQ', 'IRQ', 1, 1),
(103, 'Ireland', 'IE', 'IRL', 1, 1),
(104, 'Israel', 'IL', 'ISR', 1, 1),
(105, 'Italy', 'IT', 'ITA', 1, 1),
(106, 'Jamaica', 'JM', 'JAM', 1, 1),
(107, 'Japan', 'JP', 'JPN', 1, 1),
(108, 'Jordan', 'JO', 'JOR', 1, 1),
(109, 'Kazakhstan', 'KZ', 'KAZ', 1, 1),
(110, 'Kenya', 'KE', 'KEN', 1, 1),
(111, 'Kiribati', 'KI', 'KIR', 1, 1),
(112, 'Korea, Democratic People''s Republic of', 'KP', 'PRK', 1, 1),
(113, 'Korea, Republic of', 'KR', 'KOR', 1, 1),
(114, 'Kuwait', 'KW', 'KWT', 1, 1),
(115, 'Kyrgyzstan', 'KG', 'KGZ', 1, 1),
(116, 'Lao People''s Democratic Republic', 'LA', 'LAO', 1, 1),
(117, 'Latvia', 'LV', 'LVA', 1, 1),
(118, 'Lebanon', 'LB', 'LBN', 1, 1),
(119, 'Lesotho', 'LS', 'LSO', 1, 1),
(120, 'Liberia', 'LR', 'LBR', 1, 1),
(121, 'Libya', 'LY', 'LBY', 1, 1),
(122, 'Liechtenstein', 'LI', 'LIE', 1, 1),
(123, 'Lithuania', 'LT', 'LTU', 1, 1),
(124, 'Luxembourg', 'LU', 'LUX', 1, 1),
(125, 'Macao', 'MO', 'MAC', 1, 1),
(126, 'Macedonia, The Former Yugoslav Republic of', 'MK', 'MKD', 1, 1),
(127, 'Madagascar', 'MG', 'MDG', 1, 1),
(128, 'Malawi', 'MW', 'MWI', 1, 1),
(129, 'Malaysia', 'MY', 'MYS', 1, 1),
(130, 'Maldives', 'MV', 'MDV', 1, 1),
(131, 'Mali', 'ML', 'MLI', 1, 1),
(132, 'Malta', 'MT', 'MLT', 1, 1),
(133, 'Marshall Islands', 'MH', 'MHL', 1, 1),
(134, 'Martinique', 'MQ', 'MTQ', 1, 1),
(135, 'Mauritania', 'MR', 'MRT', 1, 1),
(136, 'Mauritius', 'MU', 'MUS', 1, 1),
(137, 'Mayotte', 'YT', 'MYT', 1, 1),
(138, 'Mexico', 'MX', 'MEX', 1, 1),
(139, 'Micronesia, Federated States of', 'FM', 'FSM', 1, 1),
(140, 'Moldova', 'MD', 'MDA', 1, 1),
(141, 'Monaco', 'MC', 'MCO', 1, 1),
(142, 'Mongolia', 'MN', 'MNG', 1, 1),
(143, 'Montserrat', 'MS', 'MSR', 1, 1),
(144, 'Morocco', 'MA', 'MAR', 1, 1),
(145, 'Mozambique', 'MZ', 'MOZ', 1, 1),
(146, 'Myanmar', 'MM', 'MMR', 1, 1),
(147, 'Namibia', 'NA', 'NAM', 1, 1),
(148, 'Nauru', 'NR', 'NRU', 1, 1),
(149, 'Nepal', 'NP', 'NPL', 1, 1),
(150, 'Netherlands', 'NL', 'NLD', 5, 1),
(151, 'Netherlands Antilles', 'AN', 'ANT', 1, 1),
(152, 'New Caledonia', 'NC', 'NCL', 1, 1),
(153, 'New Zealand', 'NZ', 'NZL', 1, 1),
(154, 'Nicaragua', 'NI', 'NIC', 1, 1),
(155, 'Niger', 'NE', 'NER', 1, 1),
(156, 'Nigeria', 'NG', 'NGA', 1, 1),
(157, 'Niue', 'NU', 'NIU', 1, 1),
(158, 'Norfolk Island', 'NF', 'NFK', 1, 1),
(159, 'Northern Mariana Islands', 'MP', 'MNP', 1, 1),
(160, 'Norway', 'NO', 'NOR', 1, 1),
(161, 'Oman', 'OM', 'OMN', 1, 1),
(162, 'Pakistan', 'PK', 'PAK', 1, 1),
(163, 'Palau', 'PW', 'PLW', 1, 1),
(164, 'Panama', 'PA', 'PAN', 1, 1),
(165, 'Papua New Guinea', 'PG', 'PNG', 1, 1),
(166, 'Paraguay', 'PY', 'PRY', 1, 1),
(167, 'Peru', 'PE', 'PER', 1, 1),
(168, 'Philippines', 'PH', 'PHL', 1, 1),
(169, 'Pitcairn', 'PN', 'PCN', 1, 1),
(170, 'Poland', 'PL', 'POL', 1, 1),
(171, 'Portugal', 'PT', 'PRT', 1, 1),
(172, 'Puerto Rico', 'PR', 'PRI', 1, 1),
(173, 'Qatar', 'QA', 'QAT', 1, 1),
(174, 'Reunion', 'RE', 'REU', 1, 1),
(175, 'Romania', 'RO', 'ROU', 1, 1),
(176, 'Russian Federation', 'RU', 'RUS', 1, 1),
(177, 'Rwanda', 'RW', 'RWA', 1, 1),
(178, 'Saint Kitts and Nevis', 'KN', 'KNA', 1, 1),
(179, 'Saint Lucia', 'LC', 'LCA', 1, 1),
(180, 'Saint Vincent and the Grenadines', 'VC', 'VCT', 1, 1),
(181, 'Samoa', 'WS', 'WSM', 1, 1),
(182, 'San Marino', 'SM', 'SMR', 1, 1),
(183, 'Sao Tome and Principe', 'ST', 'STP', 1, 1),
(184, 'Saudi Arabia', 'SA', 'SAU', 1, 1),
(185, 'Senegal', 'SN', 'SEN', 1, 1),
(186, 'Seychelles', 'SC', 'SYC', 1, 1),
(187, 'Sierra Leone', 'SL', 'SLE', 1, 1),
(188, 'Singapore', 'SG', 'SGP', 4, 1),
(189, 'Slovakia (Slovak Republic)', 'SK', 'SVK', 1, 1),
(190, 'Slovenia', 'SI', 'SVN', 1, 1),
(191, 'Solomon Islands', 'SB', 'SLB', 1, 1),
(192, 'Somalia', 'SO', 'SOM', 1, 1),
(193, 'South Africa', 'ZA', 'ZAF', 1, 1),
(194, 'South Georgia and the South Sandwich Islands', 'GS', 'SGS', 1, 1),
(195, 'Spain', 'ES', 'ESP', 3, 1),
(196, 'Sri Lanka', 'LK', 'LKA', 1, 1),
(197, 'St. Helena', 'SH', 'SHN', 1, 1),
(198, 'St. Pierre and Miquelon', 'PM', 'SPM', 1, 1),
(199, 'Sudan', 'SD', 'SDN', 1, 1),
(200, 'Suriname', 'SR', 'SUR', 1, 1),
(201, 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM', 1, 1),
(202, 'Swaziland', 'SZ', 'SWZ', 1, 1),
(203, 'Sweden', 'SE', 'SWE', 5, 1),
(204, 'Switzerland', 'CH', 'CHE', 1, 1),
(205, 'Syrian Arab Republic', 'SY', 'SYR', 1, 1),
(206, 'Taiwan', 'TW', 'TWN', 1, 1),
(207, 'Tajikistan', 'TJ', 'TJK', 1, 1),
(208, 'Tanzania, United Republic of', 'TZ', 'TZA', 1, 1),
(209, 'Thailand', 'TH', 'THA', 1, 1),
(210, 'Togo', 'TG', 'TGO', 1, 1),
(211, 'Tokelau', 'TK', 'TKL', 1, 1),
(212, 'Tonga', 'TO', 'TON', 1, 1),
(213, 'Trinidad and Tobago', 'TT', 'TTO', 1, 1),
(214, 'Tunisia', 'TN', 'TUN', 1, 1),
(215, 'Turkey', 'TR', 'TUR', 1, 1),
(216, 'Turkmenistan', 'TM', 'TKM', 1, 1),
(217, 'Turks and Caicos Islands', 'TC', 'TCA', 1, 1),
(218, 'Tuvalu', 'TV', 'TUV', 1, 1),
(219, 'Uganda', 'UG', 'UGA', 1, 1),
(220, 'Ukraine', 'UA', 'UKR', 1, 1),
(221, 'United Arab Emirates', 'AE', 'ARE', 1, 1),
(222, 'United Kingdom', 'GB', 'GBR', 6, 1),
(223, 'United States', 'US', 'USA', 2, 1),
(224, 'United States Minor Outlying Islands', 'UM', 'UMI', 1, 1),
(225, 'Uruguay', 'UY', 'URY', 1, 1),
(226, 'Uzbekistan', 'UZ', 'UZB', 1, 1),
(227, 'Vanuatu', 'VU', 'VUT', 1, 1),
(228, 'Vatican City State (Holy See)', 'VA', 'VAT', 1, 1),
(229, 'Venezuela', 'VE', 'VEN', 1, 1),
(230, 'Viet Nam', 'VN', 'VNM', 1, 1),
(231, 'Virgin Islands (British)', 'VG', 'VGB', 1, 1),
(232, 'Virgin Islands (U.S.)', 'VI', 'VIR', 1, 1),
(233, 'Wallis and Futuna Islands', 'WF', 'WLF', 1, 1),
(234, 'Western Sahara', 'EH', 'ESH', 1, 1),
(235, 'Yemen', 'YE', 'YEM', 1, 1),
(236, 'Serbia', 'RS', 'SRB', 1, 1),
(238, 'Zambia', 'ZM', 'ZMB', 1, 1),
(239, 'Zimbabwe', 'ZW', 'ZWE', 1, 1),
(241, 'Palestine, State of', 'PS', 'PSE', 1, 1),
(242, 'Montenegro', 'ME', 'MNE', 1, 1),
(243, 'Guernsey', 'GG', 'GGY', 1, 1),
(244, 'Isle of Man', 'IM', 'IMN', 1, 1),
(245, 'Jersey', 'JE', 'JEY', 1, 1),
(246, 'South Sudan', 'SS', 'SSD', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE IF NOT EXISTS `coupons` (
  `coupon_id` int(11) NOT NULL,
  `coupon_type` char(1) NOT NULL DEFAULT 'F',
  `coupon_code` varchar(32) NOT NULL DEFAULT '',
  `coupon_amount` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `coupon_minimum_order` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `coupon_start_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `coupon_expire_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `uses_per_coupon` int(5) NOT NULL DEFAULT '1',
  `uses_per_user` int(5) NOT NULL DEFAULT '0',
  `restrict_to_products` varchar(255) DEFAULT NULL,
  `restrict_to_categories` varchar(255) DEFAULT NULL,
  `restrict_to_customers` text,
  `coupon_active` char(1) NOT NULL DEFAULT 'Y',
  `date_created` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `coupon_zone_restriction` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `coupons_description`
--

CREATE TABLE IF NOT EXISTS `coupons_description` (
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '0',
  `coupon_name` varchar(32) NOT NULL DEFAULT '',
  `coupon_description` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_email_track`
--

CREATE TABLE IF NOT EXISTS `coupon_email_track` (
  `unique_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `customer_id_sent` int(11) NOT NULL DEFAULT '0',
  `sent_firstname` varchar(32) DEFAULT NULL,
  `sent_lastname` varchar(32) DEFAULT NULL,
  `emailed_to` varchar(32) DEFAULT NULL,
  `date_sent` datetime NOT NULL DEFAULT '0001-01-01 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_gv_customer`
--

CREATE TABLE IF NOT EXISTS `coupon_gv_customer` (
  `customer_id` int(5) NOT NULL DEFAULT '0',
  `amount` decimal(15,4) NOT NULL DEFAULT '0.0000'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_gv_queue`
--

CREATE TABLE IF NOT EXISTS `coupon_gv_queue` (
  `unique_id` int(5) NOT NULL,
  `customer_id` int(5) NOT NULL DEFAULT '0',
  `order_id` int(5) NOT NULL DEFAULT '0',
  `amount` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_created` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `ipaddr` varchar(32) NOT NULL DEFAULT '',
  `release_flag` char(1) NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_redeem_track`
--

CREATE TABLE IF NOT EXISTS `coupon_redeem_track` (
  `unique_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `redeem_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `redeem_ip` varchar(32) NOT NULL DEFAULT '',
  `order_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_restrict`
--

CREATE TABLE IF NOT EXISTS `coupon_restrict` (
  `restrict_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `coupon_restrict` char(1) NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE IF NOT EXISTS `currencies` (
  `currencies_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL DEFAULT '',
  `code` char(3) NOT NULL DEFAULT '',
  `symbol_left` varchar(24) DEFAULT NULL,
  `symbol_right` varchar(24) DEFAULT NULL,
  `decimal_point` char(1) DEFAULT NULL,
  `thousands_point` char(1) DEFAULT NULL,
  `decimal_places` char(1) DEFAULT NULL,
  `value` float(13,8) DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`currencies_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_point`, `thousands_point`, `decimal_places`, `value`, `last_updated`) VALUES
(1, 'US Dollar', 'USD', '$', '', '.', ',', '2', 1.00000000, '2012-11-13 10:01:46'),
(2, 'Euro', 'EUR', '&euro;', '', '.', ',', '2', 0.77300000, '2012-11-13 10:01:46'),
(3, 'GB Pound', 'GBP', '&pound;', '', '.', ',', '2', 0.67259997, '2012-11-13 10:01:46');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `customers_id` int(11) NOT NULL,
  `customers_gender` char(1) NOT NULL DEFAULT '',
  `customers_firstname` varchar(32) NOT NULL DEFAULT '',
  `customers_lastname` varchar(32) NOT NULL DEFAULT '',
  `customers_dob` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `customers_email_address` varchar(96) NOT NULL DEFAULT '',
  `customers_nick` varchar(96) NOT NULL DEFAULT '',
  `customers_default_address_id` int(11) NOT NULL DEFAULT '0',
  `customers_telephone` varchar(32) NOT NULL DEFAULT '',
  `customers_fax` varchar(32) DEFAULT NULL,
  `customers_password` varchar(40) NOT NULL DEFAULT '',
  `customers_newsletter` char(1) DEFAULT NULL,
  `customers_group_pricing` int(11) NOT NULL DEFAULT '0',
  `customers_email_format` varchar(4) NOT NULL DEFAULT 'TEXT',
  `customers_authorization` int(1) NOT NULL DEFAULT '0',
  `customers_referral` varchar(32) NOT NULL DEFAULT '',
  `customers_paypal_payerid` varchar(20) NOT NULL DEFAULT '',
  `customers_paypal_ec` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customers_basket`
--

CREATE TABLE IF NOT EXISTS `customers_basket` (
  `customers_basket_id` int(11) NOT NULL,
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `products_id` tinytext NOT NULL,
  `customers_basket_quantity` float NOT NULL DEFAULT '0',
  `final_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `customers_basket_date_added` varchar(8) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customers_basket_attributes`
--

CREATE TABLE IF NOT EXISTS `customers_basket_attributes` (
  `customers_basket_attributes_id` int(11) NOT NULL,
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `products_id` tinytext NOT NULL,
  `products_options_id` varchar(64) NOT NULL DEFAULT '0',
  `products_options_value_id` int(11) NOT NULL DEFAULT '0',
  `products_options_value_text` blob,
  `products_options_sort_order` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customers_info`
--

CREATE TABLE IF NOT EXISTS `customers_info` (
  `customers_info_id` int(11) NOT NULL DEFAULT '0',
  `customers_info_date_of_last_logon` datetime DEFAULT NULL,
  `customers_info_number_of_logons` int(5) DEFAULT NULL,
  `customers_info_date_account_created` datetime DEFAULT NULL,
  `customers_info_date_account_last_modified` datetime DEFAULT NULL,
  `global_product_notifications` int(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `db_cache`
--

CREATE TABLE IF NOT EXISTS `db_cache` (
  `cache_entry_name` varchar(64) NOT NULL DEFAULT '',
  `cache_data` mediumblob,
  `cache_entry_created` int(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_archive`
--

CREATE TABLE IF NOT EXISTS `email_archive` (
  `archive_id` int(11) NOT NULL,
  `email_to_name` varchar(96) NOT NULL DEFAULT '',
  `email_to_address` varchar(96) NOT NULL DEFAULT '',
  `email_from_name` varchar(96) NOT NULL DEFAULT '',
  `email_from_address` varchar(96) NOT NULL DEFAULT '',
  `email_subject` varchar(255) NOT NULL DEFAULT '',
  `email_html` text NOT NULL,
  `email_text` text NOT NULL,
  `date_sent` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `module` varchar(64) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ezpages`
--

CREATE TABLE IF NOT EXISTS `ezpages` (
  `pages_id` int(11) NOT NULL,
  `languages_id` int(11) NOT NULL DEFAULT '1',
  `pages_title` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `alt_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `alt_url_external` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pages_html_text` mediumtext COLLATE utf8_unicode_ci,
  `status_header` int(1) NOT NULL DEFAULT '1',
  `status_sidebox` int(1) NOT NULL DEFAULT '1',
  `status_footer` int(1) NOT NULL DEFAULT '1',
  `status_toc` int(1) NOT NULL DEFAULT '1',
  `header_sort_order` int(3) NOT NULL DEFAULT '0',
  `sidebox_sort_order` int(3) NOT NULL DEFAULT '0',
  `footer_sort_order` int(3) NOT NULL DEFAULT '0',
  `toc_sort_order` int(3) NOT NULL DEFAULT '0',
  `page_open_new_window` int(1) NOT NULL DEFAULT '0',
  `page_is_ssl` int(1) NOT NULL DEFAULT '0',
  `toc_chapter` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ezpages`
--

INSERT INTO `ezpages` (`pages_id`, `languages_id`, `pages_title`, `alt_url`, `alt_url_external`, `pages_html_text`, `status_header`, `status_sidebox`, `status_footer`, `status_toc`, `header_sort_order`, `sidebox_sort_order`, `footer_sort_order`, `toc_sort_order`, `page_open_new_window`, `page_is_ssl`, `toc_chapter`) VALUES
(1, 1, 'EZPages', '', '', 'This is the main page listed under the Link EZPages in the Header<br /><br />\r\n\r\n<strong>See: What is EZPages? Link for detailed use of EZPages</strong><br /><br />\r\n\r\nThis Link could show in the Header, Footer or Sidebox or a combination of all three locations.<br /><br />\r\n\r\nThe Chapter and TOC settings are for using this Page in combination with other Pages.<br /><br />\r\n\r\nThe other Pages can be shown either *only* with this Link in the Chapter and TOC or as their own Link in the Header, Footer or Sidebox, depending on how you would like them to appear on your site.<br /><br />\r\n\r\nThere is no true "Master" Link, other than the Links you actually have configured to display. But any Link in a Chapter can be displayed in any of the 3 locations for the Header, Footer or Sidebox or not at all, where it only appears together with the other Links in the Chapter.', 0, 0, 0, 1, 10, 0, 0, 10, 0, 0, 10),
(2, 1, 'A New Page', '', '', 'This is another page that is linked to the Chapter 10 via the Chapter number used and is sorted based on the TOC Order.<br /><br />\r\n\r\nThere is not a link to this page via the Header, Footer nor the Sidebox.<br /><br />\r\n\r\nThis page is only seen if the "main" link is selected and then it will show in the TOC listing.<br /><br />\r\n\r\nThis is a handy way to have numerous links that are related but only show one main link to get to them all.<br /><br />', 0, 0, 0, 1, 0, 0, 0, 30, 0, 0, 10),
(3, 1, 'Another New Page', '', '', 'This is yet another new page or link that is part of Chapter 10<br /><br />\r\n\r\nThe numbering of the Chapters can be done in any manner. But, by number in increments such as 10, 20, 30, etc. you can later insert pages, or links, as needed within the existing pages.<br /><br />\r\n\r\nThere is no limit to the number of pages, or links, that can be grouped together using the Chapter.<br /><br />\r\n\r\nThe display of the Previous/Next and TOC listing is a setting that can be turned on or off.', 0, 0, 0, 1, 0, 0, 0, 40, 0, 0, 10),
(4, 1, 'My Link', '', '', 'This is a single page link that will be shown in the Sidebox.<br /><br />\r\n\r\nThere are no additional pages or links associated with this page as there is no Chapter.<br /><br />\r\n\r\nLater, if you want to expand on this link you can add a Chapter and TOC settings and build a group.<br /><br />\r\n\r\nNotice that the Previous/Next and TOC automatically disable when there isn''t a Chapter. Even with a Chapter, there must be more than one (1) related link or page in the group before these will display.', 0, 1, 0, 0, 0, 10, 0, 0, 0, 0, 0),
(5, 1, 'Anything', '', '', 'The title or link names can be anything that you would like to use.<br /><br />\r\n\r\nYou decide on the content and the link name relative to that content.<br /><br />\r\n\r\nThen, define where you want the link to show: Header, Footer or Sidebox or as a combination of these three locations.<br /><br />\r\n\r\nThe content of the page can be anything you like. Be sure that your content is valid in regard to table and stylesheet rules.<br /><br />\r\n\r\nYou can even set up the links to go to Secure or Non-Secure pages as well as open in the same or a new window.<br /><br />\r\n\r\nLinks can also be setup to use internal or external links vs the HTML Content. See: examples below in the Link URL settings.', 0, 1, 0, 0, 0, 20, 0, 0, 0, 0, 0),
(6, 1, 'Shared', '', '', 'This link is a "shared" link between the Header, Footer and Sidebox.<br /><br />\r\n\r\nThe number on the order was set to 50 on all of the settings just for the sake of an easier notation on entering it.<br /><br />\r\n\r\nThe order can be the same or different for the three locations.<br /><br />\r\n\r\nIf you wanted to really get creative, you could also have this as part of a Chapter not related to the link order.<br /><br />', 0, 1, 0, 0, 50, 50, 50, 0, 0, 0, 0),
(7, 1, 'My Account', 'index.php?main_page=account', '', '', 0, 0, 0, 0, 0, 0, 10, 0, 0, 1, 0),
(8, 1, 'Site Map', 'index.php?main_page=site_map', '', '', 0, 1, 0, 0, 0, 40, 20, 0, 0, 0, 0),
(9, 1, 'Privacy Notice', 'index.php?main_page=privacy', '', '', 0, 0, 0, 0, 30, 0, 40, 0, 0, 0, 0),
(10, 1, 'Zen Cart', '', 'http://www.zen-cart.com', '', 0, 0, 0, 0, 60, 0, 0, 0, 1, 0, 0),
(11, 1, 'Gift Certificates', 'index.php?main_page=index&cPath=21', '', '', 0, 1, 0, 0, 0, 60, 0, 0, 0, 0, 0),
(12, 1, 'Action DVDs', 'index.php?main_page=index&cPath=3_10', '', '', 0, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0),
(13, 1, 'Google', '', 'http://www.google.com', '', 0, 1, 0, 0, 0, 70, 0, 0, 1, 0, 0),
(14, 1, 'What is EZ-Pages?', '', '', '<table cellspacing="4" cellpadding="4" border="3" align="center" style="width: 80%;"><tbody><tr><td><span style="font-style: italic;">\r\n<span style="font-weight: bold;">Note: This EZ-Page has been written with the help of the HTMLarea Editor.<br /> <br />This means that this EZ-page will not validate correctly based on how HTMLarea or other editors renders the code.</span></span></td></tr></tbody></table><br /><br /><span style="font-weight: bold; color: rgb(255, 0, 0);">Summary</span><br /><br /><span style="font-weight: bold;">EZ-Pages</span> is a fast, easy way of creating links and additional pages.<br /><br />The additional Pages can be for:<br /><ul><li>New Pages</li><li>Internal Links</li><li>External Links</li><li>Secure or Non-Secure pages</li><li>Same or New Window</li></ul>In Addition, there is the ability to create &quot;related&quot; links in the format of a Chapter (group) and its TOC (related pages/links).<br /><br /><span style="font-weight: bold; color: rgb(255, 0, 0);">Link Naming</span><br /><br />Links are named by the Page Title. All Links need a Page Title in order to function.<br /><br />If you forget to add a Page Title, then you will not be able to add the Link.<br /><br />If you do not assign an Order for the Header, Sidebox or Footer, then the Link will not display even if you have a Page Title.<br /><br /><span style="font-weight: bold;"><span style="color: rgb(255, 0, 0);">Link Placement</span><br /><br /></span>While you have the option of adding Additional Links to the Header, Footer and Sidebox with EZ-Pages, you are not limited to these three Link locations. Links can be in one or more locations simply by enabling the Order for the Location(s) where the Link should appear..<br /><br />The Link Location Status for the Header, Footer and Sidebox is controlled simply by setting these to Yes or No for each setting. Then, set the Order in which the Link should appear for each location.<br /><br />This means that if you were to set Header to Yes 30 and Sidebox to Yes 50 then the link would appear in both the Header and Sidebox in the Order of your Links.<br /><br />The Order numbering method is up to you. Numbering using 10, 20, 30, etc. will allow you to sort the Links and add additional Links later.<br /><br />Note: a 0 value for the Order will disable the Link from displaying.<br /><br /><span style="font-weight: bold;"><span style="color: rgb(255, 0, 0);">Open in New Window and Secure Pages</span><br /></span><br />With EZ-Pages, each Link can take you to the same, main window for your shop; or, you can have the Link open a brand new New Window. In addition, there is an option for making the Link open as a Secure Page or a Non-Secure Page.<br /><br /><span style="font-weight: bold; color: rgb(255, 0, 0);">Chapter and TOC</span><br style="font-weight: bold; color: rgb(255, 0, 0);" /><br />The Chapter and TOC, or Table of Contents, are a unique method of building Multiple Links that interact together.<br /><br />While these Links still follow the rules of the Header, Footer and Sidebox placement, the difference is that only one of the Links, the Main Link, needs to be displayed anywhere on the site.<br /><br />If you had, for example, 5 related Links, you could add the first Link as the Main Link by setting its location to the Header, Footer or Sidebox and set its Order, as usual.<br /><br />Next, you need to assign a Chapter or Group number to the Link. This Chapter holds the related Links together.<br /><br />Then, set the TOC or Table of Contents setting. This is a secondary Sort Order for within the Chapter.<br /><br />Again, you can display any of the Links within a Chapter, as well as making any of these Links the Main Link. Whether the Links all show, or just one or more of the Links show, the Chapter is the key to grouping these Links together in the TOC or Previous/Next. <br /><br /><span style="font-weight: bold; font-style: italic;">NOTE: While all Links within a Chapter will display together, you can have the different Links display in the Header, Footer or Sidebox on their own. Or, you can have the additional Links only display when the Main Link or one of the Additional Links within the Chapter has been opened.</span><br style="font-weight: bold; font-style: italic;" /><br />The versitility of EZ-Pages will make adding new Links and Pages extreamly easy for the beginner as well as the advance user.<br /><br />While this page was made in HTMLarea editor, any HTML editor could be used.<br /><br />However, be careful ... HTML editors will often add the opening and closing tags for the &lt;html&gt;, &lt;head&gt; and &lt;body&gt; to the file you are working on.<br /><br />These are already added to the pages via EZ-Pages.<br /><br /><span style="color: rgb(255, 0, 0); font-weight: bold;">External Link URL</span><br /><br />External Link URLs are links to outside pages not within your shop. These can be to any valid URL such as:<br /><br />http://www.sashbox.net<br /><br />You need to include the full URL path to any External Link URL. You may also mark these to open in a New Window or the Same Window.<br /><br /><span style="color: rgb(255, 0, 0); font-weight: bold;">Internal Link URL</span><br /><br />Internal Link URLs are links to internal pages within your shop. These can be to any valid URL, but should be written as relative links such as:<br /><br />index.php?main_page=index&amp;cPath=21<br /><br />The above Link would take you to the Category for categories_id 21<br /><br />While these links can be the Full URL to an Internal Link, it is best to write as a Relative Link so that if you change domains, are work on a temporary domain or an IP Address, the Link will remain valid if moved to another domain, IP Address, etc.<br /><br />Internal Links can also open in a New Window or the Same Window or be for Secure or Non-Secure Pages.<br /><br /><span style="font-weight: bold; color: rgb(255, 0, 0);">EZ-Pages Additional Pages vs Internal Links vs External Links</span><br /><br />The Type of Link that you create is based on an order of precidence, where HTML Content will superceed both the Internal Link and the External Link values.<br /><br />The External Link URL will superceed the Internal Link URL.<br /><br />If you try to set a combination of HTML Content, Internal Link and/or External Link, the Link will be flagged in the listing with a read icon to alert you to your mistake.<br /><br /><span style="font-weight: bold; color: rgb(255, 0, 0);">WARNING ...</span><br /><br />When using Editors such as HTMLarea, if you hit enter in the HTML Content area <br /> will be added. These will be detected as &quot;content&quot; and will override any Internal Link URL or External Link URL.<br /><br /><span style="font-weight: bold; color: rgb(255, 0, 0);">Admin Only Display</span><br /><br />Sometimes, when working on EZ-Pages, you will want to be able to work on a Live Site and see the results of your work, but not allow the Customers to see this until you are done.<br /><br />There are 3 settings in the Configuration ... EZ-Pages Settings for the Header, Footer and Sidebox  Status:<br /><ul><li>OFF</li><li>ON</li><li>Admin Only</li></ul>The Admin Only setting is controlled by the IP Address(es) set in the Website Maintenance.<br /><br />This can be very handy when needing to work on a Live Site but not wanting customers to see the work in progress.<br /><br />', 0, 0, 0, 1, 0, 0, 0, 20, 0, 0, 10),
(15, 1, 'Home', 'index.php?main_page=index', '', '', 0, 0, 1, 0, 1, 1, 11, 1, 0, 0, 0),
(16, 1, 'New Products', 'index.php?main_page=products_new', '', '', 1, 0, 1, 0, 2, 2, 12, 2, 0, 0, 0),
(17, 1, 'Specials', 'index.php?main_page=specials', '', '', 1, 0, 1, 0, 3, 3, 13, 3, 0, 0, 0),
(18, 1, 'All Products', 'index.php?main_page=products_all', '', '', 0, 0, 1, 0, 4, 4, 14, 4, 0, 0, 0),
(19, 1, 'Reviews', 'index.php?main_page=reviews', '', '', 1, 0, 1, 0, 5, 5, 15, 5, 0, 0, 0),
(20, 1, 'Contacts', 'index.php?main_page=contact_us', '', '', 1, 0, 1, 0, 6, 6, 16, 6, 0, 0, 0),
(21, 1, 'FAQs', 'index.php?main_page=gv_faq', '', '', 1, 0, 1, 0, 7, 7, 17, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `featured`
--

CREATE TABLE IF NOT EXISTS `featured` (
  `featured_id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL DEFAULT '0',
  `featured_date_added` datetime DEFAULT NULL,
  `featured_last_modified` datetime DEFAULT NULL,
  `expires_date` date NOT NULL DEFAULT '0001-01-01',
  `date_status_change` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `featured_date_available` date NOT NULL DEFAULT '0001-01-01'
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `featured`
--

INSERT INTO `featured` (`featured_id`, `products_id`, `featured_date_added`, `featured_last_modified`, `expires_date`, `date_status_change`, `status`, `featured_date_available`) VALUES
(1, 1, '0001-01-01 00:00:00', '0001-01-01 00:00:00', '2050-01-01', '0001-01-01 00:00:00', 1, '0001-01-01'),
(2, 2, '0001-01-01 00:00:00', '0001-01-01 00:00:00', '2050-01-01', '0001-01-01 00:00:00', 1, '0001-01-01'),
(3, 3, '0001-01-01 00:00:00', '0001-01-01 00:00:00', '2050-01-01', '0001-01-01 00:00:00', 1, '0001-01-01'),
(4, 4, '0001-01-01 00:00:00', '0001-01-01 00:00:00', '2050-01-01', '0001-01-01 00:00:00', 1, '0001-01-01'),
(5, 5, '0001-01-01 00:00:00', '0001-01-01 00:00:00', '2050-01-01', '0001-01-01 00:00:00', 1, '0001-01-01'),
(6, 6, '0001-01-01 00:00:00', '0001-01-01 00:00:00', '2050-01-01', '0001-01-01 00:00:00', 1, '0001-01-01'),
(10, 10, '2014-11-25 16:02:44', NULL, '0001-01-01', NULL, 1, '0001-01-01'),
(11, 15, '2014-11-25 16:02:48', NULL, '0001-01-01', NULL, 1, '0001-01-01'),
(12, 19, '2014-11-25 16:02:55', NULL, '0001-01-01', NULL, 1, '0001-01-01'),
(13, 18, '2014-11-25 16:03:00', NULL, '0001-01-01', NULL, 1, '0001-01-01'),
(14, 11, '2014-11-25 16:03:08', NULL, '0001-01-01', NULL, 1, '0001-01-01'),
(15, 12, '2014-11-25 16:03:12', NULL, '0001-01-01', NULL, 1, '0001-01-01'),
(16, 17, '2014-11-25 16:03:17', NULL, '0001-01-01', NULL, 1, '0001-01-01'),
(17, 9, '2014-11-25 16:03:21', NULL, '0001-01-01', NULL, 1, '0001-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `files_uploaded`
--

CREATE TABLE IF NOT EXISTS `files_uploaded` (
  `files_uploaded_id` int(11) NOT NULL,
  `sesskey` varchar(32) DEFAULT NULL,
  `customers_id` int(11) DEFAULT NULL,
  `files_uploaded_name` varchar(64) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Must always have either a sesskey or customers_id';

-- --------------------------------------------------------

--
-- Table structure for table `geo_zones`
--

CREATE TABLE IF NOT EXISTS `geo_zones` (
  `geo_zone_id` int(11) NOT NULL,
  `geo_zone_name` varchar(32) NOT NULL DEFAULT '',
  `geo_zone_description` varchar(255) NOT NULL DEFAULT '',
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `geo_zones`
--

INSERT INTO `geo_zones` (`geo_zone_id`, `geo_zone_name`, `geo_zone_description`, `last_modified`, `date_added`) VALUES
(1, 'Florida', 'Florida local sales tax zone', NULL, '2015-08-12 13:55:50');

-- --------------------------------------------------------

--
-- Table structure for table `get_terms_to_filter`
--

CREATE TABLE IF NOT EXISTS `get_terms_to_filter` (
  `get_term_name` varchar(255) NOT NULL DEFAULT '',
  `get_term_table` varchar(64) NOT NULL,
  `get_term_name_field` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `get_terms_to_filter`
--

INSERT INTO `get_terms_to_filter` (`get_term_name`, `get_term_table`, `get_term_name_field`) VALUES
('manufacturers_id', 'TABLE_MANUFACTURERS', 'manufacturers_name'),
('music_genre_id', 'TABLE_MUSIC_GENRE', 'music_genre_name'),
('record_company_id', 'TABLE_RECORD_COMPANY', 'record_company_name');

-- --------------------------------------------------------

--
-- Table structure for table `group_pricing`
--

CREATE TABLE IF NOT EXISTS `group_pricing` (
  `group_id` int(11) NOT NULL,
  `group_name` varchar(32) NOT NULL DEFAULT '',
  `group_percentage` decimal(5,2) NOT NULL DEFAULT '0.00',
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE IF NOT EXISTS `languages` (
  `languages_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT '',
  `code` char(2) NOT NULL DEFAULT '',
  `image` varchar(64) DEFAULT NULL,
  `directory` varchar(32) DEFAULT NULL,
  `sort_order` int(3) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`languages_id`, `name`, `code`, `image`, `directory`, `sort_order`) VALUES
(1, 'English', 'en', 'icon.gif', 'english', 1);

-- --------------------------------------------------------

--
-- Table structure for table `layout_boxes`
--

CREATE TABLE IF NOT EXISTS `layout_boxes` (
  `layout_id` int(11) NOT NULL,
  `layout_template` varchar(64) NOT NULL DEFAULT '',
  `layout_box_name` varchar(64) NOT NULL DEFAULT '',
  `layout_box_status` tinyint(1) NOT NULL DEFAULT '1',
  `layout_box_location` tinyint(1) NOT NULL DEFAULT '0',
  `layout_box_sort_order` int(11) NOT NULL DEFAULT '0',
  `layout_box_sort_order_single` int(11) NOT NULL DEFAULT '0',
  `layout_box_status_single` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=99 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `layout_boxes`
--

INSERT INTO `layout_boxes` (`layout_id`, `layout_template`, `layout_box_name`, `layout_box_status`, `layout_box_location`, `layout_box_sort_order`, `layout_box_sort_order_single`, `layout_box_status_single`) VALUES
(1, 'default_template_settings', 'banner_box_all.php', 1, 0, 5, 0, 0),
(2, 'default_template_settings', 'banner_box.php', 1, 0, 300, 1, 127),
(3, 'default_template_settings', 'banner_box2.php', 1, 0, 15, 1, 15),
(4, 'default_template_settings', 'best_sellers.php', 1, 0, 30, 70, 1),
(5, 'default_template_settings', 'categories.php', 1, 0, 10, 10, 1),
(6, 'default_template_settings', 'currencies.php', 0, 0, 80, 60, 0),
(7, 'default_template_settings', 'document_categories.php', 1, 0, 0, 0, 0),
(8, 'default_template_settings', 'ezpages.php', 1, 0, -1, 2, 1),
(9, 'default_template_settings', 'featured.php', 1, 0, 45, 0, 0),
(10, 'default_template_settings', 'information.php', 1, 0, 50, 40, 1),
(11, 'default_template_settings', 'languages.php', 0, 0, 70, 50, 0),
(12, 'default_template_settings', 'manufacturers.php', 1, 0, 30, 20, 1),
(13, 'default_template_settings', 'manufacturer_info.php', 1, 0, 35, 95, 1),
(14, 'default_template_settings', 'more_information.php', 1, 0, 200, 200, 1),
(15, 'default_template_settings', 'music_genres.php', 1, 0, 0, 0, 0),
(16, 'default_template_settings', 'order_history.php', 1, 0, 0, 0, 0),
(17, 'default_template_settings', 'product_notifications.php', 1, 0, 55, 85, 1),
(18, 'default_template_settings', 'record_companies.php', 1, 0, 0, 0, 0),
(19, 'default_template_settings', 'reviews.php', 1, 0, 40, 0, 0),
(20, 'default_template_settings', 'search.php', 1, 0, 10, 0, 0),
(21, 'default_template_settings', 'search_header.php', 0, 0, 0, 0, 1),
(22, 'default_template_settings', 'shopping_cart.php', 1, 0, 20, 30, 1),
(23, 'default_template_settings', 'specials.php', 1, 0, 45, 0, 0),
(24, 'default_template_settings', 'whats_new.php', 1, 0, 20, 0, 0),
(25, 'default_template_settings', 'whos_online.php', 1, 0, 200, 200, 1),
(26, 'template_default', 'banner_box_all.php', 1, 0, 5, 0, 0),
(27, 'template_default', 'banner_box.php', 1, 0, 300, 1, 127),
(28, 'template_default', 'banner_box2.php', 1, 0, 15, 1, 15),
(29, 'template_default', 'best_sellers.php', 1, 0, 30, 70, 1),
(30, 'template_default', 'categories.php', 1, 0, 10, 10, 1),
(31, 'template_default', 'currencies.php', 0, 0, 80, 60, 0),
(32, 'template_default', 'ezpages.php', 1, 0, -1, 2, 1),
(33, 'template_default', 'featured.php', 1, 0, 45, 0, 0),
(34, 'template_default', 'information.php', 1, 0, 50, 40, 1),
(35, 'template_default', 'languages.php', 0, 0, 70, 50, 0),
(36, 'template_default', 'manufacturers.php', 1, 0, 30, 20, 1),
(37, 'template_default', 'manufacturer_info.php', 1, 0, 35, 95, 1),
(38, 'template_default', 'more_information.php', 1, 0, 200, 200, 1),
(39, 'template_default', 'my_broken_box.php', 1, 0, 0, 0, 0),
(40, 'template_default', 'order_history.php', 1, 0, 0, 0, 0),
(41, 'template_default', 'product_notifications.php', 1, 0, 55, 85, 1),
(42, 'template_default', 'reviews.php', 1, 0, 40, 0, 0),
(43, 'template_default', 'search.php', 1, 0, 10, 0, 0),
(44, 'template_default', 'search_header.php', 0, 0, 0, 0, 1),
(45, 'template_default', 'shopping_cart.php', 1, 0, 20, 30, 1),
(46, 'template_default', 'specials.php', 1, 0, 45, 0, 0),
(47, 'template_default', 'whats_new.php', 1, 0, 20, 0, 0),
(48, 'template_default', 'whos_online.php', 1, 0, 200, 200, 1),
(49, 'classic', 'banner_box.php', 1, 0, 300, 1, 127),
(50, 'classic', 'banner_box2.php', 1, 0, 15, 1, 15),
(51, 'classic', 'banner_box_all.php', 1, 0, 5, 0, 0),
(52, 'classic', 'best_sellers.php', 1, 0, 30, 70, 1),
(53, 'classic', 'categories.php', 1, 0, 10, 10, 1),
(54, 'classic', 'currencies.php', 0, 0, 80, 60, 0),
(55, 'classic', 'document_categories.php', 1, 0, 0, 0, 0),
(56, 'classic', 'ezpages.php', 1, 0, -1, 2, 1),
(57, 'classic', 'featured.php', 1, 0, 45, 0, 0),
(58, 'classic', 'information.php', 1, 0, 50, 40, 1),
(59, 'classic', 'languages.php', 0, 0, 70, 50, 0),
(60, 'classic', 'manufacturers.php', 0, 0, 30, 20, 1),
(61, 'classic', 'manufacturer_info.php', 0, 0, 35, 95, 1),
(62, 'classic', 'more_information.php', 0, 0, 200, 200, 1),
(63, 'classic', 'music_genres.php', 0, 0, 0, 0, 0),
(64, 'classic', 'order_history.php', 0, 0, 0, 0, 0),
(65, 'classic', 'product_notifications.php', 0, 0, 55, 85, 1),
(66, 'classic', 'record_companies.php', 0, 0, 0, 0, 0),
(67, 'classic', 'reviews.php', 0, 0, 40, 0, 0),
(68, 'classic', 'search.php', 0, 0, 10, 0, 0),
(69, 'classic', 'search_header.php', 0, 0, 0, 0, 1),
(70, 'classic', 'shopping_cart.php', 0, 0, 20, 30, 1),
(71, 'classic', 'specials.php', 0, 0, 45, 0, 0),
(72, 'classic', 'whats_new.php', 1, 0, 20, 0, 0),
(73, 'classic', 'whos_online.php', 0, 0, 200, 200, 1),
(74, 'theme002', 'banner_box.php', 0, 0, 24, 0, 0),
(75, 'theme002', 'banner_box2.php', 0, 0, 25, 0, 0),
(76, 'theme002', 'banner_box_all.php', 0, 0, 12, 0, 0),
(77, 'theme002', 'best_sellers.php', 0, 0, 14, 0, 0),
(78, 'theme002', 'categories.php', 0, 0, 1, 0, 0),
(79, 'theme002', 'currencies.php', 0, 0, 5, 0, 0),
(80, 'theme002', 'document_categories.php', 0, 0, 23, 0, 0),
(81, 'theme002', 'ezpages.php', 0, 0, 21, 0, 0),
(82, 'theme002', 'featured.php', 0, 0, 17, 0, 0),
(83, 'theme002', 'information.php', 0, 0, 2, 0, 0),
(84, 'theme002', 'languages.php', 0, 0, 10, 0, 0),
(85, 'theme002', 'manufacturer_info.php', 0, 0, 6, 0, 0),
(86, 'theme002', 'manufacturers.php', 0, 0, 18, 0, 0),
(87, 'theme002', 'more_information.php', 0, 0, 15, 0, 0),
(88, 'theme002', 'music_genres.php', 0, 0, 7, 0, 0),
(89, 'theme002', 'order_history.php', 0, 0, 8, 0, 0),
(90, 'theme002', 'product_notifications.php', 0, 0, 19, 0, 0),
(91, 'theme002', 'record_companies.php', 0, 0, 20, 0, 0),
(92, 'theme002', 'reviews.php', 0, 0, 16, 0, 0),
(93, 'theme002', 'search.php', 0, 0, 22, 0, 0),
(94, 'theme002', 'search_header.php', 0, 0, 0, 0, 0),
(95, 'theme002', 'shopping_cart.php', 0, 0, 13, 0, 0),
(96, 'theme002', 'specials.php', 0, 0, 4, 0, 0),
(97, 'theme002', 'whats_new.php', 0, 0, 3, 0, 0),
(98, 'theme002', 'whos_online.php', 0, 0, 11, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `manufacturers`
--

CREATE TABLE IF NOT EXISTS `manufacturers` (
  `manufacturers_id` int(11) NOT NULL,
  `manufacturers_name` varchar(32) NOT NULL DEFAULT '',
  `manufacturers_image` varchar(64) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `manufacturers`
--

INSERT INTO `manufacturers` (`manufacturers_id`, `manufacturers_name`, `manufacturers_image`, `date_added`, `last_modified`) VALUES
(1, 'Gerber', 'manufacturers/logo_gerber.png', '2003-12-23 03:18:19', '2014-11-12 12:55:42'),
(2, 'Viessmann', 'manufacturers/logo_viessmann.png', '2003-12-23 03:18:19', '2014-11-12 12:56:09'),
(3, 'Bosch', 'manufacturers/logo_bosch.png', '2003-12-23 03:18:19', '2014-11-12 13:12:04');

-- --------------------------------------------------------

--
-- Table structure for table `manufacturers_info`
--

CREATE TABLE IF NOT EXISTS `manufacturers_info` (
  `manufacturers_id` int(11) NOT NULL DEFAULT '0',
  `languages_id` int(11) NOT NULL DEFAULT '0',
  `manufacturers_url` varchar(255) NOT NULL DEFAULT '',
  `url_clicked` int(5) NOT NULL DEFAULT '0',
  `date_last_click` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `manufacturers_info`
--

INSERT INTO `manufacturers_info` (`manufacturers_id`, `languages_id`, `manufacturers_url`, `url_clicked`, `date_last_click`) VALUES
(1, 1, '', 0, NULL),
(2, 1, '', 0, NULL),
(3, 1, '', 0, NULL),
(1, 2, '', 0, NULL),
(2, 2, '', 0, NULL),
(3, 2, '', 0, NULL),
(1, 3, '', 0, NULL),
(2, 3, '', 0, NULL),
(3, 3, '', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `media_clips`
--

CREATE TABLE IF NOT EXISTS `media_clips` (
  `clip_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL DEFAULT '0',
  `clip_type` smallint(6) NOT NULL DEFAULT '0',
  `clip_filename` text NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `media_manager`
--

CREATE TABLE IF NOT EXISTS `media_manager` (
  `media_id` int(11) NOT NULL,
  `media_name` varchar(255) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `media_to_products`
--

CREATE TABLE IF NOT EXISTS `media_to_products` (
  `media_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `media_types`
--

CREATE TABLE IF NOT EXISTS `media_types` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(64) NOT NULL DEFAULT '',
  `type_ext` varchar(8) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `media_types`
--

INSERT INTO `media_types` (`type_id`, `type_name`, `type_ext`) VALUES
(1, 'MP3', '.mp3');

-- --------------------------------------------------------

--
-- Table structure for table `meta_tags_categories_description`
--

CREATE TABLE IF NOT EXISTS `meta_tags_categories_description` (
  `categories_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `metatags_title` varchar(255) NOT NULL DEFAULT '',
  `metatags_keywords` text,
  `metatags_description` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `meta_tags_products_description`
--

CREATE TABLE IF NOT EXISTS `meta_tags_products_description` (
  `products_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `metatags_title` varchar(255) NOT NULL DEFAULT '',
  `metatags_keywords` text,
  `metatags_description` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `music_genre`
--

CREATE TABLE IF NOT EXISTS `music_genre` (
  `music_genre_id` int(11) NOT NULL,
  `music_genre_name` varchar(32) NOT NULL DEFAULT '',
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE IF NOT EXISTS `newsletters` (
  `newsletters_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `content_html` text NOT NULL,
  `module` varchar(255) NOT NULL DEFAULT '',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_sent` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `locked` int(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `orders_id` int(11) NOT NULL,
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `customers_name` varchar(64) NOT NULL DEFAULT '',
  `customers_company` varchar(64) DEFAULT NULL,
  `customers_street_address` varchar(64) NOT NULL DEFAULT '',
  `customers_suburb` varchar(32) DEFAULT NULL,
  `customers_city` varchar(32) NOT NULL DEFAULT '',
  `customers_postcode` varchar(10) NOT NULL DEFAULT '',
  `customers_state` varchar(32) DEFAULT NULL,
  `customers_country` varchar(32) NOT NULL DEFAULT '',
  `customers_telephone` varchar(32) NOT NULL DEFAULT '',
  `customers_email_address` varchar(96) NOT NULL DEFAULT '',
  `customers_address_format_id` int(5) NOT NULL DEFAULT '0',
  `delivery_name` varchar(64) NOT NULL DEFAULT '',
  `delivery_company` varchar(64) DEFAULT NULL,
  `delivery_street_address` varchar(64) NOT NULL DEFAULT '',
  `delivery_suburb` varchar(32) DEFAULT NULL,
  `delivery_city` varchar(32) NOT NULL DEFAULT '',
  `delivery_postcode` varchar(10) NOT NULL DEFAULT '',
  `delivery_state` varchar(32) DEFAULT NULL,
  `delivery_country` varchar(32) NOT NULL DEFAULT '',
  `delivery_address_format_id` int(5) NOT NULL DEFAULT '0',
  `billing_name` varchar(64) NOT NULL DEFAULT '',
  `billing_company` varchar(64) DEFAULT NULL,
  `billing_street_address` varchar(64) NOT NULL DEFAULT '',
  `billing_suburb` varchar(32) DEFAULT NULL,
  `billing_city` varchar(32) NOT NULL DEFAULT '',
  `billing_postcode` varchar(10) NOT NULL DEFAULT '',
  `billing_state` varchar(32) DEFAULT NULL,
  `billing_country` varchar(32) NOT NULL DEFAULT '',
  `billing_address_format_id` int(5) NOT NULL DEFAULT '0',
  `payment_method` varchar(128) NOT NULL DEFAULT '',
  `payment_module_code` varchar(32) NOT NULL DEFAULT '',
  `shipping_method` varchar(128) NOT NULL DEFAULT '',
  `shipping_module_code` varchar(32) NOT NULL DEFAULT '',
  `coupon_code` varchar(32) NOT NULL DEFAULT '',
  `cc_type` varchar(20) DEFAULT NULL,
  `cc_owner` varchar(64) DEFAULT NULL,
  `cc_number` varchar(32) DEFAULT NULL,
  `cc_expires` varchar(4) DEFAULT NULL,
  `cc_cvv` blob,
  `last_modified` datetime DEFAULT NULL,
  `date_purchased` datetime DEFAULT NULL,
  `orders_status` int(5) NOT NULL DEFAULT '0',
  `orders_date_finished` datetime DEFAULT NULL,
  `currency` char(3) DEFAULT NULL,
  `currency_value` decimal(14,6) DEFAULT NULL,
  `order_total` decimal(14,2) DEFAULT NULL,
  `order_tax` decimal(14,2) DEFAULT NULL,
  `paypal_ipn_id` int(11) NOT NULL DEFAULT '0',
  `ip_address` varchar(96) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orders_products`
--

CREATE TABLE IF NOT EXISTS `orders_products` (
  `orders_products_id` int(11) NOT NULL,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `products_id` int(11) NOT NULL DEFAULT '0',
  `products_model` varchar(32) DEFAULT NULL,
  `products_name` varchar(64) NOT NULL DEFAULT '',
  `products_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `final_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `products_tax` decimal(7,4) NOT NULL DEFAULT '0.0000',
  `products_quantity` float NOT NULL DEFAULT '0',
  `onetime_charges` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `products_priced_by_attribute` tinyint(1) NOT NULL DEFAULT '0',
  `product_is_free` tinyint(1) NOT NULL DEFAULT '0',
  `products_discount_type` tinyint(1) NOT NULL DEFAULT '0',
  `products_discount_type_from` tinyint(1) NOT NULL DEFAULT '0',
  `products_prid` tinytext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orders_products_attributes`
--

CREATE TABLE IF NOT EXISTS `orders_products_attributes` (
  `orders_products_attributes_id` int(11) NOT NULL,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `orders_products_id` int(11) NOT NULL DEFAULT '0',
  `products_options` varchar(32) NOT NULL DEFAULT '',
  `products_options_values` text NOT NULL,
  `options_values_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `price_prefix` char(1) NOT NULL DEFAULT '',
  `product_attribute_is_free` tinyint(1) NOT NULL DEFAULT '0',
  `products_attributes_weight` float NOT NULL DEFAULT '0',
  `products_attributes_weight_prefix` char(1) NOT NULL DEFAULT '',
  `attributes_discounted` tinyint(1) NOT NULL DEFAULT '1',
  `attributes_price_base_included` tinyint(1) NOT NULL DEFAULT '1',
  `attributes_price_onetime` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_offset` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_onetime` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_onetime_offset` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_qty_prices` text,
  `attributes_qty_prices_onetime` text,
  `attributes_price_words` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_words_free` int(4) NOT NULL DEFAULT '0',
  `attributes_price_letters` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_letters_free` int(4) NOT NULL DEFAULT '0',
  `products_options_id` int(11) NOT NULL DEFAULT '0',
  `products_options_values_id` int(11) NOT NULL DEFAULT '0',
  `products_prid` tinytext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orders_products_download`
--

CREATE TABLE IF NOT EXISTS `orders_products_download` (
  `orders_products_download_id` int(11) NOT NULL,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `orders_products_id` int(11) NOT NULL DEFAULT '0',
  `orders_products_filename` varchar(255) NOT NULL DEFAULT '',
  `download_maxdays` int(2) NOT NULL DEFAULT '0',
  `download_count` int(2) NOT NULL DEFAULT '0',
  `products_prid` tinytext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orders_status`
--

CREATE TABLE IF NOT EXISTS `orders_status` (
  `orders_status_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `orders_status_name` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders_status`
--

INSERT INTO `orders_status` (`orders_status_id`, `language_id`, `orders_status_name`) VALUES
(1, 1, 'Pending'),
(2, 1, 'Processing'),
(3, 1, 'Delivered'),
(4, 1, 'Update');

-- --------------------------------------------------------

--
-- Table structure for table `orders_status_history`
--

CREATE TABLE IF NOT EXISTS `orders_status_history` (
  `orders_status_history_id` int(11) NOT NULL,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `orders_status_id` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `customer_notified` int(1) DEFAULT '0',
  `comments` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orders_total`
--

CREATE TABLE IF NOT EXISTS `orders_total` (
  `orders_total_id` int(10) unsigned NOT NULL,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `text` varchar(255) NOT NULL DEFAULT '',
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `class` varchar(32) NOT NULL DEFAULT '',
  `sort_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `paypal`
--

CREATE TABLE IF NOT EXISTS `paypal` (
  `paypal_ipn_id` int(11) unsigned NOT NULL,
  `order_id` int(11) unsigned NOT NULL DEFAULT '0',
  `txn_type` varchar(40) NOT NULL DEFAULT '',
  `module_name` varchar(40) NOT NULL DEFAULT '',
  `module_mode` varchar(40) NOT NULL DEFAULT '',
  `reason_code` varchar(40) DEFAULT NULL,
  `payment_type` varchar(40) NOT NULL DEFAULT '',
  `payment_status` varchar(32) NOT NULL DEFAULT '',
  `pending_reason` varchar(32) DEFAULT NULL,
  `invoice` varchar(128) DEFAULT NULL,
  `mc_currency` char(3) NOT NULL DEFAULT '',
  `first_name` varchar(32) NOT NULL DEFAULT '',
  `last_name` varchar(32) NOT NULL DEFAULT '',
  `payer_business_name` varchar(128) DEFAULT NULL,
  `address_name` varchar(64) DEFAULT NULL,
  `address_street` varchar(254) DEFAULT NULL,
  `address_city` varchar(120) DEFAULT NULL,
  `address_state` varchar(120) DEFAULT NULL,
  `address_zip` varchar(10) DEFAULT NULL,
  `address_country` varchar(64) DEFAULT NULL,
  `address_status` varchar(11) DEFAULT NULL,
  `payer_email` varchar(128) NOT NULL DEFAULT '',
  `payer_id` varchar(32) NOT NULL DEFAULT '',
  `payer_status` varchar(10) NOT NULL DEFAULT '',
  `payment_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `business` varchar(128) NOT NULL DEFAULT '',
  `receiver_email` varchar(128) NOT NULL DEFAULT '',
  `receiver_id` varchar(32) NOT NULL DEFAULT '',
  `txn_id` varchar(20) NOT NULL DEFAULT '',
  `parent_txn_id` varchar(20) DEFAULT NULL,
  `num_cart_items` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `mc_gross` decimal(7,2) NOT NULL DEFAULT '0.00',
  `mc_fee` decimal(7,2) NOT NULL DEFAULT '0.00',
  `payment_gross` decimal(7,2) DEFAULT NULL,
  `payment_fee` decimal(7,2) DEFAULT NULL,
  `settle_amount` decimal(7,2) DEFAULT NULL,
  `settle_currency` char(3) DEFAULT NULL,
  `exchange_rate` decimal(4,2) DEFAULT NULL,
  `notify_version` varchar(6) NOT NULL DEFAULT '',
  `verify_sign` varchar(128) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `memo` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `paypal_payment_status`
--

CREATE TABLE IF NOT EXISTS `paypal_payment_status` (
  `payment_status_id` int(11) NOT NULL,
  `payment_status_name` varchar(64) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `paypal_payment_status`
--

INSERT INTO `paypal_payment_status` (`payment_status_id`, `payment_status_name`) VALUES
(1, 'Completed'),
(2, 'Pending'),
(3, 'Failed'),
(4, 'Denied'),
(5, 'Refunded'),
(6, 'Canceled_Reversal'),
(7, 'Reversed');

-- --------------------------------------------------------

--
-- Table structure for table `paypal_payment_status_history`
--

CREATE TABLE IF NOT EXISTS `paypal_payment_status_history` (
  `payment_status_history_id` int(11) NOT NULL,
  `paypal_ipn_id` int(11) NOT NULL DEFAULT '0',
  `txn_id` varchar(64) NOT NULL DEFAULT '',
  `parent_txn_id` varchar(64) NOT NULL DEFAULT '',
  `payment_status` varchar(17) NOT NULL DEFAULT '',
  `pending_reason` varchar(14) DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `paypal_session`
--

CREATE TABLE IF NOT EXISTS `paypal_session` (
  `unique_id` int(11) NOT NULL,
  `session_id` text NOT NULL,
  `saved_session` mediumblob NOT NULL,
  `expiry` int(17) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `paypal_testing`
--

CREATE TABLE IF NOT EXISTS `paypal_testing` (
  `paypal_ipn_id` int(11) unsigned NOT NULL,
  `order_id` int(11) unsigned NOT NULL DEFAULT '0',
  `custom` varchar(255) NOT NULL DEFAULT '',
  `txn_type` varchar(40) NOT NULL DEFAULT '',
  `module_name` varchar(40) NOT NULL DEFAULT '',
  `module_mode` varchar(40) NOT NULL DEFAULT '',
  `reason_code` varchar(40) DEFAULT NULL,
  `payment_type` varchar(40) NOT NULL DEFAULT '',
  `payment_status` varchar(32) NOT NULL DEFAULT '',
  `pending_reason` varchar(32) DEFAULT NULL,
  `invoice` varchar(128) DEFAULT NULL,
  `mc_currency` char(3) NOT NULL DEFAULT '',
  `first_name` varchar(32) NOT NULL DEFAULT '',
  `last_name` varchar(32) NOT NULL DEFAULT '',
  `payer_business_name` varchar(128) DEFAULT NULL,
  `address_name` varchar(64) DEFAULT NULL,
  `address_street` varchar(254) DEFAULT NULL,
  `address_city` varchar(120) DEFAULT NULL,
  `address_state` varchar(120) DEFAULT NULL,
  `address_zip` varchar(10) DEFAULT NULL,
  `address_country` varchar(64) DEFAULT NULL,
  `address_status` varchar(11) DEFAULT NULL,
  `payer_email` varchar(128) NOT NULL DEFAULT '',
  `payer_id` varchar(32) NOT NULL DEFAULT '',
  `payer_status` varchar(10) NOT NULL DEFAULT '',
  `payment_date` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `business` varchar(128) NOT NULL DEFAULT '',
  `receiver_email` varchar(128) NOT NULL DEFAULT '',
  `receiver_id` varchar(32) NOT NULL DEFAULT '',
  `txn_id` varchar(20) NOT NULL DEFAULT '',
  `parent_txn_id` varchar(20) DEFAULT NULL,
  `num_cart_items` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `mc_gross` decimal(7,2) NOT NULL DEFAULT '0.00',
  `mc_fee` decimal(7,2) NOT NULL DEFAULT '0.00',
  `payment_gross` decimal(7,2) DEFAULT NULL,
  `payment_fee` decimal(7,2) DEFAULT NULL,
  `settle_amount` decimal(7,2) DEFAULT NULL,
  `settle_currency` char(3) DEFAULT NULL,
  `exchange_rate` decimal(4,2) DEFAULT NULL,
  `notify_version` decimal(2,1) NOT NULL DEFAULT '0.0',
  `verify_sign` varchar(128) NOT NULL DEFAULT '',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `memo` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `products_id` int(11) NOT NULL,
  `products_type` int(11) NOT NULL DEFAULT '1',
  `products_quantity` float NOT NULL DEFAULT '0',
  `products_model` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `products_image` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `products_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `products_virtual` tinyint(1) NOT NULL DEFAULT '0',
  `products_date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `products_last_modified` datetime DEFAULT NULL,
  `products_date_available` datetime DEFAULT NULL,
  `products_weight` float NOT NULL DEFAULT '0',
  `products_status` tinyint(1) NOT NULL DEFAULT '0',
  `products_tax_class_id` int(11) NOT NULL DEFAULT '0',
  `manufacturers_id` int(11) DEFAULT NULL,
  `products_ordered` float NOT NULL DEFAULT '0',
  `products_quantity_order_min` float NOT NULL DEFAULT '1',
  `products_quantity_order_units` float NOT NULL DEFAULT '1',
  `products_priced_by_attribute` tinyint(1) NOT NULL DEFAULT '0',
  `product_is_free` tinyint(1) NOT NULL DEFAULT '0',
  `product_is_call` tinyint(1) NOT NULL DEFAULT '0',
  `products_quantity_mixed` tinyint(1) NOT NULL DEFAULT '0',
  `product_is_always_free_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `products_qty_box_status` tinyint(1) NOT NULL DEFAULT '1',
  `products_quantity_order_max` float NOT NULL DEFAULT '0',
  `products_sort_order` int(11) NOT NULL DEFAULT '0',
  `products_discount_type` tinyint(1) NOT NULL DEFAULT '0',
  `products_discount_type_from` tinyint(1) NOT NULL DEFAULT '0',
  `products_price_sorter` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `master_categories_id` int(11) NOT NULL DEFAULT '0',
  `products_mixed_discount_quantity` tinyint(1) NOT NULL DEFAULT '1',
  `metatags_title_status` tinyint(1) NOT NULL DEFAULT '0',
  `metatags_products_name_status` tinyint(1) NOT NULL DEFAULT '0',
  `metatags_model_status` tinyint(1) NOT NULL DEFAULT '0',
  `metatags_price_status` tinyint(1) NOT NULL DEFAULT '0',
  `metatags_title_tagline_status` tinyint(1) NOT NULL DEFAULT '0',
  `products_family` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `products_youtube` varchar(15) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`products_id`, `products_type`, `products_quantity`, `products_model`, `products_image`, `products_price`, `products_virtual`, `products_date_added`, `products_last_modified`, `products_date_available`, `products_weight`, `products_status`, `products_tax_class_id`, `manufacturers_id`, `products_ordered`, `products_quantity_order_min`, `products_quantity_order_units`, `products_priced_by_attribute`, `product_is_free`, `product_is_call`, `products_quantity_mixed`, `product_is_always_free_shipping`, `products_qty_box_status`, `products_quantity_order_max`, `products_sort_order`, `products_discount_type`, `products_discount_type_from`, `products_price_sorter`, `master_categories_id`, `products_mixed_discount_quantity`, `metatags_title_status`, `metatags_products_name_status`, `metatags_model_status`, `metatags_price_status`, `metatags_title_tagline_status`, `products_family`, `products_youtube`) VALUES
(1, 1, 999, 'Model1', '01.png', '550.0000', 0, '2010-09-09 00:00:00', '2015-01-04 14:42:27', '2015-02-12 00:00:00', 2, 1, 0, 1, 2, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, '350.0000', 31, 1, 0, 0, 0, 0, 0, 'group1', 'mZ5Gw7rhYkc'),
(2, 1, 999, 'Model2', '02.png', '160.0000', 0, '2010-09-09 00:00:00', '2015-01-04 09:43:40', '2015-01-14 00:00:00', 3, 1, 0, 2, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '144.0000', 31, 1, 0, 0, 0, 0, 0, 'group1', 'mZ5Gw7rhYkc'),
(3, 1, 997, 'Model3', '03.png', '241.0000', 0, '2010-09-09 00:00:00', '2015-01-04 09:43:50', NULL, 4, 1, 0, 3, 2, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '216.9000', 31, 1, 0, 0, 0, 0, 0, 'group1', 'mZ5Gw7rhYkc'),
(4, 1, 999, 'Model4', '04.png', '651.0000', 0, '2010-09-09 00:00:00', '2015-01-04 09:43:57', '2015-02-12 00:00:00', 5, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '585.9000', 31, 1, 0, 0, 0, 0, 0, 'group1', 'mZ5Gw7rhYkc'),
(5, 1, 999, 'Model5', '05.png', '211.0000', 0, '2010-09-09 00:00:00', '2015-01-04 16:10:00', NULL, 2, 1, 0, 2, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '211.0000', 2, 1, 0, 0, 0, 0, 0, 'group1', 'mZ5Gw7rhYkc'),
(6, 1, 999, 'Model6', '06.png', '83.0000', 0, '2010-09-09 00:00:00', '2015-01-04 16:10:10', NULL, 2, 1, 0, 3, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '83.0000', 2, 1, 0, 0, 0, 0, 0, 'group1', 'mZ5Gw7rhYkc'),
(7, 1, 999, 'Model7', '07.png', '503.0000', 0, '2010-09-09 00:00:00', '2015-01-04 16:09:23', NULL, 3, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '503.0000', 2, 1, 0, 0, 0, 0, 0, 'group1', 'mZ5Gw7rhYkc'),
(8, 1, 999, 'Model8', '08.png', '104.0000', 0, '2010-09-09 00:00:00', '2015-01-04 16:09:35', NULL, 4, 1, 0, 2, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '104.0000', 2, 1, 0, 0, 0, 0, 0, 'group2', 'mZ5Gw7rhYkc'),
(9, 1, 999, 'Model9', '09.png', '359.0000', 0, '2010-09-09 00:00:00', NULL, NULL, 5, 1, 0, 3, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '359.0000', 3, 1, 0, 0, 0, 0, 0, 'group2', 'mZ5Gw7rhYkc'),
(10, 1, 999, 'Model1', '10.png', '732.0000', 0, '2010-09-09 00:00:00', '2014-11-26 12:53:55', '2015-02-13 00:00:00', 6, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '732.0000', 3, 1, 0, 0, 0, 0, 0, 'group2', 'mZ5Gw7rhYkc'),
(11, 1, 999, 'Model2', '11.png', '653.0000', 0, '2010-09-09 00:00:00', '2014-11-26 12:54:06', '2015-02-13 00:00:00', 3, 1, 0, 2, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '522.4000', 3, 1, 0, 0, 0, 0, 0, 'group2', 'mZ5Gw7rhYkc'),
(12, 1, 999, 'Model3', '12.png', '124.0000', 0, '2010-09-09 00:00:00', NULL, NULL, 7, 1, 0, 3, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '124.0000', 3, 1, 0, 0, 0, 0, 0, 'group2', 'mZ5Gw7rhYkc'),
(13, 1, 998, 'Model4', '13.png', '605.0000', 0, '2010-09-09 00:00:00', NULL, NULL, 9, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '605.0000', 4, 1, 0, 0, 0, 0, 0, 'group2', 'mZ5Gw7rhYkc'),
(14, 1, 999, 'Model5', '14.png', '991.0000', 0, '2010-09-09 00:00:00', NULL, NULL, 6, 1, 0, 2, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '991.9900', 4, 1, 0, 0, 0, 0, 0, 'group3', 'mZ5Gw7rhYkc'),
(15, 1, 998, 'Model6', '15.png', '305.0000', 0, '2010-09-09 00:00:00', NULL, NULL, 5, 1, 0, 3, 1, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '305.0000', 4, 1, 0, 0, 0, 0, 0, 'group3', 'mZ5Gw7rhYkc'),
(16, 1, 999, 'Model7', '16.png', '871.0000', 0, '2010-09-09 00:00:00', NULL, NULL, 3, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '871.1400', 4, 1, 0, 0, 0, 0, 0, 'group3', 'mZ5Gw7rhYkc'),
(17, 1, 999, 'Model8', '17.png', '353.0000', 0, '2010-09-09 00:00:00', NULL, NULL, 1, 1, 0, 2, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '353.0000', 5, 1, 0, 0, 0, 0, 0, 'group3', 'mZ5Gw7rhYkc'),
(18, 1, 999, 'Model9', '18.png', '292.0000', 0, '2010-09-09 00:00:00', NULL, NULL, 2, 1, 0, 3, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '292.2400', 5, 1, 0, 0, 0, 0, 0, 'group3', 'mZ5Gw7rhYkc'),
(19, 1, 999, 'Model1', '19.png', '785.3200', 0, '2010-09-09 00:00:00', NULL, NULL, 2, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '785.3200', 5, 1, 0, 0, 0, 0, 0, 'group3', 'mZ5Gw7rhYkc'),
(20, 1, 999, 'Model2', '20.png', '999.9900', 0, '2010-09-09 00:00:00', NULL, NULL, 2, 1, 0, 2, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '999.9900', 5, 1, 0, 0, 0, 0, 0, 'group4', 'mZ5Gw7rhYkc'),
(21, 1, 999, 'Model3', '16.png', '999.9900', 0, '2014-12-21 08:59:34', '2015-01-04 09:43:32', NULL, 2, 1, 0, 2, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '899.9910', 31, 1, 0, 0, 0, 0, 0, 'group4', 'mZ5Gw7rhYkc'),
(22, 1, 999, 'Model8', '17.png', '353.0000', 0, '2014-12-21 08:59:53', '2015-01-04 09:44:04', NULL, 1, 1, 0, 2, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '317.7000', 31, 1, 0, 0, 0, 0, 0, 'group4', 'mZ5Gw7rhYkc'),
(23, 1, 999, 'Model9', '18.png', '292.0000', 0, '2014-12-21 09:01:04', '2015-01-04 09:44:12', NULL, 2, 1, 0, 3, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, '262.8000', 31, 1, 0, 0, 0, 0, 0, 'group4', 'mZ5Gw7rhYkc');

-- --------------------------------------------------------

--
-- Table structure for table `products_attributes`
--

CREATE TABLE IF NOT EXISTS `products_attributes` (
  `products_attributes_id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL DEFAULT '0',
  `options_id` int(11) NOT NULL DEFAULT '0',
  `options_values_id` int(11) NOT NULL DEFAULT '0',
  `options_values_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `price_prefix` char(1) NOT NULL DEFAULT '',
  `products_options_sort_order` int(11) NOT NULL DEFAULT '0',
  `product_attribute_is_free` tinyint(1) NOT NULL DEFAULT '0',
  `products_attributes_weight` float NOT NULL DEFAULT '0',
  `products_attributes_weight_prefix` char(1) NOT NULL DEFAULT '',
  `attributes_display_only` tinyint(1) NOT NULL DEFAULT '0',
  `attributes_default` tinyint(1) NOT NULL DEFAULT '0',
  `attributes_discounted` tinyint(1) NOT NULL DEFAULT '1',
  `attributes_image` varchar(64) DEFAULT NULL,
  `attributes_price_base_included` tinyint(1) NOT NULL DEFAULT '1',
  `attributes_price_onetime` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_offset` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_onetime` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_factor_onetime_offset` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_qty_prices` text,
  `attributes_qty_prices_onetime` text,
  `attributes_price_words` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_words_free` int(4) NOT NULL DEFAULT '0',
  `attributes_price_letters` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `attributes_price_letters_free` int(4) NOT NULL DEFAULT '0',
  `attributes_required` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=1421 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products_attributes`
--

INSERT INTO `products_attributes` (`products_attributes_id`, `products_id`, `options_id`, `options_values_id`, `options_values_price`, `price_prefix`, `products_options_sort_order`, `product_attribute_is_free`, `products_attributes_weight`, `products_attributes_weight_prefix`, `attributes_display_only`, `attributes_default`, `attributes_discounted`, `attributes_image`, `attributes_price_base_included`, `attributes_price_onetime`, `attributes_price_factor`, `attributes_price_factor_offset`, `attributes_price_factor_onetime`, `attributes_price_factor_onetime_offset`, `attributes_qty_prices`, `attributes_qty_prices_onetime`, `attributes_price_words`, `attributes_price_words_free`, `attributes_price_letters`, `attributes_price_letters_free`, `attributes_required`) VALUES
(1164, 1, 1, 29, '0.0000', '+', 80, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1165, 1, 1, 15, '0.0000', '+', 50, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1166, 1, 1, 28, '0.0000', '+', 70, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1167, 1, 1, 32, '0.0000', '+', 110, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1168, 1, 1, 26, '0.0000', '+', 40, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1169, 1, 1, 25, '0.0000', '+', 20, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1170, 1, 13, 35, '0.0000', '+', 30, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1171, 1, 13, 36, '0.0000', '+', 20, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1172, 1, 13, 34, '0.0000', '+', 40, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1173, 1, 3, 7, '0.0000', '+', 30, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1174, 1, 3, 8, '0.0000', '+', 20, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1175, 1, 3, 5, '0.0000', '+', 10, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1176, 1, 2, 20, '0.0000', '+', 40, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1177, 1, 2, 18, '0.0000', '+', 30, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1178, 1, 2, 21, '0.0000', '+', 20, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1179, 1, 2, 19, '0.0000', '+', 10, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1180, 2, 17, 63, '0.0000', '+', 20, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1181, 2, 17, 62, '0.0000', '+', 10, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1182, 2, 15, 49, '0.0000', '+', 20, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1183, 2, 15, 51, '0.0000', '+', 10, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1184, 2, 15, 50, '0.0000', '+', 30, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1196, 3, 1, 29, '0.0000', '+', 80, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1193, 3, 14, 43, '0.0000', '+', 100, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1194, 3, 14, 40, '0.0000', '+', 25, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1195, 3, 14, 38, '0.0000', '+', 5, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1189, 2, 2, 20, '0.0000', '+', 40, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1190, 2, 2, 18, '0.0000', '+', 30, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1191, 2, 2, 21, '0.0000', '+', 20, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1192, 2, 2, 19, '0.0000', '+', 10, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1197, 3, 1, 15, '0.0000', '+', 50, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1198, 3, 1, 26, '0.0000', '+', 40, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1199, 3, 1, 27, '0.0000', '+', 60, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1200, 3, 13, 35, '0.0000', '+', 30, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1201, 3, 13, 36, '0.0000', '+', 20, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1202, 3, 13, 48, '0.0000', '+', 5, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1203, 3, 13, 44, '0.0000', '+', 5, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1204, 4, 14, 39, '0.0000', '+', 10, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1205, 4, 14, 43, '0.0000', '+', 100, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1206, 4, 14, 38, '0.0000', '+', 5, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1207, 4, 14, 42, '0.0000', '+', 50, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1208, 4, 1, 15, '0.0000', '+', 50, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1209, 4, 1, 25, '0.0000', '+', 20, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1210, 4, 1, 16, '0.0000', '+', 10, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1211, 4, 1, 30, '0.0000', '+', 90, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1212, 4, 13, 35, '0.0000', '+', 30, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1213, 4, 13, 36, '0.0000', '+', 20, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1214, 4, 13, 44, '0.0000', '+', 5, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1215, 4, 1, 29, '0.0000', '+', 80, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1216, 4, 1, 32, '0.0000', '+', 110, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1217, 4, 1, 26, '0.0000', '+', 40, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1218, 4, 1, 27, '0.0000', '+', 60, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1219, 4, 1, 31, '0.0000', '+', 100, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1220, 4, 14, 41, '0.0000', '+', 15, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1221, 4, 14, 40, '0.0000', '+', 25, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1222, 4, 13, 34, '0.0000', '+', 40, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1223, 17, 14, 39, '0.0000', '+', 10, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1224, 17, 14, 43, '0.0000', '+', 100, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1225, 17, 14, 41, '0.0000', '+', 15, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1226, 17, 14, 40, '0.0000', '+', 25, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1227, 17, 1, 29, '0.0000', '+', 80, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1228, 17, 1, 15, '0.0000', '+', 50, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1229, 17, 1, 32, '0.0000', '+', 110, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1230, 17, 1, 26, '0.0000', '+', 40, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1231, 17, 1, 25, '0.0000', '+', 20, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1232, 17, 1, 27, '0.0000', '+', 60, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1233, 18, 16, 61, '0.0000', '+', 20, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1234, 18, 16, 53, '0.0000', '+', 30, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1235, 18, 16, 55, '0.0000', '+', 50, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1236, 18, 16, 56, '0.0000', '+', 60, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1237, 18, 14, 39, '0.0000', '+', 10, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1238, 18, 14, 43, '0.0000', '+', 100, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1239, 18, 14, 40, '0.0000', '+', 25, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1240, 18, 14, 38, '0.0000', '+', 5, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1241, 18, 17, 63, '0.0000', '+', 20, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1242, 18, 17, 62, '0.0000', '+', 10, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1243, 19, 13, 35, '0.0000', '+', 30, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1244, 19, 13, 36, '0.0000', '+', 20, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1245, 19, 13, 48, '0.0000', '+', 5, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1246, 19, 13, 44, '0.0000', '+', 5, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1247, 19, 1, 29, '0.0000', '+', 80, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1248, 19, 1, 28, '0.0000', '+', 70, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1249, 19, 1, 25, '0.0000', '+', 20, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1250, 19, 1, 27, '0.0000', '+', 60, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1251, 19, 1, 16, '0.0000', '+', 10, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1252, 19, 1, 30, '0.0000', '+', 90, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1253, 19, 16, 54, '0.0000', '+', 40, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1254, 19, 16, 55, '0.0000', '+', 50, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1255, 19, 16, 56, '0.0000', '+', 60, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1256, 20, 14, 39, '0.0000', '+', 10, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1257, 20, 14, 43, '0.0000', '+', 100, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1258, 20, 14, 41, '0.0000', '+', 15, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1259, 20, 14, 40, '0.0000', '+', 25, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1260, 20, 1, 29, '0.0000', '+', 80, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1261, 20, 1, 15, '0.0000', '+', 50, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1262, 20, 1, 28, '0.0000', '+', 70, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1263, 20, 1, 32, '0.0000', '+', 110, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1264, 20, 15, 49, '0.0000', '+', 20, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1265, 20, 15, 51, '0.0000', '+', 10, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1266, 20, 15, 50, '0.0000', '+', 30, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1267, 17, 14, 38, '0.0000', '+', 5, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1268, 17, 18, 65, '0.0000', '+', 10, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1269, 17, 18, 66, '0.0000', '+', 20, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1270, 18, 14, 41, '0.0000', '+', 15, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1271, 13, 16, 61, '0.0000', '+', 20, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1272, 13, 16, 53, '0.0000', '+', 30, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1273, 13, 16, 54, '0.0000', '+', 40, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1274, 13, 16, 55, '0.0000', '+', 50, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1275, 13, 1, 25, '0.0000', '+', 20, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1276, 13, 1, 27, '0.0000', '+', 60, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1277, 13, 1, 16, '0.0000', '+', 10, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1278, 13, 1, 31, '0.0000', '+', 100, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1279, 13, 15, 49, '0.0000', '+', 20, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1280, 13, 15, 51, '0.0000', '+', 10, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1281, 13, 15, 50, '0.0000', '+', 30, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1282, 14, 14, 39, '0.0000', '+', 10, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1283, 14, 14, 43, '0.0000', '+', 100, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1284, 14, 14, 41, '0.0000', '+', 15, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1285, 14, 14, 40, '0.0000', '+', 25, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1286, 14, 1, 25, '0.0000', '+', 20, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1287, 14, 1, 27, '0.0000', '+', 60, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1288, 14, 1, 16, '0.0000', '+', 10, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1289, 14, 1, 31, '0.0000', '+', 100, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1290, 14, 1, 30, '0.0000', '+', 90, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1291, 14, 1, 17, '0.0000', '+', 30, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1292, 14, 15, 49, '0.0000', '+', 20, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1293, 14, 15, 51, '0.0000', '+', 10, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1294, 14, 15, 50, '0.0000', '+', 30, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1295, 15, 17, 63, '0.0000', '+', 20, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1296, 15, 17, 62, '0.0000', '+', 10, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1297, 15, 13, 35, '0.0000', '+', 30, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1298, 15, 13, 36, '0.0000', '+', 20, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1299, 15, 13, 47, '0.0000', '+', 10, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1300, 15, 13, 48, '0.0000', '+', 5, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1301, 15, 18, 65, '0.0000', '+', 10, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1302, 15, 18, 66, '0.0000', '+', 20, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1303, 16, 1, 29, '0.0000', '+', 80, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1304, 16, 1, 15, '0.0000', '+', 50, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1305, 16, 1, 28, '0.0000', '+', 70, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1306, 16, 1, 32, '0.0000', '+', 110, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1307, 16, 1, 26, '0.0000', '+', 40, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1308, 16, 1, 45, '0.0000', '+', 5, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1309, 16, 15, 49, '0.0000', '+', 20, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1310, 16, 15, 51, '0.0000', '+', 10, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1311, 16, 15, 50, '0.0000', '+', 30, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1312, 16, 12, 0, '0.0000', '+', 0, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1313, 16, 16, 55, '0.0000', '+', 50, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1314, 16, 16, 56, '0.0000', '+', 60, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1315, 16, 16, 59, '0.0000', '+', 70, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1316, 16, 16, 60, '0.0000', '+', 80, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1317, 5, 1, 25, '0.0000', '+', 20, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1318, 5, 1, 27, '0.0000', '+', 60, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1319, 5, 1, 16, '0.0000', '+', 10, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1320, 5, 1, 31, '0.0000', '+', 100, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1321, 5, 1, 30, '0.0000', '+', 90, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1322, 5, 1, 17, '0.0000', '+', 30, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1323, 5, 17, 63, '0.0000', '+', 20, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1324, 5, 17, 62, '0.0000', '+', 10, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1325, 5, 1, 29, '0.0000', '+', 80, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1326, 5, 1, 15, '0.0000', '+', 50, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1327, 5, 1, 28, '0.0000', '+', 70, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1328, 5, 1, 32, '0.0000', '+', 110, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1329, 5, 1, 26, '0.0000', '+', 40, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1336, 6, 14, 41, '0.0000', '+', 15, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1334, 6, 14, 39, '0.0000', '+', 10, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1335, 6, 14, 43, '0.0000', '+', 100, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1417, 5, 2, 20, '0.0000', '+', 40, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1337, 6, 14, 40, '0.0000', '+', 25, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1338, 6, 1, 29, '0.0000', '+', 80, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1339, 6, 1, 15, '0.0000', '+', 50, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1340, 6, 1, 28, '0.0000', '+', 70, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1341, 6, 1, 32, '0.0000', '+', 110, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1342, 6, 1, 26, '0.0000', '+', 40, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1343, 6, 1, 25, '0.0000', '+', 20, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1344, 6, 1, 27, '0.0000', '+', 60, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1345, 6, 1, 16, '0.0000', '+', 10, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1346, 6, 15, 49, '0.0000', '+', 20, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1347, 6, 15, 51, '0.0000', '+', 10, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1348, 6, 15, 50, '0.0000', '+', 30, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1349, 7, 17, 63, '0.0000', '+', 20, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1350, 7, 17, 62, '0.0000', '+', 10, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1351, 7, 13, 35, '0.0000', '+', 30, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1352, 7, 13, 36, '0.0000', '+', 20, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1353, 7, 13, 47, '0.0000', '+', 10, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1354, 7, 13, 48, '0.0000', '+', 5, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1355, 7, 16, 60, '0.0000', '+', 80, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1356, 7, 16, 57, '0.0000', '+', 90, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1357, 7, 16, 58, '0.0000', '+', 200, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1358, 8, 12, 0, '0.0000', '+', 0, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1359, 8, 18, 65, '0.0000', '+', 10, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1360, 8, 18, 66, '0.0000', '+', 20, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1361, 8, 1, 29, '0.0000', '+', 80, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1362, 8, 1, 15, '0.0000', '+', 50, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1363, 8, 1, 28, '0.0000', '+', 70, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1364, 8, 1, 32, '0.0000', '+', 110, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1365, 8, 1, 30, '0.0000', '+', 90, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1366, 8, 1, 17, '0.0000', '+', 30, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1367, 9, 2, 20, '0.0000', '+', 40, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1368, 9, 2, 18, '0.0000', '+', 30, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1369, 9, 2, 37, '0.0000', '+', 5, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1370, 9, 2, 21, '0.0000', '+', 20, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1371, 9, 19, 67, '0.0000', '+', 10, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1372, 9, 5, 24, '0.0000', '+', 10, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1373, 9, 5, 68, '0.0000', '+', 5, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1374, 9, 5, 13, '0.0000', '+', 1000, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1375, 9, 18, 65, '0.0000', '+', 10, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1376, 9, 18, 66, '0.0000', '+', 20, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1377, 10, 3, 7, '0.0000', '+', 30, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1378, 10, 3, 6, '0.0000', '+', 20, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1379, 10, 3, 8, '0.0000', '+', 20, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1380, 10, 3, 5, '0.0000', '+', 10, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1381, 10, 1, 29, '0.0000', '+', 80, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1382, 10, 1, 15, '0.0000', '+', 50, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1383, 10, 1, 28, '0.0000', '+', 70, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1384, 10, 1, 32, '0.0000', '+', 110, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1385, 10, 1, 26, '0.0000', '+', 40, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1386, 10, 1, 25, '0.0000', '+', 20, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1387, 10, 1, 27, '0.0000', '+', 60, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1388, 10, 1, 16, '0.0000', '+', 10, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1389, 10, 1, 31, '0.0000', '+', 100, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1390, 10, 1, 30, '0.0000', '+', 90, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1391, 10, 17, 63, '0.0000', '+', 20, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1392, 11, 1, 29, '0.0000', '+', 80, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1393, 11, 1, 15, '0.0000', '+', 50, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1394, 11, 1, 28, '0.0000', '+', 70, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1395, 11, 1, 32, '0.0000', '+', 110, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1396, 11, 1, 26, '0.0000', '+', 40, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1397, 11, 1, 25, '0.0000', '+', 20, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1398, 11, 2, 20, '0.0000', '+', 40, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1399, 11, 2, 18, '0.0000', '+', 30, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1400, 11, 2, 37, '0.0000', '+', 5, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1401, 11, 2, 21, '0.0000', '+', 20, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1402, 11, 5, 64, '0.0000', '+', 100, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1403, 11, 5, 10, '0.0000', '+', 10, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1404, 11, 5, 52, '0.0000', '+', 20, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1405, 12, 16, 55, '0.0000', '+', 50, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1406, 12, 16, 56, '0.0000', '+', 60, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1407, 12, 16, 59, '0.0000', '+', 70, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1408, 12, 16, 60, '0.0000', '+', 80, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1409, 12, 3, 7, '0.0000', '+', 30, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1410, 12, 3, 6, '0.0000', '+', 20, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1411, 12, 3, 8, '0.0000', '+', 20, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1412, 12, 3, 9, '0.0000', '+', 10, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1413, 12, 19, 67, '0.0000', '+', 10, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1414, 12, 2, 20, '0.0000', '+', 40, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1415, 12, 2, 18, '0.0000', '+', 30, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1416, 12, 2, 37, '0.0000', '+', 5, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1418, 5, 2, 18, '0.0000', '+', 30, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1419, 5, 2, 37, '0.0000', '+', 5, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0),
(1420, 5, 2, 21, '0.0000', '+', 20, 1, 0, '+', 0, 0, 1, '', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '', '', '0.0000', 0, '0.0000', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `products_attributes_download`
--

CREATE TABLE IF NOT EXISTS `products_attributes_download` (
  `products_attributes_id` int(11) NOT NULL DEFAULT '0',
  `products_attributes_filename` varchar(255) NOT NULL DEFAULT '',
  `products_attributes_maxdays` int(2) DEFAULT '0',
  `products_attributes_maxcount` int(2) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products_attributes_download`
--

INSERT INTO `products_attributes_download` (`products_attributes_id`, `products_attributes_filename`, `products_attributes_maxdays`, `products_attributes_maxcount`) VALUES
(26, 'unreal.zip', 7, 3),
(1040, 'test.zip', 7, 5),
(1041, 'test2.zip', 7, 5),
(1042, 'test2.zip', 7, 5),
(1043, 'test.zip', 7, 5),
(1044, 'test.zip', 7, 5),
(1088, 'ms_word_sample.zip', 7, 5),
(1089, 'pdf_sample.zip', 7, 5),
(1093, 'test.zip', 7, 5),
(1094, 'test2.zip', 7, 5),
(1100, 'ms_word_sample.zip', 7, 5),
(1103, 'pdf_sample.zip', 7, 5);

-- --------------------------------------------------------

--
-- Table structure for table `products_description`
--

CREATE TABLE IF NOT EXISTS `products_description` (
  `products_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `products_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `products_description` text COLLATE utf8_unicode_ci,
  `products_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `products_viewed` int(5) DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products_description`
--

INSERT INTO `products_description` (`products_id`, `language_id`, `products_name`, `products_description`, `products_url`, `products_viewed`) VALUES
(1, 1, 'Oatey 316-in x 5-ft Rubber Utility Hose', 'The supplies we sell in our store are of premium quality and will serve you for years. We enrich our Plumbing Supplies Store only with the well tested models which have won trust and are known thanks to their resistance to depreciation. Modern and reliable they will cause you no troubles in further exploitation. Trust our plumbing experience and we will justify it.', '', 8),
(2, 1, 'Plumb Craft 5 Position Hand Held Shower Head - 8661', 'The supplies we sell in our store are of premium quality and will serve you for years. We enrich our Plumbing Supplies Store only with the well tested models which have won trust and are known thanks to their resistance to depreciation. Modern and reliable they will cause you no troubles in further exploitation. Trust our plumbing experience and we will justify it.', '', 43),
(3, 1, 'Plumb Craft 6 Spray Setting Fixed Shower Head - 8674000', 'The supplies we sell in our store are of premium quality and will serve you for years. We enrich our Plumbing Supplies Store only with the well tested models which have won trust and are known thanks to their resistance to depreciation. Modern and reliable they will cause you no troubles in further exploitation. Trust our plumbing experience and we will justify it.', '', 6),
(4, 1, 'Plumb Craft Acrylic Handle with Skirt Faucet Replacement', 'The supplies we sell in our store are of premium quality and will serve you for years. We enrich our Plumbing Supplies Store only with the well tested models which have won trust and are known thanks to their resistance to depreciation. Modern and reliable they will cause you no troubles in further exploitation. Trust our plumbing experience and we will justify it.', '', 38),
(5, 1, 'Plumb Craft Toilet Tank Fill Valve', 'The supplies we sell in our store are of premium quality and will serve you for years. We enrich our Plumbing Supplies Store only with the well tested models which have won trust and are known thanks to their resistance to depreciation. Modern and reliable they will cause you no troubles in further exploitation. Trust our plumbing experience and we will justify it.', '', 8),
(6, 1, 'Plumb Pak 12-in Brass Push Fit In-Line Straight Valve', 'The supplies we sell in our store are of premium quality and will serve you for years. We enrich our Plumbing Supplies Store only with the well tested models which have won trust and are known thanks to their resistance to depreciation. Modern and reliable they will cause you no troubles in further exploitation. Trust our plumbing experience and we will justify it.', '', 17),
(7, 1, 'Schon 13 x 17 Single Bowl Zero Radius Bar Sink', 'The supplies we sell in our store are of premium quality and will serve you for years. We enrich our Plumbing Supplies Store only with the well tested models which have won trust and are known thanks to their resistance to depreciation. Modern and reliable they will cause you no troubles in further exploitation. Trust our plumbing experience and we will justify it.', '', 1),
(8, 1, 'Superior Tool Soft Jaws Plumbing Pliers 06012', 'The supplies we sell in our store are of premium quality and will serve you for years. We enrich our Plumbing Supplies Store only with the well tested models which have won trust and are known thanks to their resistance to depreciation. Modern and reliable they will cause you no troubles in further exploitation. Trust our plumbing experience and we will justify it.', '', 0),
(9, 1, 'Undermount Kitchen Sink', 'The supplies we sell in our store are of premium quality and will serve you for years. We enrich our Plumbing Supplies Store only with the well tested models which have won trust and are known thanks to their resistance to depreciation. Modern and reliable they will cause you no troubles in further exploitation. Trust our plumbing experience and we will justify it.', '', 1),
(10, 1, 'Vigo One Handle Single Hole Pull Out Spray Kitchen Faucet', 'The supplies we sell in our store are of premium quality and will serve you for years. We enrich our Plumbing Supplies Store only with the well tested models which have won trust and are known thanks to their resistance to depreciation. Modern and reliable they will cause you no troubles in further exploitation. Trust our plumbing experience and we will justify it.', '', 3),
(11, 1, 'Vigo Single Hole Waterfall Bathroom Faucet Less Handles - VG0300', 'The supplies we sell in our store are of premium quality and will serve you for years. We enrich our Plumbing Supplies Store only with the well tested models which have won trust and are known thanks to their resistance to depreciation. Modern and reliable they will cause you no troubles in further exploitation. Trust our plumbing experience and we will justify it.', '', 8),
(12, 1, 'Vigo Tempered Glass Bathroom Sink - VG07505', 'The supplies we sell in our store are of premium quality and will serve you for years. We enrich our Plumbing Supplies Store only with the well tested models which have won trust and are known thanks to their resistance to depreciation. Modern and reliable they will cause you no troubles in further exploitation. Trust our plumbing experience and we will justify it.', '', 1),
(13, 1, 'Vigo Two Handle Widespread Pull-Out Spray Bar Faucet with Soap D', 'The supplies we sell in our store are of premium quality and will serve you for years. We enrich our Plumbing Supplies Store only with the well tested models which have won trust and are known thanks to their resistance to depreciation. Modern and reliable they will cause you no troubles in further exploitation. Trust our plumbing experience and we will justify it.', '', 4),
(14, 1, 'Waterstone Traditional Deck Mount One Handle Single Hole Pot Fil', 'The supplies we sell in our store are of premium quality and will serve you for years. We enrich our Plumbing Supplies Store only with the well tested models which have won trust and are known thanks to their resistance to depreciation. Modern and reliable they will cause you no troubles in further exploitation. Trust our plumbing experience and we will justify it.', '', 0),
(15, 1, 'Watts 1-in x 1-ft Reinforced PVC Reinforced Braided Vinyl Tubing', 'The supplies we sell in our store are of premium quality and will serve you for years. We enrich our Plumbing Supplies Store only with the well tested models which have won trust and are known thanks to their resistance to depreciation. Modern and reliable they will cause you no troubles in further exploitation. Trust our plumbing experience and we will justify it.', '', 1),
(16, 1, 'Whirlpool 40 Gallons 6-Year Regular Electric Water Heater', 'The supplies we sell in our store are of premium quality and will serve you for years. We enrich our Plumbing Supplies Store only with the well tested models which have won trust and are known thanks to their resistance to depreciation. Modern and reliable they will cause you no troubles in further exploitation. Trust our plumbing experience and we will justify it.', '', 0),
(17, 1, 'Whirlpool 6th Sense 50-Gallon 12-Year Tall Gas Water Heater (Nat', 'The supplies we sell in our store are of premium quality and will serve you for years. We enrich our Plumbing Supplies Store only with the well tested models which have won trust and are known thanks to their resistance to depreciation. Modern and reliable they will cause you no troubles in further exploitation. Trust our plumbing experience and we will justify it.', '', 0),
(18, 1, 'Whitehaus Collection Forever Hot One Handle Single Hole Drinking', 'The supplies we sell in our store are of premium quality and will serve you for years. We enrich our Plumbing Supplies Store only with the well tested models which have won trust and are known thanks to their resistance to depreciation. Modern and reliable they will cause you no troubles in further exploitation. Trust our plumbing experience and we will justify it.', '', 1),
(19, 1, 'Yosemite Home Decor One Handle Centerset Bathroom Faucet - YP42V', 'The supplies we sell in our store are of premium quality and will serve you for years. We enrich our Plumbing Supplies Store only with the well tested models which have won trust and are known thanks to their resistance to depreciation. Modern and reliable they will cause you no troubles in further exploitation. Trust our plumbing experience and we will justify it.', '', 0),
(20, 1, 'Yosemite Home Decor Roman Waterfall Tub Faucet', 'The supplies we sell in our store are of premium quality and will serve you for years. We enrich our Plumbing Supplies Store only with the well tested models which have won trust and are known thanks to their resistance to depreciation. Modern and reliable they will cause you no troubles in further exploitation. Trust our plumbing experience and we will justify it.', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `products_discount_quantity`
--

CREATE TABLE IF NOT EXISTS `products_discount_quantity` (
  `discount_id` int(4) NOT NULL DEFAULT '0',
  `products_id` int(11) NOT NULL DEFAULT '0',
  `discount_qty` float NOT NULL DEFAULT '0',
  `discount_price` decimal(15,4) NOT NULL DEFAULT '0.0000'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products_discount_quantity`
--

INSERT INTO `products_discount_quantity` (`discount_id`, `products_id`, `discount_qty`, `discount_price`) VALUES
(4, 127, 12, '10.0000'),
(3, 127, 9, '8.0000'),
(2, 127, 6, '7.0000'),
(1, 8, 3, '10.0000'),
(1, 127, 3, '5.0000'),
(4, 130, 12, '10.0000'),
(3, 130, 9, '8.0000'),
(2, 130, 6, '7.0000'),
(1, 130, 3, '5.0000'),
(9, 175, 9, '10.0000'),
(8, 175, 8, '9.0000'),
(7, 175, 7, '8.0000'),
(6, 175, 6, '7.0000'),
(5, 175, 5, '6.0000'),
(4, 175, 4, '5.0000'),
(3, 175, 3, '4.0000'),
(2, 175, 2, '3.0000'),
(1, 175, 10, '11.0000'),
(3, 178, 3, '4.0000'),
(2, 178, 2, '3.0000'),
(1, 178, 10, '11.0000'),
(6, 177, 36, '30.0000'),
(5, 176, 48, '30.0000'),
(4, 176, 36, '20.0000'),
(3, 176, 24, '10.0000'),
(2, 176, 12, '5.0000'),
(1, 176, 60, '40.0000'),
(5, 177, 24, '20.0000'),
(4, 177, 12, '10.0000'),
(3, 177, 6, '5.0000'),
(2, 177, 60, '50.0000'),
(1, 177, 48, '40.0000'),
(4, 178, 4, '5.0000'),
(5, 178, 5, '6.0000'),
(6, 178, 6, '7.0000'),
(7, 178, 7, '8.0000'),
(8, 178, 8, '9.0000'),
(9, 178, 9, '10.0000'),
(1, 1, 5, '10.0000'),
(2, 1, 10, '15.0000'),
(3, 1, 15, '20.0000'),
(4, 1, 20, '25.0000'),
(5, 1, 25, '30.0000');

-- --------------------------------------------------------

--
-- Table structure for table `products_notifications`
--

CREATE TABLE IF NOT EXISTS `products_notifications` (
  `products_id` int(11) NOT NULL DEFAULT '0',
  `customers_id` int(11) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products_notifications`
--

INSERT INTO `products_notifications` (`products_id`, `customers_id`, `date_added`) VALUES
(13, 5, '2014-08-11 16:55:16'),
(16, 5, '2014-08-11 16:55:16'),
(14, 5, '2014-08-11 16:55:16'),
(18, 5, '2014-08-11 16:55:16'),
(3, 1, '2015-02-26 11:01:13');

-- --------------------------------------------------------

--
-- Table structure for table `products_options`
--

CREATE TABLE IF NOT EXISTS `products_options` (
  `products_options_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `products_options_name` varchar(32) NOT NULL DEFAULT '',
  `products_options_sort_order` int(11) NOT NULL DEFAULT '0',
  `products_options_type` int(5) NOT NULL DEFAULT '0',
  `products_options_length` smallint(2) NOT NULL DEFAULT '32',
  `products_options_comment` varchar(64) DEFAULT NULL,
  `products_options_size` smallint(2) NOT NULL DEFAULT '32',
  `products_options_images_per_row` int(2) DEFAULT '5',
  `products_options_images_style` int(1) DEFAULT '0',
  `products_options_rows` smallint(2) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products_options`
--

INSERT INTO `products_options` (`products_options_id`, `language_id`, `products_options_name`, `products_options_sort_order`, `products_options_type`, `products_options_length`, `products_options_comment`, `products_options_size`, `products_options_images_per_row`, `products_options_images_style`, `products_options_rows`) VALUES
(1, 1, 'Color', 10, 2, 32, '', 32, 5, 0, 1),
(2, 1, 'Size', 20, 0, 32, '', 32, 5, 0, 1),
(3, 1, 'Model', 30, 0, 32, '', 32, 5, 0, 1),
(4, 1, 'Memory', 50, 0, 32, '', 32, 5, 0, 1),
(5, 1, 'Version', 40, 0, 32, '', 32, 5, 0, 1),
(6, 1, 'Media Type', 60, 0, 32, '', 32, 5, 0, 1),
(17, 1, 'Documentation', 45, 0, 32, NULL, 32, 5, 0, 1),
(16, 1, 'Irons', 800, 3, 32, '', 32, 5, 0, 1),
(7, 1, 'Logo Back', 310, 4, 32, '', 32, 5, 0, 1),
(8, 1, 'Logo Front', 300, 4, 32, 'You may upload your own image file(s)', 32, 5, 0, 1),
(9, 1, 'Line 2', 410, 1, 64, '', 40, 5, 0, 1),
(10, 1, 'Line 1', 400, 1, 64, 'Enter your text up to 64 characters, punctuation and spaces', 40, 5, 0, 1),
(11, 1, 'Line 3', 420, 1, 64, '', 40, 5, 0, 1),
(12, 1, 'Line 4', 430, 1, 64, '', 40, 5, 0, 1),
(13, 1, 'Gift Options', 70, 3, 32, 'Special Option Options Available:', 32, 5, 0, 1),
(14, 1, 'Amount', 200, 2, 32, '', 32, 5, 0, 1),
(15, 1, 'Features', 700, 5, 32, '&nbsp;', 32, 5, 0, 1),
(18, 1, 'Length', 70, 0, 32, '', 32, 5, 0, 1),
(19, 1, 'Shipping', 600, 5, 32, '', 32, 0, 0, 1),
(1, 2, 'Color', 10, 2, 32, '', 32, 5, 0, 1),
(2, 2, 'Size', 20, 0, 32, '', 32, 5, 0, 1),
(3, 2, 'Model', 30, 0, 32, '', 32, 5, 0, 1),
(4, 2, 'Memory', 50, 0, 32, '', 32, 5, 0, 1),
(5, 2, 'Version', 40, 0, 32, '', 32, 5, 0, 1),
(6, 2, 'Media Type', 60, 0, 32, '', 32, 5, 0, 1),
(17, 2, 'Documentation', 45, 0, 32, '', 32, 5, 0, 1),
(16, 2, 'Irons', 800, 3, 32, '', 32, 5, 0, 1),
(7, 2, 'Logo Back', 310, 4, 32, '', 32, 5, 0, 1),
(8, 2, 'Logo Front', 300, 4, 32, 'You may upload your own image file(s)', 32, 5, 0, 1),
(9, 2, 'Line 2', 410, 1, 64, '', 40, 5, 0, 1),
(10, 2, 'Line 1', 400, 1, 64, 'Enter your text up to 64 characters, punctuation and spaces', 40, 5, 0, 1),
(11, 2, 'Line 3', 420, 1, 64, '', 40, 5, 0, 1),
(12, 2, 'Line 4', 430, 1, 64, '', 40, 5, 0, 1),
(13, 2, 'Gift Options', 70, 3, 32, 'Special Option Options Available:', 32, 5, 0, 1),
(14, 2, 'Amount', 200, 2, 32, '', 32, 5, 0, 1),
(15, 2, 'Features', 700, 5, 32, '&nbsp;', 32, 5, 0, 1),
(18, 2, 'Length', 70, 0, 32, '', 32, 5, 0, 1),
(19, 2, 'Shipping', 600, 5, 32, '', 32, 0, 0, 1),
(1, 3, 'Color', 10, 2, 32, '', 32, 5, 0, 1),
(2, 3, 'Size', 20, 0, 32, '', 32, 5, 0, 1),
(3, 3, 'Model', 30, 0, 32, '', 32, 5, 0, 1),
(4, 3, 'Memory', 50, 0, 32, '', 32, 5, 0, 1),
(5, 3, 'Version', 40, 0, 32, '', 32, 5, 0, 1),
(6, 3, 'Media Type', 60, 0, 32, '', 32, 5, 0, 1),
(17, 3, 'Documentation', 45, 0, 32, '', 32, 5, 0, 1),
(16, 3, 'Irons', 800, 3, 32, '', 32, 5, 0, 1),
(7, 3, 'Logo Back', 310, 4, 32, '', 32, 5, 0, 1),
(8, 3, 'Logo Front', 300, 4, 32, 'You may upload your own image file(s)', 32, 5, 0, 1),
(9, 3, 'Line 2', 410, 1, 64, '', 40, 5, 0, 1),
(10, 3, 'Line 1', 400, 1, 64, 'Enter your text up to 64 characters, punctuation and spaces', 40, 5, 0, 1),
(11, 3, 'Line 3', 420, 1, 64, '', 40, 5, 0, 1),
(12, 3, 'Line 4', 430, 1, 64, '', 40, 5, 0, 1),
(13, 3, 'Gift Options', 70, 3, 32, 'Special Option Options Available:', 32, 5, 0, 1),
(14, 3, 'Amount', 200, 2, 32, '', 32, 5, 0, 1),
(15, 3, 'Features', 700, 5, 32, '&nbsp;', 32, 5, 0, 1),
(18, 3, 'Length', 70, 0, 32, '', 32, 5, 0, 1),
(19, 3, 'Shipping', 600, 5, 32, '', 32, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products_options_types`
--

CREATE TABLE IF NOT EXISTS `products_options_types` (
  `products_options_types_id` int(11) NOT NULL DEFAULT '0',
  `products_options_types_name` varchar(32) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Track products_options_types';

--
-- Dumping data for table `products_options_types`
--

INSERT INTO `products_options_types` (`products_options_types_id`, `products_options_types_name`) VALUES
(0, 'Dropdown'),
(1, 'Text'),
(2, 'Radio'),
(3, 'Checkbox'),
(4, 'File'),
(5, 'Read Only');

-- --------------------------------------------------------

--
-- Table structure for table `products_options_values`
--

CREATE TABLE IF NOT EXISTS `products_options_values` (
  `products_options_values_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `products_options_values_name` varchar(64) NOT NULL DEFAULT '',
  `products_options_values_sort_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products_options_values`
--

INSERT INTO `products_options_values` (`products_options_values_id`, `language_id`, `products_options_values_name`, `products_options_values_sort_order`) VALUES
(0, 1, 'TEXT', 0),
(1, 1, '4 mb', 10),
(2, 1, '8 mb', 20),
(3, 1, '16 mb', 30),
(4, 1, '32 mb', 40),
(5, 1, 'Value', 10),
(6, 1, 'Premium', 20),
(7, 1, 'Deluxe', 30),
(8, 1, 'PS/2', 20),
(9, 1, 'USB', 10),
(10, 1, 'Download: Windows - English', 10),
(13, 1, 'Box: Windows - English', 1000),
(14, 1, 'DVD/VHS Combo Pak', 30),
(15, 1, 'Blue', 50),
(16, 1, 'Red', 10),
(17, 1, 'Yellow', 30),
(18, 1, 'Medium', 30),
(63, 1, 'MS Word - English', 20),
(19, 1, 'X-Small', 10),
(62, 1, 'PDF - English', 10),
(61, 1, '2 Iron', 20),
(20, 1, 'Large', 40),
(60, 1, '8 Iron', 80),
(59, 1, '7 Iron', 70),
(21, 1, 'Small', 20),
(58, 1, 'Wedge', 200),
(57, 1, '9 Iron', 90),
(22, 1, 'VHS', 20),
(23, 1, 'DVD', 10),
(56, 1, '6 Iron', 60),
(55, 1, '5 Iron', 50),
(24, 1, '20th Century', 10),
(54, 1, '4 Iron', 40),
(53, 1, '3 Iron', 30),
(25, 1, 'Orange', 20),
(26, 1, 'Green', 40),
(27, 1, 'Purple', 60),
(28, 1, 'Brown', 70),
(29, 1, 'Black', 80),
(30, 1, 'White', 90),
(31, 1, 'Silver', 100),
(32, 1, 'Gold', 110),
(64, 1, 'Download: MAC - English', 100),
(34, 1, 'Wrapping', 40),
(35, 1, 'Autographed Memorabilia Card', 30),
(36, 1, 'Collector''s Tin', 20),
(37, 1, 'Select from below ...', 5),
(38, 1, '$5.00', 5),
(39, 1, '$10.00', 10),
(40, 1, '$25.00', 25),
(41, 1, '$15.00', 15),
(42, 1, '$50.00', 50),
(43, 1, '$100.00', 100),
(44, 1, 'Select from below ...', 5),
(45, 1, 'NONE', 5),
(46, 1, 'None', 5),
(47, 1, 'Embossed Collector''s Tin', 10),
(49, 1, 'Custom Handling', 20),
(48, 1, 'None', 5),
(50, 1, 'Same Day Shipping', 30),
(51, 1, 'Quality Design', 10),
(52, 1, 'Download: Windows - Spanish', 20),
(65, 1, 'per Foot', 10),
(66, 1, 'per Yard', 20),
(67, 1, 'Free Shipping Included!', 10),
(68, 1, 'Book Hard Cover', 5),
(0, 2, 'TEXT', 0),
(1, 2, '4 mb', 10),
(2, 2, '8 mb', 20),
(3, 2, '16 mb', 30),
(4, 2, '32 mb', 40),
(5, 2, 'Value', 10),
(6, 2, 'Premium', 20),
(7, 2, 'Deluxe', 30),
(8, 2, 'PS/2', 20),
(9, 2, 'USB', 10),
(10, 2, 'Download: Windows - English', 10),
(13, 2, 'Box: Windows - English', 1000),
(14, 2, 'DVD/VHS Combo Pak', 30),
(15, 2, 'Blue', 50),
(16, 2, 'Red', 10),
(17, 2, 'Yellow', 30),
(18, 2, 'Medium', 30),
(63, 2, 'MS Word - English', 20),
(19, 2, 'X-Small', 10),
(62, 2, 'PDF - English', 10),
(61, 2, '2 Iron', 20),
(20, 2, 'Large', 40),
(60, 2, '8 Iron', 80),
(59, 2, '7 Iron', 70),
(21, 2, 'Small', 20),
(58, 2, 'Wedge', 200),
(57, 2, '9 Iron', 90),
(22, 2, 'VHS', 20),
(23, 2, 'DVD', 10),
(56, 2, '6 Iron', 60),
(55, 2, '5 Iron', 50),
(24, 2, '20th Century', 10),
(54, 2, '4 Iron', 40),
(53, 2, '3 Iron', 30),
(25, 2, 'Orange', 20),
(26, 2, 'Green', 40),
(27, 2, 'Purple', 60),
(28, 2, 'Brown', 70),
(29, 2, 'Black', 80),
(30, 2, 'White', 90),
(31, 2, 'Silver', 100),
(32, 2, 'Gold', 110),
(64, 2, 'Download: MAC - English', 100),
(34, 2, 'Wrapping', 40),
(35, 2, 'Autographed Memorabilia Card', 30),
(36, 2, 'Collector''s Tin', 20),
(37, 2, 'Select from below ...', 5),
(38, 2, '$5.00', 5),
(39, 2, '$10.00', 10),
(40, 2, '$25.00', 25),
(41, 2, '$15.00', 15),
(42, 2, '$50.00', 50),
(43, 2, '$100.00', 100),
(44, 2, 'Select from below ...', 5),
(45, 2, 'NONE', 5),
(46, 2, 'None', 5),
(47, 2, 'Embossed Collector''s Tin', 10),
(49, 2, 'Custom Handling', 20),
(48, 2, 'None', 5),
(50, 2, 'Same Day Shipping', 30),
(51, 2, 'Quality Design', 10),
(52, 2, 'Download: Windows - Spanish', 20),
(65, 2, 'per Foot', 10),
(66, 2, 'per Yard', 20),
(67, 2, 'Free Shipping Included!', 10),
(68, 2, 'Book Hard Cover', 5),
(0, 3, 'TEXT', 0),
(1, 3, '4 mb', 10),
(2, 3, '8 mb', 20),
(3, 3, '16 mb', 30),
(4, 3, '32 mb', 40),
(5, 3, 'Value', 10),
(6, 3, 'Premium', 20),
(7, 3, 'Deluxe', 30),
(8, 3, 'PS/2', 20),
(9, 3, 'USB', 10),
(10, 3, 'Download: Windows - English', 10),
(13, 3, 'Box: Windows - English', 1000),
(14, 3, 'DVD/VHS Combo Pak', 30),
(15, 3, 'Blue', 50),
(16, 3, 'Red', 10),
(17, 3, 'Yellow', 30),
(18, 3, 'Medium', 30),
(63, 3, 'MS Word - English', 20),
(19, 3, 'X-Small', 10),
(62, 3, 'PDF - English', 10),
(61, 3, '2 Iron', 20),
(20, 3, 'Large', 40),
(60, 3, '8 Iron', 80),
(59, 3, '7 Iron', 70),
(21, 3, 'Small', 20),
(58, 3, 'Wedge', 200),
(57, 3, '9 Iron', 90),
(22, 3, 'VHS', 20),
(23, 3, 'DVD', 10),
(56, 3, '6 Iron', 60),
(55, 3, '5 Iron', 50),
(24, 3, '20th Century', 10),
(54, 3, '4 Iron', 40),
(53, 3, '3 Iron', 30),
(25, 3, 'Orange', 20),
(26, 3, 'Green', 40),
(27, 3, 'Purple', 60),
(28, 3, 'Brown', 70),
(29, 3, 'Black', 80),
(30, 3, 'White', 90),
(31, 3, 'Silver', 100),
(32, 3, 'Gold', 110),
(64, 3, 'Download: MAC - English', 100),
(34, 3, 'Wrapping', 40),
(35, 3, 'Autographed Memorabilia Card', 30),
(36, 3, 'Collector''s Tin', 20),
(37, 3, 'Select from below ...', 5),
(38, 3, '$5.00', 5),
(39, 3, '$10.00', 10),
(40, 3, '$25.00', 25),
(41, 3, '$15.00', 15),
(42, 3, '$50.00', 50),
(43, 3, '$100.00', 100),
(44, 3, 'Select from below ...', 5),
(45, 3, 'NONE', 5),
(46, 3, 'None', 5),
(47, 3, 'Embossed Collector''s Tin', 10),
(49, 3, 'Custom Handling', 20),
(48, 3, 'None', 5),
(50, 3, 'Same Day Shipping', 30),
(51, 3, 'Quality Design', 10),
(52, 3, 'Download: Windows - Spanish', 20),
(65, 3, 'per Foot', 10),
(66, 3, 'per Yard', 20),
(67, 3, 'Free Shipping Included!', 10),
(68, 3, 'Book Hard Cover', 5);

-- --------------------------------------------------------

--
-- Table structure for table `products_options_values_to_products_options`
--

CREATE TABLE IF NOT EXISTS `products_options_values_to_products_options` (
  `products_options_values_to_products_options_id` int(11) NOT NULL,
  `products_options_id` int(11) NOT NULL DEFAULT '0',
  `products_options_values_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products_options_values_to_products_options`
--

INSERT INTO `products_options_values_to_products_options` (`products_options_values_to_products_options_id`, `products_options_id`, `products_options_values_id`) VALUES
(1, 4, 1),
(2, 4, 2),
(3, 4, 3),
(4, 4, 4),
(5, 3, 5),
(6, 3, 6),
(7, 3, 7),
(8, 3, 8),
(9, 3, 9),
(10, 5, 10),
(13, 5, 13),
(14, 6, 14),
(15, 1, 15),
(16, 1, 16),
(17, 1, 17),
(18, 2, 18),
(19, 2, 19),
(20, 2, 20),
(21, 2, 21),
(22, 6, 22),
(23, 6, 23),
(24, 5, 24),
(61, 8, 0),
(60, 7, 0),
(59, 12, 0),
(58, 11, 0),
(57, 10, 0),
(56, 9, 0),
(35, 1, 25),
(36, 1, 26),
(37, 1, 27),
(38, 1, 28),
(39, 1, 29),
(40, 1, 30),
(41, 1, 31),
(42, 1, 32),
(89, 5, 64),
(55, 13, 36),
(54, 13, 35),
(53, 13, 34),
(62, 2, 37),
(63, 14, 38),
(64, 14, 39),
(65, 14, 40),
(66, 14, 41),
(67, 14, 42),
(68, 14, 43),
(69, 13, 44),
(70, 1, 45),
(71, 4, 46),
(72, 13, 47),
(73, 13, 48),
(74, 15, 49),
(75, 15, 50),
(76, 15, 51),
(77, 5, 52),
(78, 16, 53),
(79, 16, 54),
(80, 16, 55),
(81, 16, 56),
(82, 16, 57),
(83, 16, 58),
(84, 16, 59),
(85, 16, 60),
(86, 16, 61),
(87, 17, 62),
(88, 17, 63),
(90, 18, 65),
(91, 18, 66),
(92, 19, 67),
(93, 5, 68);

-- --------------------------------------------------------

--
-- Table structure for table `products_to_categories`
--

CREATE TABLE IF NOT EXISTS `products_to_categories` (
  `products_id` int(11) NOT NULL DEFAULT '0',
  `categories_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products_to_categories`
--

INSERT INTO `products_to_categories` (`products_id`, `categories_id`) VALUES
(1, 6),
(1, 7),
(1, 31),
(1, 32),
(1, 41),
(1, 42),
(1, 46),
(2, 6),
(2, 7),
(2, 31),
(2, 32),
(2, 41),
(2, 42),
(2, 46),
(3, 6),
(3, 7),
(3, 31),
(3, 32),
(3, 41),
(3, 42),
(3, 46),
(4, 6),
(4, 7),
(4, 31),
(4, 32),
(4, 41),
(4, 42),
(4, 46),
(5, 7),
(5, 8),
(5, 33),
(5, 37),
(5, 42),
(5, 43),
(6, 7),
(6, 8),
(6, 33),
(6, 37),
(6, 42),
(6, 43),
(7, 7),
(7, 8),
(7, 33),
(7, 37),
(7, 42),
(7, 43),
(8, 7),
(8, 8),
(8, 33),
(8, 37),
(8, 42),
(8, 43),
(9, 8),
(9, 9),
(9, 34),
(9, 38),
(9, 43),
(9, 44),
(10, 8),
(10, 9),
(10, 34),
(10, 38),
(10, 43),
(10, 44),
(11, 8),
(11, 9),
(11, 34),
(11, 38),
(11, 43),
(11, 44),
(12, 8),
(12, 9),
(12, 34),
(12, 38),
(12, 43),
(12, 44),
(13, 9),
(13, 10),
(13, 36),
(13, 39),
(13, 44),
(13, 45),
(14, 9),
(14, 10),
(14, 36),
(14, 39),
(14, 44),
(14, 45),
(15, 9),
(15, 10),
(15, 36),
(15, 39),
(15, 44),
(15, 45),
(16, 9),
(16, 10),
(16, 36),
(16, 39),
(16, 44),
(16, 45),
(17, 10),
(17, 35),
(17, 40),
(17, 45),
(18, 10),
(18, 35),
(18, 40),
(18, 45),
(19, 10),
(19, 35),
(19, 40),
(19, 45),
(20, 10),
(20, 35),
(20, 40),
(20, 45),
(21, 31),
(22, 31),
(23, 31);

-- --------------------------------------------------------

--
-- Table structure for table `product_music_extra`
--

CREATE TABLE IF NOT EXISTS `product_music_extra` (
  `products_id` int(11) NOT NULL DEFAULT '0',
  `artists_id` int(11) NOT NULL DEFAULT '0',
  `record_company_id` int(11) NOT NULL DEFAULT '0',
  `music_genre_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_types`
--

CREATE TABLE IF NOT EXISTS `product_types` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(255) NOT NULL DEFAULT '',
  `type_handler` varchar(255) NOT NULL DEFAULT '',
  `type_master_type` int(11) NOT NULL DEFAULT '1',
  `allow_add_to_cart` char(1) NOT NULL DEFAULT 'Y',
  `default_image` varchar(255) NOT NULL DEFAULT '',
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `last_modified` datetime NOT NULL DEFAULT '0001-01-01 00:00:00'
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_types`
--

INSERT INTO `product_types` (`type_id`, `type_name`, `type_handler`, `type_master_type`, `allow_add_to_cart`, `default_image`, `date_added`, `last_modified`) VALUES
(1, 'Product - General', 'product', 1, 'Y', '', '2015-02-11 12:28:29', '2015-02-11 12:28:29'),
(2, 'Product - Music', 'product_music', 1, 'Y', '', '2015-02-11 12:28:29', '2015-02-11 12:28:29'),
(3, 'Document - General', 'document_general', 3, 'N', '', '2015-02-11 12:28:29', '2015-02-11 12:28:29'),
(4, 'Document - Product', 'document_product', 3, 'Y', '', '2015-02-11 12:28:29', '2015-02-11 12:28:29'),
(5, 'Product - Free Shipping', 'product_free_shipping', 1, 'Y', '', '2015-02-11 12:28:29', '2015-02-11 12:28:29');

-- --------------------------------------------------------

--
-- Table structure for table `product_types_to_category`
--

CREATE TABLE IF NOT EXISTS `product_types_to_category` (
  `product_type_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_type_layout`
--

CREATE TABLE IF NOT EXISTS `product_type_layout` (
  `configuration_id` int(11) NOT NULL,
  `configuration_title` text NOT NULL,
  `configuration_key` varchar(255) NOT NULL DEFAULT '',
  `configuration_value` text NOT NULL,
  `configuration_description` text NOT NULL,
  `product_type_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(5) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `use_function` text,
  `set_function` text
) ENGINE=MyISAM AUTO_INCREMENT=140 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_type_layout`
--

INSERT INTO `product_type_layout` (`configuration_id`, `configuration_title`, `configuration_key`, `configuration_value`, `configuration_description`, `product_type_id`, `sort_order`, `last_modified`, `date_added`, `use_function`, `set_function`) VALUES
(1, 'Show Model Number', 'SHOW_PRODUCT_INFO_MODEL', '1', 'Display Model Number on Product Info 0= off 1= on', 1, 1, NULL, '2015-04-07 09:41:26', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(2, 'Show Weight', 'SHOW_PRODUCT_INFO_WEIGHT', '1', 'Display Weight on Product Info 0= off 1= on', 1, 2, NULL, '2015-04-07 09:41:26', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(3, 'Show Attribute Weight', 'SHOW_PRODUCT_INFO_WEIGHT_ATTRIBUTES', '1', 'Display Attribute Weight on Product Info 0= off 1= on', 1, 3, NULL, '2015-04-07 09:41:26', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(4, 'Show Manufacturer', 'SHOW_PRODUCT_INFO_MANUFACTURER', '1', 'Display Manufacturer Name on Product Info 0= off 1= on', 1, 4, NULL, '2015-04-07 09:41:26', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(5, 'Show Quantity in Shopping Cart', 'SHOW_PRODUCT_INFO_IN_CART_QTY', '1', 'Display Quantity in Current Shopping Cart on Product Info 0= off 1= on', 1, 5, NULL, '2015-04-07 09:41:26', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(6, 'Show Quantity in Stock', 'SHOW_PRODUCT_INFO_QUANTITY', '1', 'Display Quantity in Stock on Product Info 0= off 1= on', 1, 6, NULL, '2015-04-07 09:41:26', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(7, 'Show Product Reviews Count', 'SHOW_PRODUCT_INFO_REVIEWS_COUNT', '1', 'Display Product Reviews Count on Product Info 0= off 1= on', 1, 7, NULL, '2015-04-07 09:41:26', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(8, 'Show Product Reviews Button', 'SHOW_PRODUCT_INFO_REVIEWS', '1', 'Display Product Reviews Button on Product Info 0= off 1= on', 1, 8, NULL, '2015-04-07 09:41:26', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(9, 'Show Date Available', 'SHOW_PRODUCT_INFO_DATE_AVAILABLE', '1', 'Display Date Available on Product Info 0= off 1= on', 1, 9, NULL, '2015-04-07 09:41:26', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(10, 'Show Date Added', 'SHOW_PRODUCT_INFO_DATE_ADDED', '1', 'Display Date Added on Product Info 0= off 1= on', 1, 10, NULL, '2015-04-07 09:41:26', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(11, 'Show Product URL', 'SHOW_PRODUCT_INFO_URL', '1', 'Display URL on Product Info 0= off 1= on', 1, 11, NULL, '2015-04-07 09:41:26', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(12, 'Show Product Additional Images', 'SHOW_PRODUCT_INFO_ADDITIONAL_IMAGES', '1', 'Display Additional Images on Product Info 0= off 1= on', 1, 13, NULL, '2015-04-07 09:41:26', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(13, 'Show Starting At text on Price', 'SHOW_PRODUCT_INFO_STARTING_AT', '1', 'Display Starting At text on products with attributes Product Info 0= off 1= on', 1, 12, NULL, '2015-04-07 09:41:26', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(14, 'Product Free Shipping Image Status - Catalog', 'SHOW_PRODUCT_INFO_ALWAYS_FREE_SHIPPING_IMAGE_SWITCH', '0', 'Show the Free Shipping image/text in the catalog?', 1, 16, NULL, '2015-04-07 09:41:26', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(15, 'Product Price Tax Class Default - When adding new products?', 'DEFAULT_PRODUCT_TAX_CLASS_ID', '0', 'What should the Product Price Tax Class Default ID be when adding new products?', 1, 100, NULL, '2015-04-07 09:41:26', '', ''),
(16, 'Product Virtual Default Status - Skip Shipping Address - When adding new products?', 'DEFAULT_PRODUCT_PRODUCTS_VIRTUAL', '0', 'Default Virtual Product status to be ON when adding new products?', 1, 101, NULL, '2015-04-07 09:41:26', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(17, 'Product Free Shipping Default Status - Normal Shipping Rules - When adding new products?', 'DEFAULT_PRODUCT_PRODUCTS_IS_ALWAYS_FREE_SHIPPING', '0', 'What should the Default Free Shipping status be when adding new products?<br />Yes, Always Free Shipping ON<br />No, Always Free Shipping OFF<br />Special, Product/Download Requires Shipping', 1, 102, NULL, '2015-04-07 09:41:26', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes, Always ON''), array(''id''=>''0'', ''text''=>''No, Always OFF''), array(''id''=>''2'', ''text''=>''Special'')), '),
(18, 'Show Model Number', 'SHOW_PRODUCT_MUSIC_INFO_MODEL', '1', 'Display Model Number on Product Info 0= off 1= on', 2, 1, NULL, '2015-04-07 09:41:26', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(19, 'Show Weight', 'SHOW_PRODUCT_MUSIC_INFO_WEIGHT', '0', 'Display Weight on Product Info 0= off 1= on', 2, 2, NULL, '2015-04-07 09:41:26', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(20, 'Show Attribute Weight', 'SHOW_PRODUCT_MUSIC_INFO_WEIGHT_ATTRIBUTES', '1', 'Display Attribute Weight on Product Info 0= off 1= on', 2, 3, NULL, '2015-04-07 09:41:26', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(21, 'Show Artist', 'SHOW_PRODUCT_MUSIC_INFO_ARTIST', '1', 'Display Artists Name on Product Info 0= off 1= on', 2, 4, NULL, '2015-04-07 09:41:26', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(22, 'Show Music Genre', 'SHOW_PRODUCT_MUSIC_INFO_GENRE', '1', 'Display Music Genre on Product Info 0= off 1= on', 2, 4, NULL, '2015-04-07 09:41:26', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(23, 'Show Record Company', 'SHOW_PRODUCT_MUSIC_INFO_RECORD_COMPANY', '1', 'Display Record Company on Product Info 0= off 1= on', 2, 4, NULL, '2015-04-07 09:41:26', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(24, 'Show Quantity in Shopping Cart', 'SHOW_PRODUCT_MUSIC_INFO_IN_CART_QTY', '1', 'Display Quantity in Current Shopping Cart on Product Info 0= off 1= on', 2, 5, NULL, '2015-04-07 09:41:26', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(25, 'Show Quantity in Stock', 'SHOW_PRODUCT_MUSIC_INFO_QUANTITY', '0', 'Display Quantity in Stock on Product Info 0= off 1= on', 2, 6, NULL, '2015-04-07 09:41:26', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(26, 'Show Product Reviews Count', 'SHOW_PRODUCT_MUSIC_INFO_REVIEWS_COUNT', '1', 'Display Product Reviews Count on Product Info 0= off 1= on', 2, 7, NULL, '2015-04-07 09:41:26', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(27, 'Show Product Reviews Button', 'SHOW_PRODUCT_MUSIC_INFO_REVIEWS', '1', 'Display Product Reviews Button on Product Info 0= off 1= on', 2, 8, NULL, '2015-04-07 09:41:26', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(28, 'Show Date Available', 'SHOW_PRODUCT_MUSIC_INFO_DATE_AVAILABLE', '1', 'Display Date Available on Product Info 0= off 1= on', 2, 9, NULL, '2015-04-07 09:41:26', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(29, 'Show Date Added', 'SHOW_PRODUCT_MUSIC_INFO_DATE_ADDED', '1', 'Display Date Added on Product Info 0= off 1= on', 2, 10, NULL, '2015-04-07 09:41:26', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(30, 'Show Starting At text on Price', 'SHOW_PRODUCT_MUSIC_INFO_STARTING_AT', '1', 'Display Starting At text on products with attributes Product Info 0= off 1= on', 2, 12, NULL, '2015-04-07 09:41:26', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(31, 'Show Product Additional Images', 'SHOW_PRODUCT_MUSIC_INFO_ADDITIONAL_IMAGES', '1', 'Display Additional Images on Product Info 0= off 1= on', 2, 13, NULL, '2015-04-07 09:41:26', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(32, 'Product Free Shipping Image Status - Catalog', 'SHOW_PRODUCT_MUSIC_INFO_ALWAYS_FREE_SHIPPING_IMAGE_SWITCH', '0', 'Show the Free Shipping image/text in the catalog?', 2, 16, NULL, '2015-04-07 09:41:26', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(33, 'Product Price Tax Class Default - When adding new products?', 'DEFAULT_PRODUCT_MUSIC_TAX_CLASS_ID', '0', 'What should the Product Price Tax Class Default ID be when adding new products?', 2, 100, NULL, '2015-04-07 09:41:26', '', ''),
(34, 'Product Virtual Default Status - Skip Shipping Address - When adding new products?', 'DEFAULT_PRODUCT_MUSIC_PRODUCTS_VIRTUAL', '0', 'Default Virtual Product status to be ON when adding new products?', 2, 101, NULL, '2015-04-07 09:41:26', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(35, 'Product Free Shipping Default Status - Normal Shipping Rules - When adding new products?', 'DEFAULT_PRODUCT_MUSIC_PRODUCTS_IS_ALWAYS_FREE_SHIPPING', '0', 'What should the Default Free Shipping status be when adding new products?<br />Yes, Always Free Shipping ON<br />No, Always Free Shipping OFF<br />Special, Product/Download Requires Shipping', 2, 102, NULL, '2015-04-07 09:41:26', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes, Always ON''), array(''id''=>''0'', ''text''=>''No, Always OFF''), array(''id''=>''2'', ''text''=>''Special'')), '),
(36, 'Show Product Reviews Count', 'SHOW_DOCUMENT_GENERAL_INFO_REVIEWS_COUNT', '1', 'Display Product Reviews Count on Product Info 0= off 1= on', 3, 7, NULL, '2015-04-07 09:41:26', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(37, 'Show Product Reviews Button', 'SHOW_DOCUMENT_GENERAL_INFO_REVIEWS', '1', 'Display Product Reviews Button on Product Info 0= off 1= on', 3, 8, NULL, '2015-04-07 09:41:26', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(38, 'Show Date Available', 'SHOW_DOCUMENT_GENERAL_INFO_DATE_AVAILABLE', '1', 'Display Date Available on Product Info 0= off 1= on', 3, 9, NULL, '2015-04-07 09:41:26', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(39, 'Show Date Added', 'SHOW_DOCUMENT_GENERAL_INFO_DATE_ADDED', '1', 'Display Date Added on Product Info 0= off 1= on', 3, 10, NULL, '2015-04-07 09:41:26', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(40, 'Show Product URL', 'SHOW_DOCUMENT_GENERAL_INFO_URL', '1', 'Display URL on Product Info 0= off 1= on', 3, 11, NULL, '2015-04-07 09:41:26', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(41, 'Show Product Additional Images', 'SHOW_DOCUMENT_GENERAL_INFO_ADDITIONAL_IMAGES', '1', 'Display Additional Images on Product Info 0= off 1= on', 3, 13, NULL, '2015-04-07 09:41:26', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(42, 'Show Model Number', 'SHOW_DOCUMENT_PRODUCT_INFO_MODEL', '1', 'Display Model Number on Product Info 0= off 1= on', 4, 1, NULL, '2015-04-07 09:41:26', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(43, 'Show Weight', 'SHOW_DOCUMENT_PRODUCT_INFO_WEIGHT', '0', 'Display Weight on Product Info 0= off 1= on', 4, 2, NULL, '2015-04-07 09:41:26', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(44, 'Show Attribute Weight', 'SHOW_DOCUMENT_PRODUCT_INFO_WEIGHT_ATTRIBUTES', '1', 'Display Attribute Weight on Product Info 0= off 1= on', 4, 3, NULL, '2015-04-07 09:41:26', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(45, 'Show Manufacturer', 'SHOW_DOCUMENT_PRODUCT_INFO_MANUFACTURER', '1', 'Display Manufacturer Name on Product Info 0= off 1= on', 4, 4, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(46, 'Show Quantity in Shopping Cart', 'SHOW_DOCUMENT_PRODUCT_INFO_IN_CART_QTY', '1', 'Display Quantity in Current Shopping Cart on Product Info 0= off 1= on', 4, 5, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(47, 'Show Quantity in Stock', 'SHOW_DOCUMENT_PRODUCT_INFO_QUANTITY', '0', 'Display Quantity in Stock on Product Info 0= off 1= on', 4, 6, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(48, 'Show Product Reviews Count', 'SHOW_DOCUMENT_PRODUCT_INFO_REVIEWS_COUNT', '1', 'Display Product Reviews Count on Product Info 0= off 1= on', 4, 7, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(49, 'Show Product Reviews Button', 'SHOW_DOCUMENT_PRODUCT_INFO_REVIEWS', '1', 'Display Product Reviews Button on Product Info 0= off 1= on', 4, 8, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(50, 'Show Date Available', 'SHOW_DOCUMENT_PRODUCT_INFO_DATE_AVAILABLE', '1', 'Display Date Available on Product Info 0= off 1= on', 4, 9, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(51, 'Show Date Added', 'SHOW_DOCUMENT_PRODUCT_INFO_DATE_ADDED', '1', 'Display Date Added on Product Info 0= off 1= on', 4, 10, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(52, 'Show Product URL', 'SHOW_DOCUMENT_PRODUCT_INFO_URL', '1', 'Display URL on Product Info 0= off 1= on', 4, 11, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(53, 'Show Product Additional Images', 'SHOW_DOCUMENT_PRODUCT_INFO_ADDITIONAL_IMAGES', '1', 'Display Additional Images on Product Info 0= off 1= on', 4, 13, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(54, 'Show Starting At text on Price', 'SHOW_DOCUMENT_PRODUCT_INFO_STARTING_AT', '1', 'Display Starting At text on products with attributes Product Info 0= off 1= on', 4, 12, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(55, 'Product Free Shipping Image Status - Catalog', 'SHOW_DOCUMENT_PRODUCT_INFO_ALWAYS_FREE_SHIPPING_IMAGE_SWITCH', '0', 'Show the Free Shipping image/text in the catalog?', 4, 16, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(56, 'Product Price Tax Class Default - When adding new products?', 'DEFAULT_DOCUMENT_PRODUCT_TAX_CLASS_ID', '0', 'What should the Product Price Tax Class Default ID be when adding new products?', 4, 100, NULL, '2015-04-07 09:41:27', '', ''),
(57, 'Product Virtual Default Status - Skip Shipping Address - When adding new products?', 'DEFAULT_DOCUMENT_PRODUCT_PRODUCTS_VIRTUAL', '0', 'Default Virtual Product status to be ON when adding new products?', 4, 101, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(58, 'Product Free Shipping Default Status - Normal Shipping Rules - When adding new products?', 'DEFAULT_DOCUMENT_PRODUCT_PRODUCTS_IS_ALWAYS_FREE_SHIPPING', '0', 'What should the Default Free Shipping status be when adding new products?<br />Yes, Always Free Shipping ON<br />No, Always Free Shipping OFF<br />Special, Product/Download Requires Shipping', 4, 102, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes, Always ON''), array(''id''=>''0'', ''text''=>''No, Always OFF''), array(''id''=>''2'', ''text''=>''Special'')), '),
(59, 'Show Model Number', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_MODEL', '1', 'Display Model Number on Product Info 0= off 1= on', 5, 1, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(60, 'Show Weight', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_WEIGHT', '0', 'Display Weight on Product Info 0= off 1= on', 5, 2, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(61, 'Show Attribute Weight', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_WEIGHT_ATTRIBUTES', '1', 'Display Attribute Weight on Product Info 0= off 1= on', 5, 3, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(62, 'Show Manufacturer', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_MANUFACTURER', '1', 'Display Manufacturer Name on Product Info 0= off 1= on', 5, 4, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(63, 'Show Quantity in Shopping Cart', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_IN_CART_QTY', '1', 'Display Quantity in Current Shopping Cart on Product Info 0= off 1= on', 5, 5, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(64, 'Show Quantity in Stock', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_QUANTITY', '1', 'Display Quantity in Stock on Product Info 0= off 1= on', 5, 6, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(65, 'Show Product Reviews Count', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_REVIEWS_COUNT', '1', 'Display Product Reviews Count on Product Info 0= off 1= on', 5, 7, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(66, 'Show Product Reviews Button', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_REVIEWS', '1', 'Display Product Reviews Button on Product Info 0= off 1= on', 5, 8, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(67, 'Show Date Available', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_DATE_AVAILABLE', '0', 'Display Date Available on Product Info 0= off 1= on', 5, 9, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(68, 'Show Date Added', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_DATE_ADDED', '1', 'Display Date Added on Product Info 0= off 1= on', 5, 10, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(69, 'Show Product URL', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_URL', '1', 'Display URL on Product Info 0= off 1= on', 5, 11, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(70, 'Show Product Additional Images', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_ADDITIONAL_IMAGES', '1', 'Display Additional Images on Product Info 0= off 1= on', 5, 13, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(71, 'Show Starting At text on Price', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_STARTING_AT', '1', 'Display Starting At text on products with attributes Product Info 0= off 1= on', 5, 12, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(72, 'Product Free Shipping Image Status - Catalog', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_ALWAYS_FREE_SHIPPING_IMAGE_SWITCH', '1', 'Show the Free Shipping image/text in the catalog?', 5, 16, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(73, 'Product Price Tax Class Default - When adding new products?', 'DEFAULT_PRODUCT_FREE_SHIPPING_TAX_CLASS_ID', '0', 'What should the Product Price Tax Class Default ID be when adding new products?', 5, 100, NULL, '2015-04-07 09:41:27', '', ''),
(74, 'Product Virtual Default Status - Skip Shipping Address - When adding new products?', 'DEFAULT_PRODUCT_FREE_SHIPPING_PRODUCTS_VIRTUAL', '0', 'Default Virtual Product status to be ON when adding new products?', 5, 101, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(75, 'Product Free Shipping Default Status - Normal Shipping Rules - When adding new products?', 'DEFAULT_PRODUCT_FREE_SHIPPING_PRODUCTS_IS_ALWAYS_FREE_SHIPPING', '1', 'What should the Default Free Shipping status be when adding new products?<br />Yes, Always Free Shipping ON<br />No, Always Free Shipping OFF<br />Special, Product/Download Requires Shipping', 5, 102, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes, Always ON''), array(''id''=>''0'', ''text''=>''No, Always OFF''), array(''id''=>''2'', ''text''=>''Special'')), '),
(76, 'Show Metatags Title Default - Product Title', 'SHOW_PRODUCT_INFO_METATAGS_TITLE_STATUS', '1', 'Display Product Title in Meta Tags Title 0= off 1= on', 1, 50, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(77, 'Show Metatags Title Default - Product Name', 'SHOW_PRODUCT_INFO_METATAGS_PRODUCTS_NAME_STATUS', '1', 'Display Product Name in Meta Tags Title 0= off 1= on', 1, 51, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(78, 'Show Metatags Title Default - Product Model', 'SHOW_PRODUCT_INFO_METATAGS_MODEL_STATUS', '1', 'Display Product Model in Meta Tags Title 0= off 1= on', 1, 52, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(79, 'Show Metatags Title Default - Product Price', 'SHOW_PRODUCT_INFO_METATAGS_PRICE_STATUS', '1', 'Display Product Price in Meta Tags Title 0= off 1= on', 1, 53, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(80, 'Show Metatags Title Default - Product Tagline', 'SHOW_PRODUCT_INFO_METATAGS_TITLE_TAGLINE_STATUS', '1', 'Display Product Tagline in Meta Tags Title 0= off 1= on', 1, 54, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(81, 'Show Metatags Title Default - Product Title', 'SHOW_PRODUCT_MUSIC_INFO_METATAGS_TITLE_STATUS', '1', 'Display Product Title in Meta Tags Title 0= off 1= on', 2, 50, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(82, 'Show Metatags Title Default - Product Name', 'SHOW_PRODUCT_MUSIC_INFO_METATAGS_PRODUCTS_NAME_STATUS', '1', 'Display Product Name in Meta Tags Title 0= off 1= on', 2, 51, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(83, 'Show Metatags Title Default - Product Model', 'SHOW_PRODUCT_MUSIC_INFO_METATAGS_MODEL_STATUS', '1', 'Display Product Model in Meta Tags Title 0= off 1= on', 2, 52, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(84, 'Show Metatags Title Default - Product Price', 'SHOW_PRODUCT_MUSIC_INFO_METATAGS_PRICE_STATUS', '1', 'Display Product Price in Meta Tags Title 0= off 1= on', 2, 53, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(85, 'Show Metatags Title Default - Product Tagline', 'SHOW_PRODUCT_MUSIC_INFO_METATAGS_TITLE_TAGLINE_STATUS', '1', 'Display Product Tagline in Meta Tags Title 0= off 1= on', 2, 54, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(86, 'Show Metatags Title Default - Document Title', 'SHOW_DOCUMENT_GENERAL_INFO_METATAGS_TITLE_STATUS', '1', 'Display Document Title in Meta Tags Title 0= off 1= on', 3, 50, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(87, 'Show Metatags Title Default - Document Name', 'SHOW_DOCUMENT_GENERAL_INFO_METATAGS_PRODUCTS_NAME_STATUS', '1', 'Display Document Name in Meta Tags Title 0= off 1= on', 3, 51, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(88, 'Show Metatags Title Default - Document Tagline', 'SHOW_DOCUMENT_GENERAL_INFO_METATAGS_TITLE_TAGLINE_STATUS', '1', 'Display Document Tagline in Meta Tags Title 0= off 1= on', 3, 54, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(89, 'Show Metatags Title Default - Document Title', 'SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_TITLE_STATUS', '1', 'Display Document Title in Meta Tags Title 0= off 1= on', 4, 50, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(90, 'Show Metatags Title Default - Document Name', 'SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_PRODUCTS_NAME_STATUS', '1', 'Display Document Name in Meta Tags Title 0= off 1= on', 4, 51, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(91, 'Show Metatags Title Default - Document Model', 'SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_MODEL_STATUS', '1', 'Display Document Model in Meta Tags Title 0= off 1= on', 4, 52, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(92, 'Show Metatags Title Default - Document Price', 'SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_PRICE_STATUS', '1', 'Display Document Price in Meta Tags Title 0= off 1= on', 4, 53, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(93, 'Show Metatags Title Default - Document Tagline', 'SHOW_DOCUMENT_PRODUCT_INFO_METATAGS_TITLE_TAGLINE_STATUS', '1', 'Display Document Tagline in Meta Tags Title 0= off 1= on', 4, 54, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(94, 'Show Metatags Title Default - Product Title', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_TITLE_STATUS', '1', 'Display Product Title in Meta Tags Title 0= off 1= on', 5, 50, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(95, 'Show Metatags Title Default - Product Name', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_PRODUCTS_NAME_STATUS', '1', 'Display Product Name in Meta Tags Title 0= off 1= on', 5, 51, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(96, 'Show Metatags Title Default - Product Model', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_MODEL_STATUS', '1', 'Display Product Model in Meta Tags Title 0= off 1= on', 5, 52, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(97, 'Show Metatags Title Default - Product Price', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_PRICE_STATUS', '1', 'Display Product Price in Meta Tags Title 0= off 1= on', 5, 53, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(98, 'Show Metatags Title Default - Product Tagline', 'SHOW_PRODUCT_FREE_SHIPPING_INFO_METATAGS_TITLE_TAGLINE_STATUS', '1', 'Display Product Tagline in Meta Tags Title 0= off 1= on', 5, 54, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), '),
(99, 'PRODUCT Attribute is Display Only - Default', 'DEFAULT_PRODUCT_ATTRIBUTES_DISPLAY_ONLY', '0', 'PRODUCT Attribute is Display Only<br />Used For Display Purposes Only<br />0= No 1= Yes', 1, 200, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(100, 'PRODUCT Attribute is Free - Default', 'DEFAULT_PRODUCT_ATTRIBUTE_IS_FREE', '1', 'PRODUCT Attribute is Free<br />Attribute is Free When Product is Free<br />0= No 1= Yes', 1, 201, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(101, 'PRODUCT Attribute is Default - Default', 'DEFAULT_PRODUCT_ATTRIBUTES_DEFAULT', '0', 'PRODUCT Attribute is Default<br />Default Attribute to be Marked Selected<br />0= No 1= Yes', 1, 202, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(102, 'PRODUCT Attribute is Discounted - Default', 'DEFAULT_PRODUCT_ATTRIBUTES_DISCOUNTED', '1', 'PRODUCT Attribute is Discounted<br />Apply Discounts Used by Product Special/Sale<br />0= No 1= Yes', 1, 203, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(103, 'PRODUCT Attribute is Included in Base Price - Default', 'DEFAULT_PRODUCT_ATTRIBUTES_PRICE_BASE_INCLUDED', '1', 'PRODUCT Attribute is Included in Base Price<br />Include in Base Price When Priced by Attributes<br />0= No 1= Yes', 1, 204, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(104, 'PRODUCT Attribute is Required - Default', 'DEFAULT_PRODUCT_ATTRIBUTES_REQUIRED', '0', 'PRODUCT Attribute is Required<br />Attribute Required for Text<br />0= No 1= Yes', 1, 205, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(105, 'PRODUCT Attribute Price Prefix - Default', 'DEFAULT_PRODUCT_PRICE_PREFIX', '1', 'PRODUCT Attribute Price Prefix<br />Default Attribute Price Prefix for Adding<br />Blank, + or -', 1, 206, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Blank''), array(''id''=>''1'', ''text''=>''+''), array(''id''=>''2'', ''text''=>''-'')), '),
(106, 'PRODUCT Attribute Weight Prefix - Default', 'DEFAULT_PRODUCT_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX', '1', 'PRODUCT Attribute Weight Prefix<br />Default Attribute Weight Prefix<br />Blank, + or -', 1, 207, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Blank''), array(''id''=>''1'', ''text''=>''+''), array(''id''=>''2'', ''text''=>''-'')), '),
(107, 'MUSIC Attribute is Display Only - Default', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_DISPLAY_ONLY', '0', 'MUSIC Attribute is Display Only<br />Used For Display Purposes Only<br />0= No 1= Yes', 2, 200, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(108, 'MUSIC Attribute is Free - Default', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTE_IS_FREE', '1', 'MUSIC Attribute is Free<br />Attribute is Free When Product is Free<br />0= No 1= Yes', 2, 201, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(109, 'MUSIC Attribute is Default - Default', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_DEFAULT', '0', 'MUSIC Attribute is Default<br />Default Attribute to be Marked Selected<br />0= No 1= Yes', 2, 202, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(110, 'MUSIC Attribute is Discounted - Default', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_DISCOUNTED', '1', 'MUSIC Attribute is Discounted<br />Apply Discounts Used by Product Special/Sale<br />0= No 1= Yes', 2, 203, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(111, 'MUSIC Attribute is Included in Base Price - Default', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_PRICE_BASE_INCLUDED', '1', 'MUSIC Attribute is Included in Base Price<br />Include in Base Price When Priced by Attributes<br />0= No 1= Yes', 2, 204, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(112, 'MUSIC Attribute is Required - Default', 'DEFAULT_PRODUCT_MUSIC_ATTRIBUTES_REQUIRED', '0', 'MUSIC Attribute is Required<br />Attribute Required for Text<br />0= No 1= Yes', 2, 205, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(113, 'MUSIC Attribute Price Prefix - Default', 'DEFAULT_PRODUCT_MUSIC_PRICE_PREFIX', '1', 'MUSIC Attribute Price Prefix<br />Default Attribute Price Prefix for Adding<br />Blank, + or -', 2, 206, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Blank''), array(''id''=>''1'', ''text''=>''+''), array(''id''=>''2'', ''text''=>''-'')), '),
(114, 'MUSIC Attribute Weight Prefix - Default', 'DEFAULT_PRODUCT_MUSIC_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX', '1', 'MUSIC Attribute Weight Prefix<br />Default Attribute Weight Prefix<br />Blank, + or -', 2, 207, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Blank''), array(''id''=>''1'', ''text''=>''+''), array(''id''=>''2'', ''text''=>''-'')), '),
(115, 'DOCUMENT GENERAL Attribute is Display Only - Default', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_DISPLAY_ONLY', '0', 'DOCUMENT GENERAL Attribute is Display Only<br />Used For Display Purposes Only<br />0= No 1= Yes', 3, 200, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(116, 'DOCUMENT GENERAL Attribute is Free - Default', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTE_IS_FREE', '1', 'DOCUMENT GENERAL Attribute is Free<br />Attribute is Free When Product is Free<br />0= No 1= Yes', 3, 201, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(117, 'DOCUMENT GENERAL Attribute is Default - Default', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_DEFAULT', '0', 'DOCUMENT GENERAL Attribute is Default<br />Default Attribute to be Marked Selected<br />0= No 1= Yes', 3, 202, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(118, 'DOCUMENT GENERAL Attribute is Discounted - Default', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_DISCOUNTED', '1', 'DOCUMENT GENERAL Attribute is Discounted<br />Apply Discounts Used by Product Special/Sale<br />0= No 1= Yes', 3, 203, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(119, 'DOCUMENT GENERAL Attribute is Included in Base Price - Default', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_PRICE_BASE_INCLUDED', '1', 'DOCUMENT GENERAL Attribute is Included in Base Price<br />Include in Base Price When Priced by Attributes<br />0= No 1= Yes', 3, 204, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(120, 'DOCUMENT GENERAL Attribute is Required - Default', 'DEFAULT_DOCUMENT_GENERAL_ATTRIBUTES_REQUIRED', '0', 'DOCUMENT GENERAL Attribute is Required<br />Attribute Required for Text<br />0= No 1= Yes', 3, 205, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(121, 'DOCUMENT GENERAL Attribute Price Prefix - Default', 'DEFAULT_DOCUMENT_GENERAL_PRICE_PREFIX', '1', 'DOCUMENT GENERAL Attribute Price Prefix<br />Default Attribute Price Prefix for Adding<br />Blank, + or -', 3, 206, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Blank''), array(''id''=>''1'', ''text''=>''+''), array(''id''=>''2'', ''text''=>''-'')), '),
(122, 'DOCUMENT GENERAL Attribute Weight Prefix - Default', 'DEFAULT_DOCUMENT_GENERAL_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX', '1', 'DOCUMENT GENERAL Attribute Weight Prefix<br />Default Attribute Weight Prefix<br />Blank, + or -', 3, 207, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Blank''), array(''id''=>''1'', ''text''=>''+''), array(''id''=>''2'', ''text''=>''-'')), '),
(123, 'DOCUMENT PRODUCT Attribute is Display Only - Default', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_DISPLAY_ONLY', '0', 'DOCUMENT PRODUCT Attribute is Display Only<br />Used For Display Purposes Only<br />0= No 1= Yes', 4, 200, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(124, 'DOCUMENT PRODUCT Attribute is Free - Default', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTE_IS_FREE', '1', 'DOCUMENT PRODUCT Attribute is Free<br />Attribute is Free When Product is Free<br />0= No 1= Yes', 4, 201, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(125, 'DOCUMENT PRODUCT Attribute is Default - Default', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_DEFAULT', '0', 'DOCUMENT PRODUCT Attribute is Default<br />Default Attribute to be Marked Selected<br />0= No 1= Yes', 4, 202, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(126, 'DOCUMENT PRODUCT Attribute is Discounted - Default', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_DISCOUNTED', '1', 'DOCUMENT PRODUCT Attribute is Discounted<br />Apply Discounts Used by Product Special/Sale<br />0= No 1= Yes', 4, 203, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(127, 'DOCUMENT PRODUCT Attribute is Included in Base Price - Default', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_PRICE_BASE_INCLUDED', '1', 'DOCUMENT PRODUCT Attribute is Included in Base Price<br />Include in Base Price When Priced by Attributes<br />0= No 1= Yes', 4, 204, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(128, 'DOCUMENT PRODUCT Attribute is Required - Default', 'DEFAULT_DOCUMENT_PRODUCT_ATTRIBUTES_REQUIRED', '0', 'DOCUMENT PRODUCT Attribute is Required<br />Attribute Required for Text<br />0= No 1= Yes', 4, 205, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(129, 'DOCUMENT PRODUCT Attribute Price Prefix - Default', 'DEFAULT_DOCUMENT_PRODUCT_PRICE_PREFIX', '1', 'DOCUMENT PRODUCT Attribute Price Prefix<br />Default Attribute Price Prefix for Adding<br />Blank, + or -', 4, 206, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Blank''), array(''id''=>''1'', ''text''=>''+''), array(''id''=>''2'', ''text''=>''-'')), '),
(130, 'DOCUMENT PRODUCT Attribute Weight Prefix - Default', 'DEFAULT_DOCUMENT_PRODUCT_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX', '1', 'DOCUMENT PRODUCT Attribute Weight Prefix<br />Default Attribute Weight Prefix<br />Blank, + or -', 4, 207, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Blank''), array(''id''=>''1'', ''text''=>''+''), array(''id''=>''2'', ''text''=>''-'')), '),
(131, 'PRODUCT FREE SHIPPING Attribute is Display Only - Default', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_DISPLAY_ONLY', '0', 'PRODUCT FREE SHIPPING Attribute is Display Only<br />Used For Display Purposes Only<br />0= No 1= Yes', 5, 201, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(132, 'PRODUCT FREE SHIPPING Attribute is Free - Default', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTE_IS_FREE', '1', 'PRODUCT FREE SHIPPING Attribute is Free<br />Attribute is Free When Product is Free<br />0= No 1= Yes', 5, 201, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(133, 'PRODUCT FREE SHIPPING Attribute is Default - Default', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_DEFAULT', '0', 'PRODUCT FREE SHIPPING Attribute is Default<br />Default Attribute to be Marked Selected<br />0= No 1= Yes', 5, 202, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(134, 'PRODUCT FREE SHIPPING Attribute is Discounted - Default', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_DISCOUNTED', '1', 'PRODUCT FREE SHIPPING Attribute is Discounted<br />Apply Discounts Used by Product Special/Sale<br />0= No 1= Yes', 5, 203, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(135, 'PRODUCT FREE SHIPPING Attribute is Included in Base Price - Default', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_PRICE_BASE_INCLUDED', '1', 'PRODUCT FREE SHIPPING Attribute is Included in Base Price<br />Include in Base Price When Priced by Attributes<br />0= No 1= Yes', 5, 204, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(136, 'PRODUCT FREE SHIPPING Attribute is Required - Default', 'DEFAULT_PRODUCT_FREE_SHIPPING_ATTRIBUTES_REQUIRED', '0', 'PRODUCT FREE SHIPPING Attribute is Required<br />Attribute Required for Text<br />0= No 1= Yes', 5, 205, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''Yes''), array(''id''=>''0'', ''text''=>''No'')), '),
(137, 'PRODUCT FREE SHIPPING Attribute Price Prefix - Default', 'DEFAULT_PRODUCT_FREE_SHIPPING_PRICE_PREFIX', '1', 'PRODUCT FREE SHIPPING Attribute Price Prefix<br />Default Attribute Price Prefix for Adding<br />Blank, + or -', 5, 206, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Blank''), array(''id''=>''1'', ''text''=>''+''), array(''id''=>''2'', ''text''=>''-'')), '),
(138, 'PRODUCT FREE SHIPPING Attribute Weight Prefix - Default', 'DEFAULT_PRODUCT_FREE_SHIPPING_PRODUCTS_ATTRIBUTES_WEIGHT_PREFIX', '1', 'PRODUCT FREE SHIPPING Attribute Weight Prefix<br />Default Attribute Weight Prefix<br />Blank, + or -', 5, 207, NULL, '2015-04-07 09:41:27', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''0'', ''text''=>''Blank''), array(''id''=>''1'', ''text''=>''+''), array(''id''=>''2'', ''text''=>''-'')), '),
(139, 'Show YouTube', 'SHOW_PRODUCT_INFO_YOUTUBE', '1', 'Display YouTube Video on Product Info 0= off 1= on', 1, NULL, '2015-08-12 14:07:28', '2015-08-12 14:07:28', NULL, 'zen_cfg_select_drop_down(array(array(''id''=>''1'', ''text''=>''True''), array(''id''=>''0'', ''text''=>''False'')), ');

-- --------------------------------------------------------

--
-- Table structure for table `project_version`
--

CREATE TABLE IF NOT EXISTS `project_version` (
  `project_version_id` tinyint(3) NOT NULL,
  `project_version_key` varchar(40) NOT NULL DEFAULT '',
  `project_version_major` varchar(20) NOT NULL DEFAULT '',
  `project_version_minor` varchar(20) NOT NULL DEFAULT '',
  `project_version_patch1` varchar(20) NOT NULL DEFAULT '',
  `project_version_patch2` varchar(20) NOT NULL DEFAULT '',
  `project_version_patch1_source` varchar(20) NOT NULL DEFAULT '',
  `project_version_patch2_source` varchar(20) NOT NULL DEFAULT '',
  `project_version_comment` varchar(250) NOT NULL DEFAULT '',
  `project_version_date_applied` datetime NOT NULL DEFAULT '0001-01-01 01:01:01'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Database Version Tracking';

--
-- Dumping data for table `project_version`
--

INSERT INTO `project_version` (`project_version_id`, `project_version_key`, `project_version_major`, `project_version_minor`, `project_version_patch1`, `project_version_patch2`, `project_version_patch1_source`, `project_version_patch2_source`, `project_version_comment`, `project_version_date_applied`) VALUES
(1, 'Zen-Cart Main', '1', '5.0', '', '', '', '', 'Fresh Installation', '2022-10-05 21:04:04'),
(2, 'Zen-Cart Database', '1', '5.0', '', '', '', '', 'Fresh Installation', '2022-10-05 21:04:04');

-- --------------------------------------------------------

--
-- Table structure for table `project_version_history`
--

CREATE TABLE IF NOT EXISTS `project_version_history` (
  `project_version_id` tinyint(3) NOT NULL,
  `project_version_key` varchar(40) NOT NULL DEFAULT '',
  `project_version_major` varchar(20) NOT NULL DEFAULT '',
  `project_version_minor` varchar(20) NOT NULL DEFAULT '',
  `project_version_patch` varchar(20) NOT NULL DEFAULT '',
  `project_version_comment` varchar(250) NOT NULL DEFAULT '',
  `project_version_date_applied` datetime NOT NULL DEFAULT '0001-01-01 01:01:01'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Database Version Tracking History';

--
-- Dumping data for table `project_version_history`
--

INSERT INTO `project_version_history` (`project_version_id`, `project_version_key`, `project_version_major`, `project_version_minor`, `project_version_patch`, `project_version_comment`, `project_version_date_applied`) VALUES
(1, 'Zen-Cart Main', '1', '5.0', '', 'Fresh Installation', '2022-10-05 21:04:04'),
(2, 'Zen-Cart Database', '1', '5.0', '', 'Fresh Installation', '2022-10-05 21:04:04');

-- --------------------------------------------------------

--
-- Table structure for table `query_builder`
--

CREATE TABLE IF NOT EXISTS `query_builder` (
  `query_id` int(11) NOT NULL,
  `query_category` varchar(40) NOT NULL DEFAULT '',
  `query_name` varchar(80) NOT NULL DEFAULT '',
  `query_description` text NOT NULL,
  `query_string` text NOT NULL,
  `query_keys_list` text NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='Stores queries for re-use in Admin email and report modules';

--
-- Dumping data for table `query_builder`
--

INSERT INTO `query_builder` (`query_id`, `query_category`, `query_name`, `query_description`, `query_string`, `query_keys_list`) VALUES
(1, 'email', 'All Customers', 'Returns all customers name and email address for sending mass emails (ie: for newsletters, coupons, GVs, messages, etc).', 'select customers_email_address, customers_firstname, customers_lastname from TABLE_CUSTOMERS order by customers_lastname, customers_firstname, customers_email_address', ''),
(2, 'email,newsletters', 'All Newsletter Subscribers', 'Returns name and email address of newsletter subscribers', 'select customers_firstname, customers_lastname, customers_email_address from TABLE_CUSTOMERS where customers_newsletter = ''1''', ''),
(3, 'email,newsletters', 'Dormant Customers (>3months) (Subscribers)', 'Subscribers who HAVE purchased something, but have NOT purchased for at least three months.', 'select o.date_purchased, c.customers_email_address, c.customers_lastname, c.customers_firstname from TABLE_CUSTOMERS c, TABLE_ORDERS o WHERE c.customers_id = o.customers_id AND c.customers_newsletter = 1 GROUP BY c.customers_email_address HAVING max(o.date_purchased) <= subdate(now(),INTERVAL 3 MONTH) ORDER BY c.customers_lastname, c.customers_firstname ASC', ''),
(4, 'email,newsletters', 'Active customers in past 3 months (Subscribers)', 'Newsletter subscribers who are also active customers (purchased something) in last 3 months.', 'select c.customers_email_address, c.customers_lastname, c.customers_firstname from TABLE_CUSTOMERS c, TABLE_ORDERS o where c.customers_newsletter = ''1'' AND c.customers_id = o.customers_id and o.date_purchased > subdate(now(),INTERVAL 3 MONTH) GROUP BY c.customers_email_address order by c.customers_lastname, c.customers_firstname ASC', ''),
(5, 'email,newsletters', 'Active customers in past 3 months (Regardless of subscription status)', 'All active customers (purchased something) in last 3 months, ignoring newsletter-subscription status.', 'select c.customers_email_address, c.customers_lastname, c.customers_firstname from TABLE_CUSTOMERS c, TABLE_ORDERS o WHERE c.customers_id = o.customers_id and o.date_purchased > subdate(now(),INTERVAL 3 MONTH) GROUP BY c.customers_email_address order by c.customers_lastname, c.customers_firstname ASC', ''),
(6, 'email,newsletters', 'Administrator', 'Just the email account of the current administrator', 'select ''ADMIN'' as customers_firstname, admin_name as customers_lastname, admin_email as customers_email_address from TABLE_ADMIN where admin_id = $SESSION:admin_id', ''),
(7, 'email,newsletters', 'Customers who have never completed a purchase', 'For sending newsletter to all customers who registered but have never completed a purchase', 'SELECT DISTINCT c.customers_email_address as customers_email_address, c.customers_lastname as customers_lastname, c.customers_firstname as customers_firstname FROM TABLE_CUSTOMERS c LEFT JOIN  TABLE_ORDERS o ON c.customers_id=o.customers_id WHERE o.date_purchased IS NULL', '');

-- --------------------------------------------------------

--
-- Table structure for table `record_artists`
--

CREATE TABLE IF NOT EXISTS `record_artists` (
  `artists_id` int(11) NOT NULL,
  `artists_name` varchar(32) NOT NULL DEFAULT '',
  `artists_image` varchar(64) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `record_artists_info`
--

CREATE TABLE IF NOT EXISTS `record_artists_info` (
  `artists_id` int(11) NOT NULL DEFAULT '0',
  `languages_id` int(11) NOT NULL DEFAULT '0',
  `artists_url` varchar(255) NOT NULL DEFAULT '',
  `url_clicked` int(5) NOT NULL DEFAULT '0',
  `date_last_click` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `record_company`
--

CREATE TABLE IF NOT EXISTS `record_company` (
  `record_company_id` int(11) NOT NULL,
  `record_company_name` varchar(32) NOT NULL DEFAULT '',
  `record_company_image` varchar(64) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `record_company_info`
--

CREATE TABLE IF NOT EXISTS `record_company_info` (
  `record_company_id` int(11) NOT NULL DEFAULT '0',
  `languages_id` int(11) NOT NULL DEFAULT '0',
  `record_company_url` varchar(255) NOT NULL DEFAULT '',
  `url_clicked` int(5) NOT NULL DEFAULT '0',
  `date_last_click` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE IF NOT EXISTS `reviews` (
  `reviews_id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL DEFAULT '0',
  `customers_id` int(11) DEFAULT NULL,
  `customers_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reviews_rating` int(1) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `reviews_read` int(5) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`reviews_id`, `products_id`, `customers_id`, `customers_name`, `reviews_rating`, `date_added`, `last_modified`, `reviews_read`, `status`) VALUES
(1, 11, 1, 'Lorem Ipsum Dolor', 5, '2011-11-11 00:00:00', NULL, 8, 1),
(2, 12, 1, 'Lorem Ipsum Dolor', 4, '2011-10-10 00:00:00', NULL, 4, 1),
(3, 13, 1, 'Lorem Ipsum Dolor', 3, '2011-09-09 00:00:00', NULL, 5, 1),
(4, 14, 1, 'Lorem Ipsum Dolor', 2, '2011-08-08 00:00:00', NULL, 3, 1),
(5, 15, 1, 'Lorem Ipsum Dolor', 1, '2011-07-07 00:00:00', NULL, 119, 1),
(6, 16, 1, 'Lorem Ipsum Dolor', 5, '2011-06-06 00:00:00', NULL, 95, 1),
(10, 12, 2, 'test test', 1, '2014-06-27 13:39:48', NULL, 0, 0),
(11, 12, 2, 'test test', 5, '2014-06-27 13:40:00', NULL, 0, 0),
(12, 12, 2, 'test test', 5, '2014-06-27 13:40:39', NULL, 0, 0),
(13, 12, 2, 'test test', 5, '2014-06-27 14:01:36', NULL, 0, 0),
(14, 12, 2, 'test test', 5, '2014-06-27 14:32:03', NULL, 0, 0),
(15, 12, 2, 'test test', 4, '2014-06-27 14:33:24', NULL, 0, 0),
(16, 10, 2, 'test test', 4, '2014-08-12 14:03:12', NULL, 0, 0),
(17, 7, 1, 'jim ghgfhgf', 2, '2015-02-16 13:38:40', NULL, 0, 0),
(18, 7, 1, 'jim ghgfhgf', 4, '2015-02-16 13:46:16', NULL, 0, 0),
(19, 2, 1, 'jim ghgfhgf', 5, '2015-02-16 13:46:52', NULL, 0, 0),
(20, 16, 1, 'jim ghgfhgf', 4, '2015-02-16 13:50:57', NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `reviews_description`
--

CREATE TABLE IF NOT EXISTS `reviews_description` (
  `reviews_id` int(11) NOT NULL DEFAULT '0',
  `languages_id` int(11) NOT NULL DEFAULT '0',
  `reviews_text` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `reviews_description`
--

INSERT INTO `reviews_description` (`reviews_id`, `languages_id`, `reviews_text`) VALUES
(1, 1, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. In sit amet dui. Morbi sed mi. Duis accumsan. Etiam blandit tempus lectus. Proin mattis luctus elit. Nullam porttitor lacus euismod ligula. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Curabitur sed lacus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Etiam sapien ante, rutrum ac, commodo in, posuere ut, nibh. Vivamus non leo. Etiam sodales augue. Sed faucibus ligula. Pellentesque sit amet risus. Etiam imperdiet, dui et luctus mollis, nisi tortor mattis sem, vel ultricies sem purus vel nisl. Etiam eget nunc. Etiam at sem eget justo elementum eleifend.\r\n\r\nUt nec magna. Nunc vel purus. Fusce felis. Suspendisse et ligula non sem volutpat suscipit. Cras sed neque consectetuer lorem ultrices pretium. Curabitur nibh leo, sagittis ut, rhoncus vitae, ornare quis, justo. Sed vel felis eleifend nisl commodo pretium. Etiam bibendum. Quisque porta. Nunc porttitor pretium mauris. Aliquam erat volutpat. Nam dolor nunc, placerat nec, convallis nec, iaculis sit amet, libero. Nam feugiat condimentum libero. Aenean orci mauris, volutpat eget, dignissim quis, placerat sed, enim. Ut dictum mauris ut enim. Aliquam nec lorem. Pellentesque luctus. Pellentesque tempor, lorem id tempus pellentesque, felis eros consectetuer magna, vel congue lectus ante pretium nisl. Etiam non mauris. Pellentesque facilisis.'),
(2, 1, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. In sit amet dui. Morbi sed mi. Duis accumsan. Etiam blandit tempus lectus. Proin mattis luctus elit. Nullam porttitor lacus euismod ligula. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Curabitur sed lacus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Etiam sapien ante, rutrum ac, commodo in, posuere ut, nibh. Vivamus non leo. Etiam sodales augue. Sed faucibus ligula. Pellentesque sit amet risus. Etiam imperdiet, dui et luctus mollis, nisi tortor mattis sem, vel ultricies sem purus vel nisl. Etiam eget nunc. Etiam at sem eget justo elementum eleifend.\r\n\r\nUt nec magna. Nunc vel purus. Fusce felis. Suspendisse et ligula non sem volutpat suscipit. Cras sed neque consectetuer lorem ultrices pretium. Curabitur nibh leo, sagittis ut, rhoncus vitae, ornare quis, justo. Sed vel felis eleifend nisl commodo pretium. Etiam bibendum. Quisque porta. Nunc porttitor pretium mauris. Aliquam erat volutpat. Nam dolor nunc, placerat nec, convallis nec, iaculis sit amet, libero. Nam feugiat condimentum libero. Aenean orci mauris, volutpat eget, dignissim quis, placerat sed, enim. Ut dictum mauris ut enim. Aliquam nec lorem. Pellentesque luctus. Pellentesque tempor, lorem id tempus pellentesque, felis eros consectetuer magna, vel congue lectus ante pretium nisl. Etiam non mauris. Pellentesque facilisis.'),
(3, 1, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. In sit amet dui. Morbi sed mi. Duis accumsan. Etiam blandit tempus lectus. Proin mattis luctus elit. Nullam porttitor lacus euismod ligula. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Curabitur sed lacus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Etiam sapien ante, rutrum ac, commodo in, posuere ut, nibh. Vivamus non leo. Etiam sodales augue. Sed faucibus ligula. Pellentesque sit amet risus. Etiam imperdiet, dui et luctus mollis, nisi tortor mattis sem, vel ultricies sem purus vel nisl. Etiam eget nunc. Etiam at sem eget justo elementum eleifend.\r\n\r\nUt nec magna. Nunc vel purus. Fusce felis. Suspendisse et ligula non sem volutpat suscipit. Cras sed neque consectetuer lorem ultrices pretium. Curabitur nibh leo, sagittis ut, rhoncus vitae, ornare quis, justo. Sed vel felis eleifend nisl commodo pretium. Etiam bibendum. Quisque porta. Nunc porttitor pretium mauris. Aliquam erat volutpat. Nam dolor nunc, placerat nec, convallis nec, iaculis sit amet, libero. Nam feugiat condimentum libero. Aenean orci mauris, volutpat eget, dignissim quis, placerat sed, enim. Ut dictum mauris ut enim. Aliquam nec lorem. Pellentesque luctus. Pellentesque tempor, lorem id tempus pellentesque, felis eros consectetuer magna, vel congue lectus ante pretium nisl. Etiam non mauris. Pellentesque facilisis.'),
(4, 1, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Mauris tincidunt viverra ipsum. Mauris placerat arcu non purus. In ut tortor. Duis varius facilisis orci. Aenean in nibh non pede consequat varius. Vestibulum tempus gravida nulla. Nullam et felis. Nullam nulla. Duis felis nibh, suscipit sit amet, mollis eu, mollis id, justo. Nulla vestibulum auctor elit. Aliquam quis mi sit amet odio pretium fringilla. Nulla dictum ipsum eget lectus consectetuer consectetuer. Vivamus sit amet lacus. Vivamus lacus sapien, laoreet in, tincidunt vitae, semper sit amet, ante.\r\n\r\nCurabitur vel sem. Proin massa ligula, scelerisque a, pulvinar sit amet, varius sit amet, lectus. Sed pulvinar porta sapien. Vestibulum condimentum turpis. Etiam nunc. Aliquam eu felis quis libero imperdiet volutpat. Vivamus ut tortor. Aliquam erat volutpat. Curabitur sem risus, sollicitudin non, tempus eu, placerat vitae, sapien. Duis congue elementum erat. Quisque sit amet odio. Aliquam accumsan lorem. Proin vehicula sem rhoncus augue. Phasellus ut sem eu odio vestibulum euismod. Donec pulvinar lobortis lacus.\r\n\r\nPraesent vulputate lacus in justo. Phasellus posuere. Aenean volutpat semper urna. Fusce facilisis accumsan urna. Vestibulum nec dolor a mi fringilla venenatis. Quisque sodales urna. Curabitur pharetra auctor ligula. Maecenas suscipit vestibulum turpis. Nunc dictum mi id sem. Mauris vitae lectus. Aenean consequat. Nulla lobortis imperdiet tortor. Duis posuere purus interdum nibh. Fusce ut diam eget lacus laoreet malesuada.'),
(5, 1, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Mauris tincidunt viverra ipsum. Mauris placerat arcu non purus. In ut tortor. Duis varius facilisis orci. Aenean in nibh non pede consequat varius. Vestibulum tempus gravida nulla. Nullam et felis. Nullam nulla. Duis felis nibh, suscipit sit amet, mollis eu, mollis id, justo. Nulla vestibulum auctor elit. Aliquam quis mi sit amet odio pretium fringilla. Nulla dictum ipsum eget lectus consectetuer consectetuer. Vivamus sit amet lacus. Vivamus lacus sapien, laoreet in, tincidunt vitae, semper sit amet, ante.\r\n\r\nCurabitur vel sem. Proin massa ligula, scelerisque a, pulvinar sit amet, varius sit amet, lectus. Sed pulvinar porta sapien. Vestibulum condimentum turpis. Etiam nunc. Aliquam eu felis quis libero imperdiet volutpat. Vivamus ut tortor. Aliquam erat volutpat. Curabitur sem risus, sollicitudin non, tempus eu, placerat vitae, sapien. Duis congue elementum erat. Quisque sit amet odio. Aliquam accumsan lorem. Proin vehicula sem rhoncus augue. Phasellus ut sem eu odio vestibulum euismod. Donec pulvinar lobortis lacus.\r\n\r\nPraesent vulputate lacus in justo. Phasellus posuere. Aenean volutpat semper urna. Fusce facilisis accumsan urna. Vestibulum nec dolor a mi fringilla venenatis. Quisque sodales urna. Curabitur pharetra auctor ligula. Maecenas suscipit vestibulum turpis. Nunc dictum mi id sem. Mauris vitae lectus. Aenean consequat. Nulla lobortis imperdiet tortor. Duis posuere purus interdum nibh. Fusce ut diam eget lacus laoreet malesuada.'),
(6, 1, 'Praesent urna nibh, auctor sit amet, facilisis gravida, adipiscing vel, sem. Nullam metus mi, pretium in, mattis vitae, tempor quis, ligula. Etiam pulvinar tempor sapien. Proin dictum tristique felis. Nunc odio. Mauris molestie pulvinar nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Pellentesque nonummy justo quis nunc. Quisque non enim. Donec arcu orci, pulvinar eu, mattis ac, ornare ut, turpis. In hac habitasse platea dictumst. Suspendisse lacus turpis, molestie pulvinar, accumsan eu, dictum sed, pede. Sed diam diam, molestie sit amet, ultrices vel, blandit in, lectus. Nullam tempor pede sed mi. Cras consequat mauris eget nisi. Nullam ultricies libero nec lacus. Fusce sed risus.'),
(10, 1, 'Please tell us what you think and share your opinions with others. Be sure to focus your comments on the product.'),
(11, 1, 'Please tell us what you think and share your opinions with others. Be sure to focus your comments on the product.'),
(12, 1, 'Please tell us what you think and share your opinions with others. Be sure to focus your comments on the product.'),
(13, 1, 'fbdfbdfbdfbdfbdfbdfbdfbdfbdfbdfbdfbdfbdfbdfbdfbdfbdfbdfbdfbdfbdfbdfbdfbdfbdfbdfbdfbdfbdfbdfbdfbdfbd'),
(14, 1, 'Please tell us what you think and share your opinions with others. Be sure to focus your comments on the product.'),
(15, 1, 'Category9\r\n Category10\r\n Category11\r\n Category12\r\n Category13\r\n Category14\r\n Category15\r\n Category16\r\n Category17\r\n Category18\r\n Category19\r\n Category20\r\n\r\n \r\nProduct #012\r\n[Model3]\r\nProduct #012\r\n Details \r\n Go to the Reviews Page \r\n$124.00 $105.40\r\nWritten by:test test\r\n\r\nChoose a ranking for this item. 1 star is the worst and 5 stars is the best.\r\nOne Star Two Stars Three Stars Four Stars Five Stars\r\nPlease tell us what you think and share your opinions with others. Be sure to focus your comments on the product.'),
(16, 1, 'fdgfdsdgfbgdfghghfdhfghdfghfghdfghdfhdfghdfgthrthrethrthtrhfghdfghd'),
(17, 1, 'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww'),
(18, 1, 'Lorem ipsum dolor sit amet, lorem cursus adipiscing pellentesque, sit aliquam maecenas pellentesque tortor tortor elementum, pede tincidunt duis, eu aenean quis sollicitudin in cursus risus, duis sodales. Suscipit viverra nascetur risus accumsan lobortis. Viverra orci, auctor fringilla tempor, lectus odio elit dictum nam, eros in vitae dolor in in erat. Amet fringilla, maecenas id mauris magna fermentum. Integer aliquam vestibulum sed aenean habitasse, debitis massa nam sociosqu, fusce senectus etiam morbi mauris tincidunt, a posuere nullam enim vel mauris neque, magna amet. Integer diam donec quam et, eros eget ut consequat suspendisse asperiores. Imperdiet lorem at tellus nibh diam arcu, imperdiet ligula porttitor diam mi. Vivamus convallis enim ipsum nascetur adipiscing, sit dolor id maecenas vitae, tellus rutrum doloremque viverra lorem natoque eu, et ultrices nullam aliquam quis lacinia.'),
(19, 1, 'Lorem ipsum dolor sit amet, lorem cursus adipiscing pellentesque, sit aliquam maecenas pellentesque tortor tortor elementum, pede tincidunt duis, eu aenean quis sollicitudin in cursus risus, duis sodales. Suscipit viverra nascetur risus accumsan lobortis. Viverra orci, auctor fringilla tempor, lectus odio elit dictum nam, eros in vitae dolor in in erat. Amet fringilla, maecenas id mauris magna fermentum. Integer aliquam vestibulum sed aenean habitasse, debitis massa nam sociosqu, fusce senectus etiam morbi mauris tincidunt, a posuere nullam enim vel mauris neque, magna amet. Integer diam donec quam et, eros eget ut consequat suspendisse asperiores. Imperdiet lorem at tellus nibh diam arcu, imperdiet ligula porttitor diam mi. Vivamus convallis enim ipsum nascetur adipiscing, sit dolor id maecenas vitae, tellus rutrum doloremque viverra lorem natoque eu, et ultrices nullam aliquam quis lacinia.'),
(20, 1, 'Libero curabitur metus aenean ac, justo morbi. Ligula luctus etiam ante eros et, sit proin in mi amet pede mi, praesent dolor justo non lacus faucibus fermentum, duis scelerisque risus mauris fames neque, enim at et. Consequat ut commodo, augue pulvinar a cupiditate imperdiet nam wisi, pede nec orci maecenas gravida ac praesent, eget repellat tellus est mauris vestibulum, nibh felis dignissim elit facilisis vitae vitae. Nunc aut ut nulla. Vero imperdiet pede diam id. Ultrices nonummy auctor iaculis, mus luctus mauris non nulla rutrum sollicitudin, eget donec luctus, id eget sociosqu quam, molestie tortor. Et vitae venenatis proin, et dictum nisl suspendisse, euismod orci maecenas vitae, sagittis pede. Vehicula lectus. Ultricies vestibulum odio donec sollicitudin. Elit sodales, libero arcu tristique, dui mauris mus quisque viverra turpis. Nam vel nec laoreet sed malesuada.');

-- --------------------------------------------------------

--
-- Table structure for table `salemaker_sales`
--

CREATE TABLE IF NOT EXISTS `salemaker_sales` (
  `sale_id` int(11) NOT NULL,
  `sale_status` tinyint(4) NOT NULL DEFAULT '0',
  `sale_name` varchar(30) NOT NULL DEFAULT '',
  `sale_deduction_value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sale_deduction_type` tinyint(4) NOT NULL DEFAULT '0',
  `sale_pricerange_from` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sale_pricerange_to` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sale_specials_condition` tinyint(4) NOT NULL DEFAULT '0',
  `sale_categories_selected` text,
  `sale_categories_all` text,
  `sale_date_start` date NOT NULL DEFAULT '0001-01-01',
  `sale_date_end` date NOT NULL DEFAULT '0001-01-01',
  `sale_date_added` date NOT NULL DEFAULT '0001-01-01',
  `sale_date_last_modified` date NOT NULL DEFAULT '0001-01-01',
  `sale_date_status_change` date NOT NULL DEFAULT '0001-01-01'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `sesskey` varchar(64) NOT NULL DEFAULT '',
  `expiry` int(11) unsigned NOT NULL DEFAULT '0',
  `value` mediumblob NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`sesskey`, `expiry`, `value`) VALUES
('tqhhoms85ou8ace8mod7mmoqv5', 1665713855, 0x6332566a64584a7064486c556232746c626e787a4f6a4d794f694933595751314d7a45354d5467344d3259344e7a63334f44557a4d6a6b794d7a52694e6d4a6a4e47566b4d7949375933567a644739745a584a7a58326876633352665957526b636d567a6333787a4f6a49314f694a50526b5a4a51305666535642665645396653453954564639425245525352564e54496a746a59584a3053555238637a6f774f6949694f324e68636e5238547a6f784d6a6f696332687663484270626d644459584a30496a6f344f6e747a4f6a6736496d4e76626e526c626e527a496a74684f6a41366533317a4f6a5536496e527664474673496a74704f6a4137637a6f324f694a335a576c6e614851694f326b364d44747a4f6a5936496d4e68636e524a52434937546a747a4f6a45794f694a6a623235305a57353058335235634755694f3249364d44747a4f6a45344f694a6d636d566c58334e6f615842776157356e58326c305a5730694f326b364d44747a4f6a49774f694a6d636d566c58334e6f615842776157356e5833646c6157646f6443493761546f774f334d364d546b36496d5a795a5756666332687063484270626d646663484a70593255694f326b364d447439626d46326157646864476c76626e78504f6a45334f694a7559585a705a3246306157397553476c7a64473979655349364d6a7037637a6f304f694a775958526f496a74684f6a453665326b364d4474684f6a513665334d364e446f696347466e5a534937637a6f314f694a70626d526c65434937637a6f304f694a746232526c496a747a4f6a5936496b3550546c4e5454434937637a6f7a4f694a6e5a5851694f334d364d446f69496a747a4f6a5136496e4276633351694f3245364d44703766583139637a6f344f694a7a626d4677633268766443493759546f774f6e743966574e6f5a574e7258335a6862476c6b66484d364e446f6964484a315a534937624746755a3356685a325638637a6f334f694a6c626d647361584e6f496a74735957356e6457466e5a584e6661575238637a6f784f694978496a74735957356e6457466e5a584e665932396b5a58787a4f6a4936496d5675496a746a64584a795a57356a6558787a4f6a4d36496c5654524349376447396b59586c6661584e38637a6f784d446f694d6a41794d6930784d4330784e4349376458426b5958526c5258687761584a6864476c76626e4e38596a6f784f324e686447566e62334a35583352795a575638547a6f794d446f6955326c746347786c513246305a576476636d6c6c633152795a5755694f6a673665334d364d544d36496d4e686447566e62334a35583352795a5755694f3245364d6a633665326b364d5474684f6a6b3665334d364e446f69626d46745a534937637a6f344f694a435958526f636d397662534937637a6f314f694a706257466e5a534937637a6f344f694a6a595851784c6d70775a794937637a6f784d546f695a47567a59334a7063485270623234694f334d364d7a59334f694a556147556763335677634778705a584d67643255676332567362434270626942766458496763335276636d556759584a6c4947396d494842795a573170645730676358566862476c3065534268626d516764326c736243427a5a584a325a534235623355675a6d397949486c6c59584a7a4c6942585a53426c626e4a70593267676233567949464273645731696157356e49464e31634842736157567a49464e3062334a6c4947397562486b6764326c30614342306147556764325673624342305a584e305a5751676257396b5a57787a4948646f61574e6f49476868646d5567643239754948527964584e30494746755a434268636d5567613235766432346764476868626d747a494852764948526f5a576c7949484a6c63326c7a6447467559325567644738675a475677636d566a61574630615739754c69424e6232526c636d34675957356b49484a6c62476c68596d786c4948526f5a586b6764326c736243426a5958567a5a53423562335567626d386764484a7664574a735a584d67615734675a6e56796447686c6369426c6548427362326c3059585270623234754946527964584e30494739316369427762485674596d6c755a79426c6548426c636d6c6c626d4e6c494746755a4342335a5342336157787349477031633352705a6e6b6761585175496a747a4f6a6b36496e4268636d5675644639705a434937637a6f784f694977496a747a4f6a5136496e4268644767694f3245364d54703761546f774f334d364d546f694d53493766584d364f446f696333566958324e6864484d694f3245364e44703761546f774f334d364d6a6f694d7a45694f326b364d54747a4f6a4936496a4d79496a74704f6a4937637a6f794f69497a4d79493761546f7a4f334d364d6a6f694d7a51694f33317a4f6a4d36496e4e3159694937637a6f334f694a6f59584e6663335669496a747a4f6a5536496d4e515958526f496a747a4f6a4536496a45694f334d364e546f69626c4268644767694f334d364d546f694d53493766576b364d4474684f6a513665334d364f446f696333566958324e6864484d694f3245364d54413665326b364d44747a4f6a4536496a45694f326b364d54747a4f6a4536496a49694f326b364d6a747a4f6a4536496a4d694f326b364d7a747a4f6a4536496a51694f326b364e44747a4f6a4536496a55694f326b364e54747a4f6a4536496a59694f326b364e6a747a4f6a4536496a63694f326b364e7a747a4f6a4536496a67694f326b364f44747a4f6a4536496a6b694f326b364f54747a4f6a4936496a4577496a7439637a6f7a4f694a7a645749694f334d364e7a6f696147467a58334e3159694937637a6f314f694a6a554746306143493761546f774f334d364e546f69626c4268644767694f326b364d44743961546f794f3245364f547037637a6f304f694a755957316c496a747a4f6a457a4f694a496232316c49435967523246795a475675496a747a4f6a5536496d6c745957646c496a747a4f6a6736496d4e6864444975616e426e496a747a4f6a45784f694a6b5a584e6a636d6c7764476c7662694937637a6f7a4e6a6736496c526f5a53427a6458427762476c6c637942335a53427a5a57787349476c75494739316369427a644739795a534268636d55676232596763484a6c62576c31625342786457467361585235494746755a4342336157787349484e6c636e5a6c49486c766453426d6233496765575668636e4d754946646c49475675636d6c6a61434276645849675547783162574a70626d636755335677634778705a584d6755335276636d556762323573655342336158526f4948526f5a5342335a5778734948526c6333526c5a4342746232526c62484d676432687059326767614746325a5342336232346764484a31633351675957356b494746795a534272626d3933626942306147467561334d67644738676447686c61584967636d567a61584e305957356a5a5342306279426b5a5842795a574e705958527062323475494531765a47567962694268626d5167636d567361574669624755676447686c655342336157787349474e6864584e6c49486c766453427562794230636d3931596d786c637942706269426d64584a306147567949475634634778766158526864476c766269346756484a31633351676233567949484273645731696157356e494756346347567961575675593255675957356b4948646c4948647062477767616e567a64476c6d6553427064433467496a747a4f6a6b36496e4268636d5675644639705a434937637a6f784f694977496a747a4f6a5136496e4268644767694f3245364d54703761546f774f334d364d546f694d69493766584d364f446f696333566958324e6864484d694f3245364e44703761546f774f334d364d6a6f694d7a55694f326b364d54747a4f6a4936496a4d32496a74704f6a4937637a6f794f69497a4e79493761546f7a4f334d364d6a6f694d7a67694f33317a4f6a4d36496e4e3159694937637a6f334f694a6f59584e6663335669496a747a4f6a5536496d4e515958526f496a747a4f6a4536496a49694f334d364e546f69626c4268644767694f334d364d546f694d69493766576b364d7a74684f6a6b3665334d364e446f69626d46745a534937637a6f334f694a4c6158526a61475675496a747a4f6a5536496d6c745957646c496a747a4f6a6736496d4e6864444d75616e426e496a747a4f6a45784f694a6b5a584e6a636d6c7764476c7662694937637a6f7a4e6a6736496c526f5a53427a6458427762476c6c637942335a53427a5a57787349476c75494739316369427a644739795a534268636d55676232596763484a6c62576c31625342786457467361585235494746755a4342336157787349484e6c636e5a6c49486c766453426d6233496765575668636e4d754946646c49475675636d6c6a61434276645849675547783162574a70626d636755335677634778705a584d6755335276636d556762323573655342336158526f4948526f5a5342335a5778734948526c6333526c5a4342746232526c62484d676432687059326767614746325a5342336232346764484a31633351675957356b494746795a534272626d3933626942306147467561334d67644738676447686c61584967636d567a61584e305957356a5a5342306279426b5a5842795a574e705958527062323475494531765a47567962694268626d5167636d567361574669624755676447686c655342336157787349474e6864584e6c49486c766453427562794230636d3931596d786c637942706269426d64584a306147567949475634634778766158526864476c766269346756484a31633351676233567949484273645731696157356e494756346347567961575675593255675957356b4948646c4948647062477767616e567a64476c6d6553427064433467496a747a4f6a6b36496e4268636d5675644639705a434937637a6f784f694977496a747a4f6a5136496e4268644767694f3245364d54703761546f774f334d364d546f694d79493766584d364f446f696333566958324e6864484d694f3245364d7a703761546f774f334d364d6a6f694d7a6b694f326b364d54747a4f6a4936496a5177496a74704f6a4937637a6f794f6949304d53493766584d364d7a6f6963335669496a747a4f6a6336496d68686331397a645749694f334d364e546f6959314268644767694f334d364d546f694d794937637a6f314f694a755547463061434937637a6f784f69497a496a743961546f304f3245364f547037637a6f304f694a755957316c496a747a4f6a45794f694a535a584268615849675547467964484d694f334d364e546f69615731685a3255694f334d364f446f69593246304e433571634763694f334d364d544536496d526c63324e796158423061573975496a747a4f6a4d324e7a6f695647686c49484e31634842736157567a4948646c49484e6c62477767615734676233567949484e3062334a6c494746795a5342765a694277636d567461585674494846315957787064486b675957356b494864706247776763325679646d55676557393149475a76636942355a57467963793467563255675a57357961574e6f494739316369425162485674596d6c755a7942546458427762476c6c63794254644739795a534276626d783549486470644767676447686c4948646c624777676447567a6447566b494731765a4756736379423361476c6a6143426f59585a6c4948647662694230636e567a64434268626d516759584a6c49477475623364754948526f59573572637942306279423061475670636942795a584e7063335268626d4e6c494852764947526c63484a6c59326c6864476c76626934675457396b5a584a75494746755a4342795a57787059574a735a5342306147563549486470624777675932463163325567655739314947357649485279623356696247567a49476c7549475a31636e526f5a5849675a5868776247397064474630615739754c694255636e567a64434276645849676347783162574a70626d63675a5868775a584a705a57356a5a534268626d51676432556764326c736243427164584e3061575a3549476c304c694937637a6f354f694a7759584a6c626e5266615751694f334d364d546f694d434937637a6f304f694a775958526f496a74684f6a453665326b364d44747a4f6a4536496a51694f33317a4f6a6736496e4e31596c396a5958527a496a74684f6a4d3665326b364d44747a4f6a4936496a5179496a74704f6a4537637a6f794f6949304d79493761546f794f334d364d6a6f694e4451694f33317a4f6a4d36496e4e3159694937637a6f334f694a6f59584e6663335669496a747a4f6a5536496d4e515958526f496a747a4f6a4536496a51694f334d364e546f69626c4268644767694f334d364d546f694e43493766576b364e5474684f6a6b3665334d364e446f69626d46745a534937637a6f314f694a556232397363794937637a6f314f694a706257466e5a534937637a6f344f694a6a595851314c6d70775a794937637a6f784d546f695a47567a59334a7063485270623234694f334d364e4449314f694a5064584967623235736157356c49484e6f6233416761584d676447686c49474a6c63335167634778685932556764473867596e563549474a706132567a4c43426859324e6c63334e76636d6c6c63794268626d51676233526f5a584967636d56735958526c5a434277636d396b64574e3063793467554756795a6d566a6443427a5a584a3261574e6c4c4342795a57787059574a735a53427a61476c7763476c755a79427a65584e305a5730675957356b49475a735a586870596d786c4947527063324e7664573530494746755a43427362336c686248523549484279623264795957317a494330676447686c6332556759584a6c4948526f5a53427459576c7549474e7662584276626d567564484d67644768686443426f59585a6c49475675633356795a5751676447686c49484e3159324e6c63334d67623259676233567949474a3163326c755a584e7a4c694248636d5668644342305a57467449474e6f5a5731706333527965534268626d51675a6d78686432786c63334d675933567a644739745a584967593246795a5342336157787349484e31636e427961584e6c49486c7664534270626e4e305957353062486b675957356b49486c7664654b416d5778734947357664476c6a5a5342306147463049486c7664534268636d5567615734676447686c49484a705a3268304948427359574e6c4948646f5a584a6c4948426c623342735a534272626d3933494756325a584a3564476870626d636759574a7664585167596d6c6a65574e735a584d7549434937637a6f354f694a7759584a6c626e5266615751694f334d364d546f694d434937637a6f304f694a775958526f496a74684f6a453665326b364d44747a4f6a4536496a55694f33317a4f6a6736496e4e31596c396a5958527a496a74684f6a493665326b364d44747a4f6a4936496a5131496a74704f6a4537637a6f794f6949304e69493766584d364d7a6f6963335669496a747a4f6a6336496d68686331397a645749694f334d364e546f6959314268644767694f334d364d546f694e534937637a6f314f694a755547463061434937637a6f784f694931496a743961546f324f3245364f447037637a6f304f694a755957316c496a747a4f6a457a4f694a585958526c636942495a5746305a584a7a496a747a4f6a5536496d6c745957646c496a747a4f6a6736496d4e6864445975616e426e496a747a4f6a45784f694a6b5a584e6a636d6c7764476c7662694937637a6f7a4e6a6736496c526f5a53427a6458427762476c6c637942335a53427a5a57787349476c75494739316369427a644739795a534268636d55676232596763484a6c62576c31625342786457467361585235494746755a4342336157787349484e6c636e5a6c49486c766453426d6233496765575668636e4d754946646c49475675636d6c6a61434276645849675547783162574a70626d636755335677634778705a584d6755335276636d556762323573655342336158526f4948526f5a5342335a5778734948526c6333526c5a4342746232526c62484d676432687059326767614746325a5342336232346764484a31633351675957356b494746795a534272626d3933626942306147467561334d67644738676447686c61584967636d567a61584e305957356a5a5342306279426b5a5842795a574e705958527062323475494531765a47567962694268626d5167636d567361574669624755676447686c655342336157787349474e6864584e6c49486c766453427562794230636d3931596d786c637942706269426d64584a306147567949475634634778766158526864476c766269346756484a31633351676233567949484273645731696157356e494756346347567961575675593255675957356b4948646c4948647062477767616e567a64476c6d6553427064433467496a747a4f6a6b36496e4268636d5675644639705a434937637a6f784f694977496a747a4f6a5136496e4268644767694f3245364d54703761546f774f334d364d546f694e69493766584d364d7a6f6963335669496a747a4f6a5936496d357658334e3159694937637a6f314f694a6a5547463061434937637a6f784f694932496a747a4f6a5536496d35515958526f496a747a4f6a4536496a59694f3331704f6a633759546f344f6e747a4f6a5136496d3568625755694f334d364f446f6955335677634778705a584d694f334d364e546f69615731685a3255694f334d364f446f69593246304e793571634763694f334d364d544536496d526c63324e796158423061573975496a747a4f6a4d324e7a6f695647686c49484e31634842736157567a4948646c49484e6c62477767615734676233567949484e3062334a6c494746795a5342765a694277636d567461585674494846315957787064486b675957356b494864706247776763325679646d55676557393149475a76636942355a57467963793467563255675a57357961574e6f494739316369425162485674596d6c755a7942546458427762476c6c63794254644739795a534276626d783549486470644767676447686c4948646c624777676447567a6447566b494731765a4756736379423361476c6a6143426f59585a6c4948647662694230636e567a64434268626d516759584a6c49477475623364754948526f59573572637942306279423061475670636942795a584e7063335268626d4e6c494852764947526c63484a6c59326c6864476c76626934675457396b5a584a75494746755a4342795a57787059574a735a5342306147563549486470624777675932463163325567655739314947357649485279623356696247567a49476c7549475a31636e526f5a5849675a5868776247397064474630615739754c694255636e567a64434276645849676347783162574a70626d63675a5868775a584a705a57356a5a534268626d51676432556764326c736243427164584e3061575a3549476c304c694937637a6f354f694a7759584a6c626e5266615751694f334d364d546f694d434937637a6f304f694a775958526f496a74684f6a453665326b364d44747a4f6a4536496a63694f33317a4f6a4d36496e4e3159694937637a6f324f694a756231397a645749694f334d364e546f6959314268644767694f334d364d546f694e794937637a6f314f694a755547463061434937637a6f784f694933496a743961546f344f3245364f447037637a6f304f694a755957316c496a747a4f6a5936496c4e6f5a57787363794937637a6f314f694a706257466e5a534937637a6f344f694a6a595851344c6d70775a794937637a6f784d546f695a47567a59334a7063485270623234694f334d364d7a59334f694a556147556763335677634778705a584d67643255676332567362434270626942766458496763335276636d556759584a6c4947396d494842795a573170645730676358566862476c3065534268626d516764326c736243427a5a584a325a534235623355675a6d397949486c6c59584a7a4c6942585a53426c626e4a70593267676233567949464273645731696157356e49464e31634842736157567a49464e3062334a6c4947397562486b6764326c30614342306147556764325673624342305a584e305a5751676257396b5a57787a4948646f61574e6f49476868646d5567643239754948527964584e30494746755a434268636d5567613235766432346764476868626d747a494852764948526f5a576c7949484a6c63326c7a6447467559325567644738675a475677636d566a61574630615739754c69424e6232526c636d34675957356b49484a6c62476c68596d786c4948526f5a586b6764326c736243426a5958567a5a53423562335567626d386764484a7664574a735a584d67615734675a6e56796447686c6369426c6548427362326c3059585270623234754946527964584e30494739316369427762485674596d6c755a79426c6548426c636d6c6c626d4e6c494746755a4342335a5342336157787349477031633352705a6e6b6761585175496a747a4f6a6b36496e4268636d5675644639705a434937637a6f784f694977496a747a4f6a5136496e4268644767694f3245364d54703761546f774f334d364d546f694f43493766584d364d7a6f6963335669496a747a4f6a5936496d357658334e3159694937637a6f314f694a6a5547463061434937637a6f784f694934496a747a4f6a5536496d35515958526f496a747a4f6a4536496a67694f3331704f6a6b3759546f344f6e747a4f6a5136496d3568625755694f334d364d544136496c6468644756794946526863484d694f334d364e546f69615731685a3255694f334d364f446f69593246304f533571634763694f334d364d544536496d526c63324e796158423061573975496a747a4f6a4d324f446f695647686c49484e31634842736157567a4948646c49484e6c62477767615734676233567949484e3062334a6c494746795a5342765a694277636d567461585674494846315957787064486b675957356b494864706247776763325679646d55676557393149475a76636942355a57467963793467563255675a57357961574e6f494739316369425162485674596d6c755a7942546458427762476c6c63794254644739795a534276626d783549486470644767676447686c4948646c624777676447567a6447566b494731765a4756736379423361476c6a6143426f59585a6c4948647662694230636e567a64434268626d516759584a6c49477475623364754948526f59573572637942306279423061475670636942795a584e7063335268626d4e6c494852764947526c63484a6c59326c6864476c76626934675457396b5a584a75494746755a4342795a57787059574a735a5342306147563549486470624777675932463163325567655739314947357649485279623356696247567a49476c7549475a31636e526f5a5849675a5868776247397064474630615739754c694255636e567a64434276645849676347783162574a70626d63675a5868775a584a705a57356a5a534268626d51676432556764326c736243427164584e3061575a3549476c304c6941694f334d364f546f69634746795a57353058326c6b496a747a4f6a4536496a41694f334d364e446f69634746306143493759546f784f6e74704f6a4137637a6f784f694935496a7439637a6f7a4f694a7a645749694f334d364e6a6f69626d396663335669496a747a4f6a5536496d4e515958526f496a747a4f6a4536496a6b694f334d364e546f69626c4268644767694f334d364d546f694f53493766576b364d54413759546f344f6e747a4f6a5136496d3568625755694f334d364d544536496b466a5932567a633239796157567a496a747a4f6a5536496d6c745957646c496a747a4f6a6b36496d4e68644445774c6d70775a794937637a6f784d546f695a47567a59334a7063485270623234694f334d364d7a59334f694a556147556763335677634778705a584d67643255676332567362434270626942766458496763335276636d556759584a6c4947396d494842795a573170645730676358566862476c3065534268626d516764326c736243427a5a584a325a534235623355675a6d397949486c6c59584a7a4c6942585a53426c626e4a70593267676233567949464273645731696157356e49464e31634842736157567a49464e3062334a6c4947397562486b6764326c30614342306147556764325673624342305a584e305a5751676257396b5a57787a4948646f61574e6f49476868646d5567643239754948527964584e30494746755a434268636d5567613235766432346764476868626d747a494852764948526f5a576c7949484a6c63326c7a6447467559325567644738675a475677636d566a61574630615739754c69424e6232526c636d34675957356b49484a6c62476c68596d786c4948526f5a586b6764326c736243426a5958567a5a53423562335567626d386764484a7664574a735a584d67615734675a6e56796447686c6369426c6548427362326c3059585270623234754946527964584e30494739316369427762485674596d6c755a79426c6548426c636d6c6c626d4e6c494746755a4342335a5342336157787349477031633352705a6e6b6761585175496a747a4f6a6b36496e4268636d5675644639705a434937637a6f784f694977496a747a4f6a5136496e4268644767694f3245364d54703761546f774f334d364d6a6f694d5441694f33317a4f6a4d36496e4e3159694937637a6f324f694a756231397a645749694f334d364e546f6959314268644767694f334d364d6a6f694d5441694f334d364e546f69626c4268644767694f334d364d6a6f694d5441694f3331704f6a4d784f3245364f447037637a6f304f694a755957316c496a747a4f6a5536496b7876636d5674496a747a4f6a5536496d6c745957646c496a747a4f6a6736496e4e31596a4575616e426e496a747a4f6a45784f694a6b5a584e6a636d6c7764476c7662694937637a6f7a4e6a6336496c526f5a53427a6458427762476c6c637942335a53427a5a57787349476c75494739316369427a644739795a534268636d55676232596763484a6c62576c31625342786457467361585235494746755a4342336157787349484e6c636e5a6c49486c766453426d6233496765575668636e4d754946646c49475675636d6c6a61434276645849675547783162574a70626d636755335677634778705a584d6755335276636d556762323573655342336158526f4948526f5a5342335a5778734948526c6333526c5a4342746232526c62484d676432687059326767614746325a5342336232346764484a31633351675957356b494746795a534272626d3933626942306147467561334d67644738676447686c61584967636d567a61584e305957356a5a5342306279426b5a5842795a574e705958527062323475494531765a47567962694268626d5167636d567361574669624755676447686c655342336157787349474e6864584e6c49486c766453427562794230636d3931596d786c637942706269426d64584a306147567949475634634778766158526864476c766269346756484a31633351676233567949484273645731696157356e494756346347567961575675593255675957356b4948646c4948647062477767616e567a64476c6d65534270644334694f334d364f546f69634746795a57353058326c6b496a747a4f6a4536496a45694f334d364e446f69634746306143493759546f794f6e74704f6a4137637a6f784f694978496a74704f6a4537637a6f794f69497a4d53493766584d364d7a6f6963335669496a747a4f6a5936496d357658334e3159694937637a6f314f694a6a5547463061434937637a6f304f694978587a4d78496a747a4f6a5536496d35515958526f496a747a4f6a5136496a46664d7a45694f3331704f6a4d794f3245364f447037637a6f304f694a755957316c496a747a4f6a5536496b6c7763335674496a747a4f6a5536496d6c745957646c496a747a4f6a6736496e4e31596a4975616e426e496a747a4f6a45784f694a6b5a584e6a636d6c7764476c7662694937637a6f7a4e6a6736496c526f5a53427a6458427762476c6c637942335a53427a5a57787349476c75494739316369427a644739795a534268636d55676232596763484a6c62576c31625342786457467361585235494746755a4342336157787349484e6c636e5a6c49486c766453426d6233496765575668636e4d754946646c49475675636d6c6a61434276645849675547783162574a70626d636755335677634778705a584d6755335276636d556762323573655342336158526f4948526f5a5342335a5778734948526c6333526c5a4342746232526c62484d676432687059326767614746325a5342336232346764484a31633351675957356b494746795a534272626d3933626942306147467561334d67644738676447686c61584967636d567a61584e305957356a5a5342306279426b5a5842795a574e705958527062323475494531765a47567962694268626d5167636d567361574669624755676447686c655342336157787349474e6864584e6c49486c766453427562794230636d3931596d786c637942706269426d64584a306147567949475634634778766158526864476c766269346756484a31633351676233567949484273645731696157356e494756346347567961575675593255675957356b4948646c4948647062477767616e567a64476c6d6553427064433467496a747a4f6a6b36496e4268636d5675644639705a434937637a6f784f694978496a747a4f6a5136496e4268644767694f3245364d6a703761546f774f334d364d546f694d53493761546f784f334d364d6a6f694d7a49694f33317a4f6a4d36496e4e3159694937637a6f324f694a756231397a645749694f334d364e546f6959314268644767694f334d364e446f694d56387a4d694937637a6f314f694a755547463061434937637a6f304f694978587a4d79496a743961546f7a4d7a74684f6a673665334d364e446f69626d46745a534937637a6f314f694a456232787663694937637a6f314f694a706257466e5a534937637a6f344f694a7a6457497a4c6d70775a794937637a6f784d546f695a47567a59334a7063485270623234694f334d364d7a59334f694a556147556763335677634778705a584d67643255676332567362434270626942766458496763335276636d556759584a6c4947396d494842795a573170645730676358566862476c3065534268626d516764326c736243427a5a584a325a534235623355675a6d397949486c6c59584a7a4c6942585a53426c626e4a70593267676233567949464273645731696157356e49464e31634842736157567a49464e3062334a6c4947397562486b6764326c30614342306147556764325673624342305a584e305a5751676257396b5a57787a4948646f61574e6f49476868646d5567643239754948527964584e30494746755a434268636d5567613235766432346764476868626d747a494852764948526f5a576c7949484a6c63326c7a6447467559325567644738675a475677636d566a61574630615739754c69424e6232526c636d34675957356b49484a6c62476c68596d786c4948526f5a586b6764326c736243426a5958567a5a53423562335567626d386764484a7664574a735a584d67615734675a6e56796447686c6369426c6548427362326c3059585270623234754946527964584e30494739316369427762485674596d6c755a79426c6548426c636d6c6c626d4e6c494746755a4342335a5342336157787349477031633352705a6e6b6761585175496a747a4f6a6b36496e4268636d5675644639705a434937637a6f784f694978496a747a4f6a5136496e4268644767694f3245364d6a703761546f774f334d364d546f694d53493761546f784f334d364d6a6f694d7a4d694f33317a4f6a4d36496e4e3159694937637a6f324f694a756231397a645749694f334d364e546f6959314268644767694f334d364e446f694d56387a4d794937637a6f314f694a755547463061434937637a6f304f694978587a4d7a496a743961546f7a4e4474684f6a673665334d364e446f69626d46745a534937637a6f354f694a54615851675a58427a645730694f334d364e546f69615731685a3255694f334d364f446f69633356694e433571634763694f334d364d544536496d526c63324e796158423061573975496a747a4f6a4d324e7a6f695647686c49484e31634842736157567a4948646c49484e6c62477767615734676233567949484e3062334a6c494746795a5342765a694277636d567461585674494846315957787064486b675957356b494864706247776763325679646d55676557393149475a76636942355a57467963793467563255675a57357961574e6f494739316369425162485674596d6c755a7942546458427762476c6c63794254644739795a534276626d783549486470644767676447686c4948646c624777676447567a6447566b494731765a4756736379423361476c6a6143426f59585a6c4948647662694230636e567a64434268626d516759584a6c49477475623364754948526f59573572637942306279423061475670636942795a584e7063335268626d4e6c494852764947526c63484a6c59326c6864476c76626934675457396b5a584a75494746755a4342795a57787059574a735a5342306147563549486470624777675932463163325567655739314947357649485279623356696247567a49476c7549475a31636e526f5a5849675a5868776247397064474630615739754c694255636e567a64434276645849676347783162574a70626d63675a5868775a584a705a57356a5a534268626d51676432556764326c736243427164584e3061575a3549476c304c694937637a6f354f694a7759584a6c626e5266615751694f334d364d546f694d534937637a6f304f694a775958526f496a74684f6a493665326b364d44747a4f6a4536496a45694f326b364d54747a4f6a4936496a4d30496a7439637a6f7a4f694a7a645749694f334d364e6a6f69626d396663335669496a747a4f6a5536496d4e515958526f496a747a4f6a5136496a46664d7a51694f334d364e546f69626c4268644767694f334d364e446f694d56387a4e43493766576b364d7a553759546f344f6e747a4f6a5136496d3568625755694f334d364d544136496b52766247397961576c6a64584d694f334d364e546f69615731685a3255694f334d364f446f69633356694e533571634763694f334d364d544536496d526c63324e796158423061573975496a747a4f6a4d324f446f695647686c49484e31634842736157567a4948646c49484e6c62477767615734676233567949484e3062334a6c494746795a5342765a694277636d567461585674494846315957787064486b675957356b494864706247776763325679646d55676557393149475a76636942355a57467963793467563255675a57357961574e6f494739316369425162485674596d6c755a7942546458427762476c6c63794254644739795a534276626d783549486470644767676447686c4948646c624777676447567a6447566b494731765a4756736379423361476c6a6143426f59585a6c4948647662694230636e567a64434268626d516759584a6c49477475623364754948526f59573572637942306279423061475670636942795a584e7063335268626d4e6c494852764947526c63484a6c59326c6864476c76626934675457396b5a584a75494746755a4342795a57787059574a735a5342306147563549486470624777675932463163325567655739314947357649485279623356696247567a49476c7549475a31636e526f5a5849675a5868776247397064474630615739754c694255636e567a64434276645849676347783162574a70626d63675a5868775a584a705a57356a5a534268626d51676432556764326c736243427164584e3061575a3549476c304c6941694f334d364f546f69634746795a57353058326c6b496a747a4f6a4536496a49694f334d364e446f69634746306143493759546f794f6e74704f6a4137637a6f784f694979496a74704f6a4537637a6f794f69497a4e53493766584d364d7a6f6963335669496a747a4f6a5936496d357658334e3159694937637a6f314f694a6a5547463061434937637a6f304f694979587a4d31496a747a4f6a5536496d35515958526f496a747a4f6a5136496a4a664d7a55694f3331704f6a4d324f3245364f447037637a6f304f694a755957316c496a747a4f6a6336496c5a70646d467464584d694f334d364e546f69615731685a3255694f334d364f446f69633356694e693571634763694f334d364d544536496d526c63324e796158423061573975496a747a4f6a4d324e7a6f695647686c49484e31634842736157567a4948646c49484e6c62477767615734676233567949484e3062334a6c494746795a5342765a694277636d567461585674494846315957787064486b675957356b494864706247776763325679646d55676557393149475a76636942355a57467963793467563255675a57357961574e6f494739316369425162485674596d6c755a7942546458427762476c6c63794254644739795a534276626d783549486470644767676447686c4948646c624777676447567a6447566b494731765a4756736379423361476c6a6143426f59585a6c4948647662694230636e567a64434268626d516759584a6c49477475623364754948526f59573572637942306279423061475670636942795a584e7063335268626d4e6c494852764947526c63484a6c59326c6864476c76626934675457396b5a584a75494746755a4342795a57787059574a735a5342306147563549486470624777675932463163325567655739314947357649485279623356696247567a49476c7549475a31636e526f5a5849675a5868776247397064474630615739754c694255636e567a64434276645849676347783162574a70626d63675a5868775a584a705a57356a5a534268626d51676432556764326c736243427164584e3061575a3549476c304c694937637a6f354f694a7759584a6c626e5266615751694f334d364d546f694d694937637a6f304f694a775958526f496a74684f6a493665326b364d44747a4f6a4536496a49694f326b364d54747a4f6a4936496a4d32496a7439637a6f7a4f694a7a645749694f334d364e6a6f69626d396663335669496a747a4f6a5536496d4e515958526f496a747a4f6a5136496a4a664d7a59694f334d364e546f69626c4268644767694f334d364e446f694d6c387a4e69493766576b364d7a633759546f344f6e747a4f6a5136496d3568625755694f334d364e6a6f69546e567362474674496a747a4f6a5536496d6c745957646c496a747a4f6a6736496e4e31596a6375616e426e496a747a4f6a45784f694a6b5a584e6a636d6c7764476c7662694937637a6f7a4e6a6336496c526f5a53427a6458427762476c6c637942335a53427a5a57787349476c75494739316369427a644739795a534268636d55676232596763484a6c62576c31625342786457467361585235494746755a4342336157787349484e6c636e5a6c49486c766453426d6233496765575668636e4d754946646c49475675636d6c6a61434276645849675547783162574a70626d636755335677634778705a584d6755335276636d556762323573655342336158526f4948526f5a5342335a5778734948526c6333526c5a4342746232526c62484d676432687059326767614746325a5342336232346764484a31633351675957356b494746795a534272626d3933626942306147467561334d67644738676447686c61584967636d567a61584e305957356a5a5342306279426b5a5842795a574e705958527062323475494531765a47567962694268626d5167636d567361574669624755676447686c655342336157787349474e6864584e6c49486c766453427562794230636d3931596d786c637942706269426d64584a306147567949475634634778766158526864476c766269346756484a31633351676233567949484273645731696157356e494756346347567961575675593255675957356b4948646c4948647062477767616e567a64476c6d65534270644334694f334d364f546f69634746795a57353058326c6b496a747a4f6a4536496a49694f334d364e446f69634746306143493759546f794f6e74704f6a4137637a6f784f694979496a74704f6a4537637a6f794f69497a4e79493766584d364d7a6f6963335669496a747a4f6a5936496d357658334e3159694937637a6f314f694a6a5547463061434937637a6f304f694979587a4d33496a747a4f6a5536496d35515958526f496a747a4f6a5136496a4a664d7a63694f3331704f6a4d344f3245364f447037637a6f304f694a755957316c496a747a4f6a457a4f694a5761585a686258567a49475a6864574e70496a747a4f6a5536496d6c745957646c496a747a4f6a6736496e4e31596a6775616e426e496a747a4f6a45784f694a6b5a584e6a636d6c7764476c7662694937637a6f7a4e6a6736496c526f5a53427a6458427762476c6c637942335a53427a5a57787349476c75494739316369427a644739795a534268636d55676232596763484a6c62576c31625342786457467361585235494746755a4342336157787349484e6c636e5a6c49486c766453426d6233496765575668636e4d754946646c49475675636d6c6a61434276645849675547783162574a70626d636755335677634778705a584d6755335276636d556762323573655342336158526f4948526f5a5342335a5778734948526c6333526c5a4342746232526c62484d676432687059326767614746325a5342336232346764484a31633351675957356b494746795a534272626d3933626942306147467561334d67644738676447686c61584967636d567a61584e305957356a5a5342306279426b5a5842795a574e705958527062323475494531765a47567962694268626d5167636d567361574669624755676447686c655342336157787349474e6864584e6c49486c766453427562794230636d3931596d786c637942706269426d64584a306147567949475634634778766158526864476c766269346756484a31633351676233567949484273645731696157356e494756346347567961575675593255675957356b4948646c4948647062477767616e567a64476c6d6553427064433467496a747a4f6a6b36496e4268636d5675644639705a434937637a6f784f694979496a747a4f6a5136496e4268644767694f3245364d6a703761546f774f334d364d546f694d69493761546f784f334d364d6a6f694d7a67694f33317a4f6a4d36496e4e3159694937637a6f324f694a756231397a645749694f334d364e546f6959314268644767694f334d364e446f694d6c387a4f434937637a6f314f694a755547463061434937637a6f304f694979587a4d34496a743961546f7a4f5474684f6a673665334d364e446f69626d46745a534937637a6f784e446f69513356796333567a4947357063326b675a5851694f334d364e546f69615731685a3255694f334d364f446f69633356694f533571634763694f334d364d544536496d526c63324e796158423061573975496a747a4f6a4d324e7a6f695647686c49484e31634842736157567a4948646c49484e6c62477767615734676233567949484e3062334a6c494746795a5342765a694277636d567461585674494846315957787064486b675957356b494864706247776763325679646d55676557393149475a76636942355a57467963793467563255675a57357961574e6f494739316369425162485674596d6c755a7942546458427762476c6c63794254644739795a534276626d783549486470644767676447686c4948646c624777676447567a6447566b494731765a4756736379423361476c6a6143426f59585a6c4948647662694230636e567a64434268626d516759584a6c49477475623364754948526f59573572637942306279423061475670636942795a584e7063335268626d4e6c494852764947526c63484a6c59326c6864476c76626934675457396b5a584a75494746755a4342795a57787059574a735a5342306147563549486470624777675932463163325567655739314947357649485279623356696247567a49476c7549475a31636e526f5a5849675a5868776247397064474630615739754c694255636e567a64434276645849676347783162574a70626d63675a5868775a584a705a57356a5a534268626d51676432556764326c736243427164584e3061575a3549476c304c694937637a6f354f694a7759584a6c626e5266615751694f334d364d546f694d794937637a6f304f694a775958526f496a74684f6a493665326b364d44747a4f6a4536496a4d694f326b364d54747a4f6a4936496a4d35496a7439637a6f7a4f694a7a645749694f334d364e6a6f69626d396663335669496a747a4f6a5536496d4e515958526f496a747a4f6a5136496a4e664d7a6b694f334d364e546f69626c4268644767694f334d364e446f694d31387a4f53493766576b364e44413759546f344f6e747a4f6a5136496d3568625755694f334d364d545136496c5a70646d467464584d67593239755a33566c496a747a4f6a5536496d6c745957646c496a747a4f6a6b36496e4e31596a45774c6d70775a794937637a6f784d546f695a47567a59334a7063485270623234694f334d364d7a59334f694a556147556763335677634778705a584d67643255676332567362434270626942766458496763335276636d556759584a6c4947396d494842795a573170645730676358566862476c3065534268626d516764326c736243427a5a584a325a534235623355675a6d397949486c6c59584a7a4c6942585a53426c626e4a70593267676233567949464273645731696157356e49464e31634842736157567a49464e3062334a6c4947397562486b6764326c30614342306147556764325673624342305a584e305a5751676257396b5a57787a4948646f61574e6f49476868646d5567643239754948527964584e30494746755a434268636d5567613235766432346764476868626d747a494852764948526f5a576c7949484a6c63326c7a6447467559325567644738675a475677636d566a61574630615739754c69424e6232526c636d34675957356b49484a6c62476c68596d786c4948526f5a586b6764326c736243426a5958567a5a53423562335567626d386764484a7664574a735a584d67615734675a6e56796447686c6369426c6548427362326c3059585270623234754946527964584e30494739316369427762485674596d6c755a79426c6548426c636d6c6c626d4e6c494746755a4342335a5342336157787349477031633352705a6e6b6761585175496a747a4f6a6b36496e4268636d5675644639705a434937637a6f784f69497a496a747a4f6a5136496e4268644767694f3245364d6a703761546f774f334d364d546f694d79493761546f784f334d364d6a6f694e4441694f33317a4f6a4d36496e4e3159694937637a6f324f694a756231397a645749694f334d364e546f6959314268644767694f334d364e446f694d3138304d434937637a6f314f694a755547463061434937637a6f304f69497a587a5177496a743961546f304d5474684f6a673665334d364e446f69626d46745a534937637a6f784d6a6f695247467761574a316379426c62476c30496a747a4f6a5536496d6c745957646c496a747a4f6a6b36496e4e31596a45784c6d70775a794937637a6f784d546f695a47567a59334a7063485270623234694f334d364d7a59344f694a556147556763335677634778705a584d67643255676332567362434270626942766458496763335276636d556759584a6c4947396d494842795a573170645730676358566862476c3065534268626d516764326c736243427a5a584a325a534235623355675a6d397949486c6c59584a7a4c6942585a53426c626e4a70593267676233567949464273645731696157356e49464e31634842736157567a49464e3062334a6c4947397562486b6764326c30614342306147556764325673624342305a584e305a5751676257396b5a57787a4948646f61574e6f49476868646d5567643239754948527964584e30494746755a434268636d5567613235766432346764476868626d747a494852764948526f5a576c7949484a6c63326c7a6447467559325567644738675a475677636d566a61574630615739754c69424e6232526c636d34675957356b49484a6c62476c68596d786c4948526f5a586b6764326c736243426a5958567a5a53423562335567626d386764484a7664574a735a584d67615734675a6e56796447686c6369426c6548427362326c3059585270623234754946527964584e30494739316369427762485674596d6c755a79426c6548426c636d6c6c626d4e6c494746755a4342335a5342336157787349477031633352705a6e6b676158517549434937637a6f354f694a7759584a6c626e5266615751694f334d364d546f694d794937637a6f304f694a775958526f496a74684f6a493665326b364d44747a4f6a4536496a4d694f326b364d54747a4f6a4936496a5178496a7439637a6f7a4f694a7a645749694f334d364e6a6f69626d396663335669496a747a4f6a5536496d4e515958526f496a747a4f6a5136496a4e664e4445694f334d364e546f69626c4268644767694f334d364e446f694d3138304d53493766576b364e44493759546f344f6e747a4f6a5136496d3568625755694f334d364d544d36496c463161584e7864575567593239755a476b694f334d364e546f69615731685a3255694f334d364f546f69633356694d544975616e426e496a747a4f6a45784f694a6b5a584e6a636d6c7764476c7662694937637a6f7a4e6a6336496c526f5a53427a6458427762476c6c637942335a53427a5a57787349476c75494739316369427a644739795a534268636d55676232596763484a6c62576c31625342786457467361585235494746755a4342336157787349484e6c636e5a6c49486c766453426d6233496765575668636e4d754946646c49475675636d6c6a61434276645849675547783162574a70626d636755335677634778705a584d6755335276636d556762323573655342336158526f4948526f5a5342335a5778734948526c6333526c5a4342746232526c62484d676432687059326767614746325a5342336232346764484a31633351675957356b494746795a534272626d3933626942306147467561334d67644738676447686c61584967636d567a61584e305957356a5a5342306279426b5a5842795a574e705958527062323475494531765a47567962694268626d5167636d567361574669624755676447686c655342336157787349474e6864584e6c49486c766453427562794230636d3931596d786c637942706269426d64584a306147567949475634634778766158526864476c766269346756484a31633351676233567949484273645731696157356e494756346347567961575675593255675957356b4948646c4948647062477767616e567a64476c6d65534270644334694f334d364f546f69634746795a57353058326c6b496a747a4f6a4536496a51694f334d364e446f69634746306143493759546f794f6e74704f6a4137637a6f784f694930496a74704f6a4537637a6f794f6949304d69493766584d364d7a6f6963335669496a747a4f6a5936496d357658334e3159694937637a6f314f694a6a5547463061434937637a6f304f694930587a5179496a747a4f6a5536496d35515958526f496a747a4f6a5136496a52664e4449694f3331704f6a517a4f3245364f447037637a6f304f694a755957316c496a747a4f6a457a4f694a4d62334a6c6253426c5a32563049484e31496a747a4f6a5536496d6c745957646c496a747a4f6a6b36496e4e31596a457a4c6d70775a794937637a6f784d546f695a47567a59334a7063485270623234694f334d364d7a59334f694a556147556763335677634778705a584d67643255676332567362434270626942766458496763335276636d556759584a6c4947396d494842795a573170645730676358566862476c3065534268626d516764326c736243427a5a584a325a534235623355675a6d397949486c6c59584a7a4c6942585a53426c626e4a70593267676233567949464273645731696157356e49464e31634842736157567a49464e3062334a6c4947397562486b6764326c30614342306147556764325673624342305a584e305a5751676257396b5a57787a4948646f61574e6f49476868646d5567643239754948527964584e30494746755a434268636d5567613235766432346764476868626d747a494852764948526f5a576c7949484a6c63326c7a6447467559325567644738675a475677636d566a61574630615739754c69424e6232526c636d34675957356b49484a6c62476c68596d786c4948526f5a586b6764326c736243426a5958567a5a53423562335567626d386764484a7664574a735a584d67615734675a6e56796447686c6369426c6548427362326c3059585270623234754946527964584e30494739316369427762485674596d6c755a79426c6548426c636d6c6c626d4e6c494746755a4342335a5342336157787349477031633352705a6e6b6761585175496a747a4f6a6b36496e4268636d5675644639705a434937637a6f784f694930496a747a4f6a5136496e4268644767694f3245364d6a703761546f774f334d364d546f694e43493761546f784f334d364d6a6f694e444d694f33317a4f6a4d36496e4e3159694937637a6f324f694a756231397a645749694f334d364e546f6959314268644767694f334d364e446f694e4638304d794937637a6f314f694a755547463061434937637a6f304f694930587a517a496a743961546f304e4474684f6a673665334d364e446f69626d46745a534937637a6f784d546f69546e5673624746744947566e5a5851694f334d364e546f69615731685a3255694f334d364f546f69633356694d545175616e426e496a747a4f6a45784f694a6b5a584e6a636d6c7764476c7662694937637a6f7a4e6a6736496c526f5a53427a6458427762476c6c637942335a53427a5a57787349476c75494739316369427a644739795a534268636d55676232596763484a6c62576c31625342786457467361585235494746755a4342336157787349484e6c636e5a6c49486c766453426d6233496765575668636e4d754946646c49475675636d6c6a61434276645849675547783162574a70626d636755335677634778705a584d6755335276636d556762323573655342336158526f4948526f5a5342335a5778734948526c6333526c5a4342746232526c62484d676432687059326767614746325a5342336232346764484a31633351675957356b494746795a534272626d3933626942306147467561334d67644738676447686c61584967636d567a61584e305957356a5a5342306279426b5a5842795a574e705958527062323475494531765a47567962694268626d5167636d567361574669624755676447686c655342336157787349474e6864584e6c49486c766453427562794230636d3931596d786c637942706269426d64584a306147567949475634634778766158526864476c766269346756484a31633351676233567949484273645731696157356e494756346347567961575675593255675957356b4948646c4948647062477767616e567a64476c6d6553427064433467496a747a4f6a6b36496e4268636d5675644639705a434937637a6f784f694930496a747a4f6a5136496e4268644767694f3245364d6a703761546f774f334d364d546f694e43493761546f784f334d364d6a6f694e4451694f33317a4f6a4d36496e4e3159694937637a6f324f694a756231397a645749694f334d364e546f6959314268644767694f334d364e446f694e4638304e434937637a6f314f694a755547463061434937637a6f304f694930587a5130496a743961546f304e5474684f6a673665334d364e446f69626d46745a534937637a6f784d7a6f69526d466a6157787063326c7a4948423163694937637a6f314f694a706257466e5a534937637a6f354f694a7a645749784e533571634763694f334d364d544536496d526c63324e796158423061573975496a747a4f6a4d324e7a6f695647686c49484e31634842736157567a4948646c49484e6c62477767615734676233567949484e3062334a6c494746795a5342765a694277636d567461585674494846315957787064486b675957356b494864706247776763325679646d55676557393149475a76636942355a57467963793467563255675a57357961574e6f494739316369425162485674596d6c755a7942546458427762476c6c63794254644739795a534276626d783549486470644767676447686c4948646c624777676447567a6447566b494731765a4756736379423361476c6a6143426f59585a6c4948647662694230636e567a64434268626d516759584a6c49477475623364754948526f59573572637942306279423061475670636942795a584e7063335268626d4e6c494852764947526c63484a6c59326c6864476c76626934675457396b5a584a75494746755a4342795a57787059574a735a5342306147563549486470624777675932463163325567655739314947357649485279623356696247567a49476c7549475a31636e526f5a5849675a5868776247397064474630615739754c694255636e567a64434276645849676347783162574a70626d63675a5868775a584a705a57356a5a534268626d51676432556764326c736243427164584e3061575a3549476c304c694937637a6f354f694a7759584a6c626e5266615751694f334d364d546f694e534937637a6f304f694a775958526f496a74684f6a493665326b364d44747a4f6a4536496a55694f326b364d54747a4f6a4936496a5131496a7439637a6f7a4f694a7a645749694f334d364e6a6f69626d396663335669496a747a4f6a5536496d4e515958526f496a747a4f6a5136496a56664e4455694f334d364e546f69626c4268644767694f334d364e446f694e5638304e53493766576b364e44593759546f344f6e747a4f6a5136496d3568625755694f334d364d544136496b5a70626d6c6964584d6762576b694f334d364e546f69615731685a3255694f334d364f546f69633356694d545975616e426e496a747a4f6a45784f694a6b5a584e6a636d6c7764476c7662694937637a6f7a4e6a6336496c526f5a53427a6458427762476c6c637942335a53427a5a57787349476c75494739316369427a644739795a534268636d55676232596763484a6c62576c31625342786457467361585235494746755a4342336157787349484e6c636e5a6c49486c766453426d6233496765575668636e4d754946646c49475675636d6c6a61434276645849675547783162574a70626d636755335677634778705a584d6755335276636d556762323573655342336158526f4948526f5a5342335a5778734948526c6333526c5a4342746232526c62484d676432687059326767614746325a5342336232346764484a31633351675957356b494746795a534272626d3933626942306147467561334d67644738676447686c61584967636d567a61584e305957356a5a5342306279426b5a5842795a574e705958527062323475494531765a47567962694268626d5167636d567361574669624755676447686c655342336157787349474e6864584e6c49486c766453427562794230636d3931596d786c637942706269426d64584a306147567949475634634778766158526864476c766269346756484a31633351676233567949484273645731696157356e494756346347567961575675593255675957356b4948646c4948647062477767616e567a64476c6d65534270644334694f334d364f546f69634746795a57353058326c6b496a747a4f6a4536496a55694f334d364e446f69634746306143493759546f794f6e74704f6a4137637a6f784f694931496a74704f6a4537637a6f794f6949304e69493766584d364d7a6f6963335669496a747a4f6a5936496d357658334e3159694937637a6f314f694a6a5547463061434937637a6f304f694931587a5132496a747a4f6a5536496d35515958526f496a747a4f6a5136496a56664e4459694f333139637a6f794d546f6961584e665a47566c6347567a6446396a5958527a58324a3161577830496a74694f6a4137637a6f784d546f69634746795a57353058326830625777694f334d364d446f69496a747a4f6a45774f694a6a61476c735a46396f64473173496a747a4f6a413649694937637a6f784d446f6959335679636d5675644639705a43493761546f744d54747a4f6a45324f694a6c65474e6c63485270623235686246397361584e30496a74684f6a41366533317a4f6a5936496d356c643139705a434937546a747a4f6a45784f694a7063313968644852685932686c5a434937596a6f774f33317a5a584e7a6157397558324e76645735305a584a38596a6f784f324e31633352766257567963313970634639685a4752795a584e7a66484d364f546f694d5449334c6a41754d433478496a733d);

-- --------------------------------------------------------

--
-- Table structure for table `specials`
--

CREATE TABLE IF NOT EXISTS `specials` (
  `specials_id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL DEFAULT '0',
  `specials_new_products_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `specials_date_added` datetime DEFAULT NULL,
  `specials_last_modified` datetime DEFAULT NULL,
  `expires_date` date NOT NULL DEFAULT '0001-01-01',
  `date_status_change` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `specials_date_available` date NOT NULL DEFAULT '0001-01-01'
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `specials`
--

INSERT INTO `specials` (`specials_id`, `products_id`, `specials_new_products_price`, `specials_date_added`, `specials_last_modified`, `expires_date`, `date_status_change`, `status`, `specials_date_available`) VALUES
(1, 11, '522.4000', '0001-01-01 00:00:00', '0001-01-01 00:00:00', '2050-01-01', '0001-01-01 00:00:00', 1, '0001-01-01'),
(2, 12, '105.4000', '0001-01-01 00:00:00', '0001-01-01 00:00:00', '2050-01-01', '0001-01-01 00:00:00', 1, '0001-01-01'),
(3, 13, '514.2500', '0001-01-01 00:00:00', '0001-01-01 00:00:00', '2050-01-01', '0001-01-01 00:00:00', 1, '0001-01-01'),
(4, 14, '743.2500', '0001-01-01 00:00:00', '0001-01-01 00:00:00', '2050-01-01', '0001-01-01 00:00:00', 1, '0001-01-01'),
(5, 15, '213.5000', '0001-01-01 00:00:00', '0001-01-01 00:00:00', '2050-01-01', '0001-01-01 00:00:00', 1, '0001-01-01'),
(6, 16, '435.5000', '0001-01-01 00:00:00', '0001-01-01 00:00:00', '2050-01-01', '0001-01-01 00:00:00', 1, '0001-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `tax_class`
--

CREATE TABLE IF NOT EXISTS `tax_class` (
  `tax_class_id` int(11) NOT NULL,
  `tax_class_title` varchar(32) NOT NULL DEFAULT '',
  `tax_class_description` varchar(255) NOT NULL DEFAULT '',
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tax_class`
--

INSERT INTO `tax_class` (`tax_class_id`, `tax_class_title`, `tax_class_description`, `last_modified`, `date_added`) VALUES
(1, 'Taxable Goods', 'The following types of products are included: non-food, services, etc', NULL, '2022-10-05 21:04:03');

-- --------------------------------------------------------

--
-- Table structure for table `tax_rates`
--

CREATE TABLE IF NOT EXISTS `tax_rates` (
  `tax_rates_id` int(11) NOT NULL,
  `tax_zone_id` int(11) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL DEFAULT '0',
  `tax_priority` int(5) DEFAULT '1',
  `tax_rate` decimal(7,4) NOT NULL DEFAULT '0.0000',
  `tax_description` varchar(255) NOT NULL DEFAULT '',
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tax_rates`
--

INSERT INTO `tax_rates` (`tax_rates_id`, `tax_zone_id`, `tax_class_id`, `tax_priority`, `tax_rate`, `tax_description`, `last_modified`, `date_added`) VALUES
(1, 1, 1, 1, '7.0000', 'FL TAX 7.0%', '2022-10-05 21:04:03', '2022-10-05 21:04:03');

-- --------------------------------------------------------

--
-- Table structure for table `template_select`
--

CREATE TABLE IF NOT EXISTS `template_select` (
  `template_id` int(11) NOT NULL,
  `template_dir` varchar(64) NOT NULL DEFAULT '',
  `template_language` varchar(64) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `template_select`
--

INSERT INTO `template_select` (`template_id`, `template_dir`, `template_language`) VALUES
(1, 'theme002', '0');

-- --------------------------------------------------------

--
-- Table structure for table `upgrade_exceptions`
--

CREATE TABLE IF NOT EXISTS `upgrade_exceptions` (
  `upgrade_exception_id` smallint(5) NOT NULL,
  `sql_file` varchar(50) DEFAULT NULL,
  `reason` varchar(200) DEFAULT NULL,
  `errordate` datetime DEFAULT '0001-01-01 00:00:00',
  `sqlstatement` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `whos_online`
--

CREATE TABLE IF NOT EXISTS `whos_online` (
  `customer_id` int(11) DEFAULT NULL,
  `full_name` varchar(64) NOT NULL DEFAULT '',
  `session_id` varchar(128) NOT NULL DEFAULT '',
  `ip_address` varchar(20) NOT NULL DEFAULT '',
  `time_entry` varchar(14) NOT NULL DEFAULT '',
  `time_last_click` varchar(14) NOT NULL DEFAULT '',
  `last_page_url` varchar(255) NOT NULL DEFAULT '',
  `host_address` text NOT NULL,
  `user_agent` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `whos_online`
--

INSERT INTO `whos_online` (`customer_id`, `full_name`, `session_id`, `ip_address`, `time_entry`, `time_last_click`, `last_page_url`, `host_address`, `user_agent`) VALUES
(0, '&yen;Guest', 'tqhhoms85ou8ace8mod7mmoqv5', '127.0.0.1', '1665711673', '1665712415', '/site2/', 'OFFICE_IP_TO_HOST_ADDRESS', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:105.0) Gecko/20100101 Firefox/105.0');

-- --------------------------------------------------------

--
-- Table structure for table `zones`
--

CREATE TABLE IF NOT EXISTS `zones` (
  `zone_id` int(11) NOT NULL,
  `zone_country_id` int(11) NOT NULL DEFAULT '0',
  `zone_code` varchar(32) NOT NULL DEFAULT '',
  `zone_name` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=300 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `zones`
--

INSERT INTO `zones` (`zone_id`, `zone_country_id`, `zone_code`, `zone_name`) VALUES
(1, 223, 'AL', 'Alabama'),
(2, 223, 'AK', 'Alaska'),
(3, 223, 'AS', 'American Samoa'),
(4, 223, 'AZ', 'Arizona'),
(5, 223, 'AR', 'Arkansas'),
(7, 223, 'AA', 'Armed Forces Americas'),
(9, 223, 'AE', 'Armed Forces Europe'),
(11, 223, 'AP', 'Armed Forces Pacific'),
(12, 223, 'CA', 'California'),
(13, 223, 'CO', 'Colorado'),
(14, 223, 'CT', 'Connecticut'),
(15, 223, 'DE', 'Delaware'),
(16, 223, 'DC', 'District of Columbia'),
(17, 223, 'FM', 'Federated States Of Micronesia'),
(18, 223, 'FL', 'Florida'),
(19, 223, 'GA', 'Georgia'),
(20, 223, 'GU', 'Guam'),
(21, 223, 'HI', 'Hawaii'),
(22, 223, 'ID', 'Idaho'),
(23, 223, 'IL', 'Illinois'),
(24, 223, 'IN', 'Indiana'),
(25, 223, 'IA', 'Iowa'),
(26, 223, 'KS', 'Kansas'),
(27, 223, 'KY', 'Kentucky'),
(28, 223, 'LA', 'Louisiana'),
(29, 223, 'ME', 'Maine'),
(30, 223, 'MH', 'Marshall Islands'),
(31, 223, 'MD', 'Maryland'),
(32, 223, 'MA', 'Massachusetts'),
(33, 223, 'MI', 'Michigan'),
(34, 223, 'MN', 'Minnesota'),
(35, 223, 'MS', 'Mississippi'),
(36, 223, 'MO', 'Missouri'),
(37, 223, 'MT', 'Montana'),
(38, 223, 'NE', 'Nebraska'),
(39, 223, 'NV', 'Nevada'),
(40, 223, 'NH', 'New Hampshire'),
(41, 223, 'NJ', 'New Jersey'),
(42, 223, 'NM', 'New Mexico'),
(43, 223, 'NY', 'New York'),
(44, 223, 'NC', 'North Carolina'),
(45, 223, 'ND', 'North Dakota'),
(46, 223, 'MP', 'Northern Mariana Islands'),
(47, 223, 'OH', 'Ohio'),
(48, 223, 'OK', 'Oklahoma'),
(49, 223, 'OR', 'Oregon'),
(50, 163, 'PW', 'Palau'),
(51, 223, 'PA', 'Pennsylvania'),
(52, 223, 'PR', 'Puerto Rico'),
(53, 223, 'RI', 'Rhode Island'),
(54, 223, 'SC', 'South Carolina'),
(55, 223, 'SD', 'South Dakota'),
(56, 223, 'TN', 'Tennessee'),
(57, 223, 'TX', 'Texas'),
(58, 223, 'UT', 'Utah'),
(59, 223, 'VT', 'Vermont'),
(60, 223, 'VI', 'Virgin Islands'),
(61, 223, 'VA', 'Virginia'),
(62, 223, 'WA', 'Washington'),
(63, 223, 'WV', 'West Virginia'),
(64, 223, 'WI', 'Wisconsin'),
(65, 223, 'WY', 'Wyoming'),
(66, 38, 'AB', 'Alberta'),
(67, 38, 'BC', 'British Columbia'),
(68, 38, 'MB', 'Manitoba'),
(69, 38, 'NL', 'Newfoundland'),
(70, 38, 'NB', 'New Brunswick'),
(71, 38, 'NS', 'Nova Scotia'),
(72, 38, 'NT', 'Northwest Territories'),
(73, 38, 'NU', 'Nunavut'),
(74, 38, 'ON', 'Ontario'),
(75, 38, 'PE', 'Prince Edward Island'),
(76, 38, 'QC', 'Quebec'),
(77, 38, 'SK', 'Saskatchewan'),
(78, 38, 'YT', 'Yukon Territory'),
(79, 81, 'NDS', 'Niedersachsen'),
(80, 81, 'BAW', 'Baden Württemberg'),
(81, 81, 'BAY', 'Bayern'),
(82, 81, 'BER', 'Berlin'),
(83, 81, 'BRG', 'Brandenburg'),
(84, 81, 'BRE', 'Bremen'),
(85, 81, 'HAM', 'Hamburg'),
(86, 81, 'HES', 'Hessen'),
(87, 81, 'MEC', 'Mecklenburg-Vorpommern'),
(88, 81, 'NRW', 'Nordrhein-Westfalen'),
(89, 81, 'RHE', 'Rheinland-Pfalz'),
(90, 81, 'SAR', 'Saarland'),
(91, 81, 'SAS', 'Sachsen'),
(92, 81, 'SAC', 'Sachsen-Anhalt'),
(93, 81, 'SCN', 'Schleswig-Holstein'),
(94, 81, 'THE', 'Thüringen'),
(95, 14, 'WI', 'Wien'),
(96, 14, 'NO', 'Niederösterreich'),
(97, 14, 'OO', 'Oberösterreich'),
(98, 14, 'SB', 'Salzburg'),
(99, 14, 'KN', 'Kärnten'),
(100, 14, 'ST', 'Steiermark'),
(101, 14, 'TI', 'Tirol'),
(102, 14, 'BL', 'Burgenland'),
(103, 14, 'VB', 'Voralberg'),
(104, 204, 'AG', 'Aargau'),
(105, 204, 'AI', 'Appenzell Innerrhoden'),
(106, 204, 'AR', 'Appenzell Ausserrhoden'),
(107, 204, 'BE', 'Bern'),
(108, 204, 'BL', 'Basel-Landschaft'),
(109, 204, 'BS', 'Basel-Stadt'),
(110, 204, 'FR', 'Freiburg'),
(111, 204, 'GE', 'Genf'),
(112, 204, 'GL', 'Glarus'),
(113, 204, 'JU', 'Graubnden'),
(114, 204, 'JU', 'Jura'),
(115, 204, 'LU', 'Luzern'),
(116, 204, 'NE', 'Neuenburg'),
(117, 204, 'NW', 'Nidwalden'),
(118, 204, 'OW', 'Obwalden'),
(119, 204, 'SG', 'St. Gallen'),
(120, 204, 'SH', 'Schaffhausen'),
(121, 204, 'SO', 'Solothurn'),
(122, 204, 'SZ', 'Schwyz'),
(123, 204, 'TG', 'Thurgau'),
(124, 204, 'TI', 'Tessin'),
(125, 204, 'UR', 'Uri'),
(126, 204, 'VD', 'Waadt'),
(127, 204, 'VS', 'Wallis'),
(128, 204, 'ZG', 'Zug'),
(129, 204, 'ZH', 'Zürich'),
(130, 195, 'A Coruña', 'A Coruña'),
(131, 195, 'Álava', 'Álava'),
(132, 195, 'Albacete', 'Albacete'),
(133, 195, 'Alicante', 'Alicante'),
(134, 195, 'Almería', 'Almería'),
(135, 195, 'Asturias', 'Asturias'),
(136, 195, 'Ávila', 'Ávila'),
(137, 195, 'Badajoz', 'Badajoz'),
(138, 195, 'Baleares', 'Baleares'),
(139, 195, 'Barcelona', 'Barcelona'),
(140, 195, 'Burgos', 'Burgos'),
(141, 195, 'Cáceres', 'Cáceres'),
(142, 195, 'Cádiz', 'Cádiz'),
(143, 195, 'Cantabria', 'Cantabria'),
(144, 195, 'Castellón', 'Castellón'),
(145, 195, 'Ceuta', 'Ceuta'),
(146, 195, 'Ciudad Real', 'Ciudad Real'),
(147, 195, 'Córdoba', 'Córdoba'),
(148, 195, 'Cuenca', 'Cuenca'),
(149, 195, 'Girona', 'Girona'),
(150, 195, 'Granada', 'Granada'),
(151, 195, 'Guadalajara', 'Guadalajara'),
(152, 195, 'Guipúzcoa', 'Guipúzcoa'),
(153, 195, 'Huelva', 'Huelva'),
(154, 195, 'Huesca', 'Huesca'),
(155, 195, 'Jaén', 'Jaén'),
(156, 195, 'La Rioja', 'La Rioja'),
(157, 195, 'Las Palmas', 'Las Palmas'),
(158, 195, 'León', 'León'),
(159, 195, 'Lérida', 'Lérida'),
(160, 195, 'Lugo', 'Lugo'),
(161, 195, 'Madrid', 'Madrid'),
(162, 195, 'Málaga', 'Málaga'),
(163, 195, 'Melilla', 'Melilla'),
(164, 195, 'Murcia', 'Murcia'),
(165, 195, 'Navarra', 'Navarra'),
(166, 195, 'Ourense', 'Ourense'),
(167, 195, 'Palencia', 'Palencia'),
(168, 195, 'Pontevedra', 'Pontevedra'),
(169, 195, 'Salamanca', 'Salamanca'),
(170, 195, 'Santa Cruz de Tenerife', 'Santa Cruz de Tenerife'),
(171, 195, 'Segovia', 'Segovia'),
(172, 195, 'Sevilla', 'Sevilla'),
(173, 195, 'Soria', 'Soria'),
(174, 195, 'Tarragona', 'Tarragona'),
(175, 195, 'Teruel', 'Teruel'),
(176, 195, 'Toledo', 'Toledo'),
(177, 195, 'Valencia', 'Valencia'),
(178, 195, 'Valladolid', 'Valladolid'),
(179, 195, 'Vizcaya', 'Vizcaya'),
(180, 195, 'Zamora', 'Zamora'),
(181, 195, 'Zaragoza', 'Zaragoza'),
(182, 13, 'ACT', 'Australian Capital Territory'),
(183, 13, 'NSW', 'New South Wales'),
(184, 13, 'NT', 'Northern Territory'),
(185, 13, 'QLD', 'Queensland'),
(186, 13, 'SA', 'South Australia'),
(187, 13, 'TAS', 'Tasmania'),
(188, 13, 'VIC', 'Victoria'),
(189, 13, 'WA', 'Western Australia'),
(190, 105, 'AG', 'Agrigento'),
(191, 105, 'AL', 'Alessandria'),
(192, 105, 'AN', 'Ancona'),
(193, 105, 'AO', 'Aosta'),
(194, 105, 'AR', 'Arezzo'),
(195, 105, 'AP', 'Ascoli Piceno'),
(196, 105, 'AT', 'Asti'),
(197, 105, 'AV', 'Avellino'),
(198, 105, 'BA', 'Bari'),
(199, 105, 'BT', 'Barletta Andria Trani'),
(200, 105, 'BL', 'Belluno'),
(201, 105, 'BN', 'Benevento'),
(202, 105, 'BG', 'Bergamo'),
(203, 105, 'BI', 'Biella'),
(204, 105, 'BO', 'Bologna'),
(205, 105, 'BZ', 'Bolzano'),
(206, 105, 'BS', 'Brescia'),
(207, 105, 'BR', 'Brindisi'),
(208, 105, 'CA', 'Cagliari'),
(209, 105, 'CL', 'Caltanissetta'),
(210, 105, 'CB', 'Campobasso'),
(211, 105, 'CI', 'Carbonia-Iglesias'),
(212, 105, 'CE', 'Caserta'),
(213, 105, 'CT', 'Catania'),
(214, 105, 'CZ', 'Catanzaro'),
(215, 105, 'CH', 'Chieti'),
(216, 105, 'CO', 'Como'),
(217, 105, 'CS', 'Cosenza'),
(218, 105, 'CR', 'Cremona'),
(219, 105, 'KR', 'Crotone'),
(220, 105, 'CN', 'Cuneo'),
(221, 105, 'EN', 'Enna'),
(222, 105, 'FM', 'Fermo'),
(223, 105, 'FE', 'Ferrara'),
(224, 105, 'FI', 'Firenze'),
(225, 105, 'FG', 'Foggia'),
(226, 105, 'FC', 'Forlì Cesena'),
(227, 105, 'FR', 'Frosinone'),
(228, 105, 'GE', 'Genova'),
(229, 105, 'GO', 'Gorizia'),
(230, 105, 'GR', 'Grosseto'),
(231, 105, 'IM', 'Imperia'),
(232, 105, 'IS', 'Isernia'),
(233, 105, 'AQ', 'Aquila'),
(234, 105, 'SP', 'La Spezia'),
(235, 105, 'LT', 'Latina'),
(236, 105, 'LE', 'Lecce'),
(237, 105, 'LC', 'Lecco'),
(238, 105, 'LI', 'Livorno'),
(239, 105, 'LO', 'Lodi'),
(240, 105, 'LU', 'Lucca'),
(241, 105, 'MC', 'Macerata'),
(242, 105, 'MN', 'Mantova'),
(243, 105, 'MS', 'Massa Carrara'),
(244, 105, 'MT', 'Matera'),
(245, 105, 'VS', 'Medio Campidano'),
(246, 105, 'ME', 'Messina'),
(247, 105, 'MI', 'Milano'),
(248, 105, 'MO', 'Modena'),
(249, 105, 'MB', 'Monza e Brianza'),
(250, 105, 'NA', 'Napoli'),
(251, 105, 'NO', 'Novara'),
(252, 105, 'NU', 'Nuoro'),
(253, 105, 'OG', 'Ogliastra'),
(254, 105, 'OT', 'Olbia-Tempio'),
(255, 105, 'OR', 'Oristano'),
(256, 105, 'PD', 'Padova'),
(257, 105, 'PA', 'Palermo'),
(258, 105, 'PR', 'Parma'),
(259, 105, 'PG', 'Perugia'),
(260, 105, 'PV', 'Pavia'),
(261, 105, 'PU', 'Pesaro Urbino'),
(262, 105, 'PE', 'Pescara'),
(263, 105, 'PC', 'Piacenza'),
(264, 105, 'PI', 'Pisa'),
(265, 105, 'PT', 'Pistoia'),
(266, 105, 'PN', 'Pordenone'),
(267, 105, 'PZ', 'Potenza'),
(268, 105, 'PO', 'Prato'),
(269, 105, 'RG', 'Ragusa'),
(270, 105, 'RA', 'Ravenna'),
(271, 105, 'RC', 'Reggio Calabria'),
(272, 105, 'RE', 'Reggio Emilia'),
(273, 105, 'RI', 'Rieti'),
(274, 105, 'RN', 'Rimini'),
(275, 105, 'RM', 'Roma'),
(276, 105, 'RO', 'Rovigo'),
(277, 105, 'SA', 'Salerno'),
(278, 105, 'SS', 'Sassari'),
(279, 105, 'SV', 'Savona'),
(280, 105, 'SI', 'Siena'),
(281, 105, 'SR', 'Siracusa'),
(282, 105, 'SO', 'Sondrio'),
(283, 105, 'TA', 'Taranto'),
(284, 105, 'TE', 'Teramo'),
(285, 105, 'TR', 'Terni'),
(286, 105, 'TO', 'Torino'),
(287, 105, 'TP', 'Trapani'),
(288, 105, 'TN', 'Trento'),
(289, 105, 'TV', 'Treviso'),
(290, 105, 'TS', 'Trieste'),
(291, 105, 'UD', 'Udine'),
(292, 105, 'VA', 'Varese'),
(293, 105, 'VE', 'Venezia'),
(294, 105, 'VB', 'Verbania'),
(295, 105, 'VC', 'Vercelli'),
(296, 105, 'VR', 'Verona'),
(297, 105, 'VV', 'Vibo Valentia'),
(298, 105, 'VI', 'Vicenza'),
(299, 105, 'VT', 'Viterbo');

-- --------------------------------------------------------

--
-- Table structure for table `zones_to_geo_zones`
--

CREATE TABLE IF NOT EXISTS `zones_to_geo_zones` (
  `association_id` int(11) NOT NULL,
  `zone_country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) DEFAULT NULL,
  `geo_zone_id` int(11) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0001-01-01 00:00:00'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `zones_to_geo_zones`
--

INSERT INTO `zones_to_geo_zones` (`association_id`, `zone_country_id`, `zone_id`, `geo_zone_id`, `last_modified`, `date_added`) VALUES
(1, 223, 18, 1, NULL, '2022-10-05 21:04:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address_book`
--
ALTER TABLE `address_book`
  ADD PRIMARY KEY (`address_book_id`), ADD KEY `idx_address_book_customers_id_zen` (`customers_id`);

--
-- Indexes for table `address_format`
--
ALTER TABLE `address_format`
  ADD PRIMARY KEY (`address_format_id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`), ADD KEY `idx_admin_name_zen` (`admin_name`), ADD KEY `idx_admin_email_zen` (`admin_email`), ADD KEY `idx_admin_profile_zen` (`admin_profile`);

--
-- Indexes for table `admin_activity_log`
--
ALTER TABLE `admin_activity_log`
  ADD PRIMARY KEY (`log_id`), ADD KEY `idx_page_accessed_zen` (`page_accessed`), ADD KEY `idx_access_date_zen` (`access_date`), ADD KEY `idx_flagged_zen` (`flagged`), ADD KEY `idx_ip_zen` (`ip_address`);

--
-- Indexes for table `admin_menus`
--
ALTER TABLE `admin_menus`
  ADD UNIQUE KEY `menu_key` (`menu_key`);

--
-- Indexes for table `admin_pages`
--
ALTER TABLE `admin_pages`
  ADD UNIQUE KEY `page_key` (`page_key`);

--
-- Indexes for table `admin_pages_to_profiles`
--
ALTER TABLE `admin_pages_to_profiles`
  ADD UNIQUE KEY `profile_page` (`profile_id`,`page_key`), ADD UNIQUE KEY `page_profile` (`page_key`,`profile_id`);

--
-- Indexes for table `admin_profiles`
--
ALTER TABLE `admin_profiles`
  ADD PRIMARY KEY (`profile_id`);

--
-- Indexes for table `authorizenet`
--
ALTER TABLE `authorizenet`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`banners_id`), ADD KEY `idx_status_group_zen` (`status`,`banners_group`), ADD KEY `idx_expires_date_zen` (`expires_date`), ADD KEY `idx_date_scheduled_zen` (`date_scheduled`);

--
-- Indexes for table `banners_history`
--
ALTER TABLE `banners_history`
  ADD PRIMARY KEY (`banners_history_id`), ADD KEY `idx_banners_id_zen` (`banners_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categories_id`), ADD KEY `idx_parent_id_cat_id_zen` (`parent_id`,`categories_id`), ADD KEY `idx_status_zen` (`categories_status`), ADD KEY `idx_sort_order_zen` (`sort_order`);

--
-- Indexes for table `categories_description`
--
ALTER TABLE `categories_description`
  ADD PRIMARY KEY (`categories_id`,`language_id`), ADD KEY `idx_categories_name_zen` (`categories_name`);

--
-- Indexes for table `configuration`
--
ALTER TABLE `configuration`
  ADD PRIMARY KEY (`configuration_id`), ADD UNIQUE KEY `unq_config_key_zen` (`configuration_key`), ADD KEY `idx_key_value_zen` (`configuration_key`,`configuration_value`(10)), ADD KEY `idx_cfg_grp_id_zen` (`configuration_group_id`);

--
-- Indexes for table `configuration_group`
--
ALTER TABLE `configuration_group`
  ADD PRIMARY KEY (`configuration_group_id`), ADD KEY `idx_visible_zen` (`visible`);

--
-- Indexes for table `counter_history`
--
ALTER TABLE `counter_history`
  ADD PRIMARY KEY (`startdate`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`countries_id`), ADD KEY `idx_countries_name_zen` (`countries_name`), ADD KEY `idx_address_format_id_zen` (`address_format_id`), ADD KEY `idx_iso_2_zen` (`countries_iso_code_2`), ADD KEY `idx_iso_3_zen` (`countries_iso_code_3`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`coupon_id`), ADD KEY `idx_active_type_zen` (`coupon_active`,`coupon_type`), ADD KEY `idx_coupon_code_zen` (`coupon_code`), ADD KEY `idx_coupon_type_zen` (`coupon_type`);

--
-- Indexes for table `coupons_description`
--
ALTER TABLE `coupons_description`
  ADD PRIMARY KEY (`coupon_id`,`language_id`);

--
-- Indexes for table `coupon_email_track`
--
ALTER TABLE `coupon_email_track`
  ADD PRIMARY KEY (`unique_id`), ADD KEY `idx_coupon_id_zen` (`coupon_id`);

--
-- Indexes for table `coupon_gv_customer`
--
ALTER TABLE `coupon_gv_customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `coupon_gv_queue`
--
ALTER TABLE `coupon_gv_queue`
  ADD PRIMARY KEY (`unique_id`), ADD KEY `idx_cust_id_order_id_zen` (`customer_id`,`order_id`), ADD KEY `idx_release_flag_zen` (`release_flag`);

--
-- Indexes for table `coupon_redeem_track`
--
ALTER TABLE `coupon_redeem_track`
  ADD PRIMARY KEY (`unique_id`), ADD KEY `idx_coupon_id_zen` (`coupon_id`);

--
-- Indexes for table `coupon_restrict`
--
ALTER TABLE `coupon_restrict`
  ADD PRIMARY KEY (`restrict_id`), ADD KEY `idx_coup_id_prod_id_zen` (`coupon_id`,`product_id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`currencies_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customers_id`), ADD KEY `idx_email_address_zen` (`customers_email_address`), ADD KEY `idx_referral_zen` (`customers_referral`(10)), ADD KEY `idx_grp_pricing_zen` (`customers_group_pricing`), ADD KEY `idx_nick_zen` (`customers_nick`), ADD KEY `idx_newsletter_zen` (`customers_newsletter`);

--
-- Indexes for table `customers_basket`
--
ALTER TABLE `customers_basket`
  ADD PRIMARY KEY (`customers_basket_id`), ADD KEY `idx_customers_id_zen` (`customers_id`);

--
-- Indexes for table `customers_basket_attributes`
--
ALTER TABLE `customers_basket_attributes`
  ADD PRIMARY KEY (`customers_basket_attributes_id`), ADD KEY `idx_cust_id_prod_id_zen` (`customers_id`,`products_id`(36));

--
-- Indexes for table `customers_info`
--
ALTER TABLE `customers_info`
  ADD PRIMARY KEY (`customers_info_id`);

--
-- Indexes for table `db_cache`
--
ALTER TABLE `db_cache`
  ADD PRIMARY KEY (`cache_entry_name`);

--
-- Indexes for table `email_archive`
--
ALTER TABLE `email_archive`
  ADD PRIMARY KEY (`archive_id`), ADD KEY `idx_email_to_address_zen` (`email_to_address`), ADD KEY `idx_module_zen` (`module`);

--
-- Indexes for table `ezpages`
--
ALTER TABLE `ezpages`
  ADD PRIMARY KEY (`pages_id`), ADD KEY `idx_lang_id_zen` (`languages_id`), ADD KEY `idx_ezp_status_header_zen` (`status_header`), ADD KEY `idx_ezp_status_sidebox_zen` (`status_sidebox`), ADD KEY `idx_ezp_status_footer_zen` (`status_footer`), ADD KEY `idx_ezp_status_toc_zen` (`status_toc`);

--
-- Indexes for table `featured`
--
ALTER TABLE `featured`
  ADD PRIMARY KEY (`featured_id`), ADD KEY `idx_status_zen` (`status`), ADD KEY `idx_products_id_zen` (`products_id`), ADD KEY `idx_date_avail_zen` (`featured_date_available`), ADD KEY `idx_expires_date_zen` (`expires_date`);

--
-- Indexes for table `files_uploaded`
--
ALTER TABLE `files_uploaded`
  ADD PRIMARY KEY (`files_uploaded_id`), ADD KEY `idx_customers_id_zen` (`customers_id`);

--
-- Indexes for table `geo_zones`
--
ALTER TABLE `geo_zones`
  ADD PRIMARY KEY (`geo_zone_id`);

--
-- Indexes for table `get_terms_to_filter`
--
ALTER TABLE `get_terms_to_filter`
  ADD PRIMARY KEY (`get_term_name`);

--
-- Indexes for table `group_pricing`
--
ALTER TABLE `group_pricing`
  ADD PRIMARY KEY (`group_id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`languages_id`), ADD KEY `idx_languages_name_zen` (`name`);

--
-- Indexes for table `layout_boxes`
--
ALTER TABLE `layout_boxes`
  ADD PRIMARY KEY (`layout_id`), ADD KEY `idx_name_template_zen` (`layout_template`,`layout_box_name`), ADD KEY `idx_layout_box_status_zen` (`layout_box_status`), ADD KEY `idx_layout_box_sort_order_zen` (`layout_box_sort_order`);

--
-- Indexes for table `manufacturers`
--
ALTER TABLE `manufacturers`
  ADD PRIMARY KEY (`manufacturers_id`), ADD KEY `idx_mfg_name_zen` (`manufacturers_name`);

--
-- Indexes for table `manufacturers_info`
--
ALTER TABLE `manufacturers_info`
  ADD PRIMARY KEY (`manufacturers_id`,`languages_id`);

--
-- Indexes for table `media_clips`
--
ALTER TABLE `media_clips`
  ADD PRIMARY KEY (`clip_id`), ADD KEY `idx_media_id_zen` (`media_id`), ADD KEY `idx_clip_type_zen` (`clip_type`);

--
-- Indexes for table `media_manager`
--
ALTER TABLE `media_manager`
  ADD PRIMARY KEY (`media_id`), ADD KEY `idx_media_name_zen` (`media_name`);

--
-- Indexes for table `media_to_products`
--
ALTER TABLE `media_to_products`
  ADD KEY `idx_media_product_zen` (`media_id`,`product_id`);

--
-- Indexes for table `media_types`
--
ALTER TABLE `media_types`
  ADD PRIMARY KEY (`type_id`), ADD KEY `idx_type_name_zen` (`type_name`);

--
-- Indexes for table `meta_tags_categories_description`
--
ALTER TABLE `meta_tags_categories_description`
  ADD PRIMARY KEY (`categories_id`,`language_id`);

--
-- Indexes for table `meta_tags_products_description`
--
ALTER TABLE `meta_tags_products_description`
  ADD PRIMARY KEY (`products_id`,`language_id`);

--
-- Indexes for table `music_genre`
--
ALTER TABLE `music_genre`
  ADD PRIMARY KEY (`music_genre_id`), ADD KEY `idx_music_genre_name_zen` (`music_genre_name`);

--
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`newsletters_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orders_id`), ADD KEY `idx_status_orders_cust_zen` (`orders_status`,`orders_id`,`customers_id`), ADD KEY `idx_date_purchased_zen` (`date_purchased`), ADD KEY `idx_cust_id_orders_id_zen` (`customers_id`,`orders_id`);

--
-- Indexes for table `orders_products`
--
ALTER TABLE `orders_products`
  ADD PRIMARY KEY (`orders_products_id`), ADD KEY `idx_orders_id_prod_id_zen` (`orders_id`,`products_id`), ADD KEY `idx_prod_id_orders_id_zen` (`products_id`,`orders_id`);

--
-- Indexes for table `orders_products_attributes`
--
ALTER TABLE `orders_products_attributes`
  ADD PRIMARY KEY (`orders_products_attributes_id`), ADD KEY `idx_orders_id_prod_id_zen` (`orders_id`,`orders_products_id`);

--
-- Indexes for table `orders_products_download`
--
ALTER TABLE `orders_products_download`
  ADD PRIMARY KEY (`orders_products_download_id`), ADD KEY `idx_orders_id_zen` (`orders_id`), ADD KEY `idx_orders_products_id_zen` (`orders_products_id`);

--
-- Indexes for table `orders_status`
--
ALTER TABLE `orders_status`
  ADD PRIMARY KEY (`orders_status_id`,`language_id`), ADD KEY `idx_orders_status_name_zen` (`orders_status_name`);

--
-- Indexes for table `orders_status_history`
--
ALTER TABLE `orders_status_history`
  ADD PRIMARY KEY (`orders_status_history_id`), ADD KEY `idx_orders_id_status_id_zen` (`orders_id`,`orders_status_id`);

--
-- Indexes for table `orders_total`
--
ALTER TABLE `orders_total`
  ADD PRIMARY KEY (`orders_total_id`), ADD KEY `idx_ot_orders_id_zen` (`orders_id`), ADD KEY `idx_ot_class_zen` (`class`);

--
-- Indexes for table `paypal`
--
ALTER TABLE `paypal`
  ADD PRIMARY KEY (`paypal_ipn_id`,`txn_id`), ADD KEY `idx_order_id_zen` (`order_id`);

--
-- Indexes for table `paypal_payment_status`
--
ALTER TABLE `paypal_payment_status`
  ADD PRIMARY KEY (`payment_status_id`);

--
-- Indexes for table `paypal_payment_status_history`
--
ALTER TABLE `paypal_payment_status_history`
  ADD PRIMARY KEY (`payment_status_history_id`), ADD KEY `idx_paypal_ipn_id_zen` (`paypal_ipn_id`);

--
-- Indexes for table `paypal_session`
--
ALTER TABLE `paypal_session`
  ADD PRIMARY KEY (`unique_id`), ADD KEY `idx_session_id_zen` (`session_id`(36));

--
-- Indexes for table `paypal_testing`
--
ALTER TABLE `paypal_testing`
  ADD PRIMARY KEY (`paypal_ipn_id`,`txn_id`), ADD KEY `idx_order_id_zen` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`products_id`), ADD KEY `idx_products_date_added_zen` (`products_date_added`), ADD KEY `idx_products_status_zen` (`products_status`), ADD KEY `idx_products_date_available_zen` (`products_date_available`), ADD KEY `idx_products_ordered_zen` (`products_ordered`), ADD KEY `idx_products_model_zen` (`products_model`), ADD KEY `idx_products_price_sorter_zen` (`products_price_sorter`), ADD KEY `idx_master_categories_id_zen` (`master_categories_id`), ADD KEY `idx_products_sort_order_zen` (`products_sort_order`), ADD KEY `idx_manufacturers_id_zen` (`manufacturers_id`);

--
-- Indexes for table `products_attributes`
--
ALTER TABLE `products_attributes`
  ADD PRIMARY KEY (`products_attributes_id`), ADD KEY `idx_id_options_id_values_zen` (`products_id`,`options_id`,`options_values_id`), ADD KEY `idx_opt_sort_order_zen` (`products_options_sort_order`);

--
-- Indexes for table `products_attributes_download`
--
ALTER TABLE `products_attributes_download`
  ADD PRIMARY KEY (`products_attributes_id`);

--
-- Indexes for table `products_description`
--
ALTER TABLE `products_description`
  ADD PRIMARY KEY (`products_id`,`language_id`), ADD KEY `idx_products_name_zen` (`products_name`);

--
-- Indexes for table `products_discount_quantity`
--
ALTER TABLE `products_discount_quantity`
  ADD KEY `idx_id_qty_zen` (`products_id`,`discount_qty`);

--
-- Indexes for table `products_notifications`
--
ALTER TABLE `products_notifications`
  ADD PRIMARY KEY (`products_id`,`customers_id`);

--
-- Indexes for table `products_options`
--
ALTER TABLE `products_options`
  ADD PRIMARY KEY (`products_options_id`,`language_id`), ADD KEY `idx_lang_id_zen` (`language_id`), ADD KEY `idx_products_options_sort_order_zen` (`products_options_sort_order`), ADD KEY `idx_products_options_name_zen` (`products_options_name`);

--
-- Indexes for table `products_options_types`
--
ALTER TABLE `products_options_types`
  ADD PRIMARY KEY (`products_options_types_id`);

--
-- Indexes for table `products_options_values`
--
ALTER TABLE `products_options_values`
  ADD PRIMARY KEY (`products_options_values_id`,`language_id`), ADD KEY `idx_products_options_values_name_zen` (`products_options_values_name`), ADD KEY `idx_products_options_values_sort_order_zen` (`products_options_values_sort_order`);

--
-- Indexes for table `products_options_values_to_products_options`
--
ALTER TABLE `products_options_values_to_products_options`
  ADD PRIMARY KEY (`products_options_values_to_products_options_id`), ADD KEY `idx_products_options_id_zen` (`products_options_id`), ADD KEY `idx_products_options_values_id_zen` (`products_options_values_id`);

--
-- Indexes for table `products_to_categories`
--
ALTER TABLE `products_to_categories`
  ADD PRIMARY KEY (`products_id`,`categories_id`), ADD KEY `idx_cat_prod_id_zen` (`categories_id`,`products_id`);

--
-- Indexes for table `product_music_extra`
--
ALTER TABLE `product_music_extra`
  ADD PRIMARY KEY (`products_id`), ADD KEY `idx_music_genre_id_zen` (`music_genre_id`), ADD KEY `idx_artists_id_zen` (`artists_id`), ADD KEY `idx_record_company_id_zen` (`record_company_id`);

--
-- Indexes for table `product_types`
--
ALTER TABLE `product_types`
  ADD PRIMARY KEY (`type_id`), ADD KEY `idx_type_master_type_zen` (`type_master_type`);

--
-- Indexes for table `product_types_to_category`
--
ALTER TABLE `product_types_to_category`
  ADD KEY `idx_category_id_zen` (`category_id`), ADD KEY `idx_product_type_id_zen` (`product_type_id`);

--
-- Indexes for table `product_type_layout`
--
ALTER TABLE `product_type_layout`
  ADD PRIMARY KEY (`configuration_id`), ADD UNIQUE KEY `unq_config_key_zen` (`configuration_key`), ADD KEY `idx_key_value_zen` (`configuration_key`,`configuration_value`(10)), ADD KEY `idx_type_id_sort_order_zen` (`product_type_id`,`sort_order`);

--
-- Indexes for table `project_version`
--
ALTER TABLE `project_version`
  ADD PRIMARY KEY (`project_version_id`), ADD UNIQUE KEY `idx_project_version_key_zen` (`project_version_key`);

--
-- Indexes for table `project_version_history`
--
ALTER TABLE `project_version_history`
  ADD PRIMARY KEY (`project_version_id`);

--
-- Indexes for table `query_builder`
--
ALTER TABLE `query_builder`
  ADD PRIMARY KEY (`query_id`), ADD UNIQUE KEY `query_name` (`query_name`);

--
-- Indexes for table `record_artists`
--
ALTER TABLE `record_artists`
  ADD PRIMARY KEY (`artists_id`), ADD KEY `idx_rec_artists_name_zen` (`artists_name`);

--
-- Indexes for table `record_artists_info`
--
ALTER TABLE `record_artists_info`
  ADD PRIMARY KEY (`artists_id`,`languages_id`);

--
-- Indexes for table `record_company`
--
ALTER TABLE `record_company`
  ADD PRIMARY KEY (`record_company_id`), ADD KEY `idx_rec_company_name_zen` (`record_company_name`);

--
-- Indexes for table `record_company_info`
--
ALTER TABLE `record_company_info`
  ADD PRIMARY KEY (`record_company_id`,`languages_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`reviews_id`), ADD KEY `idx_products_id_zen` (`products_id`), ADD KEY `idx_customers_id_zen` (`customers_id`), ADD KEY `idx_status_zen` (`status`), ADD KEY `idx_date_added_zen` (`date_added`);

--
-- Indexes for table `reviews_description`
--
ALTER TABLE `reviews_description`
  ADD PRIMARY KEY (`reviews_id`,`languages_id`);

--
-- Indexes for table `salemaker_sales`
--
ALTER TABLE `salemaker_sales`
  ADD PRIMARY KEY (`sale_id`), ADD KEY `idx_sale_status_zen` (`sale_status`), ADD KEY `idx_sale_date_start_zen` (`sale_date_start`), ADD KEY `idx_sale_date_end_zen` (`sale_date_end`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`sesskey`);

--
-- Indexes for table `specials`
--
ALTER TABLE `specials`
  ADD PRIMARY KEY (`specials_id`), ADD KEY `idx_status_zen` (`status`), ADD KEY `idx_products_id_zen` (`products_id`), ADD KEY `idx_date_avail_zen` (`specials_date_available`), ADD KEY `idx_expires_date_zen` (`expires_date`);

--
-- Indexes for table `tax_class`
--
ALTER TABLE `tax_class`
  ADD PRIMARY KEY (`tax_class_id`);

--
-- Indexes for table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD PRIMARY KEY (`tax_rates_id`), ADD KEY `idx_tax_zone_id_zen` (`tax_zone_id`), ADD KEY `idx_tax_class_id_zen` (`tax_class_id`);

--
-- Indexes for table `template_select`
--
ALTER TABLE `template_select`
  ADD PRIMARY KEY (`template_id`), ADD KEY `idx_tpl_lang_zen` (`template_language`);

--
-- Indexes for table `upgrade_exceptions`
--
ALTER TABLE `upgrade_exceptions`
  ADD PRIMARY KEY (`upgrade_exception_id`);

--
-- Indexes for table `whos_online`
--
ALTER TABLE `whos_online`
  ADD KEY `idx_ip_address_zen` (`ip_address`), ADD KEY `idx_session_id_zen` (`session_id`), ADD KEY `idx_customer_id_zen` (`customer_id`), ADD KEY `idx_time_entry_zen` (`time_entry`), ADD KEY `idx_time_last_click_zen` (`time_last_click`), ADD KEY `idx_last_page_url_zen` (`last_page_url`);

--
-- Indexes for table `zones`
--
ALTER TABLE `zones`
  ADD PRIMARY KEY (`zone_id`), ADD KEY `idx_zone_country_id_zen` (`zone_country_id`), ADD KEY `idx_zone_code_zen` (`zone_code`);

--
-- Indexes for table `zones_to_geo_zones`
--
ALTER TABLE `zones_to_geo_zones`
  ADD PRIMARY KEY (`association_id`), ADD KEY `idx_zones_zen` (`geo_zone_id`,`zone_country_id`,`zone_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address_book`
--
ALTER TABLE `address_book`
  MODIFY `address_book_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `address_format`
--
ALTER TABLE `address_format`
  MODIFY `address_format_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `admin_activity_log`
--
ALTER TABLE `admin_activity_log`
  MODIFY `log_id` bigint(15) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `admin_profiles`
--
ALTER TABLE `admin_profiles`
  MODIFY `profile_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `authorizenet`
--
ALTER TABLE `authorizenet`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `banners_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `banners_history`
--
ALTER TABLE `banners_history`
  MODIFY `banners_history_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categories_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT for table `configuration`
--
ALTER TABLE `configuration`
  MODIFY `configuration_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=766;
--
-- AUTO_INCREMENT for table `configuration_group`
--
ALTER TABLE `configuration_group`
  MODIFY `configuration_group_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=62;
--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `countries_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=247;
--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `coupon_email_track`
--
ALTER TABLE `coupon_email_track`
  MODIFY `unique_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `coupon_gv_queue`
--
ALTER TABLE `coupon_gv_queue`
  MODIFY `unique_id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `coupon_redeem_track`
--
ALTER TABLE `coupon_redeem_track`
  MODIFY `unique_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `coupon_restrict`
--
ALTER TABLE `coupon_restrict`
  MODIFY `restrict_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `currencies_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customers_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `customers_basket`
--
ALTER TABLE `customers_basket`
  MODIFY `customers_basket_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `customers_basket_attributes`
--
ALTER TABLE `customers_basket_attributes`
  MODIFY `customers_basket_attributes_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `email_archive`
--
ALTER TABLE `email_archive`
  MODIFY `archive_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ezpages`
--
ALTER TABLE `ezpages`
  MODIFY `pages_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `featured`
--
ALTER TABLE `featured`
  MODIFY `featured_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `files_uploaded`
--
ALTER TABLE `files_uploaded`
  MODIFY `files_uploaded_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `geo_zones`
--
ALTER TABLE `geo_zones`
  MODIFY `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `group_pricing`
--
ALTER TABLE `group_pricing`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `languages_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `layout_boxes`
--
ALTER TABLE `layout_boxes`
  MODIFY `layout_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=99;
--
-- AUTO_INCREMENT for table `manufacturers`
--
ALTER TABLE `manufacturers`
  MODIFY `manufacturers_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `media_clips`
--
ALTER TABLE `media_clips`
  MODIFY `clip_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `media_manager`
--
ALTER TABLE `media_manager`
  MODIFY `media_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `media_types`
--
ALTER TABLE `media_types`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `music_genre`
--
ALTER TABLE `music_genre`
  MODIFY `music_genre_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `newsletters_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orders_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `orders_products`
--
ALTER TABLE `orders_products`
  MODIFY `orders_products_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `orders_products_attributes`
--
ALTER TABLE `orders_products_attributes`
  MODIFY `orders_products_attributes_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `orders_products_download`
--
ALTER TABLE `orders_products_download`
  MODIFY `orders_products_download_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `orders_status_history`
--
ALTER TABLE `orders_status_history`
  MODIFY `orders_status_history_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `orders_total`
--
ALTER TABLE `orders_total`
  MODIFY `orders_total_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `paypal`
--
ALTER TABLE `paypal`
  MODIFY `paypal_ipn_id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `paypal_payment_status`
--
ALTER TABLE `paypal_payment_status`
  MODIFY `payment_status_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `paypal_payment_status_history`
--
ALTER TABLE `paypal_payment_status_history`
  MODIFY `payment_status_history_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `paypal_session`
--
ALTER TABLE `paypal_session`
  MODIFY `unique_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `paypal_testing`
--
ALTER TABLE `paypal_testing`
  MODIFY `paypal_ipn_id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `products_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `products_attributes`
--
ALTER TABLE `products_attributes`
  MODIFY `products_attributes_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1421;
--
-- AUTO_INCREMENT for table `products_description`
--
ALTER TABLE `products_description`
  MODIFY `products_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `products_options_values_to_products_options`
--
ALTER TABLE `products_options_values_to_products_options`
  MODIFY `products_options_values_to_products_options_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=94;
--
-- AUTO_INCREMENT for table `product_types`
--
ALTER TABLE `product_types`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `product_type_layout`
--
ALTER TABLE `product_type_layout`
  MODIFY `configuration_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=140;
--
-- AUTO_INCREMENT for table `project_version`
--
ALTER TABLE `project_version`
  MODIFY `project_version_id` tinyint(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `project_version_history`
--
ALTER TABLE `project_version_history`
  MODIFY `project_version_id` tinyint(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `query_builder`
--
ALTER TABLE `query_builder`
  MODIFY `query_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `record_artists`
--
ALTER TABLE `record_artists`
  MODIFY `artists_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `record_company`
--
ALTER TABLE `record_company`
  MODIFY `record_company_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `reviews_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `salemaker_sales`
--
ALTER TABLE `salemaker_sales`
  MODIFY `sale_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `specials`
--
ALTER TABLE `specials`
  MODIFY `specials_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tax_class`
--
ALTER TABLE `tax_class`
  MODIFY `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tax_rates`
--
ALTER TABLE `tax_rates`
  MODIFY `tax_rates_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `template_select`
--
ALTER TABLE `template_select`
  MODIFY `template_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `upgrade_exceptions`
--
ALTER TABLE `upgrade_exceptions`
  MODIFY `upgrade_exception_id` smallint(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `zones`
--
ALTER TABLE `zones`
  MODIFY `zone_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=300;
--
-- AUTO_INCREMENT for table `zones_to_geo_zones`
--
ALTER TABLE `zones_to_geo_zones`
  MODIFY `association_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
