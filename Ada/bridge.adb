with Ada.Text_IO; with Ada.Integer_Text_IO;
use Ada.Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Discrete_Random;

procedure bridge is
   subtype Directions is Integer range 0..1;

   cantCarros : Integer := 0;
   direcAct : Integer := 0;
   primerCarro : Boolean := true;

   task type oneVehicle(id: Integer) is
      entry sameDirection;
      entry weight_ok;
   end oneVehicle;

   task body oneVehicle is
      package Random_Proc is new Ada.Numerics.Discrete_Random(Directions);
      use Random_Proc;
      G : Generator;
      direc : Directions;

      protected movement is
         procedure crossBridge(direc : Integer);
         procedure exitBridge(direc : Integer);
      end movement;

      protected body movement is

         procedure crossBridge(direc : Integer) is
         begin
            put("Estoy cruzando el puente!!!");
            put(" Soy el carro ");
            put(id);
            put(" Mi direccion es: ");
            put(direc);
            put_line("");
         end crossBridge;

         procedure exitBridge(direc : Integer) is
         begin
            cantCarros := cantCarros - 1;
            if (cantCarros = 2) then
               oneVehicle.weight_ok;
            end if;

            if (cantCarros = 0) then
               oneVehicle.sameDirection;
            end if;
         end exitBridge;

      end movement;

   begin
      Reset(G);
      direc := Random(G);

      -- arriveBridge
      if (direc = direcAct or primerCarro) then
         primerCarro := false;
         direcAct := direc;
      else
         accept sameDirection do
            null;
         end;
         direcAct := direc;
      end if;

      if (cantCarros = 3) then
         accept weight_ok do
            null;
         end;
      end if;

      cantCarros := cantCarros + 1;
      -- end of arriveBridge

      movement.crossBridge(direc);
      movement.exitBridge(direc);
   end oneVehicle;

   n : Integer := 10;
   vehicle_1: oneVehicle(1);
   vehicle_2: oneVehicle(2);
   vehicle_3: oneVehicle(3);
   vehicle_4: oneVehicle(4);
   vehicle_5: oneVehicle(5);
   vehicle_6: oneVehicle(6);
   vehicle_7: oneVehicle(7);
   vehicle_8: oneVehicle(8);
   vehicle_9: oneVehicle(9);
   vehicle_10: oneVehicle(10);
begin
   null;
end bridge;
