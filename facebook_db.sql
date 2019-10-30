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
 poster_id INT REFERENCES users(id) ON DELETE CASCADE,
 body TEXT
);


CREATE TABLE likes (
 id SERIAL PRIMARY KEY, 
 liker_id INT REFERENCES users(id) ON DELETE CASCADE, 
 post_id INT REFERENCES posts(id) ON DELETE CASCADE
);

-- Add and Manipulate Data 
INSERT INTO users (name, age) 
 VALUES ('Jon', 33),
       ('Ben', 45),
       ('Bob', 62),
       ('Josh', 78),
       ('Dave', 92);


-- SELECT * FROM users;

INSERT INTO posts (poster_id, body) 
 VALUES (1, 'Hello World'), 
       (1, 'Im Happy'), 
       (1, 'And Hungry'), 
       (2, 'Why so serious?'),  
       (3, 'You can do it'), 
       (4, 'Oh lordy'), 
       (5, 'Trueee'),
       (2, 'Why so serious?'); 

-- SELECT * FROM posts;

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
        (5, 5),
        (1, 8),
        (5, 6);

UPDATE 
 users 
SET 
 age = 31 
WHERE 
 id = 5;

-- SELECT * FROM users;

UPDATE 
 users 
SET 
 name = 'Alfred'
WHERE 
 id = 3;

--SELECT * FROM users;

-- DELETE FROM likes 
--  WHERE liker_id = 1 AND post_id = 4; 

DELETE FROM likes 
 WHERE liker_id = 1 AND post_id IN (
     SELECT id FROM posts WHERE poster_id = 2
 ); 

-- SELECT * FROM likes;

-- SELECT * FROM posts;

-- ALTER TABLE likes
-- DELETE CONSTRAINT likes_post_id_fkey,
-- ADD CONSTRAINT likes_post_id_fkey
--     FOREIGN KEY (post_id)
--     REFERENCES id (post_id)
--     ON DELETE CASCADE;


DELETE FROM posts 
 WHERE poster_id = 1 AND id = (
     SELECT MAX(id) FROM posts WHERE poster_id = 1
 ); 

--  SELECT * FROM posts;


DELETE FROM users 
 WHERE id = 2; 

--  SELECT * FROM users;

--  SELECT * FROM posts;

--  SELECT * FROM likes;



SELECT liker_id FROM likes
WHERE MAX(count) IN (
    SELECT liker_id, COUNT(liker_id)
FROM likes
GROUP BY liker_id
);






