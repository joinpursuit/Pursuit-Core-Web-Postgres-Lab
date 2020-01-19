DROP DATABASE IF EXISTS facebook_db;
CREATE DATABASE facebook_db;

\c facebook_db;

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
    poster_id INTEGER REFERENCES users(id),
    body TEXT
);

CREATE TABLE likes (
    id SERIAL PRIMARY KEY,
    liker_id INTEGER REFERENCES users(id),
    post_id INTEGER REFERENCES posts(id)
);


-- Add and Manipulate Data
INSERT INTO users (name, age)
VALUES 
    ('Corey', 100),
    ('Kevin', 88),
    ('Ohidur', 69),
    ('Celine', 19),
    ('Henry', 1);

INSERT INTO posts (poster_id, body)
    VALUES
        (5, 'GIT COMMIT'),
        (5, 'GIT PUSH'),
        (5, 'GIT MONEY'),
        (1, 'Good morning'),
        (2, 'Yerrrr'),
        (3, 'haaaaan'),
        (4, 'byebye');

INSERT INTO likes (liker_id, post_id)
    VALUES
        (1, 1),
        (1, 2),
        (1, 3),
        (1, 4),
        (1, 5),
        (1, 6),
        (1, 7);