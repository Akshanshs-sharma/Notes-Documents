
INSERT INTO party_type(party_type_id)
VALUES ("PERSON"),
("ORGANIZATION");

INSERT INTO party(party_id,party_type_id)
VALUES
( 1,"ORGANIZATION"),
(2,"PERSON"),
(3,"PERSON"),
(4,"PERSON"),
(5,"PERSON"),
(6,"PERSON"),
(7,"PERSON"),
(8,"PERSON"),
(9,"PERSON"),
(10,"PERSON"),
(11,"PERSON");

DELETE FROM party 
WHERE party_id = 1;

DELETE FROM party_type
WHERE party_type_id = "ORGANIZATION";

INSERT INTO party_type(party_type_id)
VALUES
("PARTY_GROUP");

INSERT INTO party(party_id,party_type_id)
VALUES
(1,"PARTY_GROUP");

SELECT * FROM party_type;

SELECT * FROM party;

SELECT * FROM person;

INSERT INTO person( party_id,first_name,last_name)
VALUES
(2, 'Aarav', 'Sharma'),
(3, 'Vivaan', 'Mehta'),
(4, 'Aditya', 'Verma'),
(5, 'Ishaan', 'Kapoor'),
(6, 'Rohan', 'Gupta'),
(7, 'Karan', 'Malhotra'),
(8, 'Arjun', 'Nair'),
(9, 'Dev', 'Patel'),
(10, 'Kabir', 'Singh'),
(11, 'Yash', 'Choudhary');

INSERT INTO party_group(party_id,party_group_name)
VALUES 
( 1, "HotWax");

INSERT INTO role_type(role_type_id)
VALUES 
( "ORGANIZATION_ROLE"),
("EMPLOYEE"),
("MANAGER");

INSERT INTO party_relationship_type(party_relationship_type_id)
VALUES
( "EMPLOYEMENT"),
("REPORTS_TO");

INSERT INTO party_role(party_id,role_type_id)
VALUES
(1,"ORGANIZATION_ROLE"),
(2,"EMPLOYEE"),
(2,"MANAGER"),
(3,"EMPLOYEE"),
(3,"MANAGER"),
(4,"EMPLOYEE"),
(4,"MANAGER"),
(5,"EMPLOYEE"),
(6,"EMPLOYEE"),
(7,"EMPLOYEE"),
(8,"EMPLOYEE"),
(9,"EMPLOYEE"),
(10,"EMPLOYEE"),
(11,"EMPLOYEE");


-- entiries for the party relationships

INSERT INTO party_relationship ( party_id_to, party_id_from, role_type_id_to, role_type_id_from, from_date , party_relationship_type_id)
VALUES 
( 1,2,"ORGANIZATION_ROLE","EMPLOYEE", CURRENT_TIMESTAMP,"EMPLOYEMENT");

-- DELETE 
-- FROM party_relationship 
-- WHERE party_id_to =1 AND party_to_from = 2 AND AND party_relationship_type_id='EMPLOYEMNET' AND from_date LIKE

TRUNCATE party_relationship;


-- INSERT INTO party_relationship ( party_id_to, party_id_from, role_type_id_to, role_type_id_from, from_date , party_relationship_type_id)
-- VALUES 
-- (2,1,"EMPLOYEE",'ORGANIZATION_ROLE',CURRENT_TIMESTAMP,'EMPLOYEMENT');

-- SELECT * FROM party_relationship;

