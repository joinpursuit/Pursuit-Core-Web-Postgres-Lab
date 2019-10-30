-- Database & Table Creation
DROP DATABASE facebook;
CREATE DATABASE facebook;

\c facebook

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR,
  age INT
);

CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  poster_id INT,
  body VARCHAR,
  FOREIGN KEY (poster_id) REFERENCES users (id) ON DELETE CASCADE
);

CREATE TABLE likes (
  id SERIAL PRIMARY KEY,
  liker_id INT,
  post_id INT,
  FOREIGN KEY (liker_id) REFERENCES users (id) ON DELETE CASCADE,
  FOREIGN KEY (post_id) REFERENCES posts (id) ON DELETE CASCADE
);

-- Add and Manipulate Data

--Add 5 users
INSERT INTO users(name,age)
  VALUES ('Sharrar',24), ('Amin',34), ('Aransa',23), ('Hupaul',29), ('Chuck',22);

-- One user should have three posts
INSERT INTO posts(poster_id,body)
  VALUES (1,'HEY'), (1,'YO'), (1,'BRO'), (2,'HOW'), (3,'ARE'), (4,'YOU'), (5,'DOIN');

-- User with id = 1 likes all other posts
INSERT INTO likes (liker_id,post_id)
  VALUES (1,4), (1,5), (1,6), (1,7);

-- User with id = 2 likes his own
INSERT INTO likes (liker_id,post_id)
  VALUES (2,4);

-- User's 2 and 1 posts are liked by 3
INSERT INTO likes (liker_id,post_id)
  VALUES (3,1), (3,2), (3,3), (3,4);

-- User 4 likes all except his and 1's
INSERT INTO likes (liker_id,post_id)
  VALUES (4,4), (4,5), (4,7);

-- All posts of 1, 2 and 3 are liked by 5
INSERT INTO likes (liker_id,post_id)
  VALUES (5,1), (5,2), (5,3), (5,4), (5,5);

-- Update age of user 5 to be 31
UPDATE
  users
SET
  age = 31
WHERE
  id = 5;

-- Update name of user 3 to be Alfred
UPDATE
  users
SET
  name = 'Alfred'
WHERE
  id = 3;

-- User 1 stops liking 2's post
DELETE FROM
  likes
WHERE
  id = 1;

-- User with 3 posts deletes his last
DELETE FROM
  posts
WHERE
  id = 3;

-- User 2 deletes account
DELETE FROM
  users
WHERE
  id = 2;

-- Find the user who has given the most likes
SELECT name, (SELECT COUNT(liker_id))
  FROM users JOIN likes ON (users.id = likes.liker_id)
GROUP BY name
ORDER BY (SELECT COUNT(liker_id)) DESC
LIMIT 1;

-- Find the most liked post
SELECT body, poster_id
FROM posts JOIN likes ON (likes.post_id = posts.id)
GROUP BY body, poster_id
ORDER BY (SELECT COUNT(likes.post_id)) DESC
LIMIT 1;

-- Find all the information of the user who posted the more liked post
SELECT name, age, users.id
FROM users JOIN posts ON (users.id = posts.poster_id) JOIN likes ON (posts.id = likes.post_id)
GROUP BY name, age, users.id
ORDER BY (SELECT COUNT(DISTINCT liker_id)) DESC
LIMIT 1;
