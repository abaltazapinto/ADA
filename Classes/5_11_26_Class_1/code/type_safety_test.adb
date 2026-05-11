with Ada.Text_IO;
use Ada.Text_IO;

procedure Type_Safety_Test is

	type Led_State is (Off, On);
	type Button_State is (Released, Pressed);

	Led	: Led_State := Off;
	Button	: Button_State := Released;

begin
	Led := On;

	Put_Line ("Done");

end Type_Safety_Test;
