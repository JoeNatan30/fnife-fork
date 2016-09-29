with Ada.Text_IO;
use Ada.Text_IO;

procedure string_inverse is

begin

   declare
      s: String := Get_Line;
   begin

      for r of reverse s loop
         put(r);
      end loop;

   end;

end string_inverse;
