with Ada.Text_IO;
use  Ada.Text_IO;


--package body Welcome is

   procedure Welcome is
      i:integer;
      x: integer;
      n: integer:= 10;
      p: integer:= n+1;

      type Degrees is new Float range -273.15 .. Float'Last;

      Temperature: Degrees;

   procedure concurrente is

      char: Character;
      number: Integer;
   begin
      Put_Line("hola soy concurrente dentro de package");
   end concurrente;

   begin

      x:= 12;
      i:= 1;
      x:= x+i;
      if (x < p) then
         Put_Line("x < p :O");
      elsif x=p then
         Put_Line("x = p :O");
      else
         Put_Line("x > p :O");
      end if;

      if Temperature > 40.0 then
         Put_Line("muy hot");
      elsif Temperature >= 30.0 then
         Put_Line("hot");
      else
         Put_Line("brbrbr");
      end if;

      case x is
      when 10 =>
         Put_Line("es 10 :v");
      when 11 =>
         Put_Line("es 11 :v");
      when 12 =>
         Put_Line("es 12 :v");
      when others =>
         Put_Line("No se :'v");
      end case;

      baja:
      while x>8 loop
         x:=x-1;
         exit baja when x = 6;
         Put_Line("baja baja x");
      end loop baja;

      forWin:
      for d in Integer range 1..10 loop
         Put_Line("Repetir la D :v");
      end loop forWin;
     concurrente;

   exception
      when Constraint_Error =>
         Put_Line("Error :O de rango");





   end Welcome;

--end Welcome;
