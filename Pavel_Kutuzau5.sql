BEGIN    
    FOR i IN 715..190000 LOOP
    insert into EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
    values (
    i+300, 
    (select util_firstnames.fn_name
              from  util_firstnames 
              where util_firstnames.fn_id = (SElECT util_employees.fn_id 
                                             FROM util_employees
                                             WHERE util_employees.e_id=i)), 
    (select util_surnames.s_name
              from  util_surnames 
              where util_surnames.s_id = (SElECT util_employees.s_id 
                                          FROM util_employees
                                          WHERE util_employees.e_id=i)), 
    ( i+300 
     || '@gmail.com' ), 
    ('+375' 
    || mod(dbms_random.value * 10E37,9) + 1
    || mod(dbms_random.value * 10E37,9) + 1 
    || mod(dbms_random.value * 10E37,9) + 1
    || mod(dbms_random.value * 10E37,9) + 1
    || mod(dbms_random.value * 10E37,9) + 1 
    || mod(dbms_random.value * 10E37,9) + 1
    || mod(dbms_random.value * 10E37,9) + 1
    || mod(dbms_random.value * 10E37,9) + 1 
    || mod(dbms_random.value * 10E37,9) + 1), 
    to_date((( mod(dbms_random.value * 10E37,27) + 1) 
            || '-' 
            || ( mod(dbms_random.value * 10E37,12) + 1) 
            || '-'
            || ( mod(dbms_random.value * 10E37,22) + 1990)), 'dd-mm-yyyy'), 
    (select util_jobs.j_ch_id
              from  util_jobs 
              where util_jobs.j_id = (SElECT util_employees.j_id 
                                      FROM util_employees
                                      WHERE util_employees.e_id=i)), 
                            
    (select jobs.max_salary
              from  jobs 
              where jobs.job_id =
                (select util_jobs.j_ch_id
                 from  util_jobs 
                 where util_jobs.j_id = (SElECT util_employees.j_id 
                                         FROM util_employees
                                         WHERE util_employees.e_id=i))),
    '0.'|| (mod(dbms_random.value * 10E37,25) + 1), 
    dbms_random.value*713 +301, 
    dbms_random.value*713 +301);
    commit;
    END LOOP;    
END;