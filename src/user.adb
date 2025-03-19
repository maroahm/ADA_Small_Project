package body User is

   procedure create_user(U : out user; Email, Name, Surname: String; Age: Natural) is
   begin
      U.Email := Email;
      U.Name := Name;
      U.Surname:= Surname;
      U.Age := Age;
   end create_user;
   function GetEmail(U: user) return String is
   begin
      if U.Email = "" then
         return "Email is empty";
      else
         return U.Email;
      end if;
      
   end GetEmail;
   
   function GetName(U: user) return String is
   begin
      if U.Name = "" then
         return "Name is empty";
      else
         return U.Name;
      end if;
   end GetName;
   
   function GetSurname(U: user) return String is 
   begin
      if U.Surname = "" then
         return "Surname is empty";
      else
         return U.Surname;
      end if;
   end GetSurname;
   
   function GetAge(U:user) return Natural is
      if U.Age = null then
         return 0;
      else
         return U.Age;
      end if
   end GetAge;
   
   function JsonData(U: user) return String is
      JsonStr : String;
   begin
      JsonStr := "{ email: " & To_String(U.Email) & " Name: " & To_String(U.Name) &
        "Surname: " & To_String(U.Surname) & " Age: " & Integer'Image(U.Age);
      return JsonStr;

end User;
