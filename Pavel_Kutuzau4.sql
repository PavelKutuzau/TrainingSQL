BEGIN    
    FOR i IN 1..714 LOOP
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
            || ( mod(dbms_random.value * 10E37,21) + 1990)), 'dd-mm-yyyy'), 
    'AC_MGR', 
    16000,
    '0.'|| (mod(dbms_random.value * 10E37,25) + 1), 
    101, 
    i+300);
    commit;
    update Departments set MANAGER_ID=i+300 where DEPARTMENT_ID=i+300;
    commit;
    END LOOP;    
END;