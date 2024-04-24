----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2024 10:50:59 AM
-- Design Name: 
-- Module Name: Program_Rom - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following li=brary declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Program_Rom is
    Port ( Memo_Sel : in STD_LOGIC_VECTOR (2 downto 0);
           Instruct_Bus : out STD_LOGIC_VECTOR (12 downto 0));
end Program_Rom;

architecture Behavioral of Program_Rom is


type rom_type is array (0 to 7) of std_logic_vector(12 downto 0); 
    signal program_ROM : rom_type := (
        "0101110000001",
        "0100100000010",
        "0100110000011",
        "0001110100000",
        "0001110110000",
        "0110000000110",
        "0110000000101",
        "0000000000000"
        );

begin
    Instruct_Bus <= program_ROM(to_integer(unsigned(Memo_Sel)));

end Behavioral;
