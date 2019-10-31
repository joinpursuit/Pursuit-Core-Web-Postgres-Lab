--Database and Table Creation 

DROP DATABASE facebook_db;

CREATE DATABASE facebook_db;

\c facebook_db;

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    firstname VARCHAR,
    age INT
);

CREATE TABLE posts(
    id SERIAL PRIMARY KEY,
    poster_id INT REFERENCES users(id) ON DELETE CASCADE,
    body TEXT
);

CREATE TABLE likes(
    id SERIAL PRIMARY KEY,
    liker_id INT REFERENCES users(id) ON DELETE CASCADE,
    post_id INT REFERENCES posts(id) ON DELETE CASCADE
);

--Add and Manipulate Data

INSERT INTO users(firstname, age)
     VALUES ('Jimmy', 29),
            ('Buddy', 26),
            ('Joe', 24),
            ('Ricky', 32),
            ('Malcolm', 22);

INSERT INTO posts(poster_id, body)
    VALUES (1, 'The weather in Miami is amazing' ), (1, 'We out in South Beach!!!'), (1, 'Heat are winning 55 games this year. Mark my words'),
           (2, 'I just got paid. Its litty!'),
           (3, 'This guy Kyrie is out of his mind man wtf'),
           (4, 'I am sick of Devin complaining about double tems in practice'),
           (5, 'When does Vic come back?');

INSERT INTO likes(liker_id, post_id)
    VALUES (1, 4), (1, 5), (1, 6), (1, 7);

INSERT INTO likes(liker_id, post_id)
    VALUES(2, 4);

INSERT INTO likes(liker_id, post_id)
    VALUES (3,1), (3,2), (3,3), (3,4);

INSERT INTO likes(liker_id, post_id)
    VALUES (4,4), (4,5), (4,7);

INSERT INTO likes(liker_id, post_id)
    VALUES (5,1), (5,2), (5,3), (5,4), (5,5);

UPDATE 
    users
SET
    age = 31
WHERE
    id = 5;

-----------------
UPDATE
    users
SET
    firstname = 'Alfred'
WHERE
    id = 3;

------------------
DELETE FROM
    likes
WHERE
    liker_id = 1
and
    post_id = (SELECT id FROM posts WHERE poster_id = 2);

-------------------

DELETE FROM 
    posts
WHERE
    poster_id = 1 
and
    body = 'Heat are winning 55 games this year. Mark my words';

------------------

DELETE FROM
    users
WHERE
    id = 2;

-------------------


