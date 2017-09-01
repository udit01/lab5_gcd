--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : lab4_seven_segment_display.vhf
-- /___/   /\     Timestamp : 08/24/2017 14:00:12
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: /opt/Xilinx/14.7/ISE_DS/ISE/bin/lin64/unwrapped/sch2hdl -intstyle ise -family artix7 -flat -suppress -vhdl lab4_seven_segment_display.vhf -w /home/btech/cs1160327/col215/24AUG/lab5_gcd/lab4_seven_segment_display.sch
--Design Name: lab4_seven_segment_display
--Device: artix7
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--
----- CELL INV4_HXILINX_lab4_seven_segment_display -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity INV4_HXILINX_lab4_seven_segment_display is
  
port(
    O0  : out std_logic;
    O1  : out std_logic;
    O2  : out std_logic;
    O3  : out std_logic;

    I0  : in std_logic;
    I1  : in std_logic;
    I2  : in std_logic;
    I3  : in std_logic
  );
end INV4_HXILINX_lab4_seven_segment_display;

architecture INV4_HXILINX_lab4_seven_segment_display_V of INV4_HXILINX_lab4_seven_segment_display is
begin
  O0 <= not I0 ;
  O1 <= not I1 ;
  O2 <= not I2 ;
  O3 <= not I3 ;
end INV4_HXILINX_lab4_seven_segment_display_V;
----- CELL OR6_HXILINX_lab4_seven_segment_display -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity OR6_HXILINX_lab4_seven_segment_display is
  
port(
    O  : out std_logic;

    I0  : in std_logic;
    I1  : in std_logic;
    I2  : in std_logic;
    I3  : in std_logic;
    I4  : in std_logic;
    I5  : in std_logic
  );
end OR6_HXILINX_lab4_seven_segment_display;

architecture OR6_HXILINX_lab4_seven_segment_display_V of OR6_HXILINX_lab4_seven_segment_display is
begin
  O <=  (I0 or I1 or I2 or I3 or I4 or I5);
end OR6_HXILINX_lab4_seven_segment_display_V;
----- CELL CB16CE_HXILINX_lab4_seven_segment_display -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CB16CE_HXILINX_lab4_seven_segment_display is
port (
    CEO : out STD_LOGIC;
    Q   : out STD_LOGIC_VECTOR(15 downto 0);
    TC  : out STD_LOGIC;
    C   : in STD_LOGIC;
    CE  : in STD_LOGIC;
    CLR : in STD_LOGIC
    );
end CB16CE_HXILINX_lab4_seven_segment_display;

architecture Behavioral of CB16CE_HXILINX_lab4_seven_segment_display is

  signal COUNT : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
  constant TERMINAL_COUNT : STD_LOGIC_VECTOR(15 downto 0) := (others => '1');
  
begin

