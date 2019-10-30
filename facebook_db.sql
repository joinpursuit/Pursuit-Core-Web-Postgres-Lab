DROP DATABASE facebook;
-- id(int, PK), name(string), age(integer)
--id(int, pk), poster id(int, fk ref. columun id in user), body(string)
--id(int pk), like id(int, fk ref. col_id in users), post id(int, fk ref. column id in post)


CREATE DATABASE facebook;

\c facebook;

CREATE TABLE users(
id INT PRIMARY KEY,
firstname VARCHAR,
lastname VARCHAR,
age INT
);

CREATE TABLE post(
    id INT PRIMARY KEY,
    poster_id INT REFERENCES users(id),
    body VARCHAR
);


CREATE TABLE likes(
    id INT PRIMARY KEY,
    liker_id INT REFERENCES users(id), 
    post_id INT REFERENCES post(id)
);

--  Add 5 users
INSERT into users (id, firstname, lastname, age)
VALUES(1, 'John', 'Doe', '20'),
      (2, 'Jane', 'Love', '45'),
      (3, 'Angel', 'Smith', '16'),
      (4, 'Charisma', 'Watson', '30'),
      (5, 'No', 'Name', 100);

      SELECT * FROM users;
--  One user should have three posts. Add at least one post for the rest of users.

INSERT into post (id, poster_id, body)
VALUES(2, 1, 'HELLO'),
      (3, 1, 'BYE'), 
      (4, 1, 'Not sure if this is right'),
      (5, 2, 'Hope'),
      (6, 3, 'This'),
      (7, 4, 'Works'),
      (8, 5, 'Please');

SELECT * FROM post;

--  User with id = 1 likes all the other users posts.
--  User with id = 2 likes only his/her own post.
--  User's 2 & 1 posts are liked by user 3
--  User 4 likes all posts except her own and user's 1.
--  All the posts of user's 1, 2, 3 are liked by user 5.
-- liker_id(user) posts_id(post)
INSERT into likes(id, liker_id, post_id)
VALUES (3, 1, 5),
       (4, 1, 6),
       (5, 1, 7),
       (6, 1, 8),
       (7, 2, 5),
       (8, 3, 2),
       (9, 3, 3),
       (10, 3, 4),
       (11, 3, 5);

SELECT * FROM likes;

INSERT into likes(id, liker_id, post_id)
VALUES (12, 4, 5),
       (13, 4, 6),
       (14, 4, 8),
       (15, 5, 2),
       (16, 5, 3),
       (17, 5, 4),
       (18, 5, 5),
       (19, 5, 6);

SELECT * FROM likes;

--  Update the age of user with id 5 to be 31.
--  Update the name of user 3 to be Alfred

UPDATE
users
SET
age = 31
WHERE
id = 5;

select 
firstname, 
lastname,
age
FROM
users
WHERE
id = 5;

UPDATE
users
SET
firstname = 'Alfred'
WHERE
id = 3;

select 
firstname, 
lastname,
age
FROM
users
WHERE
id = 3;

--  User 1 stops liking user's 2 post.
--  The user who had three posts decides to delete his/her last post.
--  User 2 decides to delete their account from of social media app.

DELETE FROM likes
WHERE liker_id = 1 AND post_id = 5;

SELECT * FROM likes

DELETE FROM posts
WHERE poster_id = 1 AND id = 4;

DELETE FROM users
where id = 2;





--  Find the user who has given the most likes.
--  Find the most liked post.
--  Find all the information of the user how posted the most liked post.
