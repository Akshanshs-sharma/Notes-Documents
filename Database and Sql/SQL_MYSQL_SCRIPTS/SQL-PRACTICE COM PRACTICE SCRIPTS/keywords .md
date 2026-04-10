ROUND( VALUE , THE\_NUMBER OF PRECISION WE NEED ) , 

USE :- used when we need to round off some values after decimal in calculations 



ROUND(height / 30.48, 1) AS height, give height as 2.1, 4.2 etc

ROUND(weight / 2.205, 0) AS weight, give weight as 37,56,48 etc









**CASE when we need to put some other value based on some other value , in this case ,we had abbrivations , i.e. GENDER = 'M','F' . but we needed MALE and FEMALE so this** 



CASE

 **WHEN gender = 'M' THEN 'Male'**

  **ELSE 'Female'**

**END AS gender** 



**IF is another way to do what case do , just inline** 

**IF(gender = 'M', 'Male', 'Female') AS gender** 

