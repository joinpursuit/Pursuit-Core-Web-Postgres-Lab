-- Database & Table Creation
DROP DATABASE facebook_db;

CREATE DATABASE facebook_db;


\c facebook_db;

CREATE TABLE users
(
    id Serial PRIMARY KEY,
    name VARCHAR,
    age INT
);

CREATE TABLE posts
(
    id Serial PRIMARY KEY,
    poster_id INT REFERENCES users (id)
);

CREATE TABLE likes
(
    id INT primary key,
    liker_id INT REFERENCES users (id),
    post_id INT REFERENCES posts (id)
);

-- Add and Manipulate Data