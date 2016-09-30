with Ada.Text_IO; with Ada.Integer_Text_IO;
use Ada.Text_IO; use Ada.Integer_Text_IO;

procedure coldcoffe is
   protected sequencer is
      procedure incrementa;
      function next_ticket return Integer;
   private
      Cont : Integer := 0;
   end sequencer;

   protected body sequencer is
      procedure incrementa is
      begin
         Cont := Cont + 1;
      end incrementa;

      function next_ticket return Integer is
      begin
         return Cont;
      end next_ticket;
   end sequencer;

   protected event_count is
      procedure incrementa;
      function serve_customer return Integer;
   private
      Cont : Integer := 0;
   end event_count;

   protected body event_count is
      procedure incrementa is
      begin
         Cont := Cont + 1;
      end incrementa;

      function serve_customer return Integer is
      begin
         return Cont;
      end serve_customer;
   end event_count;

   protected ticket is
      procedure incrementar;
      function read_number return Integer;
   private
      actual_ticket : Integer := 0;
   end ticket;

   protected body ticket is
      procedure incrementar is
      begin
         actual_ticket := actual_ticket + 1;
      end incrementar;

      function read_number return Integer is
      begin
         return actual_ticket;
      end read_number;
   end ticket;

   task type customer is
      entry readyToBeServed;
   end customer;

   task barrista is
      entry readyToServe;
      entry incrementarTicket;
   end barrista;

   task body customer is
      ticketNumber : Integer;
   begin
      ticketNumber := sequencer.next_ticket;
      sequencer.incrementa;
      barrista.readyToServe;

      while(ticketNumber /= ticket.read_number) loop
         null;
      end loop;
      barrista.incrementarTicket;
      put("Pidiendo mi orden con ticket nro.");
      put(ticketNumber);
      put_line("");
   end customer;

   task body barrista is
      nextCustomer_ticket : Integer;
   begin
      loop
         accept readyToServe do
            null;
         end;
         nextCustomer_ticket := event_count.serve_customer;
         event_count.incrementa;

         if (nextCustomer_ticket = ticket.read_number) then
            put("Atendere al cliente con ticket nro.");
            put(nextCustomer_ticket);
            put_line("");

         end if;
         accept incrementarTicket do
            null;
         end;
          ticket.incrementar;
      end loop;
   end barrista;

   c1, c2, c3 : customer;


begin
   null;
end coldcoffe;
