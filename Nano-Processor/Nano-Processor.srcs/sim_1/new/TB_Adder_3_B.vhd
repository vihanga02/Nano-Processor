----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2024 01:15:42 PM
-- Design Name: 
-- Module Name: TB_Adder_3_B - Behavioral
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

entity TB_Adder_3_B is
--  Port ( );
end TB_Adder_3_B;

architecture Behavioral of TB_Adder_3_B is

component Adder_3_B
 Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
      C_in : in STD_LOGIC;
      S : out STD_LOGIC_VECTOR (2 downto 0);
      C_out : out STD_LOGIC);
end component;

signal A,S:std_logic_vector(2 downto 0);
signal C_in,C_out:std_logic;

begin

UUT:Adder_3_B
    PORT MAP(
        A => A,
        C_in => C_in,
        S => S,
        C_out => C_out);
process
--IndexNumber
--220213D = 110 101 110 000 110 101
--220419N = 110 101 110 100 000 011
--220303e = 110 101 110 010 001 111
--220407C = 110 101 110 011 110 111        

begin
    C_in <= '0';
    
    A <= "000";
    wait for 50 ns;
    
    A <= "101";
    wait for 50 ns;
    
    A <= "111";
    wait for 50 ns;
    
    A <= "110";
    wait for 50 ns;
    
    A <= "001";
    
    wait;
end process;

end Behavioral;
