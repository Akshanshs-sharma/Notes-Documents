SELECT * from (
  select assigned_to as user_id , coalesce( count(task_id),0) as completed_task,0 as completed_subtask from task where task_status = 'COMPLETED' group by assigned_to
  union all
  SELECT assigned_to AS user_id , 0 as completed_task , coalesce(COUNT(subtask_id),0) as completed_subtask FROM subtask where subtask_status = 'COMPLETED' GROUP BY assigned_to 
  ) as union_of_task_subtask ;
  
  START TRANSACTION;
  
  ALTER TABLE users
  ADD COLUMN user_name VARCHAR(50);
  
  COMMIT;