----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2024 03:58:07 PM
-- Design Name: 
-- Module Name: TB_Multiplier_4 - Behavioral
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

entity TB_Multiplier_4 is
--  Port ( );
end TB_Multiplier_4;

architecture Behavioral of TB_Multiplier_4 is
component Multiplier_4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal a : std_logic_vector(3 downto 0);
signal b : std_logic_vector (3 downto 0);
signal y : std_logic_vector (7 downto 0);

begin
    UUT: Multiplier_4 port map(
    A => a,
    B => b,
    y => y);
    
  process
   begin
    a <= "0111";
    b <= "1111";
   wait for 166.6ns;
   b <= "1100";
   wait for 166.6ns;
   b <= "0101";
   wait for 166.6ns;
   a <= "1111";
   b <= "1100";
   wait for 166.6ns;
   a <= "1111";
   b <= "0101";
   wait for 166.6ns;
   a <= "1100";
   b <= "0101";
   wait;
   end process;
end Behavioral;
