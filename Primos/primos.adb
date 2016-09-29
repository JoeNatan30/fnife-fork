with Ada.Integer_Text_IO,ada.Text_IO;
use Ada.Integer_Text_IO,ada.Text_IO;

procedure primos is

   num:integer;

   function Es_Primo (number:integer) return boolean is
      veracidad: boolean;
      div: integer;
   begin

      verificar_Primo:
      for n in Integer range 2..(number-1) loop
         div := number mod n;

      if(div = 0) then
         veracidad:= False;
         exit when div = 0;
      end if;
      veracidad:= True;

      end loop verificar_Primo;

      return veracidad;

   end Es_Primo;


begin

   put("escriba un numero: ");
   get(num);

   Consultar_primos:
   for n in reverse 1..num loop
      if(Es_Primo(n)) then
         put(n);
         Put_Line(" ");
      end if;
   end loop Consultar_primos;

end primos;
