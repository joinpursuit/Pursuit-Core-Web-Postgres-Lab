DROP DATABASE facebook_style_db;

--Database & Table Creation 
CREATE DATABASE facebook_style_db;

\c facebook_style_db

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    age INT
);

CREATE TABLE posts(
    id SERIAL PRIMARY KEY,
    body VARCHAR,
    poster_id INT REFERENCES users(id) 
);

CREATE TABLE likes(
    id SERIAL PRIMARY KEY,
    liker_id INT REFERENCES users(id),
    post_id INT REFERENCES posts(id)
);

--Add and Manipulate Data

--Insert into isers, posts, likes
INSERT INTO users (name, age)
    VALUES('Rick Grimes', 40),
          ('Michonne Hawthorne', 35),
          ('Carl Grimes', 16),
          ('Daryl Dixon', 40),
          ('Carol Peletier', 45);
    
INSERT INTO posts (body, poster_id)
    VALUES('My weapon of choice is a katana', 2),
          ('My name is Rick', 1),
          ('My name is Carl', 3),
          ('My name is Daryl', 4),
          ('My name is Carol', 5),
          ('My name is Michonne', 2),
          ('I am the leader of the pack', 2);
        
INSERT INTO likes (liker_id, post_id)
    VALUES(1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (1, 6), (1, 7),
          (2, 2), (3, 1), (3, 2), (3, 6, (3, 7),(4, 1), (4, 3), 
          (4, 5), (4, 6), (4, 7), (5, 1), (5, 2), (5,3), (5, 6),
          (5, 7);


       
        




