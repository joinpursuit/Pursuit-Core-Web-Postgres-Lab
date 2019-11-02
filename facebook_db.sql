-- Database & Table Creation
DROP DATABASE facebook_db_lab;
CREATE DATABASE facebook_db_lab;
\c facebook_db_lab


CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name_of_user VARCHAR,
    age INT
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    poster_id INT REFERENCES users (id) ON DELETE CASCADE,
    body VARCHAR
);

CREATE TABLE likes (
    id SERIAL PRIMARY KEY,
    liker_id INT REFERENCES users (id) ON DELETE CASCADE,
    post_id INT REFERENCES posts (id) ON DELETE CASCADE
);


-- Add and Manipulate Data

INSERT INTO users (name_of_user, age)
    VALUES  ('user1', 25),
            ('user2', 26),
            ('user3', 27),
            ('user4', 28),
            ('user5', 29);

INSERT INTO posts (poster_id, body) 
    VALUES  (1, 'Today was a fun day'),
            (1, 'I ate good food'),
            (1, 'I slept well'),
            (2, 'I like JavaScript'), -- post 4
            (3, 'I like Python'), -- post 5
            (4, 'I like Java'), -- post 6
            (5, 'I like SQL'); -- post 7


-- User with id = 1 likes all the other users posts.
INSERT INTO likes (liker_id, post_id)
    VALUES  (1, 4),
            (1, 5),
            (1, 6),
            (1, 7);


-- User with id = 2 likes only his/her own post.
INSERT INTO likes (liker_id, post_id)
    VALUES (2, 4);


-- User's 2 & 1 posts are liked by user 3
INSERT INTO likes (liker_id, post_id)
    VALUES  (3, 1),
            (3, 2),
            (3, 3),
            (3, 4);


-- User 4 likes all posts except her own and user's 1.
INSERT INTO likes (liker_id, post_id)
    VALUES  (4, 4),
            (4, 5),
            (4, 7);


-- All the posts of user's 1, 2, 3 are liked by user 5.
INSERT INTO likes (liker_id, post_id)
    VALUES  (5, 1),
            (5, 2),
            (5, 3),
            (5, 4),
            (5, 5);


-- Update the age of user with id 5 to be 31.
UPDATE users
SET age = 31
WHERE id = 5;


-- Update the name of user 3 to be Alfred
UPDATE users
SET name_of_user = 'Alfred'
WHERE id = 3;


-- User 1 stops liking user's 2 post.
DELETE FROM likes 
WHERE liker_id = 1
AND post_id = 2;


-- The user who had three posts decides to delete his/her last post.
DELETE FROM likes 
WHERE post_id = 3; -- deletes the likes on their post

DELETE from posts 
WHERE id = 3; -- deletes the post

SELECT * FROM posts; -- checks the current question


-- User 2 decides to delete their account from of social media app.

-- My previous code
-- DELETE FROM likes 
-- WHERE post_id = 4; -- deletes likes on their posts

-- DELETE FROM likes
-- WHERE liker_id = 2; -- deletes likes they did

-- DELETE FROM posts 
-- WHERE poster_id = 2; -- deletes their posts

-- DELETE FROM users -- deletes the user
-- WHERE id = 2;

-- SELECT * FROM users;


-- New Code





--  Find the user who has given the most likes.
SELECT * FROM likes;

--this shows the column name chaned to num_likes but it doesn't actually change he col name
-- SELECT * FROM users
-- WHERE id =  (
--     SELECT liker_id, COUNT(liker_id) as num_likes 
--         FROM likes 
--         --counts all the likes the user has given
--         GROUP BY liker_id 
--         --this sorts the table
--         ORDER BY COUNT(liker_id) DESC 
--         --limit by top row. Limit is only used by rows
--         LIMIT 1
--     );


\echo --------------------------------------------------
--Another solution to the same question
SELECT name_of_user, COUNT(post_id) AS num_of_likes
    FROM users
    JOIN likes ON users.id = likes.liker_id
    GROUP BY name_of_user
    ORDER BY num_of_likes DESC
    LIMIT 1;

--agregate functions are used with GROUP BY a lot
--GROUP BY works as, t tries to group rows by whatever columns you specify
--Count, counts the numbers of rows in that group(GROUP BY)





--  Find the most liked post.
SELECT posts.id AS post_id, posts.body, COUNT(posts.id) AS times_linked
    FROM posts
    JOIN likes ON posts.id = likes.post_id
    GROUP BY posts.id
    ORDER BY times_linked DESC
    LIMIT 1;




-- Find all the information of the user how posted the most liked post.

SELECT * FROM users
JOIN posts On users.id = posts.poster_id
WHERE posts.id = (
    --find most liked post
    SELECT posts.poster_id
    FROM posts
    JOIN likes ON posts.id = likes.post_id
    GROUP BY (posts.id)
    ORDER BY COUNT(posts.body) DESC
    LIMIT 1
);