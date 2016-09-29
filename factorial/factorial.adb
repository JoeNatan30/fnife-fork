with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

procedure factorial is

   num:integer;

begin


   get(num);


   for n in reverse  1..(num-1) loop
      put(num);
      num := num * n;
   end loop;

end factorial;
