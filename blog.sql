-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2022 at 03:40 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `body` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `post_id`, `user_id`, `body`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 'Nice', '2022-05-24 01:15:53', '2022-05-24 01:15:53'),
(2, 2, 3, 'So beautiful', '2022-05-24 01:21:27', '2022-05-24 01:21:27'),
(3, 3, 4, 'Cool', '2022-05-24 01:23:01', '2022-05-24 01:23:01'),
(4, 5, 3, 'really?', '2022-05-24 01:39:39', '2022-05-24 01:39:39'),
(5, 4, 3, 'Nice', '2022-05-24 01:40:13', '2022-05-24 01:40:13');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `topic_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `body` text NOT NULL,
  `published` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `topic_id`, `title`, `image`, `video`, `body`, `published`, `created_at`) VALUES
(2, 1, NULL, 'Birds', '1653355729_Weaver_bird.jpg', '1653355729_Untitled.mp4', '&lt;p&gt;&lt;strong&gt;Birds&lt;/strong&gt; are a group of &lt;a href=&quot;https://en.wikipedia.org/wiki/Warm-blooded&quot;&gt;warm-blooded&lt;/a&gt; &lt;a href=&quot;https://en.wikipedia.org/wiki/Vertebrate&quot;&gt;vertebrates&lt;/a&gt; constituting the &lt;a href=&quot;https://en.wikipedia.org/wiki/Class_(biology)&quot;&gt;class&lt;/a&gt; &lt;strong&gt;Aves&lt;/strong&gt; &lt;a href=&quot;https://en.wikipedia.org/wiki/Help:IPA/English&quot;&gt;/ˈeɪviːz/&lt;/a&gt;, characterised by &lt;a href=&quot;https://en.wikipedia.org/wiki/Feather&quot;&gt;feathers&lt;/a&gt;, toothless beaked jaws, the &lt;a href=&quot;https://en.wikipedia.org/wiki/Oviparity&quot;&gt;laying&lt;/a&gt; of &lt;a href=&quot;https://en.wikipedia.org/wiki/Eggshell&quot;&gt;hard-shelled&lt;/a&gt; eggs, a high &lt;a href=&quot;https://en.wikipedia.org/wiki/Metabolism&quot;&gt;metabolic&lt;/a&gt; rate, a four-chambered &lt;a href=&quot;https://en.wikipedia.org/wiki/Heart&quot;&gt;heart&lt;/a&gt;, and a strong yet lightweight &lt;a href=&quot;https://en.wikipedia.org/wiki/Bird_skeleton&quot;&gt;skeleton&lt;/a&gt;. Birds live worldwide and range in size from the 5.5&amp;nbsp;cm (2.2&amp;nbsp;in) &lt;a href=&quot;https://en.wikipedia.org/wiki/Bee_hummingbird&quot;&gt;bee hummingbird&lt;/a&gt; to the 2.8&amp;nbsp;m (9&amp;nbsp;ft 2&amp;nbsp;in) &lt;a href=&quot;https://en.wikipedia.org/wiki/Common_ostrich&quot;&gt;ostrich&lt;/a&gt;. There are about ten thousand living species, more than half of which are &lt;a href=&quot;https://en.wikipedia.org/wiki/Passerine&quot;&gt;passerine&lt;/a&gt;, or &quot;perching&quot; birds. Birds have &lt;a href=&quot;https://en.wikipedia.org/wiki/Glossary_of_bird_terms#wings&quot;&gt;wings&lt;/a&gt; whose development varies according to species; the only known groups without wings are the extinct &lt;a href=&quot;https://en.wikipedia.org/wiki/Moa&quot;&gt;moa&lt;/a&gt; and &lt;a href=&quot;https://en.wikipedia.org/wiki/Elephant_bird&quot;&gt;elephant birds&lt;/a&gt;. Wings, which evolved from &lt;a href=&quot;https://en.wikipedia.org/wiki/Forelimb&quot;&gt;forelimbs&lt;/a&gt;, gave birds the ability to fly, although further evolution has led to the &lt;a href=&quot;https://en.wikipedia.org/wiki/Flightless_bird&quot;&gt;loss of flight in some birds&lt;/a&gt;, including &lt;a href=&quot;https://en.wikipedia.org/wiki/Ratite&quot;&gt;ratites&lt;/a&gt;, &lt;a href=&quot;https://en.wikipedia.org/wiki/Penguin&quot;&gt;penguins&lt;/a&gt;, and diverse &lt;a href=&quot;https://en.wikipedia.org/wiki/Endemism&quot;&gt;endemic&lt;/a&gt; island species. The digestive and respiratory systems of birds are also uniquely adapted for flight. Some bird species of aquatic environments, particularly &lt;a href=&quot;https://en.wikipedia.org/wiki/Seabird&quot;&gt;seabirds&lt;/a&gt; and some &lt;a href=&quot;https://en.wikipedia.org/wiki/Water_bird&quot;&gt;waterbirds&lt;/a&gt;, have further evolved for swimming&lt;/p&gt;', 1, '2022-05-24 04:14:28'),
(3, 2, NULL, 'New car', '1653355622_car.jpg', NULL, '&lt;p&gt;New Delhi, May 8: Automobile major Maruti Suzuki on Tuesday said that it will carry out a &ldquo;Service Campaign&rdquo; for its new Swift and Baleno models to inspect for a possible fault in their &ldquo;brake vacuum hose&rdquo;.Also Read - &lt;a href=&quot;https://www.india.com/business/maruti-suzuki-finalises-land-for-new-plant-in-haryana-to-invest-rs-11000-crore-in-first-phase-5390979/&quot;&gt;Maruti Suzuki Finalises Land For New Plant In Haryana, To Invest Rs 11,000 Crore in First Phase&lt;/a&gt;&lt;/p&gt;&lt;p&gt;According to the company, around 52,686 new Swift and Baleno vehicles manufactured between December 1, 2017 and March 16, 2018 will be covered in this campaign. Also Read - &lt;a href=&quot;https://www.india.com/business/maruti-cars-to-go-costly-from-today-check-details-maruti-suzuki-car-price-rise-5343622/&quot;&gt;Maruti Cars to Go Costly From Today. Check Details&lt;/a&gt;&lt;/p&gt;&lt;p&gt;&ldquo;Starting 14th May 2018 owners of the vehicles included in this service campaign will be contacted by dealers for inspection and replacement of the faulty part,&rdquo; the company said in a notice on its website. Also Read - &lt;a href=&quot;https://www.india.com/car-and-bike/cars-to-get-costly-from-april-2022-maruti-suzuki-toyota-nissan-bmw-audi-mercedes-benz-new-rates-latest-news-today-5313876/&quot;&gt;Planning To Buy Your Dream Car? This News Is For You&lt;/a&gt;&lt;/p&gt;&lt;p&gt;&ldquo;Service campaigns are undertaken globally by automobile companies to rectify faults that may potentially cause inconvenience to customers. The inspection and replacement will be done free of cost for the customer.&rdquo;&lt;/p&gt;', 1, '2022-05-24 04:19:45'),
(4, 4, NULL, 'Dog', NULL, '1653355850_dog_poodle_car_window_wind_storm_413.mp4', '&lt;p&gt;Dogs, often hailed as humans&rsquo; best friends, have been the topic of many scientific studies looking into how they might boost our well-being. In this Spotlight, we&rsquo;ll explain how your friendly pup can benefit your health across the board.&lt;/p&gt;', 1, '2022-05-24 04:30:50'),
(5, 5, NULL, 'Life Philosophy', NULL, NULL, '&lt;p&gt;How should you live? In many ways, my blog is devoted to trying to pull apart and answer this question. Over the last decade, I\'ve written a lot trying to do this, here are some of the best articles.&amp;nbsp;&lt;br&gt;&lt;br&gt;The 5 Best Life Philosophy Articles&amp;nbsp;&lt;br&gt;Here are my best five essays on how to live better:&amp;nbsp;&lt;br&gt;&lt;br&gt;Most Books Won&rsquo;t Change Your Life (But You Should Read Them Anyways)&amp;nbsp;&lt;br&gt;You should read more books, even if you can&rsquo;t apply them all.&amp;nbsp;&lt;br&gt;Can Life Have Too Much Meaning?&amp;nbsp;&lt;br&gt;We tend to think of meaning as something we want more from life, not less. However, many symptoms of modern life may actually be from having too much meaning, not too little.&amp;nbsp;&lt;br&gt;Is Reading Blogs Like This One Keeping You From Improving Your Life?&amp;nbsp;&lt;br&gt;Is reading a complement or substitute for doing the work of self-improvement?&amp;nbsp;&lt;br&gt;Should You Target the Minimum?&amp;nbsp;&lt;br&gt;I discuss minimum, average and maximum targeting and how these three different approaches differ for pursuing all sorts of goals.&amp;nbsp;&lt;br&gt;Are You Living Your Life or Just Planning Your Biography?&amp;nbsp;&lt;br&gt;The difference between how life is experienced and how it is remembered can result in choices that make you worse off.&lt;/p&gt;', 1, '2022-05-24 04:37:46');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `rating` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`id`, `user_id`, `post_id`, `rating`) VALUES
(2, 2, 2, 5),
(3, 3, 3, 4),
(4, 3, 2, 4),
(5, 4, 3, 5),
(6, 4, 2, 4),
(7, 4, 4, 5),
(8, 5, 3, 5),
(9, 3, 5, 3),
(10, 3, 4, 5);

-- --------------------------------------------------------

--
-- Table structure for table `reply`
--

CREATE TABLE `reply` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `body` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE `topics` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `admin` tinyint(4) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `admin`, `username`, `email`, `password`, `created_at`) VALUES
(1, 1, 'abdullah', 'abdullah@gmail.com', '$2y$10$NnU8H1QoH97z4GtIhgMnku6BP8FgwfWsDHSXKvUrzErieoFW.K/1e', '2022-05-23 22:37:48'),
(2, 1, 'nawaf', 'nawaf@gmail.com', '$2y$10$Iu328r.7jwjBjTAgj1TIfOc8NwKZ8UtJnUzx3jz0GkEp/OAK5s1WS', '2022-05-24 01:15:27'),
(3, 0, 'mohammed', 'mohammed@gmail.com', '$2y$10$Pn1aM9mT3KmqjETiVQNVL.AfvfPemeyqSVK5poVTL9HWIoRFftKCa', '2022-05-24 01:20:51'),
(4, 1, 'fahad', 'fahad@gmail.com', '$2y$10$yNXoEd2.00ZnObyN4ugo6u68D26nno1ugSGzcRHDbhu/9JPGb7qFC', '2022-05-24 01:22:32'),
(5, 1, 'ali', 'ali@gmail.com', '$2y$10$bDDyq0cCoolk1/LZdm0je.gBAGCfHwt6mw3DN1txACH.tqxvifqeW', '2022-05-24 01:34:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `postid` (`post_id`),
  ADD KEY `uid` (`user_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `topic_id` (`topic_id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `postid` (`post_id`),
  ADD KEY `uid` (`user_id`);

--
-- Indexes for table `reply`
--
ALTER TABLE `reply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`user_id`),
  ADD KEY `cid` (`comment_id`);

--
-- Indexes for table `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `reply`
--
ALTER TABLE `reply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `topics`
--
ALTER TABLE `topics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reply`
--
ALTER TABLE `reply`
  ADD CONSTRAINT `reply_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reply_ibfk_2` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
