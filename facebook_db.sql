DROP DATABASE facebook;

CREATE DATABASE facebook; 

\c facebook;


CREATE TABLE users(
    id SERIAL PRIMARY KEY, 
    username VARCHAR,
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
