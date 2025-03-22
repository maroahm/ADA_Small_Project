generic
   type Elem is private;
   type Key (<>) is private; 
   type Arr is array(Natural range <>) of Elem;
   with function Condition(E:Elem; K:Key) return Boolean; 

package DataBase is

   type database_type(Max: Natural) is limited private;
   
   procedure Insert_Elem(D: in out database_type; E: Elem; success: out Boolean);
   procedure Get_Elem(D: database_type; K: Key; E: out Elem; success: out boolean);
   procedure Update_Elem(D: in out database_type; K: Key; E: Elem; success: out boolean);
   procedure Delete_Elem(D: in out database_type; K:key; success: out boolean);
private
   type database_type(Max: Natural) is record
      Data: Arr(0..Max);
      Size : Natural := 0;
   end record;
   
end DataBase;
