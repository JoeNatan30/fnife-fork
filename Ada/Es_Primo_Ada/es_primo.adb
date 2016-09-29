with ada.Integer_Text_IO,ada.Text_IO,ada.Float_Text_IO;
use  ada.Integer_Text_IO,ada.Text_IO,ada.Float_Text_IO;

procedure Es_Primo is
   veracidad: boolean;
   number:integer;
   div: integer;
begin

   put("Escriba un numero: ");
   get(number);

   verificar_Primo:
   for n in Integer range 2..(number-1) loop

      div := number mod n;

      if(div = 0) then
         veracidad:= False;
         exit when div = 0;
      end if;
      veracidad:= True;

   end loop verificar_Primo;

   if(veracidad = True) then
      put("es primo");
   else
      put("No es primo");
   end if;

end Es_Primo;
