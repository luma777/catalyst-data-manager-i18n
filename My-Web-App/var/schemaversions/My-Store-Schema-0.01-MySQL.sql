-- 
-- Created by SQL::Translator::Producer::MySQL
-- Created on Fri Sep 16 14:58:18 2016
-- 
SET foreign_key_checks=0;

DROP TABLE IF EXISTS users;

--
-- Table: users
--
CREATE TABLE users (
  id integer NOT NULL auto_increment,
  user_name varchar(25) NOT NULL,
  email varchar(25) NOT NULL,
  password varchar(27) NULL,
  PRIMARY KEY (id),
  UNIQUE user_unique (email)
);

SET foreign_key_checks=1;

