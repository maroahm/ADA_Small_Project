with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;

package User is
   type user_type is private;
   
   procedure create_user(U : out user_type; Email, Name, Surname: String; Age: Natural);
   function GetEmail(U: user_type) return String;
   function GetName(U: user_type) return String;
   function GetSurname(U: user_type) return String;
   function GetAge(U:user_type) return Natural;
   function JsonData(U: user_type) return String;
   
   
         
   
private 
   type user_type is record
      Email : Unbounded_String;
      Name: Unbounded_String;
      Surname: Unbounded_String;
      Age: Natural;
   end record;
end User;
