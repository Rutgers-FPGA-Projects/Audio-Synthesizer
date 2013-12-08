--assuming there are 8 select lines and 4 read lines
--7-0 are input, 8-11 are output (in order of left most to right most keys)
--pin numbers for gpio and keyboard are TEMPORARY and untested
--must use pin tester software to determine correct pins
--based on above assumptions, and using ???? hz clock, it will check each key ???? times a second
--KEYBOARD(0) is F3, KEYBOARD(31) is C6

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY keyboardinterface IS
PORT( GPIO : inout STD_LOGIC_VECTOR(11 DOWNTO 0);
		CLOCK_50 : in STD_LOGIC;
		KEYBOARD : out STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0'));
END keyboardinterface;

ARCHITECTURE str OF keyboardinterface IS
	--SIGNAL KEYBOARD : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');
	SIGNAL tempclock : STD_LOGIC;
	SIGNAL count : INTEGER RANGE 0 TO 249999 := 0; --for creating lower freq clock
	SIGNAL count2 : INTEGER RANGE 0 TO 15 := 0; --for cycling which keys are being tested, and alternating between setting inputs and outputs in case the key circuit is not "instant" (number of input pins times 2)
BEGIN
	--first create a ???? hz clock on tempclock
	PROCESS(CLOCK_50)
	BEGIN
		IF rising_edge(CLOCK_50) THEN
			IF (count = 24999) THEN
				tempclock <= NOT tempclock;
				count <= 0;
			ELSE
				count <= count + 1;
			END IF;
		END IF;
	END PROCESS;
	
--	GPIO(0) <= '0';
--	GPIO(1) <= '0';
--	GPIO(2) <= '0';
--	GPIO(3) <= '0';
--	GPIO(4) <= '0';
--	GPIO(5) <= '1';
--	GPIO(6) <= '0';
--	GPIO(7) <= '0';
	GPIO(8) <= 'Z';
	GPIO(9) <= 'Z';
	GPIO(10) <= 'Z';
	GPIO(11) <= 'Z';
--	PROCESS(GPIO(8))
--	BEGIN
--		IF (GPIO(8) = '1') THEN LEDR(0) <= '1'; ELSE LEDR(0) <= '0'; END IF;
--	END PROCESS;
	--LEDR(0) <= GPIO(8);
	
	
	PROCESS(tempclock)
	BEGIN
		IF rising_edge(tempclock) THEN
			CASE count2 IS
				WHEN 0 =>
					GPIO(0) <= '0';
					GPIO(1) <= '0';
					GPIO(2) <= '0';
					GPIO(3) <= '0';
					GPIO(4) <= '0';
					GPIO(5) <= '0';
					GPIO(6) <= '0';
					GPIO(7) <= '1'; --set first input pin high
				WHEN 1 => --then read output pins
					--GPIO(8) <= 'Z';
					IF (GPIO(8) = '1') THEN KEYBOARD(0) <= '1'; ELSE KEYBOARD(0) <= '0'; END IF;
					IF (GPIO(9) = '1') THEN KEYBOARD(1) <= '1'; ELSE KEYBOARD(1) <= '0'; END IF;
					IF (GPIO(10) = '1') THEN KEYBOARD(2) <= '1'; ELSE KEYBOARD(2) <= '0'; END IF;
					IF (GPIO(11) = '1') THEN KEYBOARD(3) <= '1'; ELSE KEYBOARD(3) <= '0'; END IF;
					--original code doesnt work because keyboard needs to act as a register to remember values, so if statements are required
					--KEYBOARD(0) <= '1' WHEN GPIO(8) ELSE '0';
					--KEYBOARD(1) <= '1' WHEN GPIO(9) ELSE '0';
					--KEYBOARD(2) <= '1' WHEN GPIO(10) ELSE '0';
					--KEYBOARD(3) <= '1' WHEN GPIO(11) ELSE '0';
				WHEN 2 =>
					GPIO(0) <= '0';
					GPIO(1) <= '0';
					GPIO(2) <= '0';
					GPIO(3) <= '0';
					GPIO(4) <= '0';
					GPIO(5) <= '0';
					GPIO(6) <= '1'; --set second input pin high
					GPIO(7) <= '0';
				WHEN 3 => --then read output pins
					IF (GPIO(8) = '1') THEN KEYBOARD(4) <= '1'; ELSE KEYBOARD(4) <= '0'; END IF;
					IF (GPIO(9) = '1') THEN KEYBOARD(5) <= '1'; ELSE KEYBOARD(5) <= '0'; END IF;
					IF (GPIO(10) = '1') THEN KEYBOARD(6) <= '1'; ELSE KEYBOARD(6) <= '0'; END IF;
					IF (GPIO(11) = '1') THEN KEYBOARD(7) <= '1'; ELSE KEYBOARD(7) <= '0'; END IF;
				WHEN 4 =>
					GPIO(0) <= '0';
					GPIO(1) <= '0';
					GPIO(2) <= '0';
					GPIO(3) <= '0';
					GPIO(4) <= '0';
					GPIO(5) <= '1';
					GPIO(6) <= '0';
					GPIO(7) <= '0';
				WHEN 5 =>
					IF (GPIO(8) = '1') THEN KEYBOARD(8) <= '1'; ELSE KEYBOARD(8) <= '0'; END IF;
					IF (GPIO(9) = '1') THEN KEYBOARD(9) <= '1'; ELSE KEYBOARD(9) <= '0'; END IF;
					IF (GPIO(10) = '1') THEN KEYBOARD(10) <= '1'; ELSE KEYBOARD(10) <= '0'; END IF;
					IF (GPIO(11) = '1') THEN KEYBOARD(11) <= '1'; ELSE KEYBOARD(11) <= '0'; END IF;
				WHEN 6 =>
					GPIO(0) <= '0';
					GPIO(1) <= '0';
					GPIO(2) <= '0';
					GPIO(3) <= '0';
					GPIO(4) <= '1';
					GPIO(5) <= '0';
					GPIO(6) <= '0';
					GPIO(7) <= '0';
				WHEN 7 =>
					IF (GPIO(8) = '1') THEN KEYBOARD(12) <= '1'; ELSE KEYBOARD(12) <= '0'; END IF;
					IF (GPIO(9) = '1') THEN KEYBOARD(13) <= '1'; ELSE KEYBOARD(13) <= '0'; END IF;
					IF (GPIO(10) = '1') THEN KEYBOARD(14) <= '1'; ELSE KEYBOARD(14) <= '0'; END IF;
					IF (GPIO(11) = '1') THEN KEYBOARD(15) <= '1'; ELSE KEYBOARD(15) <= '0'; END IF;
				WHEN 8 =>
					GPIO(0) <= '0';
					GPIO(1) <= '0';
					GPIO(2) <= '0';
					GPIO(3) <= '1';
					GPIO(4) <= '0';
					GPIO(5) <= '0';
					GPIO(6) <= '0';
					GPIO(7) <= '0';
				WHEN 9 =>
					IF (GPIO(8) = '1') THEN KEYBOARD(16) <= '1'; ELSE KEYBOARD(16) <= '0'; END IF;
					IF (GPIO(9) = '1') THEN KEYBOARD(17) <= '1'; ELSE KEYBOARD(17) <= '0'; END IF;
					IF (GPIO(10) = '1') THEN KEYBOARD(18) <= '1'; ELSE KEYBOARD(18) <= '0'; END IF;
					IF (GPIO(11) = '1') THEN KEYBOARD(19) <= '1'; ELSE KEYBOARD(19) <= '0'; END IF;
				WHEN 10 =>
					GPIO(0) <= '0';
					GPIO(1) <= '0';
					GPIO(2) <= '1';
					GPIO(3) <= '0';
					GPIO(4) <= '0';
					GPIO(5) <= '0';
					GPIO(6) <= '0';
					GPIO(7) <= '0';
				WHEN 11 =>
					IF (GPIO(8) = '1') THEN KEYBOARD(20) <= '1'; ELSE KEYBOARD(20) <= '0'; END IF;
					IF (GPIO(9) = '1') THEN KEYBOARD(21) <= '1'; ELSE KEYBOARD(21) <= '0'; END IF;
					IF (GPIO(10) = '1') THEN KEYBOARD(22) <= '1'; ELSE KEYBOARD(22) <= '0'; END IF;
					IF (GPIO(11) = '1') THEN KEYBOARD(23) <= '1'; ELSE KEYBOARD(23) <= '0'; END IF;
				WHEN 12 =>
					GPIO(0) <= '0';
					GPIO(1) <= '1';
					GPIO(2) <= '0';
					GPIO(3) <= '0';
					GPIO(4) <= '0';
					GPIO(5) <= '0';
					GPIO(6) <= '0';
					GPIO(7) <= '0';
				WHEN 13 =>
					IF (GPIO(8) = '1') THEN KEYBOARD(24) <= '1'; ELSE KEYBOARD(24) <= '0'; END IF;
					IF (GPIO(9) = '1') THEN KEYBOARD(25) <= '1'; ELSE KEYBOARD(25) <= '0'; END IF;
					IF (GPIO(10) = '1') THEN KEYBOARD(26) <= '1'; ELSE KEYBOARD(26) <= '0'; END IF;
					IF (GPIO(11) = '1') THEN KEYBOARD(27) <= '1'; ELSE KEYBOARD(27) <= '0'; END IF;
				WHEN 14 =>
					GPIO(0) <= '1';
					GPIO(1) <= '0';
					GPIO(2) <= '0';
					GPIO(3) <= '0';
					GPIO(4) <= '0';
					GPIO(5) <= '0';
					GPIO(6) <= '0';
					GPIO(7) <= '0';
				WHEN 15 =>
					IF (GPIO(8) = '1') THEN KEYBOARD(28) <= '1'; ELSE KEYBOARD(28) <= '0'; END IF;
					IF (GPIO(9) = '1') THEN KEYBOARD(29) <= '1'; ELSE KEYBOARD(29) <= '0'; END IF;
					IF (GPIO(10) = '1') THEN KEYBOARD(30) <= '1'; ELSE KEYBOARD(30) <= '0'; END IF;
					IF (GPIO(11) = '1') THEN KEYBOARD(31) <= '1'; ELSE KEYBOARD(31) <= '0'; END IF;
			END CASE;
			IF (count2 = 15) THEN
				count2 <= 0;
			ELSE
				count2 <= count2 + 1;
			END IF;
		END IF;
	END PROCESS;
END str;