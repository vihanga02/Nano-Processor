----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2024 01:40:28 PM
-- Design Name: 
-- Module Name: TB_DECODER_2_TO_4 - Behavioral
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

entity TB_DECODE_2_TO_4 is
--  Port ( );
end TB_DECODE_2_TO_4;

architecture Behavioral of TB_DECODE_2_TO_4 is

COMPONENT DECODE_2_TO_4
    Port ( I : in STD_LOGIC_VECTOR (1 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0));
END COMPONENT;

    SIGNAL i : STD_LOGIC_VECTOR (1 downto 0);
    SIGNAL en : STD_LOGIC;
    SIGNAL y : STD_LOGIC_VECTOR (3 downto 0);
    
begin
 UTT: DECODE_2_TO_4 PORT MAP(
    I => i,
    EN => en,
    Y => y
    );
 process
 begin
      i <= "00";
      en <= '1';
      wait for 125 ns;
      i <= "01";
      wait for 125 ns;
      i <= "10";
      wait for 125 ns;
      i <= "11";
      wait for 125 ns;
       en <= '0';
       i <= "00";
      wait for 125 ns;
      i <= "01";
      wait for 125 ns;
      i <= "10";
      wait for 125 ns;
      i <= "11";
      wait;
end process;
  
end Behavioral;
