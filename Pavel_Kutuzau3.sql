BEGIN    
    FOR i IN 1..190000 LOOP
    INSERT INTO util_employees (e_id, fn_id, s_id, j_id ) VALUES (i,(dbms_random.value*5493+1),  
    (dbms_random.value*999+1), (dbms_random.value*17+2));
    END LOOP; 
    commit;
END;