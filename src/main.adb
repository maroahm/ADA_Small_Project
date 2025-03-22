--Name: Omar Ahmed Ibrahim Abdelkader
--Neptun Code: WQ54YY

with Ada.Calendar, Ada.Calendar.Formatting, Ada.Text_IO, Ada.Strings.Fixed;
use Ada.Calendar, Ada.Calendar.Formatting, Ada.Text_IO, Ada.Strings.Fixed;

-----------------------------------
--Add any other imports needed here:

with controller, Users, Messages;
use Users, Messages;
-----------------------------------

procedure Main is

   --------------------------------
   --Implement all needed declarations, packages and/or functions, procedures here:

   function user_condition(E : User; K: String) return Boolean is
   begin
      if Users.GetEmail(E) = K then
         return True;
      else
         return False;
      end if;
   end user_condition;
   function message_condition(E: Message; K: Integer) return Boolean is
      Now : Time := Clock;
   begin
      if Messages.Get_ID(E) = K then
         return True;
      else
         return False;
      end if;
   end message_condition;





   type UserArr is array(Natural range <>) of User;
   type MessageArr is array(Natural range <>) of Message;

   package User_Controller is new Controller(User, String, UserArr,user_condition, Users.To_JSON);
   package Message_Controller is new Controller(Message, Integer, MessageArr,Message_condition, Messages.To_JSON);
   U_Cntrl : User_Controller.controller_type(10);
   M_Cntrl : Message_Controller.controller_type(10);



   -------------------------------
   --DO NOT MODIFY ANYTHING BELOW THIS LINE!

   type User_Arr is array(Natural range <>) of User;
   type Message_Arr is array(Natural range <>) of Message;

   U_Arr: User_Arr(1..10);
   M_Arr: Message_Arr(1..10);

   U11: User;
   M11: Message;
begin

   for I in U_Arr'Range loop
      Create_User(U_Arr(I), "user" & Trim(I'Image, Ada.Strings.Left) & "@email.com", "name" & I'Image, "surname" & I'Image, I + 10);
   end loop;

   for I in M_Arr'Range loop
      Create_Message(M_Arr(I), I, "some text " & Trim(I'Image, Ada.Strings.Left), Image(Clock), U_Arr(I), U_Arr( ((I+5) mod U_Arr'Length) + 1 ));
   end loop;

   for I in U_Arr'Range loop
      User_Controller.Create(U_Cntrl, U_Arr(I));
   end loop;
   New_Line;

   for I in M_Arr'Range loop
      Message_Controller.Create(M_Cntrl, M_Arr(I));
   end loop;
   New_Line;

   Message_Controller.Create(M_Cntrl, M_Arr(1));
   New_Line;

   for I in U_Arr'Range loop
      User_Controller.Read(U_Cntrl, "user" & Trim(I'Image, Ada.Strings.Left) & "@email.com");
   end loop;
   New_Line;

   for I in M_Arr'Range loop
      Message_Controller.Read(M_Cntrl, I);
   end loop;
   New_Line;

   User_Controller.Read(U_Cntrl, "user11@email.com");
   New_Line;

   Create_User(U11, "user10@email.com", "name11", "surname11", 20);
   User_Controller.Update(U_Cntrl, "user10@email.com", U11);
   New_Line;

   Create_Message(M11, 10, "Lorem Ipsum", Image(Clock), U_Arr(1), U_Arr(2));
   Message_Controller.Update(M_Cntrl, 10, M11);
   New_Line;

   for I in U_Arr'Range loop
      User_Controller.Read(U_Cntrl, "user" & Trim(I'Image, Ada.Strings.Left) & "@email.com");
   end loop;
   New_Line;

   for I in M_Arr'Range loop
      Message_Controller.Read(M_Cntrl, I);
   end loop;
   New_Line;


   User_Controller.Update(U_Cntrl, "user11@email.com", U_Arr(1));
   New_Line;

   Message_Controller.Update(M_Cntrl, 11, M_Arr(1));
   New_Line;

   User_Controller.Delete(U_Cntrl, "user10@email.com");
   New_Line;

   Message_Controller.Delete(M_Cntrl, 10);
   New_Line;

   for I in U_Arr'Range loop
      User_Controller.Read(U_Cntrl, "user" & Trim(I'Image, Ada.Strings.Left) & "@email.com");
   end loop;
   New_Line;

   for I in M_Arr'Range loop
      Message_Controller.Read(M_Cntrl, I);
   end loop;
   New_Line;

   User_Controller.Delete(U_Cntrl, "user10@email.com");
   New_Line;

   Message_Controller.Delete(M_Cntrl, 10);
   New_Line;

end Main;
