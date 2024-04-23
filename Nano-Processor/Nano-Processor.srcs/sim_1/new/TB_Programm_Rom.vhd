----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2024 10:53:45 AM
-- Design Name: 
-- Module Name: TB_Programm_Rom - Behavioral
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

entity TB_Programm_Rom is
--  Port ( );
end TB_Programm_Rom;

architecture Behavioral of TB_Programm_Rom is

component Program_Rom is
    Port ( Memo_Sel : in STD_LOGIC_VECTOR (2 downto 0);
           Instruction_Bus : out STD_LOGIC_VECTOR (11 downto 0));
end component;

signal Memo_Sel : STD_LOGIC_VECTOR (2 downto 0);
signal Instruction_Bus : STD_LOGIC_VECTOR (11 downto 0);

begin

UTT : Program_Rom
    port map (
        Memo_sel => memo_sel,
        Instruction_Bus => Instruction_bus);
        
    rom_process : process
        begin
            memo_sel <= "000";
            wait for 100ns;
            
            memo_sel <= "001";
            wait for 100ns;
            
            memo_sel <= "010";
            wait for 100ns;
                        
            memo_sel <= "011";
            wait for 100ns;
                        
            memo_sel <= "100";
            wait for 100ns;
            
            memo_sel <= "101";
            wait for 100ns;
            
            memo_sel <= "110";
            wait for 100ns;
            
            memo_sel <= "111";
            wait;
    end process;

end Behavioral;
