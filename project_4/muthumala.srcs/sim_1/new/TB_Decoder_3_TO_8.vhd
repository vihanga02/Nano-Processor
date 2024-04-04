----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2024 02:08:29 PM
-- Design Name: 
-- Module Name: TB_Decoder_3_TO_8 - Behavioral
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

entity TB_Decoder_3_TO_8 is
--  Port ( );
end TB_Decoder_3_TO_8;

architecture Behavioral of TB_Decoder_3_TO_8 is
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
    
    process
    begin
        i <= "111";
        en <= '1';
        wait for 100 ns;
        i <= "110";
        wait for 100 ns;
        i <= "011";
        wait for 100 ns;
        i <= "101";
        wait for 100 ns;
        i <= "111";
        en <= '0';
        wait for 100 ns;
        i <= "110";
        wait for 100 ns;
        i <= "011";
        wait for 100 ns;
        i <= "101";
        wait;
    end process;

end Behavioral;
