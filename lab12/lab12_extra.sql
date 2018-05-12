.read lab12.sql

-- Q5
CREATE TABLE greatstudents AS
  SELECT a.date, a.color, a.pet, a.number, b.number
    FROM students AS a, fa17students AS b
    WHERE a.date = b.date AND a.color = b.color AND a.pet = b.pet;

-- Q6
CREATE TABLE sevens AS
  SELECT a.seven FROM students AS a, checkboxes AS b
    WHERE a.time = b.time AND a.number = 7 AND b.'7' = 'True';

-- Q7
CREATE TABLE fa17favnum AS
  SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";


CREATE TABLE fa17favpets AS
  SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";


CREATE TABLE sp18favpets AS
  SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";


CREATE TABLE sp18dog AS
  SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";


CREATE TABLE sp18alldogs AS
  SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";


CREATE TABLE obedienceimages AS
  SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";

-- Q8
CREATE TABLE smallest_int_count AS
  SELECT "REPLACE THIS LINE WITH YOUR SOLUTION";
