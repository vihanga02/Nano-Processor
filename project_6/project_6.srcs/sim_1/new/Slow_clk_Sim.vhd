----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2024 12:54:57 PM
-- Design Name: 
-- Module Name: Slow_clk_Sim - Behavioral
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

entity Slow_clk_Sim is
--  Port ( );
end Slow_clk_Sim;

architecture Behavioral of Slow_clk_Sim is

component Slow_Clk is
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;

signal c_in, c_out : std_logic;

begin
UTT: Slow_clk port map(
    Clk_in => c_in,
    Clk_out => c_out);
    
process
    begin
        c_in <= '1';
        wait for 10ns;
        c_in <= '0';
        wait for 10ns;
end process;
end Behavioral;
