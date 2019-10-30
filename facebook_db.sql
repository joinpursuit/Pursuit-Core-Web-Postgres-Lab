/*
Joseph P. Pasaoa
Postgres Lab
*/


-- Database & Table Creation
DROP DATABASE [IF EXISTS] kertal;
CREATE DATABASE kertal;
\c kertal

CREATE TABLE user (
   id SERIAL PRIMARY KEY,
   name VARCHAR(36),
   age INT
);

CREATE TABLE post (
   post_id SERIAL PRIMARY KEY,
   owner_id INT REFERENCES user (id),
   body TEXT
);

CREATE TABLE like (
   like_id SERIAL PRIMARY KEY,
   owner_id INT REFERENCES user (id),
   target_id INT REFERENCES post (post_id)
);


-- Add & Manipulate Data
