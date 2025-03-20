package body DataBase is

   procedure Insert_Elem(D : in out database_type; E: Elem) is
   begin
      if D.Size < D.Data'Length then
         D.Data(D.Size) := E;
      end if;
   end Insert_Elem;
   
   procedure Get_Elem(D: database_type; K: Key; E: out Elem) is
   begin
      
   procedure Update_Elem(D: database_type; K: Key; E: out Elem);
   procedure Delete_Elem(D: in out database_type; K:key; E: Elem);

end DataBase;
