Scripts must be performed in the following sequence:

0. 'L1create_tables.sql'  - basic script(if the initial structure is not created)

1. 'Pavel_Kutuzau1.sql' - (creation of temporary tables)
2. 'Pavel_Kutuzau2.sql' - (fill the table "DEPARTMENTS")
3. 'Pavel_Kutuzau3.sql' - (fill in the table "util_employees" random numbers)
4. 'Pavel_Kutuzau4.sql' - (added to the table 'EMPLOYEES' of managers in all departments 
                           and update table "DEPARTMENTS")
5. 'Pavel_Kutuzau5.sql' - (added to the table 'EMPLOYEES' 190000 employees)
6. 'Pavel_Kutuzau6.sql' - (delete all tempary tables)