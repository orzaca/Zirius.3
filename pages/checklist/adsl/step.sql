CREATE TABLE `steps2` (
  `id` int(11) NOT NULL,
  `flow_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `option_yes_id` int(11) DEFAULT NULL,
  `option_no_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `step_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `steps2`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_flow_id` (`flow_id`);

ALTER TABLE `steps2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;


ALTER TABLE steps1 AUTO_INCREMENT = 1;



CREATE TABLE `flows2` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `flows2`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `flows2` AUTO_INCREMENT = 1;
ALTER TABLE `flows2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;


step  gpon
step1 adls
step2 dth
step3 hfc
step4 tv hfc
step5 iptv