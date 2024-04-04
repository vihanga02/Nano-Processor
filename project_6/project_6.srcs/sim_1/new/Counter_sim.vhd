----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2024 02:35:18 PM
-- Design Name: 
-- Module Name: Counter_sim - Behavioral
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

entity Counter_sim is
--  Port ( );
end Counter_sim;

architecture Behavioral of Counter_sim is

component Counter is
    Port ( Dir : in STD_LOGIC;
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal d,r,clk: std_logic;
signal q : std_logic_vector(2 downto 0);

begin
UTT: Counter port map(
    Dir => d,
    Res => r,
    Clk => clk,
    Q => q);
    
process
    begin
        d <= '0';
        r <= '1';
       wait for 150ns;
        r <= '0';
        wait for 600ns;
        d <= '1';
        wait;
end process;

     process 
        begin
        clk <= '0';
        wait for 5ns;
        clk <= '1';
        wait for 5ns;
end process;

end Behavioral;
