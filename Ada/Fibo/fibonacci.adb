with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

procedure fibo is

   ini,sec,tri,num:integer;

begin

   ini := 1;
   sec := 1;

   get(num);


   for n in Integer range 1..num loop

      put(sec);

      tri := ini + sec;
      ini := sec;
      sec := tri;

   end loop;

end fibo;
