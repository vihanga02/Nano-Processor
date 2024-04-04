----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2024 04:36:31 PM
-- Design Name: 
-- Module Name: TB_Mux_8_TO_1_1 - Behavioral
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

entity TB_Mux_8_TO_1_1 is
--  Port ( );
end TB_Mux_8_TO_1_1;

architecture Behavioral of TB_Mux_8_TO_1_1 is
COMPONENT Mux_8_TO_1_1
    Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (7 downto 0);
           Y : out STD_LOGIC
           );
END COMPONENT;
    SIGNAL s : STD_LOGIC_VECTOR (2 downto 0);
    SIGNAL en,y : STD_LOGIC;
    SIGNAL d : STD_LOGIC_VECTOR (7 downto 0);
begin
    UTT: Mux_8_TO_1_1 PORT MAP(
        S => s,
        EN => en,
        Y => y,
        D => d
    );
    
    process
    begin
        s <= "111";
        d <= "11110111";
        en <= '1';
        wait for 62.5 ns;
        s <= "110";
        wait for 62.5 ns;
        s <= "101";
        wait for 62.5 ns;
        s <= "100";
        wait for 62.5 ns;
        s <= "011";
        wait for 62.5 ns;
        s <= "010";
        wait for 62.5 ns;
        s <= "001";
        wait for 62.5 ns;
        s <= "000";
        wait for 62.5 ns;
        
        s <= "111";
        d <= "01011100";
        wait for 62.5 ns;
        s <= "110";
        wait for 62.5 ns;
        s <= "101";
        wait for 62.5 ns;
        s <= "100";
        wait for 62.5 ns;
        s <= "011";
        wait for 62.5 ns;
        s <= "010";
        wait for 62.5 ns;
        s <= "001";
        wait for 62.5 ns;
        s <= "000";
        
        wait;
    end process;

end Behavioral;
