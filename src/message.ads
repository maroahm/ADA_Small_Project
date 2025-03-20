with Ada.Strings.Unbounded, User;
use Ada.Strings.Unbounded, User;


package message is

   type message_type is private;
   
   procedure Create_Message(M: out message_type; ID: Integer; Text:String; User_Sent: user_type; User_Recieved: user_type);
   function GetId(M: message_type) return Integer;
   function GetText(M: message_type) return String;
   function GetUserSent(M: message_type) return user_type;
   function GetUserRecieved(M: message_type) return user_type;
   function JsonMessage(M: message_type) return String;

private
   type message_type is record
      ID: Integer;
      Text: Unbounded_String;
      User_Sent: user_type;
      User_Recieved: user_type;
   end record;
end message;
