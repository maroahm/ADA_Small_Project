package body DataBase is

   
   procedure Insert_Elem(D : in out database_type; E: Elem; success: out boolean) is
   begin
      success := False;
      if D.Size < D.Data'Length then
         D.Data(D.Size) := E;
         D.Size:= D.Size + 1;
         success:= True;
      end if;
   end Insert_Elem;
   
   procedure Get_Elem(D: database_type; K: Key; E: out Elem; success: out boolean) is
   begin
      success := False;
      for I in D.Data'Range loop
         if Condition(D.Data(I), Key) then
            success := True;
            E:= D.Data(I);
         end if;
      end loop;
   end Get_Elem;
      
   procedure Update_Elem(D: database_type; K: Key; E: in out Elem;success: out boolean) is
   begin
      success := False;
      for I in D.Data'Range loop
         if Condition(D.Data(I), Key) loop
            success := True;
            D.Data(I) := E;
         end if;
      end loop;
   end Update_Elem;
   
   procedure Delete_Elem(D: in out database_type; K:key;success: out boolean) is 
   begin
      success := False;
      for I in D.Data'Range loop
         if Condition(D.Data(I), Key) then
            success := True;
            for J in I .. D.Size - 2 loop
               D.Data(J) := D.Data(J+1);
            end loop;
            D.Size := D.Size -1;
         end if
      end loop
   end Delete_ELem;
   
end DataBase;
