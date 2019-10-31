-- Database & Table Creation V1
-- COMMAND LINE EXECUTABLE => psql -f facebook_db.sql

-- DELETE DB IF IT EXISTS THEN RECREATE IT AND CONNECT TO IT
DROP DATABASE IF EXISTS facebook;
CREATE DATABASE facebook;
\c facebook

-- CREATE TABLES (users, posts, likes)
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(150),
    age INT
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id) ON DELETE CASCADE,
    body TEXT
);

CREATE TABLE likes (
    id SERIAL PRIMARY KEY,
    liker_id INT REFERENCES users(id) ON DELETE CASCADE,
    poster_id INT REFERENCES posts(id) ON DELETE CASCADE
);

-- ADDING USERS 
INSERT INTO users (name, age) VALUES 
    ('A', 43),
    ('B', 39),
    ('C', 23),
    ('D', 57),
    ('E', 33);

-- ADDING POSTS
INSERT INTO posts (user_id, body) VALUES
    (1, 'Why so serious'),
    (1, 'You can do it!'),
    (2, 'Trueee'),
    (3, 'Basically'),
    (4, 'You cant see me'),
    (5, 'Touchdown'),
    (2, 'It works'),
    (1, 'Short');

-- ADDING LIKES
INSERT INTO likes (liker_id, poster_id) VALUES
    (1, 4),
    (1, 5),
    (1, 6),
    (1, 7),
    (1, 8),
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

-- UPDATE AGE OF USER 5 TO 31
UPDATE users SET age = 31 WHERE id = 5;
-- UPDATE USER 3's NAME TO 'Alfred'
UPDATE users SET name = 'Alfred' WHERE id = 3;

-- SELECT * FROM likes;

-- -- USER 1 STOPS LIKING USER 2'S POSTS
DELETE FROM likes
WHERE liker_id = 1 AND poster_id IN (
    SELECT id FROM posts WHERE user_id = 2
);

-- -- ALTERNATE SOLUTION BY JOINING TABLE
-- SELECT tl.* FROM likes tl INNER JOIN posts tp ON (tp.id = tl.poster_id)
-- WHERE tl.liker_id = 1 AND tp.user_id = 2;

-- TESTING
-- SELECT * FROM likes LEFT JOIN posts ON (likes.liker_id = posts.user_id);
-- -- WHERE likes.liker_id = 1 AND posts.user_id = 2;

-- DELETE FROM likes USING posts
-- -- ON (likes.id = posts.poster_id)
-- WHERE (likes.liker_id = 1 AND posts.user_id = 2);

-- SELECT * FROM likes;

-- SELECT * FROM posts;

-- SELECT * FROM likes;
-- SELECT * FROM posts;

-- THE USER WHO HAD 3 POSTS DECIDES TO DELETE HIS/HER LAST POST

DELETE FROM posts WHERE id = (
    SELECT id FROM posts
        WHERE user_id = 1
        ORDER BY id DESC
        LIMIT 1
);

-- MISSING DELETING THE LIKES

-- SELECT * FROM posts;

-- -- *** ALTER TABLE(s) AND ADD CONSTRAINT => ON DELETE CASCADE ***

-- USER 2 DECIDES TO DELETE THEIR ACCOUNT FROM OF SOCIAL MEDIA APP
-- REMOVE USERS (id = 2), POSTS (user_id = 2), LIKES (liker_id = 2 & poster_id = 2)

-- SELECT * FROM users;
-- SELECT * FROM posts;
-- SELECT * FROM likes;

DELETE FROM users WHERE id = 2;
-- DELETE FROM posts WHERE user_id = 2;
-- DELETE FROM likes WHERE liker_id = 2 OR poster_id = 2;

-- SELECT * FROM users;
-- SELECT * FROM posts;
-- SELECT * FROM likes;

-- FIND THE USER WHO HAS GIVEN THE MOST LIKES
-- \!clear

SELECT liker_id, COUNT(*)
FROM likes
GROUP BY liker_id 
ORDER BY COUNT(*) DESC
LIMIT 1; 

-- SELECT * FROM posts JOIN likes ON (posts.id = likes.poster_id);

-- SELECT * FROM likes;
-- SELECT * FROM posts;

-- FIND THE MOST LIKED POST
SELECT body, poster_id, COUNT(*) 
FROM likes 
JOIN posts ON (posts.id = likes.poster_id)
GROUP BY poster_id, body
ORDER BY COUNT(*) DESC
LIMIT 1;

-- FIND ALL THE INFORMATION OF THE USER WHO POSTED THE MOST LIKED POST

SELECT users.id, users.name, users.age
FROM posts
JOIN users ON (posts.user_id = users.id)
JOIN likes ON (posts.id = likes.poster_id)
GROUP BY poster_id, body, users.id
ORDER BY COUNT(*) DESC
LIMIT 1;