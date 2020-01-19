-- Database & table creation

DROP DATABASE IF EXISTS facebook_db;
CREATE DATABASE facebook_db;

\c facebook_db

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS likes;

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    age INTEGER   
);

CREATE TABLE posts(
    id SERIAL PRIMARY KEY, 
    poster_id INT REFERENCES users(id) ON DELETE SET NULL,
    body TEXT
);

CREATE TABLE likes(
    id SERIAL PRIMARY KEY,
    liker_id INT REFERENCES users(id) ON DELETE SET NULL, 
    post_id INT REFERENCES posts(id) ON DELETE SET NULL
);

-- Add and Manipulate Data

INSERT INTO users (name, age)
VALUES('name', 32),
      ('tim', 45),
      ('sue', 23),
      ('joe', 47),
      ('Beth', 25);

INSERT INTO posts (poster_id, body)
VALUES(2, 'Hi im tim'),
      (2, 'This is tim again'),
      (2, 'Still tim'),
      (1, 'My name is name'),
      (3, 'Sue here'),
      (4, 'Joe'),
      (5, 'Its beth');

INSERT INTO likes (liker_id, post_id)
VALUES(1, 10),
      (1, 14),
      (1, 15),
      (1, 16);

INSERT INTO likes (liker_id, post_id)
VALUES(2, 10),
      (2, 11),
      (2, 12);

INSERT INTO likes (liker_id, post_id)
VALUES(3,10),
        (3, 11),
        (3,12),
        (3, 13);

INSERT INTO likes (liker_id, post_id)
VALUES(4,10),
      (4,11),
      (4,14),
      (4,16);

INSERT INTO likes (liker_id, post_id)
VALUES(5, 13),
      (5, 10),
      (5, 11),
      (5,12),
      (5,14);

UPDATE users
SET age = 31
WHERE id = 5;

UPDATE users 
SET name = 'Alfred'
WHERE id = 3;

DELETE FROM likes 
WHERE id = 1;

DELETE FROM posts
WHERE id = 12

DELETE FROM users
WHERE id = 2


