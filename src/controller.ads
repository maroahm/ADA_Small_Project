with DataBase;

generic
   type Elem is private;
   type Key is (<>); 
   type Arr is array(Natural range <>) of Elem;
   with function Condition(E:Elem; K:Key) return Boolean; 
   with function JSON(E: Elem) return String;
package Controller is
   
   package Data is new DataBase(Elem, Key, Arr, Condition);
   type Database_type is new Data.database_type;
   type controller_type(Max: Natural) is limited private;
   procedure Create( C: in out controller_type; E: Elem);
   procedure Read(C: in out controller_type; K: Key);
   procedure Update(C: in out controller_type; K: Key; E: Elem);
   procedure Delete(C: in out controller_type; K:key);

   
private
   type Controller_type(Max: Natural) is record
      DB: Database_type(0..Max);
end Controller;
