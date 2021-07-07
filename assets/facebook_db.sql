-- Database & Table Creation
DROP DATABASE facebook_db;
CREATE DATABASE facebook_db;


\c facebook_db;

CREATE TABLE users (
  id serial PRIMARY KEY,
  fullname VARCHAR,
  age INT
);

CREATE TABLE posts (
  id Serial PRIMARY KEY,
  poster_id INT REFERENCES users(id) ON DELETE CASCADE,
  body VARCHAR
);

CREATE TABLE likes (
  id serial primary key,
  liker_id INT REFERENCES users (id) ON DELETE CASCADE,
  post_id INT REFERENCES posts (id) ON DELETE CASCADE
);

-- Add and Manipulate Data
INSERT INTO users (fullname, age)
VALUES
  ('Victoria Adams', 47),
  ('Gerson Lopez', 33),('George Lopez', 30),('Micheal Amparo', 24),('Jenesh Napit', 24);

INSERT INTO posts (poster_id, body)
VALUES
  (1, 'Hello'),(1, 'World'),(1, 'Code'),(2, 'Javascript'),(3, 'ECMASCRIPT'),(4, 'PYTHON'),(5, 'C++'),(4,'Goodbye');
-- DELETE from users

INSERT INTO likes (liker_id, post_id)
VALUES
  (1, 1),(1, 2),(1, 3),(1, 4),(1, 5),(1, 6),(1, 7),(2,3),(4,3),(5,3),(3,2),(4,3);


UPDATE users
SET
  fullname = 'Alfred'
WHERE
  id = 3;

UPDATE users
SET
  age = 31
WHERE
  id = 5;

DELETE from users
WHERE
  id = 2;

-- find the 
SELECT * from users 
  WHERE id = (
  SELECT liker_id from likes
  GROUP BY liker_id
  ORDER BY COUNT(liker_id) DESC
  LIMIT 1);

-- find the most liked post
SELECT  posts.id AS post_id, COUNT(posts.id) AS times_liked
  from posts
  JOIN likes ON posts.id = likes.post_id
  GROUP BY posts.id
  ORDER BY times_liked DESC
  LIMIT 1;

-- find the user with the most liked post by the most liked post id
SELECT * from users 
  JOIN posts ON users.id = posts.poster_id  
  WHERE posts.id = (
    SELECT posts.id
      FROM posts
      JOIN likes ON posts.id = likes.post_id
      GROUP BY posts.id
      ORDER BY COUNT(posts.body) DESC
      LIMIT 1
  );