-- --------------------------------------------------------

--
-- Structure de la table `service_categories`
--

CREATE TABLE `service_categories` (
`sc_id` INT NULL AUTO_INCREMENT PRIMARY KEY ,
`sc_name` VARCHAR( 255 ) NULL ,
`sc_description` VARCHAR( 255 ) NULL ,
`sc_activate` ENUM( '0', '1') NULL
) ENGINE = innodb COMMENT = 'Services Cat�gories For best Reporting';


INSERT INTO `topology` (`topology_id` , `topology_name` , `topology_icone` , `topology_parent` , `topology_page` , `topology_order` , `topology_group` , `topology_url` , `topology_url_opt` , `topology_popup` , `topology_modules` , `topology_show`) VALUES ('', 'm_categories', './img/icones/16x16/certificate.gif', 602, 60209, 90, 1, './include/configuration/configObject/service_categories/serviceCategories.php', NULL, '0', '0', '1');

INSERT INTO `topology_JS` (`id_t_js` , `id_page` , `o` , `PathName_js` , `Init`) VALUES ('', '60703', 'a', './include/common/javascript/changetab.js', 'initChangeTab');
INSERT INTO `topology_JS` (`id_t_js` , `id_page` , `o` , `PathName_js` , `Init`) VALUES ('', '60703', 'w', './include/common/javascript/changetab.js', 'initChangeTab');
INSERT INTO `topology_JS` (`id_t_js` , `id_page` , `o` , `PathName_js` , `Init`) VALUES ('', '60703', 'c', './include/common/javascript/changetab.js', 'initChangeTab');

--
-- Reporting
--

INSERT INTO `topology` (`topology_id` , `topology_name` , `topology_icone` , `topology_parent` , `topology_page` , `topology_order` , `topology_group` , `topology_url` , `topology_url_opt` , `topology_popup` , `topology_modules` , `topology_show` , `topology_style_class` , `topology_style_id` , `topology_OnClick`) VALUES ('', 'm_dashboardHostGroup', './img/icones/16x16/text_rich_colored.gif', 307, 30703, 20, 50, './include/reporting/dashboard/viewHostGroupLog.php', NULL, '0', '0', '1', NULL , NULL , NULL);
INSERT INTO `topology` (`topology_id` , `topology_name` , `topology_icone` , `topology_parent` , `topology_page` , `topology_order` , `topology_group` , `topology_url` , `topology_url_opt` , `topology_popup` , `topology_modules` , `topology_show` , `topology_style_class` , `topology_style_id` , `topology_OnClick`) VALUES ('', 'm_dashboardServiceGroup', './img/icones/16x16/text_rich_colored.gif', 307, 30704, 20, 50, './include/reporting/dashboard/viewServicesGroupLog.php', NULL, '0', '0', '1', NULL , NULL , NULL);

INSERT INTO `topology_JS` (`id_t_js` , `id_page` , `o` , `PathName_js` , `Init`) VALUES ('', 30703, NULL, './include/common/javascript/Timeline/src/main/webapp/api/timeline-api.js', 'initTimeline');
INSERT INTO `topology_JS` (`id_t_js` , `id_page` , `o` , `PathName_js` , `Init`) VALUES ('', 30704, NULL, './include/common/javascript/Timeline/src/main/webapp/api/timeline-api.js', 'initTimeline');

--
-- NDO
--

ALTER TABLE `general_opt` ADD `ndo_base_name` VARCHAR( 255 ) NOT NULL DEFAULT 'nagios',ADD `ndo_base_prefixe` VARCHAR( 255 ) NOT NULL DEFAULT 'ndo', ADD `ndo_activate` BINARY NOT NULL DEFAULT '0';

--
-- ODS and Traps
--

ALTER TABLE `general_opt` ADD `snmptt_unknowntrap_log_file` VARCHAR( 255 ) NULL AFTER `snmpttconvertmib_path_bin` ;


UPDATE `centreon`.`topology` SET `topology_name` = 'menu_ODS_config',`topology_parent` = '501', `topology_page` = '5010601', `topology_order` = '5' WHERE `topology`.`topology_page` = 5010110;

-- Delete DB extract

DELETE FROM `topology` WHERE `topology_page` = '50301';


-- traps

ALTER TABLE `traps` ADD `traps_submit_result_enable` ENUM( '0', '1' ) NULL DEFAULT '1' AFTER `traps_status` ;
ALTER TABLE `traps` ADD `traps_execution_command` TEXT NULL AFTER `traps_submit_result_enable`, ADD `traps_execution_command_enable` ENUM( '0', '1' ) NULL DEFAULT '0' AFTER `traps_execution_command` ;
ALTER TABLE `traps` ADD `traps_reschedule_svc_enable` ENUM( '0', '1' ) NULL DEFAULT '0' AFTER `traps_execution_command_enable` ;


--
-- Structure de la table `service_categories_relation`
--

 CREATE TABLE `service_categories_relation` (
`scr_id` INT NULL AUTO_INCREMENT PRIMARY KEY ,
`service_service_id` INT NULL ,
`sc_id` INT NULL
) ENGINE = innodb;

ALTER TABLE `service_categories_relation` ADD FOREIGN KEY ( `service_service_id` ) REFERENCES `centreon`.`service` (`service_id`) ON DELETE CASCADE ;
ALTER TABLE `service_categories_relation` ADD FOREIGN KEY ( `sc_id` ) REFERENCES `centreon`.`service_categories` (`sc_id`) ON DELETE CASCADE ;


UPDATE `giv_graphs_template` SET `col_top` = NULL , `col_bot` = NULL;




