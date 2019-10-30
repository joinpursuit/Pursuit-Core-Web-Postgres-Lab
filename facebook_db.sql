DROP DATABASE facebook;

-- Database & Table Creation

CREATE DATABASE facebook;

\c facebook;

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    firstname VARCHAR,
    lastname VARCHAR,
    age INT
);

CREATE TABLE posts(
    id SERIAL PRIMARY KEY,
    poster_id INT REFERENCES users (id) ON DELETE CASCADE,
    body VARCHAR 
);

CREATE TABLE likes (
    id SERIAL PRIMARY KEY,
    liker_id INT REFERENCES users (id) ON DELETE CASCADE,
    post_id INT REFERENCES posts (id) ON DELETE CASCADE
);

-- Add and Manipulate Data

INSERT INTO users(firstname, lastname, age)
    VALUES('Tom', 'Brown', 24), 
          ('Sally', 'Smith', 55), 
          ('Phil', 'Jones', 32), 
          ('Paula', 'Kent', 46),
          ('John', 'Black', 26);

    SELECT * FROM users;


INSERT INTO posts (poster_id, body)
    VALUES(1, 'Its cold today'),
          (1, 'I need a hat'),
          (1, 'And a scarf'),
          (2, 'I like the cold'),
          (3, 'I prefer summer'),
          (4, 'I need a vacation'),
          (5, 'I want to order lunch')
          ;
SELECT * FROM posts;

INSERT INTO likes (liker_id, post_id)
    VALUES (1, 4),
           (1, 5),
           (1, 6),
           (1, 7),
           (2, 4),
           (3, 1),
           (3, 2),
           (3, 3),
           (3, 4),
           (4, 4),
           (4, 5),
           (4, 7),
           (5, 1),
           (5, 2),
           (5, 3),
           (5, 4),
           (5, 5);
           
SELECT * FROM likes;

UPDATE users SET age = 31 WHERE id = 5;
UPDATE users SET firstname = 'Alfred' WHERE id = 3;

SELECT * FROM users;

DELETE FROM likes WHERE id = 1;
DELETE FROM posts WHERE id = 3;

SELECT * FROM likes;
SELECT * FROM posts;

--User `2` decides to delete their account from of social media app.
DELETE FROM users WHERE id = 2;

SELECT * from users;


--Find the user who has given the most likes.


     
   