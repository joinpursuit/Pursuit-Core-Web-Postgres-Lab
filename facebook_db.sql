DROP DATABASE IF EXISTS facebook_db 
CREATE DATABASE facebook_db

\c facebook_db

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name TEXT,
    age INTEGER
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    post_id INT REFERENCES users(id) ON DELETE SET NULL,
    body TEXT
);

CREATE TABLE  likes (
    id SERIAL PRIMARY KEY,
    liker_id INT REFERENCES users(id) ON DELETE SET NULL,
    post_id INT REFERENCES post(id) ON DELETE SET NULL,
);

INSERT INTO users 
    VALUES (1, 'Jon', 69),
        (2, 'Corey', 100),
        (3, 'Kong', 25),
        (4, 'Henry', 101),
        (5, 'David', 5);