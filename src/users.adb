with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;

package body Users is

   procedure create_user(U : out User; Email, Name, Surname: String; Age: Natural) is
   begin
      U.Email := To_Unbounded_String(Email);
      U.Name := To_Unbounded_String(Name);
      U.Surname:= To_Unbounded_String(Surname);
      U.Age := Age;
   end create_user;
   function GetEmail(U: User) return String is
   begin
      if U.Email = "" then
         return "Email is empty";
      else
         return To_String(U.Email);
      end if;
      
   end GetEmail;
   
   function GetName(U: User) return String is
   begin
      if U.Name = "" then
         return "Name is empty";
      else
         return To_String(U.Name);
      end if;
   end GetName;
   
   function GetSurname(U: User) return String is 
   begin
      if U.Surname = "" then
         return "Surname is empty";
      else
         return To_String(U.Surname);
      end if;
   end GetSurname;
   
   function GetAge(U:User) return Natural is
   begin
      if U.Age = -1 then
         return 0;
      else
         return U.Age;
      end if;
   end GetAge;
   
   function To_JSON(U: User) return String is
   begin
      return "{ ""Email"": " & To_String(U.Email)
             & " ""Name"" : " & To_String(U.Name)
             & " ""Surname"": " & To_String(U.Surname)
             & " ""Age"": " & Integer'Image(U.Age) & " }";

   end To_JSON;

end Users;
