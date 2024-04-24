----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2024 01:23:32 PM
-- Design Name: 
-- Module Name: TB_Mux_2_W_3_B - Behavioral
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

entity TB_Mux_2_W_3_B is
--  Port ( );
end TB_Mux_2_W_3_B;

architecture Behavioral of TB_Mux_2_W_3_B is

component Mux_2_W_3_B
	port(A_in : in STD_LOGIC_VECTOR (2 downto 0);
           B_in : in STD_LOGIC_VECTOR (2 downto 0);
           S_in : in STD_LOGIC;
           C_out : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal A_in : STD_LOGIC_VECTOR (2 downto 0);
signal B_in : STD_LOGIC_VECTOR (2 downto 0);
signal S_in : STD_LOGIC;
signal C_out : STD_LOGIC_VECTOR (2 downto 0);

begin

UUT: Mux_2_W_3_B
  PORT MAP(
    A_in => A_in,
    B_in => B_in,
    S_in => S_in,
    C_out => C_out);
    
--IndexNumber
    --220213D = 110 101 110 000 110 101
    --220419N = 110 101 110 100 000 011
    --220303e = 110 101 110 010 001 111
    --220407C = 110 101 110 011 110 111
          
process
    begin
      A_in <= "101";
      B_in <= "011";
      S_in <= '1';
    
      wait for 100 ns;
      S_in <= '0';
    
      wait for 100 ns;
      S_in <= '1';
      wait;
  end process;

end Behavioral;
