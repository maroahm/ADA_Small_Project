package body Messages is

   procedure Create_Message(New_Message : in out Message;ID : Integer; Text : String; Timestamp : String;
                            User_Sent : Users.User; User_Received : Users.User) is
   begin
      New_Message.ID := ID;
      New_Message.Text := To_Unbounded_String(Text);
      New_Message.Timestamp := To_Unbounded_String(Timestamp);
      New_Message.User_Sent := User_Sent;
      New_Message.User_Received := User_Received;
   end Create_Message;

   function Get_ID(M : Message) return Integer is
   begin
      return M.ID;
   end Get_ID;

   function Get_Text(M : Message) return String is
   begin
      return To_String(M.Text);
   end Get_Text;

   function Get_Timestamp(M : Message) return String is
   begin
      return To_String(M.Timestamp);
   end Get_Timestamp;

   function Get_User_Sent(M : Message) return Users.User is
   begin
      return M.User_Sent;
   end Get_User_Sent;

   function Get_User_Received(M : Message) return Users.User is
   begin
      return M.User_Received;
   end Get_User_Received;


   function To_JSON(M : Message) return String is
   begin
      return "{ ""ID"": " & Integer'Image(M.ID) &
             ", ""Text"": " & To_String(M.Text) &
             ", ""Timestamp"": " & To_String(M.Timestamp) &
             ", ""User_Sent"": " & Users.To_JSON(M.User_Sent) &
             ", ""User_Received"": " & Users.To_JSON(M.User_Received) & " }";
   end To_JSON;

end Messages;
