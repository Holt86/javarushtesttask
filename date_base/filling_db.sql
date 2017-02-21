DROP DATABASE IF EXISTS test;

CREATE DATABASE test;

USE test;

CREATE TABLE `user` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `age` int(11) NOT NULL,
  `isAdmin` bit(1) NOT NULL DEFAULT b'0',
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

INSERT INTO `user` (`id`,`name`,`age`,`isAdmin`,`createDate`) VALUES (1,"Александр",30,1,"2017-11-11 14:50:23"), (2,"Николай",18,0,"2014-13-12 20:50:23"),(3,"Michael ",24,0,"2015-02-11 12:50:23"),(4,"Татьяна",18,0,"2012-13-12 21:50:23"),(5,"Василий",18,0,"2011-01-12 20:50:23"), (6,"Nikol",3,0,"2017-13-12 10:27:29"), (7,"Надежда",46,0,"2012-13-12 20:56:23"), (8,"Сергей",18,0,"2014-13-12 20:50:23");



