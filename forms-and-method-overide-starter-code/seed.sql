DROP TABLE IF EXISTS post;

CREATE TABLE post (

  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  body TEXT

);

INSERT INTO post (title , body) VALUES ('Post 1' , 'Body text 1');
INSERT INTO post (title , body) VALUES ('Post 2' , 'Body text 2');
INSERT INTO post (title , body) VALUES ('Post 3' , 'Body text 3');
INSERT INTO post (title , body) VALUES ('Post 4' , 'Body text 4');