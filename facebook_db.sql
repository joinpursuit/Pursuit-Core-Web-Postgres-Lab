DROP DATABASE facebook_db;

CREATE DATABASE facebook_db;

-- connecting to facebook_db database

\c facebook_db

-- Database & Table Creation

CREATE TABLE Users (
    id SERIAL PRIMARY KEY,
    username VARCHAR,
    age INT
);

CREATE TABLE Posts (
    id SERIAL PRIMARY KEY,
    poster_id INT REFERENCES Users (id) ON DELETE CASCADE,
    body VARCHAR
);

CREATE TABLE Likes (
    id SERIAL PRIMARY KEY,
    liker_id INT REFERENCES Users (id) ON DELETE CASCADE,
    post_id INT REFERENCES Posts (id) ON DELETE CASCADE
);

-- Add and Manipulate Data

-- Add 5 Users
INSERT INTO Users(username, age)
    VALUES ('Jack', 600),
            ('Lich', 350),
            ('Dracula', 1300),
            ('Akio', 33),
            ('Reaper', 9999);

--  One user should have three posts. Add at least one post for the rest of users.
INSERT INTO Posts(poster_id, body)
        VALUES (1, 'Sang in the Graveyard today'),
        (1, 'Theres an emptyness in my bones'),
        (1, 'Wait whats this!'),
        (2, 'Uncovered secret about human blood'),
        (3, 'Did someone say blood?'),
        (4, 'I will defeat you all'),
        (5, 'Im waiting...');

-- User with id = 1 likes all the other users posts.
INSERT INTO Likes(liker_id, post_id)
    VALUES 
         (1, 4),
         (1, 5),
         (1, 6),
         (1, 7);

--  User with id = 2 likes only his/her own post.
INSERT INTO Likes(liker_id, post_id)
    VALUES
        (2, 4);

--  User's 2 & 1 posts are liked by user 3
INSERT INTO Likes(liker_id, post_id)
    VALUES 
        (3, 1),
        (3, 2),
        (3, 3),
        (3, 4);

--  User 4 likes all posts except her own and user's 1.
INSERT INTO Likes(liker_id, post_id)
    VALUES 
        (4, 5),
        (4, 6),
        (4, 7);

--  All the posts of user's 1, 2, 3 are liked by user 5.
INSERT INTO Likes(liker_id, post_id)
    VALUES 
        (5, 1),
        (5, 2),
        (5, 3),
        (5, 4),
        (5, 5);

--  Update the age of user with id 5 to be 31.
UPDATE Users SET age = 31 WHERE id = 5; 

--  Update the name of user 3 to be Alfred
UPDATE Users SET username = 'Alfred' WHERE id = 3; 

--  User 1 stops liking user's 2 post.
DELETE FROM Likes
WHERE
    liker_id IN
    (SELECT liker_id
    FROM Likes
WHERE id = 2);

--  The user who had three posts decides to delete his/her last post.
DELETE FROM
    Posts
WHERE
    id = 3;

--  User 2 decides to delete their account from of social media app.
DELETE FROM
    Users
WHERE
    id = 2;

--  Find the user who has given the most likes.
-- SELECT
--     username
-- FROM 
--     Users
-- WHERE
--     username IN    
-- (SELECT liker_id
--     FROM Likes
-- WHERE id = 2);

SELECT
    COUNT(post_id) AS Counting, liker_id
FROM
    Likes
    GROUP BY liker_id;
    -- ORDER BY COUNT(post_id) DESC
    -- LIMIT 5;

-- Find the most liked post.
SELECT
    COUNT(liker_id) AS Counting, post_id
FROM
    Likes
    GROUP BY post_id;

-- Find all the information of the user how posted the most liked post.


-- Select Something

SELECT 
*
FROM
    Likes;
