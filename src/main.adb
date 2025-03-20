with Ada.Text_IO, User,message;
use Ada.Text_IO;
procedure Main is

   use User, message;
   U : user_type;
   U2 : user_type;
   M: message_type;
begin

   create_user(U, "test@example.com", "John", "Doe", 25);

   create_user(U2, "test2@example.com", "Omar", "abdo", 34);
   Create_Message(M, 124, "hello users", U, U2);
   Put_Line(JsonMessage(M));
   Put_Line(GetEmail(U));

   Put_Line("User created successfully.");
end Main;
