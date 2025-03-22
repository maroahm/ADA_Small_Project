with DataBase;

generic
   type Elem is private;
   type Key (<>) is private; 
   type Arr is array(Natural range <>) of Elem;
   with function Condition(E:Elem; K:Key) return Boolean; 
   with function JSON(E: Elem) return String;
package Controller is
   
   type controller_type(Max: Natural) is limited private;
   
   package Data is new DataBase(Elem, Key, Arr, Condition);
   use Data;  

   procedure Create( C: in out controller_type; E: Elem);
   procedure Read(C: in out controller_type; K: Key);
   procedure Update(C: in out controller_type; K: Key; E: Elem);
   procedure Delete(C: in out controller_type; K:key);

   
private
   type Controller_type(Max: Natural) is record
      DB: Data.database_type(Max);
   end record;
end Controller;
