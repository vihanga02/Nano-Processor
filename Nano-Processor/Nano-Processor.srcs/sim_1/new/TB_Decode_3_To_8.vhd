----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2024 01:01:07 PM
-- Design Name: 
-- Module Name: TB_Decode_3_To_8 - Behavioral
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

entity TB_Decode_3_To_8 is
--  Port ( );
end TB_Decode_3_To_8;

architecture Behavioral of TB_Decode_3_To_8 is

COMPONENT DECODER_3_TO_8
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
END COMPONENT;
    SIGNAL i : STD_LOGIC_VECTOR (2 downto 0);
    SIGNAL en : STD_LOGIC;
    SIGNAL y : STD_LOGIC_VECTOR (7 downto 0);
begin
    UTT: DECODER_3_TO_8 PORT MAP(
        I => i,
        EN => en,
        Y => y
    );
--IndexNumber
--220213D = 110 101 110 000 110 101
--220419N = 110 101 110 100 000 011
--220303e = 110 101 110 010 001 111
--220407C = 110 101 110 011 110 111    
    process
    begin
        i <= "111";
        en <= '1';
        wait for 100 ns;
        i <= "110";
        wait for 100 ns;
        i <= "101";
        wait for 100 ns;
        i <= "100";
        wait for 100 ns;
        i <= "011";
        en <= '0';
        wait for 100 ns;
        i <= "010";
        wait for 100 ns;
        i <= "001";
        wait for 100 ns;
        i <= "000";
        
        wait;
        end process;
end Behavioral;