-- INSERT INTO party_relationship ( party_id_to, party_id_from, role_type_id_to, role_type_id_from, from_date , party_relationship_type_id)
-- VALUES 
-- (3,1,"EMPLOYEE",'ORGANIZATION_ROLE',CURRENT_TIMESTAMP,'EMPLOYEMENT'),
-- (4,1,"EMPLOYEE",'ORGANIZATION_ROLE',CURRENT_TIMESTAMP,'EMPLOYEMENT'),
-- (5,1,"EMPLOYEE",'ORGANIZATION_ROLE',CURRENT_TIMESTAMP,'EMPLOYEMENT'),
-- (6,1,"EMPLOYEE",'ORGANIZATION_ROLE',CURRENT_TIMESTAMP,'EMPLOYEMENT'),
-- (7,1,"EMPLOYEE",'ORGANIZATION_ROLE',CURRENT_TIMESTAMP,'EMPLOYEMENT'),
-- (8,1,"EMPLOYEE",'ORGANIZATION_ROLE',CURRENT_TIMESTAMP,'EMPLOYEMENT'),
-- (9,1,"EMPLOYEE",'ORGANIZATION_ROLE',CURRENT_TIMESTAMP,'EMPLOYEMENT'),
-- (10,1,"EMPLOYEE",'ORGANIZATION_ROLE',CURRENT_TIMESTAMP,'EMPLOYEMENT'),
-- (11,1,"EMPLOYEE",'ORGANIZATION_ROLE',CURRENT_TIMESTAMP,'EMPLOYEMENT');

-- INSERT INTO party_relationship( party_id_to, party_id_from , role_type_id_to, role_type_id_from, from_date, party_relationship_type_id)
-- VALUES
-- (2,1,'MANAGER','ORGANIZATION_ROLE',CURRENT_TIMESTAMP,'REPORTS_TO');

-- INSERT INTO party_relationship( party_id_to, party_id_from , role_type_id_to, role_type_id_from, from_date, party_relationship_type_id)
-- VALUES
-- (3,1,'MANAGER','ORGANIZATION_ROLE',CURRENT_TIMESTAMP,'REPORTS_TO'),
-- (4,1,'MANAGER','ORGANIZATION_ROLE',CURRENT_TIMESTAMP,'REPORTS_TO');

-- DELETE 
-- FROM party_relationship 
-- WHERE role_type_id_to="MANAGER" AND role_type_id_from="ORGANIZATION_ROLE" AND party_relationship_type_id='REPOSRTS_TO' AND from_date REGEXP "^2026-02-21";

INSERT INTO party_relationship ( party_id_to, party_id_from, role_type_id_to, role_type_id_from, from_date , party_relationship_type_id)
VALUES 
(2,1,"EMPLOYEE",'ORGANIZATION_ROLE',CURRENT_TIMESTAMP,'EMPLOYEMENT');

SELECT * FROM party_relationship;

TRUNCATE party_relationship;



INSERT INTO party_relationship ( party_id_to, party_id_from, role_type_id_to, role_type_id_from, from_date , party_relationship_type_id)
VALUES 
(3,1,"EMPLOYEE",'ORGANIZATION_ROLE',CURRENT_TIMESTAMP,'EMPLOYEMENT'),
(4,1,"EMPLOYEE",'ORGANIZATION_ROLE',CURRENT_TIMESTAMP,'EMPLOYEMENT'),
(5,1,"EMPLOYEE",'ORGANIZATION_ROLE',CURRENT_TIMESTAMP,'EMPLOYEMENT'),
(6,1,"EMPLOYEE",'ORGANIZATION_ROLE',CURRENT_TIMESTAMP,'EMPLOYEMENT'),
(7,1,"EMPLOYEE",'ORGANIZATION_ROLE',CURRENT_TIMESTAMP,'EMPLOYEMENT'),
(8,1,"EMPLOYEE",'ORGANIZATION_ROLE',CURRENT_TIMESTAMP,'EMPLOYEMENT'),
(9,1,"EMPLOYEE",'ORGANIZATION_ROLE',CURRENT_TIMESTAMP,'EMPLOYEMENT'),
(10,1,"EMPLOYEE",'ORGANIZATION_ROLE',CURRENT_TIMESTAMP,'EMPLOYEMENT'),
(11,1,"EMPLOYEE",'ORGANIZATION_ROLE',CURRENT_TIMESTAMP,'EMPLOYEMENT');

