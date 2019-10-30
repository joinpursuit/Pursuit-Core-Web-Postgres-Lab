DROP DATABASE facebook;
-- Database & Table Creation

CREATE DATABASE facebook;

\c facebook

-- Create Users Table

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    firstname VARCHAR,
    age INT
    );

-- Create Posts Table

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    poster_id INT REFERENCES users (id),
    body VARCHAR
);

CREATE TABLE likes (
    id SERIAL PRIMARY KEY,
    liker_id INT REFERENCES users (id),
    post_id INT REFERENCES posts(id)
);

-- Add and manipulate data

--- add 5 users
INSERT into users (firstname, age)
    VALUES ('Hupaul', 25),
           ('Aransa', 24),
           ('Briahana', 25),
           ('Dantae', 22),
           ('Jonathan', 33),
           ('Elisandra', 21);

SELECT * FROM users;
--- One user should have three posts. Add at least one post for the rest of users.


-- Hupaul posts
INSERT into posts (poster_id, body) 
    VALUES (1, 'It is so easy to get frags in the new Call of Duty game'),
           (1, 'I really dislike playing on this map, it is way too open');

-- Aransa posts
INSERT into posts (poster_id, body) 
    VALUES (2, 'Ugh I cant wait to leave work today...'),
           (2, 'I really want to go to this party tmm but I dont know what to wear'),
           (2, 'I forgot my umbrella at home smh');

-- Briahana posts
INSERT into posts (poster_id, body) 
    VALUES (3, 'This new song by Chris Brown is dope!'),
           (3, 'The rnb singers these days have no talent');

-- Dantae posts
INSERT into posts (poster_id, body) 
    VALUES (4, 'The recent update to AMD chips messed up my framerate something serious');

-- Jonathan posts
INSERT into posts (poster_id, body) 
    VALUES (5, 'I need to finish this game before the due date, but its
            hard to work with these people'),
           (5, 'Does anyone know how to draw, and are willing to teach me? My drawings suck ass');

-- Elisandra 1st post
INSERT into posts (poster_id, body) 
    VALUES (6, 'I hope the new Unity3D update doesnt break my game');

SELECT * FROM posts;
--- Liking Posts

INSERT into likes (liker_id, post_id)
    VALUES 
    (1, 3), (1, 4), (1, 5), (1, 6), (1, 7), (1, 8), (1, 9), (1, 10), (1, 11), 
    (2, 3), (2, 4), (2, 5), 
    (3, 1), (3, 2), (3, 3), (3, 4), (3, 5),
    (4, 3), (4, 4), (4, 5), (4, 6), (4, 7), (4, 9), (4, 10), (4, 11),
    (5, 1), (5, 2), (5, 3), (5, 4), (5, 5), (5, 6), (5, 7);

SELECT * FROM likes;
--- Update User info

UPDATE users SET age = 31 WHERE id = 5;

UPDATE users SET firstname = 'Alfred' WHERE id = 3;

DELETE FROM likes WHERE (liker_id = 1 AND post_id = 3) OR (liker_id = 1 AND post_id = 4) OR (liker_id = 1 AND post_id = 5);

SELECT * FROM likes;

DELETE FROM users WHERE firstname = 'Aransa';

