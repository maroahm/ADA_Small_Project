with Ada.Text_IO;
use Ada.Text_IO;
package body Controller is

   procedure Create( C: in out controller_type; E: Elem) is
      success: Boolean;
   begin
      Insert_Elem(C.DB, E, success);
      if success then
         Put_Line("Element Successfully inserted");
      else
         Put_Line("***Element could not be inserted - database full***");
      end if;
   end Create;
   procedure Read(C: in out controller_type; K: Key) is
      E: Elem;
      success: Boolean;
   begin
      Get_Elem(C.DB, K, E, success);
      if success then
         Put_Line(JSON(E));
      else
         Put_Line("***Element could not be found***");
      end if;
   end Read;

   procedure Update(C: in out controller_type; K: Key; E: Elem) is
      success:Boolean;
   begin
      Update_Elem(C.DB, K, E, success);
      if success then
         Put_Line("Element successfully updated");
      else
         Put_Line("***Element could not be found***");
      end if;
   end Update;

   procedure Delete(C: in out controller_type; K:key) is
      success: Boolean;
   begin
      Delete_ELem(C.DB, K, success);
      if success then
         Put_Line("Element succesfully deleted");
      else
         Put_Line("***Element could not be found***");
      end if;
   end Delete;

end Controller;
