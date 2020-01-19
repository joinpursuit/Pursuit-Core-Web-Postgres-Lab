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
    
    INSERT INTO posts
        VALUES(1, 1, 'Hello World'),
                (2, 1, 'Yerrrrr'),
                (3, 1, 'Superstar David'),
                (4, 2, 'I hate monday'),
                (5, 3, 'Git mloney'),
                (6, 4, 'Hola'),
                (7, 5, 'Bye');
    INSERT INTO likes
        VALUES (1, 1, 4),
                (2, 1, 5),
                (3, 1, 6),
                (4, 1, 7);

    INSERT INTO likes 
        VALUES(5,2,4);

    INSERT INTO likes
        VALUES(6, 3, 4),
                (7, 3, 3),
                (8, 3, 2), 
                (9, 3, 1);

    INSERT INTO likes
        VALUES(10, 4, 4),
                (11, 4, 5),
                (12, 4, 7);

    INSERT INTO likes
        VALUES(13, 5, 1),
                (14, 5, 2), 
                (15, 5, 3),
                (16, 5, 4),
                (17, 5, 5);

    UPDATE users 
    SET age = 31 
    WHERE id = 5;

    UPDATE users
    SET name = 'Alfred'
    WHERE id = 3;

    DELETE FROM likes
    WHERE liker_id = 1 AND post_id = 2;

    DELETE FROM post
    WHERE id = 3;

    DELETE FROM users
    WHERE id = 2

    
        