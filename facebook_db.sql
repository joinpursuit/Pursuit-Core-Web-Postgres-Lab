DROP DATABASE IF EXISTS facebook_db;
CREATE DATABASE facebook_db;

\c facebook_db;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS posts;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name TEXT,
    age INTEGER,
    id INTEGER REFERENCES users(id) ON DELETE SET NULL
);

CREATE TABLE posts(
    id SERIAL PRIMARY KEY,
    poster_id INT REFERENCES users(id),
    body TEXT

);
CREATE TABLE likes (
    id SERIAL PRIMARY KEY,
    liker_id INT REFERENCES users(id),
    post_id INT REFERENCES posts(id)
);
INSERT INTO users (name, age)
VALUES ('deja', 35), ('jon', 26), ('maria', 21), ('alex', 16), ('socrates',3);

INSERT INTO posts (poster_id, body)
VALUES (1, 'hi'), (2,'bye'),(3, 'hi'), (4,'bye'),(5, 'yerrrr'), (5, 'meow'),(5, 'bloop');

INSERT INTO likes (liker_id, post_id)
VALUES (1, 5), (2, 1), (2, 3), (2, 5), (3, 1), (3, 5), (4, 1), (5, 1), (2, 2), (2, 3), (4,3);
UPDATE users
SET name = "Alfred"
WHERE id = 3;
UPDATE users
SET age = 31
WHERE id = 5
DELETE FROM users
WHERE ID = 2;
DELETE FROM posts
WHERE post_id = 3;