-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 03, 2024 at 02:37 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project`
--

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(11) NOT NULL,
  `image` varchar(191) NOT NULL,
  `url` varchar(191) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `image`, `url`, `created_at`, `updated_at`) VALUES
(11, 'public/banner-image/2024-01-03-13-31-42.jpeg', 'https://www.khabaronline.ir/news/1713129/?utm_source=undernews_khabaronline&utm_medium=Banner&utm_campaign=app_install', '2022-04-10 17:14:11', '2024-01-03 16:01:42'),
(12, 'salsmawd', 'wadadwdawd.com', '2023-12-30 11:31:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(11, 'سیاسی', '2019-07-13 12:33:01', '2019-07-13 16:06:40'),
(13, 'اقتصادی', '2019-07-13 12:33:12', '2020-08-03 01:31:47'),
(15, 'خارجی', '2022-03-13 17:28:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `post_id` int(11) NOT NULL,
  `status` enum('unseen','seen','approved') NOT NULL DEFAULT 'unseen',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `comment`, `post_id`, `status`, `created_at`, `updated_at`) VALUES
(20, 1, 'hello', 22, 'approved', '2020-08-11 01:49:46', '2023-12-31 13:43:27'),
(22, 1, 'test', 22, 'approved', '2020-10-04 23:56:16', '2023-12-31 13:43:26'),
(32, 1, 'salam in yek test ast', 15, 'seen', '2023-12-31 12:11:47', '2023-12-31 14:42:12'),
(33, 1, 'in test 2 ast', 21, 'approved', '2023-12-31 12:12:23', '2023-12-31 14:50:11');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `url` varchar(300) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `url`, `parent_id`, `created_at`, `updated_at`) VALUES
(20, 'خانه اصلی', 'http://localhost/project/', NULL, '2022-04-12 17:34:21', NULL),
(22, 'اقتصادی', 'http://localhost/project/show-category/15', 20, '2022-04-12 17:34:40', '2023-12-31 16:23:40'),
(29, 'سیاسی', 'http://localhost/project/show-category/11', NULL, '2023-12-31 16:29:48', NULL),
(30, 'خبری', 'http://localhost/project/show-category/13', NULL, '2024-01-03 12:59:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `summary` text NOT NULL,
  `body` text NOT NULL,
  `view` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `image` varchar(200) NOT NULL,
  `status` enum('disable','enable') NOT NULL DEFAULT 'disable',
  `selected` tinyint(5) NOT NULL DEFAULT 1 COMMENT '1 => select 2 => no select',
  `breaking_news` tinyint(5) NOT NULL DEFAULT 1 COMMENT '1 => no breaking news 2 => breaking news',
  `published_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `summary`, `body`, `view`, `user_id`, `cat_id`, `image`, `status`, `selected`, `breaking_news`, `published_at`, `created_at`, `updated_at`) VALUES