process(C, CLR)
begin
  if (CLR='1') then
    COUNT <= (others => '0');
  elsif (C'event and C = '1') then
    if (CE='1') then 
      COUNT <= COUNT+1;
    end if;
  end if;
end process;

TC  <= '1' when (COUNT = TERMINAL_COUNT) else '0';
CEO <= '1' when ((COUNT = TERMINAL_COUNT) and CE='1') else '0';
Q   <= COUNT;

end Behavioral;

----- CELL D2_4E_HXILINX_lab4_seven_segment_display -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity D2_4E_HXILINX_lab4_seven_segment_display is
  
port(
    D0  : out std_logic;
    D1  : out std_logic;
    D2  : out std_logic;
    D3  : out std_logic;

    A0  : in std_logic;
    A1  : in std_logic;
    E   : in std_logic
  );
end D2_4E_HXILINX_lab4_seven_segment_display;

architecture D2_4E_HXILINX_lab4_seven_segment_display_V of D2_4E_HXILINX_lab4_seven_segment_display is
  signal d_tmp : std_logic_vector(3 downto 0);
begin
  process (A0, A1, E)
  variable sel   : std_logic_vector(1 downto 0);
  begin
    sel := A1&A0;
    if( E = '0') then
    d_tmp <= "0000";
    else
      case sel is
      when "00" => d_tmp <= "0001";
      when "01" => d_tmp <= "0010";
      when "10" => d_tmp <= "0100";
      when "11" => d_tmp <= "1000";
      when others => NULL;
      end case;
    end if;
  end process; 

    D3 <= d_tmp(3);
    D2 <= d_tmp(2);
    D1 <= d_tmp(1);
    D0 <= d_tmp(0);

end D2_4E_HXILINX_lab4_seven_segment_display_V;
----- CELL M2_1_HXILINX_lab4_seven_segment_display -----
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity M2_1_HXILINX_lab4_seven_segment_display is
  
port(
    O   : out std_logic;

    D0  : in std_logic;
    D1  : in std_logic;
    S0  : in std_logic
  );
end M2_1_HXILINX_lab4_seven_segment_display;

architecture M2_1_HXILINX_lab4_seven_segment_display_V of M2_1_HXILINX_lab4_seven_segment_display is
begin
  process (D0, D1, S0)
  begin
    case S0 is
    when '0' => O <= D0;
    when '1' => O <= D1;
    when others => NULL;
    end case;
    end process; 
end M2_1_HXILINX_lab4_seven_segment_display_V;
----- CELL CB2CE_HXILINX_lab4_seven_segment_display -----


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CB2CE_HXILINX_lab4_seven_segment_display is
  
port (
    CEO  : out STD_LOGIC;
    Q0   : out STD_LOGIC;
    Q1   : out STD_LOGIC;
    TC   : out STD_LOGIC;
    C    : in STD_LOGIC;
    CE   : in STD_LOGIC;
    CLR  : in STD_LOGIC
    );
end CB2CE_HXILINX_lab4_seven_segment_display;

architecture Behavioral of CB2CE_HXILINX_lab4_seven_segment_display is

  signal COUNT : STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
  constant TERMINAL_COUNT : STD_LOGIC_VECTOR(1 downto 0) := (others => '1');
  
begin

process(C, CLR)
begin
  if (CLR='1') then
    COUNT <= (others => '0');
  elsif (C'event and C = '1') then
    if (CE='1') then 
      COUNT <= COUNT+1;
    end if;
  end if;
end process;

TC   <= '1' when (COUNT = TERMINAL_COUNT) else '0';
CEO  <= '1' when ((COUNT = TERMINAL_COUNT) and CE='1') else '0';

Q1 <= COUNT(1);
Q0 <= COUNT(0);

end Behavioral;


library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity Gcathode_MUSER_lab4_seven_segment_display is
   port ( bit_in_4 : in    std_logic_vector (3 downto 0); 
          ouputG   : out   std_logic);
end Gcathode_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of Gcathode_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_1   : std_logic;
   signal XLXN_2   : std_logic;
   signal XLXN_3   : std_logic;
   signal XLXN_4   : std_logic;
   signal XLXN_5   : std_logic;
   component OR5
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR5 : component is "BLACK_BOX";
   
   component AND2B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2B1 : component is "BLACK_BOX";
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component AND3B2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B2 : component is "BLACK_BOX";
   
begin
   XLXI_1 : OR5
      port map (I0=>XLXN_5,
                I1=>XLXN_4,
                I2=>XLXN_3,
                I3=>XLXN_2,
                I4=>XLXN_1,
                O=>ouputG);
   
   XLXI_2 : AND2B1
      port map (I0=>bit_in_4(2),
                I1=>bit_in_4(1),
                O=>XLXN_1);
   
   XLXI_3 : AND2B1
      port map (I0=>bit_in_4(0),
                I1=>bit_in_4(1),
                O=>XLXN_2);
   
   XLXI_4 : AND2B1
      port map (I0=>bit_in_4(2),
                I1=>bit_in_4(3),
                O=>XLXN_3);
   
   XLXI_5 : AND2
      port map (I0=>bit_in_4(3),
                I1=>bit_in_4(0),
                O=>XLXN_4);
   
   XLXI_7 : AND3B2
      port map (I0=>bit_in_4(3),
                I1=>bit_in_4(1),
                I2=>bit_in_4(2),
                O=>XLXN_5);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity Fcathode_MUSER_lab4_seven_segment_display is
   port ( bit_in_4 : in    std_logic_vector (3 downto 0); 
          outputF  : out   std_logic);
end Fcathode_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of Fcathode_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_1   : std_logic;
   signal XLXN_2   : std_logic;
   signal XLXN_3   : std_logic;
   signal XLXN_4   : std_logic;
   signal XLXN_5   : std_logic;
   component OR5
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR5 : component is "BLACK_BOX";
   
   component AND2B2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2B2 : component is "BLACK_BOX";
   
   component AND2B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2B1 : component is "BLACK_BOX";
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component AND3B2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B2 : component is "BLACK_BOX";
   
begin
   XLXI_1 : OR5
      port map (I0=>XLXN_5,
                I1=>XLXN_4,
                I2=>XLXN_3,
                I3=>XLXN_2,
                I4=>XLXN_1,
                O=>outputF);
   
   XLXI_2 : AND2B2
      port map (I0=>bit_in_4(0),
                I1=>bit_in_4(1),
                O=>XLXN_1);
   
   XLXI_3 : AND2B1
      port map (I0=>bit_in_4(0),
                I1=>bit_in_4(2),
                O=>XLXN_2);
   
   XLXI_4 : AND2B1
      port map (I0=>bit_in_4(2),
                I1=>bit_in_4(3),
                O=>XLXN_3);
   
   XLXI_5 : AND2
      port map (I0=>bit_in_4(1),
                I1=>bit_in_4(3),
                O=>XLXN_4);
   
   XLXI_6 : AND3B2
      port map (I0=>bit_in_4(1),
                I1=>bit_in_4(3),
                I2=>bit_in_4(2),
                O=>XLXN_5);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity Ecathode_MUSER_lab4_seven_segment_display is
   port ( bit_in_4 : in    std_logic_vector (3 downto 0); 
          outputE  : out   std_logic);
end Ecathode_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of Ecathode_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_1   : std_logic;
   signal XLXN_2   : std_logic;
   signal XLXN_3   : std_logic;
   signal XLXN_5   : std_logic;
   component OR4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR4 : component is "BLACK_BOX";
   
   component AND2B2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2B2 : component is "BLACK_BOX";
   
   component AND2B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2B1 : component is "BLACK_BOX";
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
begin
   XLXI_1 : OR4
      port map (I0=>XLXN_5,
                I1=>XLXN_3,
                I2=>XLXN_2,
                I3=>XLXN_1,
                O=>outputE);
   
   XLXI_2 : AND2B2
      port map (I0=>bit_in_4(0),
                I1=>bit_in_4(2),
                O=>XLXN_1);
   
   XLXI_3 : AND2B1
      port map (I0=>bit_in_4(0),
                I1=>bit_in_4(1),
                O=>XLXN_2);
   
   XLXI_4 : AND2
      port map (I0=>bit_in_4(1),
                I1=>bit_in_4(3),
                O=>XLXN_3);
   
   XLXI_5 : AND2
      port map (I0=>bit_in_4(2),
                I1=>bit_in_4(3),
                O=>XLXN_5);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity Dcathode_MUSER_lab4_seven_segment_display is
   port ( bit_in_4 : in    std_logic_vector (3 downto 0); 
          outputD  : out   std_logic);
end Dcathode_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of Dcathode_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_1   : std_logic;
   signal XLXN_2   : std_logic;
   signal XLXN_3   : std_logic;
   signal XLXN_4   : std_logic;
   signal XLXN_5   : std_logic;
   component OR5
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR5 : component is "BLACK_BOX";
   
   component AND2B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2B1 : component is "BLACK_BOX";
   
   component AND3B3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B3 : component is "BLACK_BOX";
   
   component AND3B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B1 : component is "BLACK_BOX";
   
begin
   XLXI_1 : OR5
      port map (I0=>XLXN_5,
                I1=>XLXN_4,
                I2=>XLXN_3,
                I3=>XLXN_2,
                I4=>XLXN_1,
                O=>outputD);
   
   XLXI_2 : AND2B1
      port map (I0=>bit_in_4(1),
                I1=>bit_in_4(3),
                O=>XLXN_1);
   
   XLXI_3 : AND3B3
      port map (I0=>bit_in_4(0),
                I1=>bit_in_4(2),
                I2=>bit_in_4(3),
                O=>XLXN_2);
   
   XLXI_4 : AND3B1
      port map (I0=>bit_in_4(2),
                I1=>bit_in_4(1),
                I2=>bit_in_4(0),
                O=>XLXN_3);
   
   XLXI_5 : AND3B1
      port map (I0=>bit_in_4(1),
                I1=>bit_in_4(0),
                I2=>bit_in_4(2),
                O=>XLXN_4);
   
   XLXI_6 : AND3B1
      port map (I0=>bit_in_4(0),
                I1=>bit_in_4(1),
                I2=>bit_in_4(2),
                O=>XLXN_5);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity Ccathode_MUSER_lab4_seven_segment_display is
   port ( bit_in_4 : in    std_logic_vector (3 downto 0); 
          outputC  : out   std_logic);
end Ccathode_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of Ccathode_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_2   : std_logic;
   signal XLXN_3   : std_logic;
   signal XLXN_4   : std_logic;
   signal XLXN_5   : std_logic;
   signal XLXN_6   : std_logic;
   component OR5
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR5 : component is "BLACK_BOX";
   
   component AND2B2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2B2 : component is "BLACK_BOX";
   
   component AND2B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2B1 : component is "BLACK_BOX";
   
begin
   XLXI_1 : OR5
      port map (I0=>XLXN_6,
                I1=>XLXN_5,
                I2=>XLXN_4,
                I3=>XLXN_3,
                I4=>XLXN_2,
                O=>outputC);
   
   XLXI_2 : AND2B2
      port map (I0=>bit_in_4(1),
                I1=>bit_in_4(3),
                O=>XLXN_2);
   
   XLXI_3 : AND2B1
      port map (I0=>bit_in_4(3),
                I1=>bit_in_4(0),
                O=>XLXN_3);
   
   XLXI_4 : AND2B1
      port map (I0=>bit_in_4(1),
                I1=>bit_in_4(0),
                O=>XLXN_4);
   
   XLXI_5 : AND2B1
      port map (I0=>bit_in_4(3),
                I1=>bit_in_4(2),
                O=>XLXN_5);
   
   XLXI_6 : AND2B1
      port map (I0=>bit_in_4(2),
                I1=>bit_in_4(3),
                O=>XLXN_6);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity Bcathode_MUSER_lab4_seven_segment_display is
   port ( bit_in_4 : in    std_logic_vector (3 downto 0); 
          outputB  : out   std_logic);
end Bcathode_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of Bcathode_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_1   : std_logic;
   signal XLXN_2   : std_logic;
   signal XLXN_3   : std_logic;
   signal XLXN_4   : std_logic;
   signal XLXN_5   : std_logic;
   component OR5
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR5 : component is "BLACK_BOX";
   
   component AND2B2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2B2 : component is "BLACK_BOX";
   
   component AND3B3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B3 : component is "BLACK_BOX";
   
   component AND3B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B1 : component is "BLACK_BOX";
   
begin
   XLXI_1 : OR5
      port map (I0=>XLXN_5,
                I1=>XLXN_4,
                I2=>XLXN_3,
                I3=>XLXN_2,
                I4=>XLXN_1,
                O=>outputB);
   
   XLXI_2 : AND2B2
      port map (I0=>bit_in_4(2),
                I1=>bit_in_4(3),
                O=>XLXN_1);
   
   XLXI_7 : AND2B2
      port map (I0=>bit_in_4(0),
                I1=>bit_in_4(2),
                O=>XLXN_2);
   
   XLXI_8 : AND3B3
      port map (I0=>bit_in_4(0),
                I1=>bit_in_4(1),
                I2=>bit_in_4(3),
                O=>XLXN_3);
   
   XLXI_9 : AND3B1
      port map (I0=>bit_in_4(3),
                I1=>bit_in_4(1),
                I2=>bit_in_4(0),
                O=>XLXN_4);
   
   XLXI_10 : AND3B1
      port map (I0=>bit_in_4(1),
                I1=>bit_in_4(0),
                I2=>bit_in_4(3),
                O=>XLXN_5);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity Acathode_MUSER_lab4_seven_segment_display is
   port ( bit_in_4 : in    std_logic_vector (3 downto 0); 
          outputA  : out   std_logic);
end Acathode_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of Acathode_MUSER_lab4_seven_segment_display is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal XLXN_2   : std_logic;
   signal XLXN_3   : std_logic;
   signal XLXN_4   : std_logic;
   signal XLXN_5   : std_logic;
   signal XLXN_6   : std_logic;
   signal XLXN_26  : std_logic;
   component OR6_HXILINX_lab4_seven_segment_display
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             I5 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component AND2B2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2B2 : component is "BLACK_BOX";
   
   component AND2B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2B1 : component is "BLACK_BOX";
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component AND3B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B1 : component is "BLACK_BOX";
   
   component AND3B2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B2 : component is "BLACK_BOX";
   
   attribute HU_SET of XLXI_1 : label is "XLXI_1_0";
begin
   XLXI_1 : OR6_HXILINX_lab4_seven_segment_display
      port map (I0=>XLXN_26,
                I1=>XLXN_6,
                I2=>XLXN_5,
                I3=>XLXN_4,
                I4=>XLXN_3,
                I5=>XLXN_2,
                O=>outputA);
   
   XLXI_2 : AND2B2
      port map (I0=>bit_in_4(0),
                I1=>bit_in_4(2),
                O=>XLXN_2);
   
   XLXI_3 : AND2B1
      port map (I0=>bit_in_4(3),
                I1=>bit_in_4(1),
                O=>XLXN_3);
   
   XLXI_4 : AND2
      port map (I0=>bit_in_4(1),
                I1=>bit_in_4(2),
                O=>XLXN_4);
   
   XLXI_5 : AND2B1
      port map (I0=>bit_in_4(0),
                I1=>bit_in_4(3),
                O=>XLXN_5);
   
   XLXI_6 : AND3B1
      port map (I0=>bit_in_4(3),
                I1=>bit_in_4(2),
                I2=>bit_in_4(0),
                O=>XLXN_6);
   
   XLXI_7 : AND3B2
      port map (I0=>bit_in_4(1),
                I1=>bit_in_4(2),
                I2=>bit_in_4(3),
                O=>XLXN_26);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity binary_to_7_segment_display_MUSER_lab4_seven_segment_display is
   port ( bit_in_4             : in    std_logic_vector (3 downto 0); 
          bit_out_7_to_cathode : out   std_logic_vector (6 downto 0));
end binary_to_7_segment_display_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of 
      binary_to_7_segment_display_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_8               : std_logic;
   signal XLXN_9               : std_logic;
   signal XLXN_10              : std_logic;
   signal XLXN_11              : std_logic;
   signal XLXN_12              : std_logic;
   signal XLXN_13              : std_logic;
   signal XLXN_14              : std_logic;
   component Acathode_MUSER_lab4_seven_segment_display
      port ( bit_in_4 : in    std_logic_vector (3 downto 0); 
             outputA  : out   std_logic);
   end component;
   
   component Bcathode_MUSER_lab4_seven_segment_display
      port ( bit_in_4 : in    std_logic_vector (3 downto 0); 
             outputB  : out   std_logic);
   end component;
   
   component Ccathode_MUSER_lab4_seven_segment_display
      port ( bit_in_4 : in    std_logic_vector (3 downto 0); 
             outputC  : out   std_logic);
   end component;
   
   component Dcathode_MUSER_lab4_seven_segment_display
      port ( bit_in_4 : in    std_logic_vector (3 downto 0); 
             outputD  : out   std_logic);
   end component;
   
   component Ecathode_MUSER_lab4_seven_segment_display
      port ( bit_in_4 : in    std_logic_vector (3 downto 0); 
             outputE  : out   std_logic);
   end component;
   
   component Fcathode_MUSER_lab4_seven_segment_display
      port ( bit_in_4 : in    std_logic_vector (3 downto 0); 
             outputF  : out   std_logic);
   end component;
   
   component Gcathode_MUSER_lab4_seven_segment_display
      port ( bit_in_4 : in    std_logic_vector (3 downto 0); 
             ouputG   : out   std_logic);
   end component;
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
begin
   XLXI_1 : Acathode_MUSER_lab4_seven_segment_display
      port map (bit_in_4(3 downto 0)=>bit_in_4(3 downto 0),
                outputA=>XLXN_8);
   
   XLXI_2 : Bcathode_MUSER_lab4_seven_segment_display
      port map (bit_in_4(3 downto 0)=>bit_in_4(3 downto 0),
                outputB=>XLXN_9);
   
   XLXI_3 : Ccathode_MUSER_lab4_seven_segment_display
      port map (bit_in_4(3 downto 0)=>bit_in_4(3 downto 0),
                outputC=>XLXN_10);
   
   XLXI_4 : Dcathode_MUSER_lab4_seven_segment_display
      port map (bit_in_4(3 downto 0)=>bit_in_4(3 downto 0),
                outputD=>XLXN_11);
   
   XLXI_5 : Ecathode_MUSER_lab4_seven_segment_display
      port map (bit_in_4(3 downto 0)=>bit_in_4(3 downto 0),
                outputE=>XLXN_12);
   
   XLXI_6 : Fcathode_MUSER_lab4_seven_segment_display
      port map (bit_in_4(3 downto 0)=>bit_in_4(3 downto 0),
                outputF=>XLXN_13);
   
   XLXI_7 : Gcathode_MUSER_lab4_seven_segment_display
      port map (bit_in_4(3 downto 0)=>bit_in_4(3 downto 0),
                ouputG=>XLXN_14);
   
   XLXI_8 : INV
      port map (I=>XLXN_8,
                O=>bit_out_7_to_cathode(6));
   
   XLXI_9 : INV
      port map (I=>XLXN_9,
                O=>bit_out_7_to_cathode(5));
   
   XLXI_10 : INV
      port map (I=>XLXN_10,
                O=>bit_out_7_to_cathode(4));
   
   XLXI_11 : INV
      port map (I=>XLXN_11,
                O=>bit_out_7_to_cathode(3));
   
   XLXI_12 : INV
      port map (I=>XLXN_12,
                O=>bit_out_7_to_cathode(2));
   
   XLXI_13 : INV
      port map (I=>XLXN_13,
                O=>bit_out_7_to_cathode(1));
   
   XLXI_14 : INV
      port map (I=>XLXN_14,
                O=>bit_out_7_to_cathode(0));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity msb_of_counter_MUSER_lab4_seven_segment_display is
   port ( q   : in    std_logic_vector (15 downto 0); 
          msb : out   std_logic);
end msb_of_counter_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of msb_of_counter_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
begin
   XLXI_1 : BUF
      port map (I=>q(15),
                O=>msb);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity bit4_to_bus_MUSER_lab4_seven_segment_display is
   port ( i1     : in    std_logic; 
          i2     : in    std_logic; 
          i3     : in    std_logic; 
          i4     : in    std_logic; 
          outPUT : out   std_logic_vector (3 downto 0));
end bit4_to_bus_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of bit4_to_bus_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
begin
   XLXI_1 : BUF
      port map (I=>i1,
                O=>outPUT(0));
   
   XLXI_2 : BUF
      port map (I=>i2,
                O=>outPUT(1));
   
   XLXI_3 : BUF
      port map (I=>i3,
                O=>outPUT(2));
   
   XLXI_4 : BUF
      port map (I=>i4,
                O=>outPUT(3));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity Multiplexer_16to4_MUSER_lab4_seven_segment_display is
   port ( anode  : in    std_logic_vector (3 downto 0); 
          b      : in    std_logic_vector (15 downto 0); 
          outPUT : out   std_logic_vector (3 downto 0));
end Multiplexer_16to4_MUSER_lab4_seven_segment_display;

architecture BEHAVIORAL of Multiplexer_16to4_MUSER_lab4_seven_segment_display is
   attribute BOX_TYPE   : string ;
   signal XLXN_7  : std_logic;
   signal XLXN_10 : std_logic;
   signal XLXN_16 : std_logic;
   signal XLXN_19 : std_logic;
   signal XLXN_25 : std_logic;
   signal XLXN_31 : std_logic;
   signal XLXN_40 : std_logic;
   signal XLXN_43 : std_logic;
   signal XLXN_74 : std_logic;
   signal XLXN_76 : std_logic;
   signal XLXN_78 : std_logic;
   signal XLXN_79 : std_logic;
   signal XLXN_81 : std_logic;
   signal XLXN_82 : std_logic;
   signal XLXN_84 : std_logic;
   signal XLXN_85 : std_logic;
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component OR4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR4 : component is "BLACK_BOX";
   
begin
   XLXI_19 : AND2
      port map (I0=>anode(0),
                I1=>b(0),
                O=>XLXN_7);
   
   XLXI_30 : AND2
      port map (I0=>anode(0),
                I1=>b(1),
                O=>XLXN_10);
   
   XLXI_31 : AND2
      port map (I0=>anode(0),
                I1=>b(2),
                O=>XLXN_79);
   
   XLXI_32 : AND2
      port map (I0=>anode(0),
                I1=>b(3),
                O=>XLXN_16);
   
   XLXI_33 : AND2
      port map (I0=>anode(1),
                I1=>b(4),
                O=>XLXN_19);
   
   XLXI_34 : AND2
      port map (I0=>anode(1),
                I1=>b(5),
                O=>XLXN_74);
   
   XLXI_35 : AND2
      port map (I0=>anode(1),
                I1=>b(6),
                O=>XLXN_25);
   
   XLXI_36 : AND2
      port map (I0=>anode(1),
                I1=>b(7),
                O=>XLXN_84);
   
   XLXI_37 : AND2
      port map (I0=>anode(2),
                I1=>b(8),
                O=>XLXN_31);
   
   XLXI_38 : AND2
      port map (I0=>anode(2),
                I1=>b(9),
                O=>XLXN_76);
   
   XLXI_39 : AND2
      port map (I0=>anode(2),
                I1=>b(10),
                O=>XLXN_81);
   
   XLXI_40 : AND2
      port map (I0=>anode(2),
                I1=>b(11),
                O=>XLXN_40);
   
   XLXI_41 : AND2
      port map (I0=>anode(3),
                I1=>b(12),
                O=>XLXN_43);
   
   XLXI_42 : AND2
      port map (I0=>anode(3),
                I1=>b(13),
                O=>XLXN_78);
   
   XLXI_43 : AND2
      port map (I0=>anode(3),
                I1=>b(14),
                O=>XLXN_82);
   
   XLXI_44 : AND2
      port map (I0=>anode(3),
                I1=>b(15),
                O=>XLXN_85);
   
   XLXI_49 : OR4
      port map (I0=>XLXN_43,
                I1=>XLXN_31,
                I2=>XLXN_19,
                I3=>XLXN_7,
                O=>outPUT(0));
   
   XLXI_50 : OR4
      port map (I0=>XLXN_78,
                I1=>XLXN_76,
                I2=>XLXN_74,
                I3=>XLXN_10,
                O=>outPUT(1));
   
   XLXI_52 : OR4
      port map (I0=>XLXN_82,
                I1=>XLXN_81,
                I2=>XLXN_25,
                I3=>XLXN_79,
                O=>outPUT(2));
   
   XLXI_53 : OR4
      port map (I0=>XLXN_85,
                I1=>XLXN_40,
                I2=>XLXN_84,
                I3=>XLXN_16,
                O=>outPUT(3));
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity lab4_seven_segment_display is
   port ( b          : in    std_logic_vector (15 downto 0); 
          clk        : in    std_logic; 
          pushbutton : in    std_logic; 
          anode      : out   std_logic_vector (3 downto 0); 
          cathode    : out   std_logic_vector (6 downto 0));
end lab4_seven_segment_display;

architecture BEHAVIORAL of lab4_seven_segment_display is
   attribute HU_SET     : string ;
   signal XLXN_2     : std_logic_vector (15 downto 0);
   signal XLXN_3     : std_logic;
   signal XLXN_5     : std_logic;
   signal XLXN_6     : std_logic;
   signal XLXN_9     : std_logic;
   signal XLXN_10    : std_logic;
   signal XLXN_11    : std_logic;
   signal XLXN_12    : std_logic;
   signal XLXN_13    : std_logic;
   signal XLXN_14    : std_logic;
   signal XLXN_15    : std_logic;
   signal XLXN_16    : std_logic;
   signal XLXN_18    : std_logic_vector (3 downto 0);
   signal XLXN_23    : std_logic;
   signal XLXN_25    : std_logic_vector (3 downto 0);
   signal XLXN_27    : std_logic;
   signal XLXN_28    : std_logic;
   signal XLXN_30    : std_logic;
   signal XLXN_31    : std_logic;
   signal XLXN_32    : std_logic;
   component CB16CE_HXILINX_lab4_seven_segment_display
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             CEO : out   std_logic; 
             Q   : out   std_logic_vector (15 downto 0); 
             TC  : out   std_logic);
   end component;
   
   component M2_1_HXILINX_lab4_seven_segment_display
      port ( D0 : in    std_logic; 
             D1 : in    std_logic; 
             S0 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
   component CB2CE_HXILINX_lab4_seven_segment_display
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             CEO : out   std_logic; 
             Q0  : out   std_logic; 
             Q1  : out   std_logic; 
             TC  : out   std_logic);
   end component;
   
   component D2_4E_HXILINX_lab4_seven_segment_display
      port ( A0 : in    std_logic; 
             A1 : in    std_logic; 
             E  : in    std_logic; 
             D0 : out   std_logic; 
             D1 : out   std_logic; 
             D2 : out   std_logic; 
             D3 : out   std_logic);
   end component;
   
   component Multiplexer_16to4_MUSER_lab4_seven_segment_display
      port ( anode  : in    std_logic_vector (3 downto 0); 
             b      : in    std_logic_vector (15 downto 0); 
             outPUT : out   std_logic_vector (3 downto 0));
   end component;
   
   component INV4_HXILINX_lab4_seven_segment_display
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O0 : out   std_logic; 
             O1 : out   std_logic; 
             O2 : out   std_logic; 
             O3 : out   std_logic);
   end component;
   
   component bit4_to_bus_MUSER_lab4_seven_segment_display
      port ( i1     : in    std_logic; 
             i2     : in    std_logic; 
             i3     : in    std_logic; 
             i4     : in    std_logic; 
             outPUT : out   std_logic_vector (3 downto 0));
   end component;
   
   component msb_of_counter_MUSER_lab4_seven_segment_display
      port ( msb : out   std_logic; 
             q   : in    std_logic_vector (15 downto 0));
   end component;
   
   component binary_to_7_segment_display_MUSER_lab4_seven_segment_display
      port ( bit_in_4             : in    std_logic_vector (3 downto 0); 
             bit_out_7_to_cathode : out   std_logic_vector (6 downto 0));
   end component;
   
   attribute HU_SET of XLXI_1 : label is "XLXI_1_1";
   attribute HU_SET of XLXI_6 : label is "XLXI_6_2";
   attribute HU_SET of XLXI_7 : label is "XLXI_7_3";
   attribute HU_SET of XLXI_11 : label is "XLXI_11_4";
   attribute HU_SET of XLXI_14 : label is "XLXI_14_5";
