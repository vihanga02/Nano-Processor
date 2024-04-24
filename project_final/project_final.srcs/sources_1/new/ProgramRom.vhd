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
           Instruct_Bus : out STD_LOGIC_VECTOR (12 downto 0));
end Program_Rom;

architecture Behavioral of Program_Rom is

type rom_type is array (0 to 7) of std_logic_vector(12 downto 0); 
    signal program_ROM : rom_type := (
--        "0100010000001",
--        "0100100000010",
--        "0100110000011",
--        "1000010000001", -- bit shift
--        "1010010000010",  -- logical operator
--        "0010010000000",
--        "0000000000000",
--        "0000000000000"
        
        "0101110000001",
        "0100100000010",
        "0100110000011",
        "0001110100000",
        "0001110110000",
        "1001110000001",
        "1010000000001",
        "0110000000101"
--            "0100010001010", -- MOVI R1,10
--            "1000010000001",
--            "1010100000000", -- MOVI R2,1
--            "0100100001011", -- NEG R2
--            "1000100000010", -- ADD R1,R2
--            "1010100010010", -- JNZ R1,0
--            "0000000000000", -- 
--            "0000000000000"
        );

begin
    Instruct_Bus <= program_ROM(to_integer(unsigned(Memo_Sel)));

end Behavioral;
