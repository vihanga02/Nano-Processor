----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2024 12:53:47 PM
-- Design Name: 
-- Module Name: TB_FA - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_FA is
--  Port ( );
end TB_FA;

architecture Behavioral of TB_FA is
 COMPONENT FA
    PORT( A, B, C_in : IN STD_LOGIC;
        C_out, S : OUT STD_LOGIC);
    END COMPONENT;
     SIGNAL a, b, ci : std_logic;
     SIGNAL co, s : std_logic;
begin
UUT: FA PORT MAP(
    A => a,
    B => b,
    C_in => ci,
    S => s,
    C_out => co
 );
--IndexNumber
 --220213D = 11 0101 1100 0011 0101
 --220419N = 11 0101 1101 0000 0011
 --220303e = 11 0101 1100 1000 1111
 --220407C = 11 0101 1100 1111 0111 
  
  process
      begin
      a <= '0'; -- set initial values
      b <= '0';
      ci <= '0';
      WAIT FOR 100 ns; -- after 100 ns change inputs
      ci <= '1';
      WAIT FOR 100 ns;
      b <= '1';
      ci <= '0';
      WAIT FOR 100 ns; 
      ci <= '1';
      WAIT FOR 100 ns; 
      a <= '1';
      b <= '0';
      ci <= '0';
      WAIT FOR 100 ns; 
      ci <= '1';
      WAIT FOR 100 ns; 
      b <= '1';
      ci <= '0';
      WAIT FOR 100 ns; 
       ci <= '1';
      WAIT; -- will wait forever
     end process;
end Behavioral;
