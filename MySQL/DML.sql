-- Create, Alter or Drop
CREATE DATABASE `mybatis`;

USE `mybatis`;

DROP TABLE IF EXISTS `user`;

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
`id` int(20) NOT NULL,
`name` varchar(30) DEFAULT NULL,
`pwd` varchar(30) DEFAULT NULL,
PRIMARY KEY(`id`)
);

-- add a column
ALTER TABLE `user`
ADD role VARCHAR(20) NOT NULL;

-- modify a column
ALTER TABLE `user`
MODIFY `name` varchar(40);

DESCRIBE `user`;

-- rename a column
ALTER TABLE `user`
CHANGE COLUMN `name` `username` VARCHAR(30) DEFAULT NULL;

--drop a column
ALTER TABLE `user`
DROP COLUMN `role`;