INSERT INTO party_relationship ( party_id_to, party_id_from, role_type_id_to, role_type_id_from, from_date , party_relationship_type_id)
VALUES 
(2,1,"MANAGER",'ORGANIZATION_ROLE',CURRENT_TIMESTAMP,'EMPLOYEMENT'),
(3,1,"MANAGER",'ORGANIZATION_ROLE',CURRENT_TIMESTAMP,'EMPLOYEMENT'),
(4,1,"MANAGER",'ORGANIZATION_ROLE',CURRENT_TIMESTAMP,'EMPLOYEMENT');

INSERT INTO party_relationship_type (party_relationship_type_id)
VALUE("MANAGER");
INSERT INTO party_relationship ( party_id_to, party_id_from, role_type_id_to, role_type_id_from, from_date , party_relationship_type_id)
VALUES 
(5,2,"EMPLOYEE",'MANAGER',CURRENT_TIMESTAMP,'MANAGER');

INSERT INTO party_relationship ( party_id_to, party_id_from, role_type_id_to, role_type_id_from, from_date , party_relationship_type_id)
VALUES 
(6,3,"EMPLOYEE",'MANAGER',CURRENT_TIMESTAMP,'MANAGER'),
(7,4,"EMPLOYEE",'MANAGER',CURRENT_TIMESTAMP,'MANAGER');


SELECT * FROM party_relationship;

			


-- INSERT INTO party_relationship( party_id_to, party_id_from , role_type_id_to, role_type_id_from, from_date, party_relationship_type_id)
-- VALUES
-- (1,2,'ORGANIZATION_ROLE','MANAGER',CURRENT_TIMESTAMP,'REPORTS_TO'),
-- (1,3,'ORGANIZATION_ROLE','MANAGER',CURRENT_TIMESTAMP,'REPORTS_TO'),
-- (1,4,'ORGANIZATION_ROLE','MANAGER',CURRENT_TIMESTAMP,'REPORTS_TO');

-- INSERT INTO party_relationship( party_id_to, party_id_from , role_type_id_to, role_type_id_from, from_date, party_relationship_type_id)
-- VALUES
-- (2,5,'MANAGER','EMPLOYEE',CURRENT_TIMESTAMP,'REPORTS_TO').
-- (1,3,'ORGANIZATION_ROLE','MANAGER',CURRENT_TIMESTAMP,'REPORTS_TO'),
-- (1,4,'ORGANIZATION_ROLE','MANAGER',CURRENT_TIMESTAMP,'REPORTS_TO');


INSERT INTO contact_mech_type( contact_mech_type_id ,has_table,description)
 VALUES 
 ('TELECOM_NUMBER','Y','phone number to contact a party'),
 ('POSTAL_ADDRESS','N','TABLE TO BE MADE'),
 ('EMAIL','N','EMAIL TO CONTACT');
 
 DELETE 
 FROM contact_mech_type
 WHERE contact_mech_type_id = 'EMAIL';

INSERT INTO contact_mech_purpose_type
( contact_mech_purpose_type_id )
VALUES 
("BILLING_LOCATION"),
("PRIMARY_LOCATION"),
("SHIPPING_LOCATION"),
("PHONE_HOME"),
("PHONE_WORK");
select * from contact_mech;
INSERT INTO contact_mech(contact_mech_id,contact_mech_type_id)
values
('CM001','TELECOM_NUMBER'),
('CM002','POSTAL_ADDRESS'),
('CM003','POSTAL_ADDRESS');

select * from contact_mech_type_purpose;
INSERT INTO contact_mech_type_purpose(contact_mech_type_id,contact_mech_purpose_type_id)
VALUES
('POSTAL_ADDRESS','BILLING_LOCATION'),
('POSTAL_ADDRESS','PRIMARY_LOCATION'),
('POSTAL_ADDRESS','SHIPPING_LOCATION');

INSERT INTO contact_mech_type_purpose(contact_mech_type_id,contact_mech_purpose_type_id)
VALUES
('TELECOM_NUMBER','PHONE_HOME'),
('TELECOM_NUMBER','PHONE_WORK');


select * from contact_mech;
select * from contact_mech_type;
select * from telecom_number;
SELECT * FROM contact_mech_purpose_type;
SELECT * FROM contact_mech_type_purpose;









