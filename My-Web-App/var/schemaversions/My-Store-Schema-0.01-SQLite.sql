-- 
-- Created by SQL::Translator::Producer::SQLite
-- Created on Fri Sep 16 14:58:18 2016
-- 

BEGIN TRANSACTION;

--
-- Table: users
--
DROP TABLE users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY NOT NULL,
  user_name varchar(25) NOT NULL,
  email varchar(25) NOT NULL,
  password varchar(27)
);

CREATE UNIQUE INDEX user_unique ON users (email);

COMMIT;
