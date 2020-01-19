DROP DATABASE IF EXISTS facebook_db;
CREATE DATABASE facebook_db;

\c facebook_db;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS likes;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  age INTEGER
);

CREATE TABLE posts(
  id SERIAL PRIMARY KEY,
  poster_id INTEGER REFERENCES users(id) ON DELETE SET NULL,
  body TEXT NOT NULL
);

CREATE TABLE likes (
  id SERIAL PRIMARY KEY,
  liker_id INTEGER REFERENCES users(id) ON DELETE SET NULL ,
  post_id INTEGER REFERENCES posts(id) ON DELETE SET NULL 
);

--add and manipulate data
INSERT INTO users (name, age)
  VALUES('Maria', 27),
        ('Deven', 31),
        ('Jenifer', 28),
        ('Zak', 13),
        ('Anabel', 45);


INSERT INTO posts (poster_id, body)
  VALUES(4, 'I love it.'), 
        (4, 'Today was a good day.'), 
        (4, 'Stay away.'), 
        (1, 'How is everyone?'), 
        (2, 'Call me crazy but I feel like....'), 
        (3, 'Cookies are the best.'), 
        (5, 'What conspiricy theories are you into?'); 

INSERT INTO likes (liker_id, post_id)
  VALUES(1, 1),
        (1, 2),
        (1, 3),
        (1, 5),
        (1, 6),
        (1, 7),
        (2, 1),
        (2, 2),
        (2, 3),
        (3, 4),
        (3, 5),
        (4, 5),
        (4, 6),
        (4, 7),
        (5, 4),
        (5, 5),
        (5, 6);
       
