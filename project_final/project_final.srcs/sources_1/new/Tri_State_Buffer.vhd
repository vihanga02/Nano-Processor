----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2024 03:19:59 PM
-- Design Name: 
-- Module Name: Tri_State_Buffer - Behavioral
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

entity Tri_State_Buffer_3_B is
     Port ( data_in : in STD_LOGIC_VECTOR (2 downto 0);
          enable : in STD_LOGIC;
          data_out: out STD_LOGIC_VECTOR (2 downto 0));
end Tri_State_Buffer_3_B;

architecture Behavioral of Tri_State_Buffer_3_B is

begin

    data_out <= data_in WHEN(Enable='1') else "ZZZ";

end Behavioral;