(15, 'آماده باش ۳۰هزار مامور پلیس تهران پس از هک‌شدن پمپ‌ بنزین‌ها', '<p>فرمانده فراجا با اشاره به مسئله آشفتگی در انضباط شهری، گفت: پذیرفته نیست که تهران امن ظاهری نامنظم و آشفته داشته باشد و باید با آموزش، فرهنگ سازی، اقدامات ایجابی و ... برای کاهش این آشفتگی&zwnj;ها و نظم بخشی به امر ترافیک و ترددها تلاش مجدانه داشته باشیم. سردار احمدرضا رادان به گزارش همشهری آنلاین، سردار احمدرضا رادان در جلسه با فرماندهان، روسا و مدیران فرماندهی انتظامی تهران بزرگ با گرامی&zwnj;داشت یاد و خاطره سردار سلیمانی و تبریک سالروز میلاد حضرت زهرا(س) و روز مادر گفت: از تلاش&zwnj;های مستمر، صادقانه و پی&zwnj;درپی کارکنان مجموعه انتظامی تهران بزرگ تشکر و قدردانی می&zwnj;کنم و این تلاش&zwnj;ها را برای خدمتی که در این مجموعه داشتند با گوشت و پوست و استخوان خود لمس می&zwnj;کنم. وی با اشاره به این که تهران یکی از استان&zwnj;هایی است که در همه واحدها و بخش&zwnj;های انتظامی، آگاهی، اطلاعات و امنیت و ... پرکارتر بوده و ویژگی&zwnj; خاصی دارد، اظهارکرد: اثرگذاری ماموریت&zwnj;ها در تهران و موفقیت و ضعف در آن قطعا به سراسر کشور تسری پیدا می&zwnj;کند و اینها سبب می&zwnj;شود تا فرماندهی انتظامی تهران بزرگ حساسیت بالایی داشته باشد. رادان با اشاره به این که تمام زحمات شما در انجام ماموریت&zwnj;ها برای ما قابل لمس و درک است، خاطرنشان کرد: هیچکس نمی&zwnj;تواند منکر مدیریت مطلوب و قابل قدردانی مجموعه فرماندهی انتظامی تهران بزرگ در سالگرد حوادث شهریور سال گذشته که برخی به دنبال تهییج و فراخوان و به دنبال آن، ایجاد نا امنی&zwnj; بودند، باشد. آماده باش ۳۰ هزار مامور پلیس پایتخت در هنگام هک پمپ&zwnj; بنزین&zwnj;ها وی ماموریت بعدی تهران بزرگ را در روزهای اخیر هک شدن پمپ بنزین ها عنوان کرد و افزود: این خبر برای همه خبری عادی محسوب می&zwnj;شد و برای فرماندهی انتظامی تهران بزرگ، آماده باش کامل ۳۰ هزار نیروی پای کار بود که خوشبختانه به نحوی مدیریت شد که حادثه&zwnj;ای پیش نیامد. فرمانده فراجا با اشاره به پاکسازی منطقه هرندی و شوش و ایجاد لذت زندگی و چهره مطلوب شهری برای این منطقه را از دیگر خدمات مجموعه فرماندهی انتظامی تهران بزرگ عنوان و خاطرنشان کرد: همه باید تلاش کنیم تا این منطقه به چهره قبلی خود بازنگردد. رادان در ادامه به موضوع مبارزه با سرقت در مجموعه انتظامی تهران بزرگ اشاره کرد و افزود: در این حوزه اقدامات بسیار در خور توجهی صورت گرفته ولی باید بیش از پیش تلاش کنیم و برای مردم این تلاش&zwnj;های پلیس ملموس&zwnj;تر باشد. وی مبارزه با سرقت را تلفیقی از اقدامات مناسب صورت گرفته از جمله دستبد و پابند الکترونیکی و انجام اقدامات کارآگاهان پلیس&zwnj;های آگاهی، پیشگیری، امنیت و سایر رده ها عنوان کرد و افزود: باید با اطلاع رسانی بهنگام این موضوعات برای مردم بیش از پیش تبیین شود. فرمانده فراجا به موضوع هوشمندسازی پلیس اشاره و خاطرنشان کرد: این امر قطعا مستلزم ساختار، رفتار و بافتار است که می توانند ما را در هوشمندسازی و توانمندسازی پلیس یاری و در انجام ماموریت&zwnj;ها موفق سازند. رادان به طرح&zwnj;های مطرح شده در جلسه از سوی روسای پلیس&zwnj;ها و معاونان فرماندهی انتظامی تهران بزرگ اشاره کرد و گفت:&zwnj; قطعا با تمام قوا از طرح&zwnj;های مطرح شده&zwnj;ای که قابلیت اجرایی در وضعیت موجود داشته باشند استقبال و موانع موجود را مرتفع خواهیم کرد. وی به مسئله آشفتگی در انضباط شهری اشاره کرد و گفت: پذیرفته نیست که تهران امن ظاهری نامنظم و آشفته داشته باشد و باید با آموزش، فرهنگ سازی، اقدامات ایجابی و ... برای کاهش این آشفتگی&zwnj;ها و نظم بخشی به امر ترافیک و ترددها تلاش مجدانه داشته باشیم.</p>\r\n', '<p>فرمانده فراجا با اشاره به مسئله آشفتگی در انضباط شهری، گفت: پذیرفته نیست که تهران امن ظاهری نامنظم و آشفته داشته باشد و باید با آموزش، فرهنگ سازی، اقدامات ایجابی و ... برای کاهش این آشفتگی&zwnj;ها و نظم بخشی به امر ترافیک و ترددها تلاش مجدانه داشته باشیم. سردار احمدرضا رادان به گزارش همشهری آنلاین، سردار احمدرضا رادان در جلسه با فرماندهان، روسا و مدیران فرماندهی انتظامی تهران بزرگ با گرامی&zwnj;داشت یاد و خاطره سردار سلیمانی و تبریک سالروز میلاد حضرت زهرا(س) و روز مادر گفت: از تلاش&zwnj;های مستمر، صادقانه و پی&zwnj;درپی کارکنان مجموعه انتظامی تهران بزرگ تشکر و قدردانی می&zwnj;کنم و این تلاش&zwnj;ها را برای خدمتی که در این مجموعه داشتند با گوشت و پوست و استخوان خود لمس می&zwnj;کنم. وی با اشاره به این که تهران یکی از استان&zwnj;هایی است که در همه واحدها و بخش&zwnj;های انتظامی، آگاهی، اطلاعات و امنیت و ... پرکارتر بوده و ویژگی&zwnj; خاصی دارد، اظهارکرد: اثرگذاری ماموریت&zwnj;ها در تهران و موفقیت و ضعف در آن قطعا به سراسر کشور تسری پیدا می&zwnj;کند و اینها سبب می&zwnj;شود تا فرماندهی انتظامی تهران بزرگ حساسیت بالایی داشته باشد. رادان با اشاره به این که تمام زحمات شما در انجام ماموریت&zwnj;ها برای ما قابل لمس و درک است، خاطرنشان کرد: هیچکس نمی&zwnj;تواند منکر مدیریت مطلوب و قابل قدردانی مجموعه فرماندهی انتظامی تهران بزرگ در سالگرد حوادث شهریور سال گذشته که برخی به دنبال تهییج و فراخوان و به دنبال آن، ایجاد نا امنی&zwnj; بودند، باشد. آماده باش ۳۰ هزار مامور پلیس پایتخت در هنگام هک پمپ&zwnj; بنزین&zwnj;ها وی ماموریت بعدی تهران بزرگ را در روزهای اخیر هک شدن پمپ بنزین ها عنوان کرد و افزود: این خبر برای همه خبری عادی محسوب می&zwnj;شد و برای فرماندهی انتظامی تهران بزرگ، آماده باش کامل ۳۰ هزار نیروی پای کار بود که خوشبختانه به نحوی مدیریت شد که حادثه&zwnj;ای پیش نیامد. فرمانده فراجا با اشاره به پاکسازی منطقه هرندی و شوش و ایجاد لذت زندگی و چهره مطلوب شهری برای این منطقه را از دیگر خدمات مجموعه فرماندهی انتظامی تهران بزرگ عنوان و خاطرنشان کرد: همه باید تلاش کنیم تا این منطقه به چهره قبلی خود بازنگردد. رادان در ادامه به موضوع مبارزه با سرقت در مجموعه انتظامی تهران بزرگ اشاره کرد و افزود: در این حوزه اقدامات بسیار در خور توجهی صورت گرفته ولی باید بیش از پیش تلاش کنیم و برای مردم این تلاش&zwnj;های پلیس ملموس&zwnj;تر باشد. وی مبارزه با سرقت را تلفیقی از اقدامات مناسب صورت گرفته از جمله دستبد و پابند الکترونیکی و انجام اقدامات کارآگاهان پلیس&zwnj;های آگاهی، پیشگیری، امنیت و سایر رده ها عنوان کرد و افزود: باید با اطلاع رسانی بهنگام این موضوعات برای مردم بیش از پیش تبیین شود. فرمانده فراجا به موضوع هوشمندسازی پلیس اشاره و خاطرنشان کرد: این امر قطعا مستلزم ساختار، رفتار و بافتار است که می توانند ما را در هوشمندسازی و توانمندسازی پلیس یاری و در انجام ماموریت&zwnj;ها موفق سازند. رادان به طرح&zwnj;های مطرح شده در جلسه از سوی روسای پلیس&zwnj;ها و معاونان فرماندهی انتظامی تهران بزرگ اشاره کرد و گفت:&zwnj; قطعا با تمام قوا از طرح&zwnj;های مطرح شده&zwnj;ای که قابلیت اجرایی در وضعیت موجود داشته باشند استقبال و موانع موجود را مرتفع خواهیم کرد. وی به مسئله آشفتگی در انضباط شهری اشاره کرد و گفت: پذیرفته نیست که تهران امن ظاهری نامنظم و آشفته داشته باشد و باید با آموزش، فرهنگ سازی، اقدامات ایجابی و ... برای کاهش این آشفتگی&zwnj;ها و نظم بخشی به امر ترافیک و ترددها تلاش مجدانه داشته باشیم.</p>\r\n', 1000, 1, 11, 'public/post-image/2024-01-03-15-54-28.jpeg', 'enable', 1, 2, '2022-04-12 15:21:23', '2019-07-17 12:10:04', '2024-01-03 15:54:28'),
(21, 'انفجارهای متعدد در منهتن نیویورک/ ساختمان‌ها به‌شدت لرزیدند', '<p>مهر نوشت: بر اثر وقوع انفجارهای متعدد در منهتن نیویورک، ساختمان&zwnj;ها به&zwnj;شدت لرزیدند و بالگردهای امداد و نجات به منطقه حادثه اعزام شدند.</p>\r\n\r\n<h1>&nbsp;</h1>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>به نقل از خبرگزاری اسپوتنیک، رسانه های محلی در آمریکا امروز سه شنبه با انتشار فیلم هایی از وقوع انفجارهای متعدد در منهتن نیویورک واقع در آمریکا خبر می دهند.</p>\r\n', '<p>مهر نوشت: بر اثر وقوع انفجارهای متعدد در منهتن نیویورک، ساختمان&zwnj;ها به&zwnj;شدت لرزیدند و بالگردهای امداد و نجات به منطقه حادثه اعزام شدند.</p>\r\n\r\n<h1>&nbsp;</h1>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>به نقل از خبرگزاری اسپوتنیک، رسانه های محلی در آمریکا امروز سه شنبه با انتشار فیلم هایی از وقوع انفجارهای متعدد در منهتن نیویورک واقع در آمریکا خبر می دهند.</p>\r\n', 1, 1, 15, 'public/post-image/2024-01-03-15-55-42.jpeg', 'enable', 1, 1, '2022-04-12 15:21:29', '2020-06-19 22:37:10', '2024-01-03 15:55:42'),
(22, 'واردات کالا با رمز ارز ممکن می‌شود', '<p>ایسنا: دستیار وزیر امور اقتصادی و دارایی گفت: استفاده از ظرفیت&zwnj;های رمزارزها در تسهیل تجارت خارجی کشور، نقطه شروع مطلوبی برای به رسمیت شناختن این حوزه است و در صورت وثیقه&zwnj;گذاری رمزارزهای ایران نزد مبادی وارداتی، امکان خرید اعتباری کالاهای وارداتی فراهم می&zwnj;شود و خلا استفاده از اعتبار اسنادی (LC) در مبادلات خارجی ایران در شرایط تحریم پوشش داده می&zwnj;شود.</p>\r\n\r\n<p>محمد جلال در نشست &laquo;سیاستگذاری رمزارزها و رمزدارایی&zwnj;ها و جایگاه آن در نظام ارزی کشور&raquo; اظهار کرد: با مقولات جدیدی همچون پدیده رمزارزها ابتدا باید پدیده انگارانه مواجه شد نه مبتنی بر تهدید و فرصت، همچنین باید به صورت مستمر نحوه مواجه به روزرسانی شود. ذات اقتصاد دیجیتال به نحوی است که برای نقش آفرینی نیازی به اخذ مجوز از کشورها ندارند و فارغ از مرزها توسعه پیدا می&zwnj;کند.</p>\r\n\r\n<p>&nbsp;</p>\r\n', '<p>ایسنا: دستیار وزیر امور اقتصادی و دارایی گفت: استفاده از ظرفیت&zwnj;های رمزارزها در تسهیل تجارت خارجی کشور، نقطه شروع مطلوبی برای به رسمیت شناختن این حوزه است و در صورت وثیقه&zwnj;گذاری رمزارزهای ایران نزد مبادی وارداتی، امکان خرید اعتباری کالاهای وارداتی فراهم می&zwnj;شود و خلا استفاده از اعتبار اسنادی (LC) در مبادلات خارجی ایران در شرایط تحریم پوشش داده می&zwnj;شود.</p>\r\n\r\n<p>محمد جلال در نشست &laquo;سیاستگذاری رمزارزها و رمزدارایی&zwnj;ها و جایگاه آن در نظام ارزی کشور&raquo; اظهار کرد: با مقولات جدیدی همچون پدیده رمزارزها ابتدا باید پدیده انگارانه مواجه شد نه مبتنی بر تهدید و فرصت، همچنین باید به صورت مستمر نحوه مواجه به روزرسانی شود. ذات اقتصاد دیجیتال به نحوی است که برای نقش آفرینی نیازی به اخذ مجوز از کشورها ندارند و فارغ از مرزها توسعه پیدا می&zwnj;کند.</p>\r\n\r\n<p>وی ادامه داد: به حوزه رمزارزها باید نگاه انطباقی داشته باشیم و بهترین تصمیم را بگیریم. درحال&zwnj;حاضر تنها درخصوص عدم تولید رمزارزها با استفاده از نیروی برق جمعبندی وجود دارد و در دیگر حوزه&zwnj;ها نه امکان کنار گذاشتن وجود دارد و نه ساختارها برای رسمیت دادن و امکان تنظیم&zwnj;گیری فراهم است.</p>\r\n\r\n<p>دستیار وزیر اقتصاد با تاکید بر اینکه اگر با یک پدیده جدید به موقع مواجه نشویم، به مرور تهدیدهای آن بیشتر می&zwnj;شود، افزود: معرفی ظرفیت&zwnj;های این پدیده در حوزه مبادلات خارجی میتواند نقطه شروع به رسمیت شناختن آن باشد. به طور مثال ایده وثیقه&zwnj;گذاری رمزارزها نزد نهادهای مالی و شرکت&zwnj;های بزرگ خارجی در کشورهای صادرکننده کالا به ایران میتواند جایگزینی برای اسناد اعتباری باشد که به دلیل تحریم&zwnj;ها مدتهاست که از آن محروم هستیم. بنابراین استفاده از رمزارزها به عنوان وثیقه بین&zwnj;المللی در تجارت بین&zwnj;المللی برای خرید اعتباری به شدت مفید خواهد بود.</p>\r\n\r\n<p>به گفته جلال، ظرفیت بعدی ایجاد ارزهای جایگزین بر پایه دارایی&zwnj;های رمزنگاری شده است که میتواند به خصوص با همکاری مجموعه&zwnj;های مثل بریکس، بخشی از مشکلات مبادلات تجاری خارجی کشور را رفع کند. شفافیت و امنیت بلاک چین، این امکان را برای ایران فراهم می&zwnj;کند. ظرفیت سوم راه&zwnj;اندازی نوعی گواهی سپرده کالایی یا توکن بر مبنای دارایی&zwnj;های کشور است که می&zwnj;تواند به عنوان ابزار تضمین برای خرید اعتباری یا خرید مدت&zwnj;دار مورد استفاده قرار بگیرد و دست کم واردات شرکت&zwnj;های صادراتی را بدون نیاز به تامین ارز ساماندهی کند.</p>\r\n\r\n<p>جلال تاکید کرد: با توجه به واقعیت&zwnj;های حاکم بر اقتصاد ایران، از جمله اینکه نرخ ارز نمی&zwnj;تواند تک نرخی شود و موارد مشابه، من فکر میکنم این امکان وجود دارد که یک تجربه موفق در حوزه رمزارزها معرفی شود و مورد استفاده قرار بگیرد تا از فضای جدل کنونی خارج شویم و اجماعی برای به رسمیت شناختن این حوزه ایجاد شود. من معتقدم نقطه عزیمت به این سمت استفاده از ظرفیت&zwnj;های این حوزه در مبادلات خارجی است.</p>\r\n\r\n<p>بنابراین گزارش، نشست &laquo;سیاستگذاری رمزارزها و رمزدارایی&zwnj;ها و جایگاه آن در نظام ارزی کشور&raquo; ۱۲ دی ماه ۱۴۰۲، با حضور جمعی از اساتید و صاحبنظران و فعالان این حوزه با میزبانی &laquo;پژوهشکده امور اقتصادی وزارت اقتصاد&raquo; برگزار شد. این نشست، پنجمین نشست تخصصی از دهمین همایش سالانه اقتصاد مقاومتی بود که در بازه آبان تا اسفندماه امسال با موضوع &laquo;حکمرانی ارزی؛ ثبات و رونق اقتصادی&raquo; برگزار شد. در پنجمین نشست از این همایش فرصت&zwnj;ها و تهدیدهای مواجهه با پدیده رمزارزها و رمزدارایی&zwnj;ها برای اقتصاد ایران مورد بحث و بررسی قرار گرفت.</p>\r\n', 65, 1, 13, 'public/post-image/2024-01-03-15-56-46.jpeg', 'enable', 1, 1, '2023-12-30 10:31:56', '2020-06-19 22:37:55', '2024-01-03 15:56:46');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `permission` enum('user','admin') NOT NULL DEFAULT 'user',
  `verify_token` varchar(191) DEFAULT NULL,
  `is_active` tinyint(5) NOT NULL DEFAULT 0,
  `forgot_token` varchar(191) DEFAULT NULL,
  `forgot_token_expire` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `permission`, `verify_token`, `is_active`, `forgot_token`, `forgot_token_expire`, `created_at`, `updated_at`) VALUES
