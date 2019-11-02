-- Database & Table Creation

DROP DATABASE facebook;

CREATE DATABASE facebook;

\c facebook

CREATE TABLE users(id SERIAL PRIMARY KEY, names VARCHAR, age INT);


CREATE TABLE posts(id SERIAL PRIMARY KEY, poster_id INT REFERENCES users (id), body VARCHAR);


CREATE TABLE likes(id SERIAL PRIMARY KEY, liker_id INT REFERENCES users (id), post_id INT REFERENCES posts (id));

-- Add and Manipulate Data

INSERT INTO users (names, age) VALUES ('Victoria', 47), ('Gerson', 33) , ('Maria' , 44) , ('Chris' , 36) , ('John' , 27);

INSERT INTO posts (poster_id , body)  VALUES (1 , 'Good morning'),(2,'Hey everyone'),(2,'Merry Christmas'),(2,'Wow'),(3,'That was fun'),(4,'OMG'),(5,'Look at my dog'),(5,'Going to the mall');

INSERT INTO likes (liker_id , post_id) VALUES (1 , 2) , (1 , 3) , (1 , 4) , (1 , 5) , (1 , 6) , (1 , 7) , (1 , 8) ,
(2 , 2) , (2 , 3) , (2 , 4) , 
(3 , 1) , (3 , 2) , (3 , 3) , (3 ,4) ,
(4 , 2) , (4 , 3) , (4 , 4) , (4 , 5) , (4 , 7) , (4 , 8) , 
(5 , 1) , (5 , 2) , (5 , 3) , (5 , 4) , (5 , 5);

UPDATE users
SET age = 31 
WHERE id = 5;

UPDATE users
SET names = 'Alfred'
WHERE id = 3;

DELETE FROM likes WHERE liker_id = 1 AND post_id IN((SELECT id FROM posts WHERE poster_id = 2));

DELETE FROM likes WHERE post_id = 4;
DELETE FROM posts WHERE id = 4;

DELETE FROM likes WHERE liker_id = 2 OR post_id IN((SELECT id FROM posts WHERE poster_id = 2));
DELETE FROM posts WHERE poster_id = 2;
DELETE FROM users WHERE id = 2;

SELECT names FROM users
WHERE id = (SELECT liker_id FROM likes GROUP BY liker_id ORDER BY COUNT(id) DESC LIMIT 1);

SELECT body FROM posts 
WHERE id = (SELECT post_id FROM likes GROUP BY post_id ORDER BY COUNT(id) DESC LIMIT 1);

SELECT * FROM users
WHERE id = (SELECT poster_id FROM posts 
WHERE id = (SELECT post_id FROM likes GROUP BY post_id ORDER BY COUNT(id) DESC LIMIT 1));