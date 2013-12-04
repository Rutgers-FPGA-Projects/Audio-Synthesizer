LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY keyboardpintester IS
PORT( GPIO : inout STD_LOGIC_VECTOR(11 DOWNTO 0);
	SW : in STD_LOGIC_VECTOR(11 DOWNTO 0);
	LEDR : out STD_LOGIC_VECTOR(11 DOWNTO 0) );
END keyboardpintester;
ARCHITECTURE str OF keyboardpintester IS
BEGIN
	PROCESS (SW)
	BEGIN
		IF (SW(0) = '1') THEN
			GPIO(0) <= 'Z';
			LEDR(0) <= GPIO(0);
		ELSE
			GPIO(0) <= '1';
			LEDR(0) <= '0';
		END IF;
		
		IF (SW(1) = '1') THEN
			GPIO(1) <= 'Z';
			LEDR(1) <= GPIO(1);
		ELSE
			GPIO(1) <= '1';
			LEDR(1) <= '0';
		END IF;
		
		IF (SW(2) = '1') THEN
			GPIO(2) <= 'Z';
			LEDR(2) <= GPIO(2);
		ELSE
			GPIO(2) <= '1';
			LEDR(2) <= '0';
		END IF;
		
		IF (SW(3) = '1') THEN
			GPIO(3) <= 'Z';
			LEDR(3) <= GPIO(3);
		ELSE
			GPIO(3) <= '1';
			LEDR(3) <= '0';
		END IF;
		
		IF (SW(4) = '1') THEN
			GPIO(4) <= 'Z';
			LEDR(4) <= GPIO(4);
		ELSE
			GPIO(4) <= '1';
			LEDR(4) <= '0';
		END IF;
		
		IF (SW(5) = '1') THEN
			GPIO(5) <= 'Z';
			LEDR(5) <= GPIO(5);
		ELSE
			GPIO(5) <= '1';
			LEDR(5) <= '0';
		END IF;
		
		IF (SW(6) = '1') THEN
			GPIO(6) <= 'Z';
			LEDR(6) <= GPIO(6);
		ELSE
			GPIO(6) <= '1';
			LEDR(6) <= '0';
		END IF;
		
		IF (SW(7) = '1') THEN
			GPIO(7) <= 'Z';
			LEDR(7) <= GPIO(7);
		ELSE
			GPIO(7) <= '1';
			LEDR(7) <= '0';
		END IF;
		
		IF (SW(8) = '1') THEN
			GPIO(8) <= 'Z';
			LEDR(8) <= GPIO(8);
		ELSE
			GPIO(8) <= '1';
			LEDR(8) <= '0';
		END IF;
		
		IF (SW(9) = '1') THEN
			GPIO(9) <= 'Z';
			LEDR(9) <= GPIO(9);
		ELSE
			GPIO(9) <= '1';
			LEDR(9) <= '0';
		END IF;
		
		IF (SW(10) = '1') THEN
			GPIO(10) <= 'Z';
			LEDR(10) <= GPIO(10);
		ELSE
			GPIO(10) <= '1';
			LEDR(10) <= '0';
		END IF;
		
		IF (SW(11) = '1') THEN
			GPIO(11) <= 'Z';
			LEDR(11) <= GPIO(11);
		ELSE
			GPIO(11) <= '1';
			LEDR(11) <= '0';
		END IF;
		
--		GPIO <= (NOT SW) ? '1' : 'z';
--		LEDR <= (SW) ? GPIO : '0';
	END PROCESS;
END str;