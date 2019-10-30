-- Database & Table Creation V1

DROP DATABASE facebook;

CREATE DATABASE facebook;

\c facebook

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(150),
    age INT
);

-- SELECT * FROM users;

-- COMMAND LINE EXECUTABLE => psql -f facebook_db.sql

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    poster_id INT REFERENCES users(id) ON DELETE CASCADE,
    body TEXT
)

INSERT INTO posts(poster_id, body)
    VALUES (1, 'Hello World');

SELECT * FROM posts;

-- COMMAND LINE EXECUTABLE => psql -f facebook_db.sql

CREATE TABLE likes (
    id SERIAL PRIMARY KEY,
    liker_id INT REFERENCES users(id) ON DELETE CASCADE,
    post_id INT REFERENCES posts(id) ON DELETE CASCADE
);

INSERT INTO likes(liker_id, post_id)
    VALUES (1, 1);

SELECT * FROM likes;

-- COMMAND LINE EXECUTABLE => psql -f facebook_db.sql

-- ADDING USERS 

INSERT INTO users (name, age) VALUES 
    ('A', 43),
    ('B', 39),
    ('C', 23),
    ('D', 57),
    ('E', 33);

INSERT INTO posts (poster_id, body) VALUES
    (1, 'Why so serious'),
    (1, 'You can do it!'),
    (1, 'Oh Lordy'),
    (2, 'Trueee'),
    (3, 'Basically'),
    (4, 'You cant see me'),
    (5, 'Touchdown');

INSERT likes (liker_id, post_id) VALUES
    (1, 4),
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

UPDATE 
    users
SET
    age = 31
WHERE
    id = 5;

UPDATE
    users
SET
    name = 'Alfred'
WHERE
    id = 3;

-- USER

DELETE FROM likes
WHERE liker_id = 1 AND post_id IN (
    SELECT id FROM posts WHERE poster_id = 2
);

DELETE FROM posts
    WHERE poster_id = 1;

-- ALTER TABLE AND ADD CONSTRAINT ON DELETE CASCADE

DELETE FROM posts
    WHERE poster_id = 1 AND id = (
        SELECT MAX(id) FROM posts WHERE poster_id = 1
    );

DELETE FROM users
    WHERE id = 2;

SELECT * FROM users;

-- FIND USER GIVEN THE MOST LIKES

