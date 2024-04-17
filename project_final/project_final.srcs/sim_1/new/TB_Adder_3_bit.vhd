----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/16/2024 08:46:20 AM
-- Design Name: 
-- Module Name: TB_Adder_3_bit - Behavioral
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

entity TB_Adder_3_bit is
--  Port ( );
end TB_Adder_3_bit;

architecture Behavioral of TB_Adder_3_bit is

component Adder_3_bit
 Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
          C_in : in STD_LOGIC;
          S : out STD_LOGIC_VECTOR (2 downto 0);
          C_out : out STD_LOGIC);
end component;

signal A,S:std_logic_vector(2 downto 0);
signal C_in,C_out:std_logic;

begin

UUT:Adder_3_bit
    PORT MAP(
        A => A,
        C_in => C_in,
        S => S,
        C_out => C_out);
process
begin
    C_in <= '0';
    
    A <= "000";
    wait for 50 ns;
    
    A <= "010";
    wait for 50 ns;
    
    A <= "110";
    wait for 50 ns;
    
    A <= "111";
    wait for 50 ns;
    
    A <= "011";
    
    wait;
end process;


end Behavioral;
