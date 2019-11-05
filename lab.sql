-- Database and Tables 
DROP DATABASE facebook;
CREATE DATABASE facebook;
\c facebook
-- Create (Users) Table
CREATE TABLE users (
   id SERIAL PRIMARY KEY,
   firstname VARCHAR,
   age INT
   );
-- Create (Posts) Table
CREATE TABLE posts (
   id SERIAL PRIMARY KEY,
   owner_id INT REFERENCES users (id),
   body VARCHAR
);
CREATE TABLE likes (
   id SERIAL PRIMARY KEY,
   liker_id INT REFERENCES users (id),
   post_id INT REFERENCES posts(id)
);

--- add (5) users
INSERT into users (firstname, age)
   VALUES ('Alpha', 21),
          ('Echo', 22),
          ('Charlie', 23),
          ('Foxtrot', 24),
          ('Whiskey', 25),
          ('Bravo', 26);      
SELECT * FROM users;
INSERT into posts (owner_id, body)
   VALUES (1, 'Ive been hit!'),
          (1, 'Target 300 meters out, Respond Bravo!');
INSERT into posts (owner_id, body)
   VALUES (2, 'Alpha get down!'),
          (2, 'Alphas been hit!'),
          (2, 'Im the best soldier youve got');
INSERT into posts (owner_id, body)
   VALUES (3, 'Heard you Echo! Alpha lay down!');
INSERT into posts (owner_id, body)
   VALUES (5, 'Alpha you nugget! Listen next time!'),
          (5, 'I need to pay attention...');
INSERT into posts (owner_id, body)
   VALUES (6, 'Alpha, Echo, Charlie! Watch your flank!');

SELECT posts.body, post.id AS post_id, likes.id, likes.liker_id
