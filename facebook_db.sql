-- Database & Table Creation

DROP DATABASE IF EXISTS facebook;
CREATE DATABASE facebook;

\c facebook;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS likes;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    age INTEGER
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

-- ### Add and Manipulate Data

INSERT INTO users (name, age)
    VALUES('Sam',28),
            ('Mike', 37),
            ('Jon', 72),
            ('Kevin', 9),
            ('Bob', 101);

INSERT INTO posts (poster_id, body)
    VALUES(1,'post 1'),
            (1, 'post 2'),
            (1, 'post 3'),
            (2, 'post 4'),
            (3, 'post 5'),
            (4, 'post 6'),
            (5, 'post 7');

INSERT INTO likes (liker_id, post_id)
    VALUES(1,4),
        (1,5),
        (1,6),
        (1,7),
        (2,4),
        (3,1),
        (3,2),
        (3,3),
        (3,4),
        (4,4),
        (4,5),
        (4,7),
        (5,1),
        (5,2),
        (5,3),
        (5,4),
        (5,5);

UPDATE users SET age=31 WHERE id=5;
UPDATE users SET name='Alfred' WHERE id=3;
DELETE FROM likes WHERE liker_id = 1;
DELETE FROM posts WHERE poster_id = 3;
DELETE FROM users WHERE id= 2;


-- SELECT MAX (liker_id) FROM likes
-- SELECT MAX (poster_id) FROM posts