begin
   XLXN_27 <= '1';
   XLXN_28 <= '1';
   XLXN_30 <= '1';
   XLXN_31 <= '0';
   XLXN_32 <= '0';
   XLXI_1 : CB16CE_HXILINX_lab4_seven_segment_display
      port map (C=>clk,
                CE=>XLXN_27,
                CLR=>XLXN_31,
                CEO=>open,
                Q(15 downto 0)=>XLXN_2(15 downto 0),
                TC=>open);
   
   XLXI_6 : M2_1_HXILINX_lab4_seven_segment_display
      port map (D0=>XLXN_23,
                D1=>clk,
                S0=>pushbutton,
                O=>XLXN_3);
   
   XLXI_7 : CB2CE_HXILINX_lab4_seven_segment_display
      port map (C=>XLXN_3,
                CE=>XLXN_28,
                CLR=>XLXN_32,
                CEO=>open,
                Q0=>XLXN_5,
                Q1=>XLXN_6,
                TC=>open);
   
   XLXI_11 : D2_4E_HXILINX_lab4_seven_segment_display
      port map (A0=>XLXN_5,
                A1=>XLXN_6,
                E=>XLXN_30,
                D0=>XLXN_13,
                D1=>XLXN_14,
                D2=>XLXN_15,
                D3=>XLXN_16);
   
   XLXI_13 : Multiplexer_16to4_MUSER_lab4_seven_segment_display
      port map (anode(3 downto 0)=>XLXN_18(3 downto 0),
                b(15 downto 0)=>b(15 downto 0),
                outPUT(3 downto 0)=>XLXN_25(3 downto 0));
   
   XLXI_14 : INV4_HXILINX_lab4_seven_segment_display
      port map (I0=>XLXN_16,
                I1=>XLXN_15,
                I2=>XLXN_14,
                I3=>XLXN_13,
                O0=>XLXN_12,
                O1=>XLXN_11,
                O2=>XLXN_10,
                O3=>XLXN_9);
   
   XLXI_15 : bit4_to_bus_MUSER_lab4_seven_segment_display
      port map (i1=>XLXN_9,
                i2=>XLXN_10,
                i3=>XLXN_11,
                i4=>XLXN_12,
                outPUT(3 downto 0)=>anode(3 downto 0));
   
   XLXI_16 : bit4_to_bus_MUSER_lab4_seven_segment_display
      port map (i1=>XLXN_13,
                i2=>XLXN_14,
                i3=>XLXN_15,
                i4=>XLXN_16,
                outPUT(3 downto 0)=>XLXN_18(3 downto 0));
   
   XLXI_17 : msb_of_counter_MUSER_lab4_seven_segment_display
      port map (q(15 downto 0)=>XLXN_2(15 downto 0),
                msb=>XLXN_23);
   
   XLXI_24 : binary_to_7_segment_display_MUSER_lab4_seven_segment_display
      port map (bit_in_4(3 downto 0)=>XLXN_25(3 downto 0),
                bit_out_7_to_cathode(6 downto 0)=>cathode(6 downto 0));
   
end BEHAVIORAL;



