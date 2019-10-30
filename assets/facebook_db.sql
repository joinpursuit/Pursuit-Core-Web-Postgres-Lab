-- Database & Table Creation
DROP DATABASE facebook_db;

CREATE DATABASE facebook_db;


\c facebook_db;

CREATE TABLE users
(
    id Serial PRIMARY KEY,
    fullname VARCHAR,
    age INT
);

CREATE TABLE posts
(
    id Serial PRIMARY KEY,
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
INSERT INTO users (fullname, age) VALUES ('Victoria Adams', 47), ('Gerson Lopez', 33),('George Lopez',30),('Micheal Amparo',24),('Jenesh Napit',24);

INSERT INTO posts (poster_id, body) VALUES (1,'Hello'),(1,'World'),(1,'Code'),(2,'Javascript'),(3,'ECMASCRIPT'),(4,'PYTHON'),(5,'C++');
-- DELETE from posts
