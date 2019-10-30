DROP DATABASE facebook;

CREATE DATABASE facebook; 

\c facebook;

--Create users table
CREATE TABLE users(
    id SERIAL PRIMARY KEY, 
    users_name VARCHAR,
    age INT
);
--Create posts table
CREATE TABLE posts(
    id SERIAL PRIMARY KEY, 
    poster_id INT REFERENCES users(id),
    body VARCHAR
);
--Create likes table
CREATE TABLE likes(
    id SERIAL PRIMARY KEY, 
    liker_id INT REFERENCES users(id),
    post_id INT REFERENCES posts(id)
);

--Add 5 users
INSERT INTO users(users_name,age)
VALUES('Michelle',22),
    ('Daniel',25),
    ('Gabriel',22),
    ('Lauren ',24),
    ('Henry',23)
;

SELECT * FROM users;

--One user should have 3 posts
--At least 1 for the rest of the users
INSERT INTO posts(poster_id,body)
VALUES(1, 'Hello'),
    (1, 'I am hungry'),
    (1, 'What is your favorite song?'),
    (2, 'I am also hungry'),
    (3, 'Do you think dogs are better than cats?'),
    (4, ':)'),
    (5, 'I do not know what else to right');

SELECT * FROM posts;


