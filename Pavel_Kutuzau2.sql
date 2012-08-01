BEGIN
     FOR i IN 1..238 LOOP
     FOR j IN 1..3 LOOP       
     INSERT INTO DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, COUNTRY_ID)
     VALUES (
     (i*3+(j-1)-2)+300, 
     ((select UTIL_TYPES_OF_DEPARTMENTS.u_name
            from  UTIL_TYPES_OF_DEPARTMENTS 
            where UTIL_TYPES_OF_DEPARTMENTS.u_id = j)
       || ' ('
       ||
       (select util_countries.u_name
              from  util_countries 
              where util_countries.u_id = i)
       ||  ')'),
     null, 
     (select util_countries.u_name
              from  util_countries 
              where util_countries.u_id = i));
     commit;         
     END LOOP;
    END LOOP;    
END;