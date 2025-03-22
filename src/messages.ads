with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;
with Users;
package Messages is

   type Message is private;

   procedure Create_Message( New_Message : in out Message; ID : Integer; Text : String; Timestamp : String;
                            User_Sent : Users.User; User_Received : Users.User);

   function Get_ID(M : Message) return Integer;
   function Get_Text(M : Message) return String;
   function Get_Timestamp(M : Message) return String;
   function Get_User_Sent(M : Message) return Users.User;
   function Get_User_Received(M : Message) return Users.User;
   
   function To_JSON(M : Message) return String;
   
private
   type Message is record
      ID: Integer;
      Text: Unbounded_String;
      TimeStamp: Unbounded_String;
      User_Sent: Users.User;
      User_Received: Users.User;
   
   end record;
end messages;
