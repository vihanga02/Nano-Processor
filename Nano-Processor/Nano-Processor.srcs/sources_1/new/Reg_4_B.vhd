----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2024 11:43:57 AM
-- Design Name: 
-- Module Name: Reg_4_B - Behavioral
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

entity Reg_4_B is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           R : out STD_LOGIC_VECTOR (3 downto 0));
end Reg_4_B;

architecture Behavioral of Reg_4_B is

begin
process (Clk, Reset) begin
    if (Reset = '1') then
        R <= "0000"; -- reset the register asynchronously
    else if (rising_edge(Clk)) then -- respond when clock rises
        if En = '1' then -- Enable should be set
            R <= D;
        end if;
    end if;
    end if;
end process;
end Behavioral;
