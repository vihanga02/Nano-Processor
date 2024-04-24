----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/04/2024 12:20:01 PM
-- Design Name: 
-- Module Name: Instruction_Decoder - Behavioral
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

entity Instruction_Decoder is
      Port ( Instruction_Bus : in STD_LOGIC_VECTOR (12 downto 0);
             Check_For_Jump : in STD_LOGIC_VECTOR (3 downto 0);
             Register_Enable : out STD_LOGIC_VECTOR (2 downto 0);
             Load_Select : out STD_LOGIC;
             Immediate_Value : out STD_LOGIC_VECTOR (3 downto 0);
             Register_Select_0 : out STD_LOGIC_VECTOR (2 downto 0);
             Register_Select_1 : out STD_LOGIC_VECTOR (2 downto 0);
             A_S_Select : out STD_LOGIC;
             Jump_Flag : out STD_LOGIC;
             Jump_Address : out STD_LOGIC_VECTOR (2 downto 0);
             Bit_Shift_EN : out STD_LOGIC;
             Logical_Operation_EN : out STD_LOGIC;
             Bit_Shift_Count : out STD_LOGIC_VECTOR (1 downto 0);
             Logical_Op : out STD_LOGIC_VECTOR (1 downto 0));
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is

signal all_zeroes : STD_LOGIC;

begin
 
     all_zeroes <= NOT(Check_For_Jump(0)) AND NOT(Check_For_Jump(1)) AND NOT(Check_For_Jump(2)) AND NOT(Check_For_Jump(3));
     
     Register_Enable <= Instruction_bus (9 downto 7);                 -- 010
     
     Load_Select <= Instruction_bus(11) AND NOT(Instruction_bus(10));  -- 0
     
     Immediate_Value <= Instruction_bus(3 downto 0);                    -- 000
     
     Register_Select_0 <= Instruction_bus(9 downto 7);                  -- 010
     
     Register_Select_1 <= Instruction_bus(6 downto 4);                  -- 000
     
     A_S_Select <= NOT Instruction_bus(12) AND NOT(Instruction_bus(11)) AND Instruction_bus(10);    -- 
     
     Jump_Flag <= NOT Instruction_bus(12) AND Instruction_bus(11) AND Instruction_bus(10) AND all_zeroes;
     
     Jump_Address <= Instruction_bus(2 downto 0);
     
     Bit_Shift_EN <= Instruction_bus(12) AND NOT Instruction_bus(11) AND NOT Instruction_bus(10);
     
     Logical_Operation_EN <= Instruction_bus(12) AND NOT Instruction_bus(11) AND Instruction_bus(10);
     
     Bit_Shift_Count <= Instruction_bus(1 downto 0);
     
     Logical_Op <= Instruction_bus(1 downto 0);
 
end Behavioral;