(1, 'SaraFz', 'kamran@gmail.com', '$2y$10$nlZ5dMJ2sv9HrKU4NJslDe0ick10lGSBZNM2i14zKtDGGAEqAdXVS', 'admin', NULL, 1, NULL, NULL, '2019-06-06 01:28:40', '2023-12-31 11:48:55'),
(18, 'mahanclash8195@gmail.com', 'myauthentication.1jan@gmail.com', '$2y$10$J1rptxxsDulSvi3HfRMXvuzF6D2A15DjZxbntYQ.17yToFgP4O8rW', 'user', '2a1f9b01736ffd6846c4f843cab861bcaa693ca7929ade4ff694111399d10ef3', 0, NULL, NULL, '2024-01-01 13:54:04', NULL),
(19, 'mahanmr', 'mahanclash8195@gmail.com', '$2y$10$ouEPjZHXwIpuI2C.Cyq3PexZiXUa/MithymktqUlWFgqPPbvIRDGO', 'admin', 'f492b2233caaaba715df65d8ca99dda7168f71fe3742411f7ecf7b24763344ac', 1, '5d5293558220a2fc9121683724abc9fc33182bd6c6e7cc7c3be79bf092b693af', '2024-01-02 14:30:27', '2024-01-02 11:38:53', '2024-01-02 14:15:27'),
(20, 'mahdimrd', 'mahanclash93@gmail.com', '$2y$10$2VpHV184NGNl9DXV7qAKvuwRmaW4ufkVByALM8gOjzKDOyOhc5aSu', 'user', '3be389d62567bb9f509469767399fac9401bc618e7e979c5d9c7d4dcff7d1bf8', 0, NULL, NULL, '2024-01-02 12:25:46', NULL),
(21, 'mahan rahimi', 'myauthenti1212n.1jan@gmail.com', '$2y$10$IokOmJ.tyaI8Qd1nDMuMMePo25CnDuEIno7ZrVh5c8vOLobIjV1fi', 'user', '3b593675b7007280ca5f0ecc77549f06f6a386a908f5f19fef12d070f35be923', 0, NULL, NULL, '2024-01-03 16:58:31', NULL),
(22, 'Mhanmr02', 'mahanclash9339@gmail.com', '$2y$10$wLdIkECR3Or2m/KfoBbASu5naRFL0Ik9zS/3LYS.2OetE8mQj4Qja', 'user', '219837f6c094f28b2e76f0353fe78eddbc29b524e75dc0a6c323e1db26bbaed0', 0, NULL, NULL, '2024-01-03 17:02:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `websetting`
--

CREATE TABLE `websetting` (
  `id` int(11) NOT NULL,
  `title` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `keywords` text DEFAULT NULL,
  `logo` text DEFAULT NULL,
  `icon` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `websetting`
--

INSERT INTO `websetting` (`id`, `title`, `description`, `keywords`, `logo`, `icon`, `created_at`, `updated_at`) VALUES
(6, 'Jame-News', 'salam122', 'salam222', 'public/setting/logo.png', 'public/setting/icon.jpeg', '2024-01-01 12:08:57', '2024-01-03 15:49:49');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `article_id` (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`cat_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `websetting`
--
ALTER TABLE `websetting`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `websetting`
--
ALTER TABLE `websetting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `menus_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
