library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity blink_led_clk is
	port (
		clk : in std_logic; 
		led1 : out std_logic;
		led2 : out std_logic;
		led3 : out std_logic;
		led4 : out std_logic
	);
end blink_led_clk;

architecture rtl of blink_led_clk is
	signal state_LED: std_logic;
	--Frequency of the FPGA board in MHZ
	constant FPGA_clock: integer := 50000000;
	constant LED_FREQ: integer := 5;
	--The amount of edges to count
	constant MAX_CNT: integer := (FPGA_clock / LED_FREQ / 2);
	/*The number of bits used to count the number of edges*/
	signal cnt: unsigned (24 downto 0);	
	signal cycle: unsigned (4 downto 0);

begin
	/*0 == On, 1 == OFF, Remember Cyclone IV LED's have been inverted*/
	state_LED <= '0';
	process (clk) begin
	if rising_edge (clk) then
		if (cnt = MAX_CNT) then
			cnt <= (others => '0');
			cycle <= (cycle + 1) mod 4;
		else
			cnt <= cnt + 1;
		end if;
		
		if (cycle = 0) then
			led1 <= state_LED;
			led2 <= not state_LED;
			led3 <= not state_LED;
			led4 <= not state_LED;
		elsif (cycle = 1) then
			led1 <= not state_LED;
			led2 <= state_LED;
			led3 <= not state_LED;
			led4 <= not state_LED;
		elsif (cycle = 2) then
			led1 <= not state_LED;
			led2 <= not state_LED;
			led3 <= state_LED;
			led4 <= not state_LED;
		elsif (cycle = 3) then
			led1 <= not state_LED;
			led2 <= not state_LED;
			led3 <= not state_LED;
			led4 <= state_LED;
		end if;
		
	end if;
	end process;

	
end rtl;