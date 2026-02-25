CREATE database compilation_training;

USE compilation_training;

CREATE table compilation_training.users
( user_id INT PRIMARY KEY NOT NULL,
  username VARCHAR(20) NOT NULL,
  email VARCHAR(50) NOT NULL);
  
  CREATE TABLE compilation_training.project
  ( project_id INT PRIMARY KEY NOT NULL,
    project_name VARCHAR(20) NOT NULL,
    project_discription TEXT NOT NULL,
    project_status ENUM ( 'TODO' , 'IN-PROGRESS', 'COMPLETED') NOT NULL DEFAULT 'TODO' );
 
 
     CREATE TABLE compilation_training.tasks
    ( task_id INT PRIMARY KEY NOT NULL,
      project_id INT NOT NULL,
      user_id INT NOT NULL,
      task_name VARCHAR(50) ,
      task_discription TEXT NOT NULL,
      task_status ENUM( 'TODO','IN-PROGRESS','COMPLETED') NOT NULL DEFAULT 'TODO',
      FOREIGN KEY (project_id) REFERENCES compilation_training.project(project_id),
      FOREIGN KEY (user_id) REFERENCES compilation_training.users(user_id));
      
      CREATE TABLE compilation_training.subtasks
      ( subtask_id INT PRIMARY KEY NOT NULL,
      task_id INT NOT NULL,
      user_id INT NOT NULL,
      subtask_naem VARCHAR(50) ,
      subtask_discription TEXT NOT NULL,
      subtask_status ENUM( 'TODO','IN-PROGRESS','COMPLETED') NOT NULL DEFAULT 'TODO',
      FOREIGN KEY (task_id) REFERENCES compilation_training.tasks(task_id),
      FOREIGN KEY (user_id) REFERENCES compilation_training.users(user_id));
   
   DROP TABLE compilation_training.subtasks;
   
       -- CREATE TABLE compilation_training.tasks
--     ( task_id INT PRIMARY KEY NOT NULL,
--       project_id INT NOT NULL,
--       task_discription TEXT NOT NULL,
--       task_status ENUM( 'TODO','IN-PROGRESS','COMPLETED') NOT NULL DEFAULT 'TODO');
--       
-- 	DROP TABLE compilation_training.tasks;
      
      
      -- 1. Users
INSERT INTO compilation_training.users (user_id, username, email) VALUES
(1, 'admin',     'admin@company.com'),
(2, 'priya',     'priya.sharma@company.com'),
(3, 'rahul',     'rahul.kumar@company.com'),
(4, 'neha',      'neha.patel@company.com'),
(5, 'sanjay',    'sanjay.verma@company.com');


-- 2. Projects
INSERT INTO compilation_training.project (project_id, project_name, project_discription, project_status) VALUES
(101, 'Website Redesign',      'Complete redesign of company main website (responsive + new CMS)',     'IN-PROGRESS'),
(102, 'Mobile App v2',         'New version of customer mobile application with payment integration',  'TODO'),
(103, 'Inventory System',      'Internal warehouse management and stock tracking system',            'IN-PROGRESS'),
(104, 'Employee Portal',       'Self-service HR portal for leave, salary slip, policy documents',     'COMPLETED'),
(105, 'Marketing Campaign',    'Q4 digital marketing campaign + landing page creation',              'TODO');


-- 3. Tasks
INSERT INTO compilation_training.tasks 
    (task_id, project_id, user_id, task_name, task_discription, task_status) VALUES

-- Project 101 - Website Redesign
(1001, 101, 2, 'Design Homepage',          'Create wireframes and final design for homepage',               'COMPLETED'),
(1002, 101, 3, 'Implement Responsive CSS', 'Make sure layout works on mobile, tablet and desktop',         'IN-PROGRESS'),
(1003, 101, 4, 'Integrate Contact Form',   'Connect contact form to email service and add validation',     'TODO'),
(1004, 101, 2, 'SEO Optimization',         'Add meta tags, alt texts and structured data',                 'TODO'),

-- Project 102 - Mobile App v2
(1005, 102, 3, 'API Payment Integration',  'Integrate Razorpay / Stripe payment gateway',                  'TODO'),
(1006, 102, 5, 'User Profile Screen',      'Redesign and implement new user profile screen',               'TODO'),

-- Project 103 - Inventory System
(1007, 103, 4, 'Database Schema Design',   'Create tables for products, stock, movements, suppliers',      'COMPLETED'),
(1008, 103, 5, 'Stock In/Out Module',      'Implement logic for stock receiving and issuing',              'IN-PROGRESS'),
(1009, 103, 3, 'Low Stock Alerts',         'Create notification system when stock goes below threshold',   'TODO');


-- 4. Subtasks
INSERT INTO compilation_training.subtasks 
    (subtask_id, task_id, user_id, subtask_naem, subtask_discription, subtask_status) VALUES

-- Task 1001 (Design Homepage)
(2001, 1001, 2, 'Create wireframe',        'Low-fidelity wireframe in Figma',                     'COMPLETED'),
(2002, 1001, 2, 'High-fidelity mockup',    'Detailed design with colors and typography',          'COMPLETED'),

-- Task 1002 (Implement Responsive CSS)
(2003, 1002, 3, 'Mobile layout',           'Adjust layout for screens < 768px',                   'IN-PROGRESS'),
(2004, 1002, 3, 'Tablet layout',           'Adjust layout for screens 768–1024px',                'TODO'),

-- Task 1005 (API Payment Integration)
(2005, 1005, 3, 'Sandbox testing',         'Test payments in test mode',                          'TODO'),
(2006, 1005, 5, 'Error handling',          'Handle failed payments and timeouts',                 'TODO'),

-- Task 1007 (Database Schema Design)
(2007, 1007, 4, 'Create ER diagram',       'Draw entity relationship diagram',                    'COMPLETED'),
(2008, 1007, 4, 'Write migration script',  'Create all tables + indexes + constraints',          'COMPLETED'),

-- Task 1008 (Stock In/Out Module)
(2009, 1008, 5, 'Stock receive form',      'UI and backend for receiving new stock',              'IN-PROGRESS'),
(2010, 1008, 5, 'Stock issue form',        'UI and backend for issuing stock to departments',     'TODO');
      
      
      SELECT u.username , p.project_name, t.task_name
FROM compilation_training.users as u
INNER JOIN compilation_training.tasks as t
ON u.user_id = t.user_id
INNER JOIN compilation_training.project as p
ON t.project_id = p.project_id
WHERE tasks.task_status = 'COMPLETED';

SELECT 
    u.username,
    p.project_name,
    t.task_name
FROM compilation_training.users u
LEFT JOIN compilation_training.tasks t
    ON u.user_id = t.user_id
LEFT JOIN compilation_training.project p
    ON t.project_id = p.project_id
WHERE t.task_status = 'COMPLETED';

SELECT 
    u.username,
    p.project_name,
    t.task_name
FROM compilation_training.tasks t
INNER JOIN compilation_training.users u
    ON t.user_id = u.user_id
INNER JOIN compilation_training.project p
    ON t.project_id = p.project_id
WHERE t.task_status = 'COMPLETED';

UPDATE compilation_training.tasks
SET tasks.task_status = 'IN-PROGRESS'
WHERE task_id = 1003;

CREATE VIEW completed_tasks AS 
SELECT * 
FROM tasks 
WHERE task_status='COMPLETED';

SELECT task_name  FROM completed_tasks;

USE compilation_training;

ANALYZE TABLE compilation_training.tasks;