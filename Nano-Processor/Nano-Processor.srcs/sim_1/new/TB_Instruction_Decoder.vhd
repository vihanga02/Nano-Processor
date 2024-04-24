----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2024 01:20:29 PM
-- Design Name: 
-- Module Name: TB_Instruction_Decoder - Behavioral
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

entity TB_Instruction_Decoder is
--  Port ( );
end TB_Instruction_Decoder;

architecture Behavioral of TB_Instruction_Decoder is


component Instruction_Decoder is
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
             Comparator_En : out STD_LOGIC);
end component;

    SIGNAL ins_bus : STD_LOGIC_VECTOR(12 downto 0);
    SIGNAL jmp_check, im_val : STD_LOGIC_VECTOR(3 downto 0);
    SIGNAL reg_enb, reg_sel_0, reg_sel_1, jmp_addr : STD_LOGIC_VECTOR(2 downto 0);
    SIGNAL load_sel, add_sub_sel, jmp, Comparator_En : STD_LOGIC;
    
begin
    UUT : Instruction_decoder PORT MAP (
        Instruction_Bus => ins_bus,
        Check_For_Jump => jmp_check,
        Register_Enable => reg_enb,
        Load_Select => load_sel,
        Immediate_Value => im_val,
        Register_Select_0 => reg_sel_0,
        Register_Select_1 => reg_sel_1,
        A_S_Select => add_sub_sel,
        Jump_Flag => jmp,
        Jump_Address => jmp_addr
    );
    
   --IndexNumber
    --220213D = 11 0101 1100 0011 0101
    --220419N = 11 0101 1101 0000 0011
    --220303e = 11 0101 1100 1000 1111
    --220407C = 11 0101 1100 1111 0111    
        
        process
        begin
            jmp_check <= "0000";
        -- MOVI R1, 10
            ins_bus <= "0100010001010";
            wait for 100ns;
            
            -- MOVI R2, 1
            ins_bus <= "0100100000101";
            wait for 100ns;
            
            -- NEG R2
            ins_bus <= "0010100000000";
            wait for 100ns;
            
            -- JZR 1
            ins_bus <= "0110000000110";
            wait;
        end process;

end Behavioral;
