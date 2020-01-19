--Database & Table Creation

DROP DATA DATABASE IF EXISTS facebook_data;
CREATE DATABASE facebook_data;
\c facebook_data

CREATE Table users(
    id SERIAL PRIMARY KEY,
    name TEXT,
    age INTEGER,
);

CREATE Table likes(
    id SERIAL PRIMARY KEY,
    FOREIGN KEY liker_id REFERENCES users(id),
    FOREIGN KEY post_id REFERENCES posts(id),
);

CREATE Table posts(
    id SERIAL PRIMARY KEY,
    FOREIGN KEY poster_id REFERENCES users(id),

);