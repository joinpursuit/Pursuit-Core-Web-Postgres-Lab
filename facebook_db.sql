DROP DATABASE IF EXISTS mug_mag;
CREATE DATABASE mug_mag;

\c mug_mag;


DROP Table IF EXISTS users;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS likes;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name TEXT,
    age INTEGER
);


CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    poster_id INTEGER REFERENCES users(id) ON DELETE SET NULL,
    body TEXT
);

CREATE TABLE likes (
    id SERIAL PRIMARY KEY,
    liker_id INTEGER,
    post_id INTEGER
);

-- add 5 users
INSERT INTO users (name,age)
    VALUES ('Jay', 15) ,
           ('Kelvin',85),
           ('Corey',100),
           ('Jon', 30),
           ('Jason',40);

INSERT INTO posts (poster_id, body)
    VALUES (1,'I like that comment'),
           (2,'Wow'),
           (3,'smh'),
           (4,'cool'),
           (5,'lol'),
           (3,'woah'),
           (3,'thats dope');

INSERT INTO likes (liker_id, post_id)
    VALUES (1,1),
            (1,2),
            (1,3),
            (1,4),
            (1,5),
            (1,6),
            (1,7),          
            (2,2),
            (3,1),
            (3,2),
            (4,2),
            (4,3),
            (4,4),
            (4,5),
            (4,6),
            (4,7),
            (5,1),
            (5,2),
            (5,3),
            (5,6),
            (5,7);

UPDATE users 
SET age = 31
WHERE id = 5;


UPDATE users
SET name = 'Alfred'
WHERE id = 3;

DELETE FROM posts
WHERE id = 7;
DELETE FROM likes
WHERE id = 2;

DELETE FROM users 
WHERE id = 2;

SELECT name, COUNT(liker_id) FROM users
JOIN likes 
ON users.id = likes.liker_id
GROUP BY name
ORDER BY COUNT(liker_id) DESC;

SELECT body, COUNT(post_id) FROM posts
JOIN likes
ON likes.post_id = posts.poster_id
GROUP BY body
ORDER BY COUNT(post_id) DESC;

SELECT name, age, users.id, COUNT(liker_id) FROM users
JOIN likes 
ON likes.liker_id = users.id 
GROUP BY name , age, users.id 
ORDER BY COUNT(liker_id) DESC;





 






