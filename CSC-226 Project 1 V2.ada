-- Library stuff
with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

--Begin Procedure 
procedure test is -- 'test' is name of file

	--Declare and define an INTEGER as MAX with a value of 50
	MAX : INTEGER := 50;
	--Declare and initialize Array Pointer as Counter with a value of 1
	Counter: INTEGER := 1;
	
	--Declare an array of INTEGER with a range of 1 to 50
	NumberArray : array(INTEGER range 1..50) of INTEGER;
	
	--Declare INTEGERS for the Low, High and Average of NumberArray
	Low: INTEGER;
	High: INTEGER;
	Average: INTEGER;
	
	--Declare Temp_Input as an INTEGER
	Temp_Input : INTEGER;
	
	
begin

	--Prompt the user for 50 integers with output
	Put("Enter 50 integers please.  No duplicates allowed. ");
		
	LoopTillFifty :
		while (Counter <= MAX) loop
		
			New_Line;					-- Output a new line via Text_IO Library
			Get(Temp_Input);		-- Get Input from Keyboard
			
			New_Line; 				-- Output a new line via Text_IO Library
			Put(Temp_Input); 		-- Output Input from Keyboard
			
			CheckForDuplicates: 	-- Reference the point where the loop begins.
				for I in Integer range 1 .. (Counter) loop 		-- for Loop from 1 to where the counter is (including those numbers)
					if (NumberArray(I) = Temp_Input) then 	-- Check for equality to prevent duplicates
						Put(" : Duplicate Rejected");
						exit CheckForDuplicates; 	-- break out of loop
					else	--Not a duplicate
						NumberArray(Counter) := Temp_Input; 	-- Add number to array location of counter value.
						Put(" : Added to array in memory space #");
						Put(Counter, 1);
						Counter := Counter + 1; 	--Increment the counter
						exit checkForDuplicates;	--Break out of loop
					end if; -- end if statement
				end loop CheckForDuplicates; -- End For Loop
			
		end loop LoopTillFifty;	-- End do while loop
		
		--Initialize starting values for Low, High and Average based on their functionality in For Loop, 'GetStat'
		Low := NumberArray(1);
		High := NumberArray(1);
		Average := 0;
		
		
		GetStats :	--Get Misc stats about array
			for I in Integer range 1 .. MAX loop	-- Interate through the entire array
			
				if (Low > NumberArray(I)) then		-- Get the lowest number of array
					Low := NumberArray(I);
				end if;
				
				if (High < NumberArray(I)) then	-- Get the highest number of array
					High := NumberArray(I);
				end if;
				
				Average := Average + NumberArray(I);	--Increment Average by the spot in the array.
			
			end loop GetStats;	--End For Loop
			
			Average := Average / MAX;	-- Calculate Average
			
			--Output stats
			New_Line;
			Put("Stats of the set of integers: ");
			New_Line;
			Put("Low: ");
			Put(Low,2);
			New_Line;
			Put("High: ");
			Put(High,2);
			New_Line;
			Put("Average: ");
			Put(Average,2);

end test;






