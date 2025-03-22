with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;

package Users is
   type User is private;
   
   procedure create_user(U : out User; Email, Name, Surname: String; Age: Natural);
   function GetEmail(U: User) return String;
   function GetName(U: User) return String;
   function GetSurname(U: User) return String;
   function GetAge(U:User) return Natural;
   function To_JSON(U: User) return String;
   
   
         
   
private 
   type User is record
      Email : Unbounded_String;
      Name: Unbounded_String;
      Surname: Unbounded_String;
      Age: Natural;
   end record;
end Users;
