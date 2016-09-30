with Ada.Text_IO;
use Ada.Text_IO;

procedure basico_concurrencia is
   task tarea1;
   task tarea2 is
      entry uno_dos;
   end tarea2;

   task tarea3 is
      entry uno_tres;
   end tarea3;

   task tarea4 is
      entry dos_cuatro;
   end tarea4;

   task tarea5 is
      entry dos_cinco;
      entry tres_cinco;
   end tarea5;


   final : Positive := 10;
-------------------------------------------------------

   task body tarea1 is
      final : Positive := 10;
   begin
      taskfor1:
      for count in 1..final loop
         Put_Line("Tarea 1");
      end loop taskfor1;
      tarea2.uno_dos;
      tarea3.uno_tres;
   end tarea1;

-------------------------------------------------------
   task body tarea2 is
      final: Positive := 10;
   begin
      accept uno_dos do
         null;
      end;

      for count in 1..final loop
         Put_Line("Tarea 2");
      end loop ;
      tarea4.dos_cuatro;
      tarea5.dos_cinco;
   end tarea2;
-------------------------------------------------------
   task body tarea3 is
      final: Positive := 10;
   begin
      accept uno_tres do
         null;
      end;

      for count in 1..final loop
         Put_Line("Tarea 3");
      end loop ;
      tarea5.tres_cinco;
   end tarea3;
-------------------------------------------------------
   task body tarea4 is
      final: Positive := 10;
   begin
      accept dos_cuatro do
         null;
      end;

      for count in 1..final loop
         Put_Line("Tarea 4");
      end loop ;

   end tarea4;
--------------------------------------------------
   task body tarea5 is
      final: Positive := 10;
   begin
      accept dos_cinco do
         null;
      end;
      accept tres_cinco do
         null;
      end;
      for count in 1..final loop
         Put_Line("Tarea 5");
      end loop ;

   end tarea5;

begin



   for count in 1..final loop
         Put_Line("Tarea Principal");
   end loop ;

end basico_concurrencia;
