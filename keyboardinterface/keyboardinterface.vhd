--assuming there are 8 select lines and 4 read lines
--0-7 are input, 8-11 are output
--pin numbers for gpio and keyboard are TEMPORARY and untested
--must use pin tester software to determine correct pins
--based on above assumptions, and using 100 hz clock, it will check each key 6 times a second

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY keyboardinterface IS
PORT( GPIO : inout STD_LOGIC_VECTOR(11 DOWNTO 0);
		CLOCK_50 : in STD_LOGIC;
		KEYBOARD : out STD_LOGIC_VECTOR(31 DOWNTO 0) ); --which keys are being pressed on the keyboard
END keyboardinterface;

ARCHITECTURE str OF keyboardinterface IS
	SIGNAL tempclock : STD_LOGIC;
	SIGNAL count : INTEGER RANGE 0 TO 249999 := 0; --for creating lower freq clock
	SIGNAL count2 : INTEGER RANGE 0 TO 15 := 0; --for cycling which keys are being tested, and alternating between setting inputs and outputs in case the key circuit is not "instant" (number of input pins times 2)
BEGIN
	--first create a 100 hz clock on tempclock
	PROCESS(CLOCK_50)
	BEGIN
		IF rising_edge(CLOCK_50) THEN
			IF (count = 249999) THEN
				tempclock <= NOT tempclock;
				count <= 0;
			ELSE
				count <= count + 1;
			END IF;
		END IF;
	END PROCESS;
	
	PROCESS(tempclock)
	BEGIN
		IF rising_edge(tempclock) THEN
			CASE count2 IS
				WHEN 0 =>
					GPIO(0) <= '1'; --set first input pin high
					GPIO(1) <= '0';
					GPIO(2) <= '0';
					GPIO(3) <= '0';
					GPIO(4) <= '0';
					GPIO(5) <= '0';
					GPIO(6) <= '0';
					GPIO(7) <= '0';
				WHEN 1 => --then read output pins
					KEYBOARD(0) <= GPIO(8);
					KEYBOARD(1) <= GPIO(9);
					KEYBOARD(2) <= GPIO(10);
					KEYBOARD(3) <= GPIO(11);
				WHEN 2 =>
					GPIO(0) <= '0';
					GPIO(1) <= '1'; --set second input pin high
					GPIO(2) <= '0';
					GPIO(3) <= '0';
					GPIO(4) <= '0';
					GPIO(5) <= '0';
					GPIO(6) <= '0';
					GPIO(7) <= '0';
				WHEN 3 => --then read output pins
					KEYBOARD(4) <= GPIO(8);
					KEYBOARD(5) <= GPIO(9);
					KEYBOARD(6) <= GPIO(10);
					KEYBOARD(7) <= GPIO(11);
				WHEN 4 =>
					GPIO(0) <= '0';
					GPIO(1) <= '0';
					GPIO(2) <= '1';
					GPIO(3) <= '0';
					GPIO(4) <= '0';
					GPIO(5) <= '0';
					GPIO(6) <= '0';
					GPIO(7) <= '0';
				WHEN 5 =>
					KEYBOARD(8) <= GPIO(8);
					KEYBOARD(9) <= GPIO(9);
					KEYBOARD(10) <= GPIO(10);
					KEYBOARD(11) <= GPIO(11);
				WHEN 6 =>
					GPIO(0) <= '0';
					GPIO(1) <= '0';
					GPIO(2) <= '0';
					GPIO(3) <= '1';
					GPIO(4) <= '0';
					GPIO(5) <= '0';
					GPIO(6) <= '0';
					GPIO(7) <= '0';
				WHEN 7 =>
					KEYBOARD(12) <= GPIO(8);
					KEYBOARD(13) <= GPIO(9);
					KEYBOARD(14) <= GPIO(10);
					KEYBOARD(15) <= GPIO(11);
				WHEN 8 =>
					GPIO(0) <= '0';
					GPIO(1) <= '0';
					GPIO(2) <= '0';
					GPIO(3) <= '0';
					GPIO(4) <= '1';
					GPIO(5) <= '0';
					GPIO(6) <= '0';
					GPIO(7) <= '0';
				WHEN 9 =>
					KEYBOARD(16) <= GPIO(8);
					KEYBOARD(17) <= GPIO(9);
					KEYBOARD(18) <= GPIO(10);
					KEYBOARD(19) <= GPIO(11);
				WHEN 10 =>
					GPIO(0) <= '0';
					GPIO(1) <= '0';
					GPIO(2) <= '0';
					GPIO(3) <= '0';
					GPIO(4) <= '0';
					GPIO(5) <= '1';
					GPIO(6) <= '0';
					GPIO(7) <= '0';
				WHEN 11 =>
					KEYBOARD(20) <= GPIO(8);
					KEYBOARD(21) <= GPIO(9);
					KEYBOARD(22) <= GPIO(10);
					KEYBOARD(23) <= GPIO(11);
				WHEN 12 =>
					GPIO(0) <= '0';
					GPIO(1) <= '0';
					GPIO(2) <= '0';
					GPIO(3) <= '0';
					GPIO(4) <= '0';
					GPIO(5) <= '0';
					GPIO(6) <= '1';
					GPIO(7) <= '0';
				WHEN 13 =>
					KEYBOARD(24) <= GPIO(8);
					KEYBOARD(25) <= GPIO(9);
					KEYBOARD(26) <= GPIO(10);
					KEYBOARD(27) <= GPIO(11);
				WHEN 14 =>
					GPIO(0) <= '0';
					GPIO(1) <= '0';
					GPIO(2) <= '0';
					GPIO(3) <= '0';
					GPIO(4) <= '0';
					GPIO(5) <= '0';
					GPIO(6) <= '0';
					GPIO(7) <= '1';
				WHEN 15 =>
					KEYBOARD(28) <= GPIO(8);
					KEYBOARD(29) <= GPIO(9);
					KEYBOARD(30) <= GPIO(10);
					KEYBOARD(31) <= GPIO(11);
			END CASE;
			IF (count2 = 15) THEN
				count2 <= 0;
			ELSE
				count2 <= count2 + 1;
			END IF;
		END IF;
	END PROCESS;
END str;