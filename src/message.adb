with Ada.Strings.Unbounded, User;
use Ada.Strings.Unbounded, User;


package body message is

   procedure Create_Message(M: out message_type; ID: Integer; Text:String; User_Sent: user_type; User_Recieved: user_type) is
   begin
      M.ID := ID;
      M.Text := To_Unbounded_String(Text);
      M.User_Sent := User_Sent;
      M.User_Recieved := User_Recieved;
   end Create_Message;
   
   function GetId(M: message_type) return Integer is
   begin
      if M.ID = -1 then
         return 0;
      else
         return M.ID;
      end if;
   end GetId;
   
   function GetText(M: message_type) return String is 
   begin 
      if M.Text = "" then
         return "Text is empty";
      else
         return To_String(M.Text);
      end if;
   end GetText;
   
   function GetUserSent(M: message_type) return user_type is
   begin
      return M.User_Sent;
   end GetUserSent;
   function GetUserRecieved(M: message_type) return user_type is 
   begin 
      return M.User_Recieved;
   end GetUserRecieved;
   function JsonMessage(M: message_type) return String is
      JsonStr : Unbounded_String;
   begin
      JsonStr := "{ Id: " & To_Unbounded_String(Integer'Image(M.ID)) & ", Text: "
        & M.Text & ", user sent: " & To_Unbounded_String(JsonData(M.User_Sent)) & 
        ", user recieved: " & To_Unbounded_String(JsonData(M.User_Recieved)) & "}";
      return To_String(JsonStr);
   end JsonMessage;
end message;
