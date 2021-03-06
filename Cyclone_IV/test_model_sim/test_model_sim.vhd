library ieee;
use ieee.std_logic_1164.all;
/*A test to observe model sim*/
entity test_model_sim is
	port (
	A : in std_logic;
	B : in std_logic;
	sum: out std_logic;
	carry: out std_logic
	);
end test_model_sim;

architecture rlt of test_model_sim is

begin 
	sum <= A xor B;
	carry <= A and B;
end rlt;

	