----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/02/2024 02:20:40 PM
-- Design Name: 
-- Module Name: Mux_2_W_2_B - Behavioral
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

entity Mux_2_W_3_B is
    Port ( A_in : in STD_LOGIC_VECTOR (2 downto 0);
           B_in : in STD_LOGIC_VECTOR (2 downto 0);
           S_in : in STD_LOGIC;
           C_out : out STD_LOGIC_VECTOR (2 downto 0));
end Mux_2_W_3_B;

architecture Behavioral of Mux_2_W_3_B is

begin
 process (A_in, B_in, S_in)
    begin   
        if 
            S_in = '0' then
            C_out <= A_in;
        else
            C_out <= B_in;
        end if;
    end process;

end Behavioral;
