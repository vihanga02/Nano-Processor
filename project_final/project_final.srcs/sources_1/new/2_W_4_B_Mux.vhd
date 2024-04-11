----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/02/2024 11:54:40 AM
-- Design Name: 
-- Module Name: 2_w_4_b_multiplexer - Behavioral
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

entity Mux_2_W_4_B is
    Port ( S_in : in STD_LOGIC;
           A_in : in STD_LOGIC_VECTOR (3 downto 0);
           B_in : in STD_LOGIC_VECTOR (3 downto 0);
           EN : in STD_LOGIC;
           C_out : out STD_LOGIC_VECTOR (3 downto 0));
end Mux_2_W_4_B;

architecture Behavioral of Mux_2_W_4_B is

signal d_out: STD_LOGIC_VECTOR(3 downto 0);

begin

process(S_in, A_in, B_in, EN)
    begin
        if (EN = '1') then
            if (S_in = '0') then
                C_out <= A_in;
            else
                C_out <= B_in;
            end if;
        end if;
    end process;

end Behavioral;