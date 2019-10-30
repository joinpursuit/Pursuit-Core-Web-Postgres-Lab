-- Database & Table Creation
DROP DATABASE facebook;
CREATE DATABASE facebook;

\c facebook;

CREATE TABLE users(
	id SERIAL PRIMARY KEY,
	name VARCHAR, 
	age INT
);

CREATE TABLE posts(
	id SERIAL PRIMARY KEY, 
	body VARCHAR,
	poster_id INT REFERENCES users(id)
);

CREATE TABLE likes(
	id SERIAL PRIMARY KEY, 
	liker_id INT REFERENCES users(id),
	post_id INT REFERENCES posts(id)
);

INSERT INTO users(name, age)
	VALUES('Lebron James', 35), ('Anthony Davis', 26),
	('Rajon Rondo', 31), ('God Caruso', 1000), ('Chuck Okonkwo', 25);

INSERT INTO posts(body, poster_id)
	VALUES('I am so bored of regular season' ,1), ('Im re-signing', 2),
	 ('I am a trash basketball player', 3), ('WIN', 4), ('Statistics are key', 5),
	 ('Lake show for life', 5), ('Nba basketball is amazing', 5);

INSERT INTO likes(liker_id, post_id)
	VALUES(1, 2), (1, 3), (1, 4), (1, 5), (1, 6), (1, 7),(2,2), (3, 1), (3, 2),
	(4, 2), (4, 3), (4, 5), (4, 6), (4, 7), (5, 1), (5, 2), (5, 3);


UPDATE users
SET age = 31 
WHERE name = 'Lebron James';

UPDATE users 
SET name = 'Alfred'
WHERE id = 3;

DELETE 
FROM likes 
WHERE id = 1;

DELETE 
FROM likes
WHERE post_id = 7;

DELETE
FROM posts
WHERE id = 7;

DELETE 
FROM likes
WHERE liker_id = 2 OR post_id IN (SELECT id FROM posts WHERE poster_id = 2);

SELECT * FROM likes;

DELETE 
FROM posts 
WHERE poster_id = 2;

DELETE
FROM users
WHERE id = 2;

SELECT name FROM users WHERE id = (

SELECT liker_id  FROM likes GROUP BY liker_id ORDER BY COUNT(id) DESC
LIMIT 1);

SELECT body FROM posts WHERE id = (

	SELECT post_id FROM likes GROUP BY post_id ORDER BY COUNT(id) DESC LIMIT 1
	);

SELECT name, age FROM users WHERE id = (
	SELECT poster_id FROM posts WHERE id = (

		SELECT post_id FROM likes GROUP BY post_id ORDER BY COUNT(id) DESC LIMIT 1
	)
);



