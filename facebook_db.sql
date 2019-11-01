
DROP DATABASE IF EXISTS facebook_db;
CREATE DATABASE facebook_db;

\c facebook_db

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    age INT NOT NULL
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    poster_id INT REFERENCES users (id),
    body TEXT NOT NULL
);

CREATE TABLE likes (
    id SERIAL PRIMARY KEY,
    liker_id INT REFERENCES users (id),
    post_id INT REFERENCES posts (id)
);

-- ADD 5 USERS
INSERT INTO users (name, age)
    VALUES ('Robert Baratheon', 31),
            ('Jaime Lannister', 32),
            ('Catelyn Stark', 33),
            ('Cersei Lannister', 34),
            ('Daenerys Targaryen', 35);

SELECT * FROM users;

-- USER's 1 POSTS (3)
INSERT INTO posts (poster_id, body)
    VALUES (1, 'Post 1, I dont know what to say'),
            (1, 'How come I never watched this show'),
            (1, 'Not important, I have better to do'),
-- OTHER USERS POSTS (one each)
            (2, 'Don''t event know thoes actors'),
            (3, 'Whatever'),
            (4, 'blabla'),
            (5, '......'), (2, 'test');

SELECT * FROM posts
    JOIN users ON (poster_id = users.id);

--User with id=1 likes all the other users posts.
INSERT INTO likes (liker_id, post_id)
    VALUES (1, 4),
            (1, 5),
            (1, 6),
            (1, 7), (1, 8),
--User with id = 2 likes only his/her own post.
            (2, 4),
--User's 2 & 1 posts are liked by user 3
            (3, 1),
            (3, 2),
            (3, 3),
            (3, 4),
--User 4 likes all posts except her own and user's 1.
            (4, 4),
            (4, 5),
            (4, 7),
-- All the posts of user's 1, 2, 3 are liked by user 5.
            (5, 1),
            (5, 2),
            (5, 3),
            (5, 4),
            (5, 5);

SELECT * FROM likes;

-- Update the age of user with id 5 to be 31.
UPDATE users SET age = 31 WHERE id = 5;
SELECT * from users;

--Update the name of user 3 to be Alfred
UPDATE users SET name = 'Alfred' WHERE id = 3;
SELECT * from users;

--User 1 stops liking user's 2 post
DELETE FROM likes WHERE liker_id = 1 AND post_id IN (
    SELECT id FROM posts WHERE poster_id = 2
);
SELECT * from likes WHERE liker_id = 1;

--The user who had three posts decides to delete his/her last post.
DELETE FROM likes WHERE post_id = (
    SELECT MAX(id) FROM posts WHERE poster_id = 1);
DELETE FROM posts WHERE poster_id = 1 AND id = (
    SELECT MAX(id) FROM posts WHERE poster_id = 1);
SELECT *  FROM posts WHERE poster_id = 1;

--User 2 decides to delete their account from of social media app.
DELETE FROM likes WHERE post_id IN (
    SELECT id FROM posts WHERE poster_id = 2);
DELETE FROM Likes WHERE liker_id = 2;
DELETE FROM posts WHERE poster_id = 2;
DELETE FROM users WHERE id = 2;
SELECT * FROM users;

--Find the user who has given the most likes.
SELECT subtable.name, subtable.total 
    FROM (
        SELECT name, COUNT(liker_id) AS total 
        FROM Likes JOIN users 
        ON liker_id = users.id 
        GROUP BY name
        ORDER BY total DESC) subtable
    LIMIT 1;


--Find the most liked post.
-- SELECT MAX(COUNT(post_id)) AS most_liked_post FROM likes;
SELECT * FROM users JOIN posts ON users.id = poster_id
    JOIN likes ON posts.id = post_id;

SELECT subtable.name, subtable.post_id, subtable.total
   FROM (
        SELECT users.name, post_id, COUNT(post_id) AS total 
        FROM likes JOIN posts
        ON post_id = posts.id 
        JOIN users 
        ON poster_id = users.id
        GROUP BY post_id, users.name
        ORDER BY total DESC) subtable
   LIMIT 1;


--Find all the information of the user how posted the most liked post.
-- SELECT * FROM users WHERE id = (
--     SELECT poster_id FROM posts WHERE COUNT(post_id) >= (
--         SELECT MAX(COUNT(post_id)) AS most_liked_post FROM likes
--     ));
SELECT subtable.id, subtable.name, subtable.age
   FROM (
        SELECT users.id, users.name, users.age, COUNT(post_id) AS total 
        FROM likes JOIN posts
        ON post_id = posts.id 
        JOIN users 
        ON poster_id = users.id
        GROUP BY post_id, users.id, users.name, users.age
        ORDER BY total DESC) subtable
   LIMIT 1;

-- V2
-- COMMENTS TABLE
CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    commenter_id INT REFERENCES users (id),
    post_id INT REFERENCES posts (id),
    body TEXT
);

-- ALBUMS TABLE
CREATE TABLE albums (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users (id),
    album_name VARCHAR (35)
);

-- PICTURES TABLE
CREATE TABLE pictures (
    id SERIAL PRIMARY KEY,
    album_id INT REFERENCES albums (id),
    pic_url TEXT
);