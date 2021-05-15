CREATE TABLE parent (
  id int PRIMARY KEY,
  name text NOT NULL
);

CREATE TABLE child (
  id int PRIMARY KEY,
  parent_id int REFERENCES parent
    DEFERRABLE INITIALLY IMMEDIATE,
  name text
);

INSERT INTO parent
SELECT
  generate_series(1,1000000) AS id,
  md5(random()::text) as name;

INSERT INTO child
SELECT
  generate_series(1,5000000) AS id,
  generate_series(1,1000000) AS parent_id,
  md5(random()::text) as name;
