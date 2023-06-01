# Quiz Application
create database quiz;
use quiz;
CREATE TABLE questions (
    id INT PRIMARY KEY,
    question_text TEXT
);
CREATE TABLE options (
    id INT PRIMARY KEY,
    question_id INT,
    option_text TEXT,
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE answers (
    id INT PRIMARY KEY,
    question_id INT,
    correct_option_id INT,
    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (correct_option_id) REFERENCES options(id)
);
INSERT INTO questions (id, question_text) VALUES (1, 'What is the capital of india?');
INSERT INTO questions (id, question_text) VALUES (2, 'Who is the best ipl captain?');
INSERT INTO options (id, question_id, option_text) VALUES (1, 1, 'punjab');
INSERT INTO options (id, question_id, option_text) VALUES (2, 1, 'Delhi');
INSERT INTO options (id, question_id, option_text) VALUES (3, 1, 'mumbai');
INSERT INTO options (id, question_id, option_text) VALUES (4, 1, 'pallavolu');

INSERT INTO options (id, question_id, option_text) VALUES (5, 2, 'cheeku');
INSERT INTO options (id, question_id, option_text) VALUES (6, 2, 'captain cool');
INSERT INTO options (id, question_id, option_text) VALUES (7, 2, 'Hitman');
INSERT INTO options (id, question_id, option_text) VALUES (8, 2, 'jaddu');
INSERT INTO answers (id, question_id, correct_option_id) VALUES (1, 1, 2);
INSERT INTO answers (id, question_id, correct_option_id) VALUES (2, 2, 6);
SELECT q.id, q.question_text, o.id AS option_id, o.option_text
FROM questions q
JOIN options o ON q.id = o.question_id;
SELECT *
FROM answers
WHERE question_id = 2 AND correct_option_id = 6;
SELECT 
    CASE
        WHEN EXISTS (
            SELECT * 
            FROM answers 
            WHERE question_id =2 AND correct_option_id =6)
        THEN 'Correct'
        ELSE 'Incorrect'
    END AS result;






