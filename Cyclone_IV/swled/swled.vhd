library ieee;
use ieee.std_logic_1164.all;

entity swled is
	port(
		input_1 : in std_logic;
		input_2 : in std_logic;
		input_3 : in std_logic;
		input_4 : in std_logic;
		result_1 : out std_logic;
		result_2 : out std_logic;
		result_3 : out std_logic;
		result_4 : out std_logic
	);
end swled;

architecture rt1 of swled is
begin
	result_1 <= input_1;
	result_2 <= input_2;
	result_3 <= input_3;
	result_4 <= input_4;
end rt1;