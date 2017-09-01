
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;

entity lab5_gcd is
    Port ( a_i : in STD_LOGIC;
           b_i : in STD_LOGIC_VECTOR (7 downto 0);
           push_i : in STD_LOGIC;
           pushbutton : in STD_LOGIC;
           clk : in STD_LOGIC;
           load : out STD_LOGIC;
           sub : out STD_LOGIC;
           op_valid : out STD_LOGIC;
           cathode : out STD_LOGIC_VECTOR (6 downto 0);
           anode : out STD_LOGIC_VECTOR (3 downto 0));
end lab5_gcd;

architecture Behavioral of lab5_gcd is
	COMPONENT lab4_seven_segment_display
PORT(
    b : IN std_logic_vector(15 downto 0);
    clk : IN std_logic;
    pushbutton : IN std_logic;          
    anode : OUT std_logic_vector(3 downto 0);
    cathode : OUT std_logic_vector(6 downto 0)
    );
END COMPONENT;

signal COUNTER1 : std_logic_vector (15 downto 0);
--signal COUNTER2 : std_logic_vector (15 downto 0);
--signal a_checked : std_logic_vector (7 downto 0);
--signal b_checked : std_logic_vector (7 downto 0);
--signal CLOCK31 : std_logic;
--signal clock_mod : std_logic;
signal sub_signal: std_logic;
signal ONE : std_logic ;
signal ZERO : std_logic;
signal checked_valid : std_logic;
signal load_signal : std_logic;
signal d : std_logic_vector (15 downto 0);
signal a0_int :integer range 0 to 15;
signal a1_int :integer range 0 to 15;
signal b0_int :integer range 0 to 15;
signal b1_int :integer range 0 to 15;
signal d0 : integer range 0 to 15;
signal d1: integer range 0 to 15;

--signal a : std_logic_vector (7 downto 0);
--signal b : std_logic_vector (7 downto 0);
--signal aTOsub : std_logic_vector (7 downto 0);
--signal bTOsub : std_logic_vector (7 downto 0);

begin
ONE <= '1';
ZERO <= '0';

a0_int <= to_integer(unsigned(a_i(3 downto 0)));
a1_int <= to_integer(unsigned(a_i(7 downto 4)));
b0_int <= to_integer(unsigned(b_i(3 downto 0)));
b1_int <= to_integer(unsigned(b_i(7 downto 4)));

display: lab4_seven_segment_display PORT MAP(
    b => d,
    clk =>clk ,
    pushbutton => pushbutton,
    anode => anode  ,
    cathode => cathode
);

process(clk,push_i, load)
    begin
        if (load = '1') then -- currently done asynchronously without clock
            
        if (sub_signal = 1) then
            if(a0_int = b0_int and a1_int = b1_int) then
                -- the two inputs are equal
                sub_signal <= '0';

                sub_signal <= '0';
            elsif(a1_int > b1_int or (a1_int = b1_int and a0_int > b0_int)) then
					-- A > B
					if (a0_int > b0_int or a0_int = b0_int) then
							d0 <= a0_int - b0_int;
							d1 <= a1_int - b1_int;
					else
						d0 <= 10 - b0_int + a0_int;
						d1 <= a1_int - b1_int - 1;
					end if;
					-- assign the difference to A
					a0_int <= d0;
					a1_int <=d1;
				elsif(a1_int < b1_int or (a1_int = b1_int and a0_int < b0_int)) then
					-- B > A
					if (b0_int > a0_int and b0_int = a0_int) then
							d0 <= b0_int - a0_int;
							d1 <= a1_int - b1_int;
					else
							d0 <= 10 - a0_int + b0_int;
							d1 <= b1_int - a1_int - 1;
					end if;
					-- assign the difference to B
					b0_int <= d0;
					b1_int <= d1;
				end if;
		end if;
end process;
end architecture ;
