-- Database & Table Creation
DROP DATABASE facebook_db;

CREATE DATABASE facebook_db;


\c facebook_db;

CREATE TABLE users
(
    id INT PRIMARY KEY,
    fullname VARCHAR,
    age INT
);

CREATE TABLE posts
(
    id INT PRIMARY KEY,
    poster_id INT REFERENCES users(id),
    body VARCHAR
);

CREATE TABLE likes
(
    id INT primary key,
    liker_id INT REFERENCES users (id),
    post_id INT REFERENCES posts (id)
);

-- Add and Manipulate Data
-- INSERT INTO users (id,fullname, age) VALUES (20,'Victoria Adams', 47), (21,'Gerson Lopez', 33),(22,'George Lopez',30),(23,'Micheal Amparo',24),(24,'Jenesh Napit',24);

-- INSERT INTO posts (poster_id, id, body) VALUES (20,3,'Hello'),(20,4,'World'),(20,5,'Code'),(21,6,'Javascript'),(22,7,'ECMASCRIPT'),(23,8,'PYTHON'),(24,9,'C++');
-- INSERT INTO likes (id,liker_id,post_id) VALUES (11,20,3),(12,20,4),(13,20,5),(14,20,6),(15,20,7),(16,20,8),(17,20,9)
-- INSERT INTO likes (id,liker_id,post_id) VALUES (18,21,6)
-- INSERT INTO likes (id,liker_id,post_id) VALUES (18,22,6)


UPDATE 
    users
SET 
    fullname = 'Alfred'
WHERE 
    id = 22;

UPDATE 
    users
SET 
    age = 31
WHERE 
    id = 24;