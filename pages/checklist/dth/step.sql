CREATE TABLE `steps6` (
  `id` int(11) NOT NULL,
  `flow_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `option_yes_id` int(11) DEFAULT NULL,
  `option_no_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `step_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
ALTER TABLE `steps6`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_flow_id` (`flow_id`);


ALTER TABLE `steps6`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

ALTER TABLE `steps6`
  ADD CONSTRAINT `fk_flow_id` FOREIGN KEY (`flow_id`) REFERENCES `flows` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;



CREATE TABLE `flows6` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `flows6`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `flows6`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
COMMIT;

