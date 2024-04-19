----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/01/2024 04:47:32 PM
-- Design Name: 
-- Module Name: ProgramRom - Behavioral
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

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Program_Rom is
    Port ( Memo_Sel : in STD_LOGIC_VECTOR (2 downto 0);
           Instruct_Bus : out STD_LOGIC_VECTOR (11 downto 0));
end Program_Rom;

architecture Behavioral of Program_Rom is

type rom_type is array (0 to 6) of std_logic_vector(11 downto 0); 
    signal program_ROM : rom_type := (
        "100010001010", -- MOVI R1,10
        "100100000001", -- MOVI R2,1
        "010100000000", -- NEG R2
        "000010100000", -- ADD R1,R2
        "110010000000", -- JNZ R1,0
        "000000000000", -- 
        "000000000000"  -- 
        );

begin
    Instruct_Bus <= program_ROM(to_integer(unsigned(Memo_Sel)));

end Behavioral;
