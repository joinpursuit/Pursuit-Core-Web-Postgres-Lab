--Database & Table Creation
DROP DATABASE facebook_db;
CREATE DATABASE facebook_db;

\c facebook_db;

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    fullname VARCHAR,
    age INT
);

CREATE TABLE posts(
    id SERIAL PRIMARY KEY, 
    poster_id INT REFERENCES users(id),
    body VARCHAR
);

CREATE TABLE likes(
    id SERIAL PRIMARY KEY, 
    liker_id INT REFERENCES users(id),
    post_id INT REFERENCES posts(id)
);

--Add and Manipulate Data

INSERT INTO users(fullname, age)
VALUES('Maliq Taylor', 23), ('Kadijah Wilson', 25), ('Michael Amparo', 24), ('Voniel Brown', 24), ('Giselle Sanchez', 24);

INSERT INTO posts(poster_id, body)
VALUES(1, 'Send help pls'), (1, 'Happy Tuesday!'), (1, 'I like space'), (2, 'Hope this works'), (3, 'hi'), (4, 'Apparently one of the Roman emperors marches his army to the sea and ordered them to thow their spears into the sea because he wanted to fight Poseidon'), (5, '*insert dog meme here*');

INSERT INTO likes(liker_id, post_id)
VALUES (1, 4), (1, 5), (1,6), (1,7), (2, 4), (3, 1), (3, 2), (3, 3), (3, 4), (5, 1), (5, 2), (5, 3), (5, 4), (5, 5);

UPDATE users SET age = 31 WHERE id = 5;

UPDATE users SET fullname = 'Alfred' WHERE id = 3;

DELETE FROM likes WHERE liker_id = 1 AND post_id= 4;

DELETE FROM posts WHERE poster_id= 1 AND post_id=3;

DELETE FROM users WHERE id = 2;
