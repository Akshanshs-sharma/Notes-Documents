CREATE DATABASE IF NOT EXISTS sql_practice_1;

USE sql_practice_1;

-- to create different types of part
CREATE TABLE party_type
( party_type_id VARCHAR(50) UNIQUE NOT NULL);

CREATE TABLE party 
( party_id INT PRIMARY KEY,
  party_type_id VARCHAR(50) NOT NULL
  );
  
--    needed to make party_type_id foreign key
  ALTER TABLE party
  ADD CONSTRAINT party_type_id 
  FOREIGN KEY ( party_type_id)
  REFERENCES party_type(party_type_id);
  
  CREATE TABLE person(
party_id INT PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
FOREIGN KEY (party_id) REFERENCES party(party_id)
);

CREATE TABLE party_group
( party_id INT PRIMARY KEY ,
  party_group_name VARCHAR(50),
  FOREIGN KEY (party_id) REFERENCES party(party_id)
  );
  
  --  to store different types of role a party can play
CREATE TABLE role_type
( role_type_id VARCHAR(50) PRIMARY KEY );

-- to determine what kind of roles a party could play
CREATE TABLE party_role
(
party_id INT  ,
role_type_id VARCHAR(50) ,
PRIMARY KEY ( party_id, role_type_id)
);

-- list of possible relationships between two parties 
CREATE TABLE party_relationship_type
( party_relationship_type_id VARCHAR(50) PRIMARY KEY);

-- tntity for relationship between two parties 


-- WRONG WAY 
-- CREATE TABLE party_relationship
-- ( party_id_to INT ,
-- party_id_from INT ,
-- role_type_id_to VARCHAR(50) ,
-- role_type_id_from VARCHAR(50) ,
-- from_date TIMESTAMP,
-- thru_date TIMESTAMP,
-- party_relationship_type_id VARCHAR(50),
-- statusId VARCHAR(50),
-- FOREIGN KEY (party_id_to) REFERENCES party_role(party_id) ,
-- FOREIGN KEY (party_id_from) REFERENCES party_role(party_id) ,
-- FOREIGN KEY (role_type_id_to) REFERENCES party_role(role_type_id),
-- FOREIGN KEY (role_type_id_from) REFERENCES party_role(role_type_id),
-- FOREIGN KEY ( party_relationship_type_id) REFERENCES party_relationship_type(party_relationship_type_id),
-- PRIMARY KEY ( party_id_to, party_id_from, role_type_id_to, role_type_id_from, from_date)
-- );

CREATE TABLE party_relationship
( party_id_to INT ,
party_id_from INT ,
role_type_id_to VARCHAR(50) ,
role_type_id_from VARCHAR(50) ,
from_date TIMESTAMP,
thru_date TIMESTAMP,
party_relationship_type_id VARCHAR(50),
statusId VARCHAR(50),
FOREIGN KEY (party_id_to,role_type_id_to) REFERENCES party_role(party_id,role_type_id) ,
FOREIGN KEY (party_id_from,role_type_id_from) REFERENCES party_role(party_id,role_type_id) ,
FOREIGN KEY ( party_relationship_type_id) REFERENCES party_relationship_type(party_relationship_type_id),
PRIMARY KEY ( party_id_to, party_id_from, role_type_id_to, role_type_id_from, from_date)
);

-- ALTER TABLE party_relationship
-- DROP COLUMN statusId

ALTER TABLE party
MODIFY COLUMN description VARCHAR(255) ;

ALTER TABLE party
MODIFY COLUMN party_id VARCHAR(50);

ALTER TABLE party_type
ADD COLUMN has_table char(1),
ADD COLUMN description VARCHAR(255);

ALTER TABLE person 
ADD COLUMN date_of_birth date,
MODIFY COLUMN first_name VARCHAR(50) NOT NULL,
MODIFY COLUMN last_name VARCHAR(50) NOT NULL,
ADD COLUMN middle_name VARCHAR(50) ,
ADD COLUMN gender char(1)  ,
ADD COLUMN height DECIMAL(5,2),
ADD COLUMN weight DECIMAL(5,2);

ALTER TABLE party_group
ADD description VARCHAR(255);

ALTER TABLE party_relationship_type
ADD COLUMN has_table char(1),
ADD COLUMN description VARCHAR(255),
ADD COLUMN role_type_id_valid_to VARCHAR(50),
ADD COLUMN role_type_id_valid_from VARCHAR(50);

ALTER TABLE party_relationship_type
MODIFY COLUMN role_type_id_valid_to VARCHAR(50),
MODIFY COLUMN role_type_id_valid_from VARCHAR(50);

ALTER TABLE role_type
ADD COLUMN has_table char(1),
ADD COLUMN description VARCHAR(255),
ADD COLUMN parent_type_id VARCHAR(50);

-- ALTER TABLE party 
-- MODIFY COLOUMN party;

-- ANALYZE sql_practice_1;

CREATE INDEX contact_mech_type_idx on contact_mech(contact_mech_type_id);

SHOW INDEX FROM contact_mech;

SELECT index_name,column_name,non_unique
from information_schema.statistics
where table_schema = 'sql_practice'
   and table_name = 'contact_mech';
   
   SELECT *
from information_schema.statistics
where table_schema = 'sql_practice'
   and table_name = 'contact_mech';
 