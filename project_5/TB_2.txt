----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2024 03:38:31 PM
-- Design Name: 
-- Module Name: TB_Multiplier_2 - Behavioral
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

entity TB_Multiplier_2 is
--  Port ( );
end TB_Multiplier_2;

architecture Behavioral of TB_Multiplier_2 is

component Multiplier_2 is
    Port ( A : in STD_LOGIC_VECTOR (1 downto 0);
           B : in STD_LOGIC_VECTOR (1 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal a : std_logic_vector(1 downto 0);
signal b : std_logic_vector (1 downto 0);
signal y : std_logic_vector (3 downto 0);

begin

UUT: Multiplier_2 port map(
    A => a,
    B => b,
    y => y);
   
   process
   begin
    a <= "11";
    b <= "11";
   wait for 100ns;
   b <= "10";
   wait for 100ns;
   b <= "01";
   wait for 100ns;
   b <= "00";
   wait for 100ns;
   b <= "10";
   a <= "10";
   wait for 100ns;
   b <= "01";
   wait for 100ns;
   b <= "00";
   wait for 100ns;
   b <= "01";
   a <= "01";
   wait for 100ns;
   b <= "00";
   wait for 100ns;
   a <= "00";
   wait;
   end process;

end Behavioral;
