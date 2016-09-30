with Ada.Text_IO; use Ada.Text_IO;

procedure ProtectPC is

   type Index is mod 8; --de 0 a 7
   type Buffer_Array is array(Index) of Integer;

   --BUFFER =============================================
   --proctect Buffer is
   task Buffer is
      entry Append(I: in Integer);
      entry Take(I: out Integer);
      --private
      --B: Buffer_Array;
      --In_Ptr, Out_Ptr, Count: Index := 0;
   end Buffer;

   task body Buffer is
      B: Buffer_Array;
      In_Ptr, Out_Ptr, Count: Index := 0;

   begin
      loop
         select

               accept Append(I: in Integer) do
                  B(In_Ptr) := I;
               end Append;
               Count := Count + 1;
               In_Ptr := In_Ptr + 1;
         or
            when Count > 0 =>
               accept Take(I: out Integer) do
                  I := B(Out_Ptr);
               end Take;
               Count := Count - 1;
               Out_Ptr := Out_Ptr + 1;
         end select;
      end loop;
   end Buffer;



   --protected body Buffer is -- Es una estructura para manejar proD_cons
   ----APPEND =============================================
   -- entry Append(I: in Integer) when Count < Index'Last is
   --begin
   -- B(In_Ptr) := I;
   --Count := Count + 1;
   --In_Ptr := In_Ptr + 1;
   --end Append;

   ----TAKE =============================================
   --entry Take(I: out Integer) when Count > 0 is
   --begin
   -- I := B(Out_Ptr);
   --Count := Count - 1;
   --Out_Ptr := Out_Ptr + 1;
   --end Take;
   --end Buffer;


   --PRODUCTOR =============================================
   task Producer;
   task body Producer is
   begin
      for N in 1..200 loop

         Buffer.Append(N);
      end loop;
   end Producer;

   --CONSUMIDOR =============================================
   task type Consumer(ID: Integer);
   task body Consumer is
      N: Integer;
   begin
      loop
         Buffer.Take(N);

      end loop;
   end Consumer;

   C1: Consumer(1);
   C2: Consumer(2);

begin
  NULL;
end ProtectPC;
