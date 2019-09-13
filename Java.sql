set serverout on;

begin 
for i in 1..10 loop
dbms_output.put_line('과');
end loop;
end;