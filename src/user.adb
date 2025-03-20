with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;

package body User is

   procedure create_user(U : out user_type; Email, Name, Surname: String; Age: Natural) is
   begin
      U.Email := To_Unbounded_String(Email);
      U.Name := To_Unbounded_String(Name);
      U.Surname:= To_Unbounded_String(Surname);
      U.Age := Age;
   end create_user;
   function GetEmail(U: user_type) return String is
   begin
      if U.Email = "" then
         return "Email is empty";
      else
         return To_String(U.Email);
      end if;
      
   end GetEmail;
   
   function GetName(U: user_type) return String is
   begin
      if U.Name = "" then
         return "Name is empty";
      else
         return To_String(U.Name);
      end if;
   end GetName;
   
   function GetSurname(U: user_type) return String is 
   begin
      if U.Surname = "" then
         return "Surname is empty";
      else
         return To_String(U.Surname);
      end if;
   end GetSurname;
   
   function GetAge(U:user_type) return Natural is
   begin
      if U.Age = -1 then
         return 0;
      else
         return U.Age;
      end if;
   end GetAge;
   
   function JsonData(U: user_type) return String is
      JsonStr : Unbounded_String;
   begin
      JsonStr := "{ email: " & U.Email & ", Name: " & U.Name &
        ", Surname: " & U.Surname & ", Age: " & To_Unbounded_String(Integer'Image(U.Age)) & "}";
     
      return To_String(JsonStr);
   end JsonData;

end User;
