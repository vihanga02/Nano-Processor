----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2024 03:42:40 PM
-- Design Name: 
-- Module Name: TB_Bit_Shift - Behavioral
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

entity TB_Bit_Shift is
--  Port ( );
end TB_Bit_Shift;

architecture Behavioral of TB_Bit_Shift is

component Bit_Shift is
    Port ( 
        A : in STD_LOGIC_VECTOR (3 downto 0);
        B_Shift : in STD_LOGIC_VECTOR (1 downto 0);
        EN : in STD_LOGIC;
        A_out : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal a, a_out : STD_LOGIC_VECTOR (3 downto 0);
signal b_shift : STD_LOGIC_VECTOR (1 downto 0);
signal en : STD_LOGIC;

begin

UTT : Bit_Shift
    port map (
        A => a,
        B_shift => b_shift,
        EN => en,
        A_out => a_out);
        
PROCESS
    begin 
        a <= "1111";
        en <= '1';
        b_shift <= "00";
        wait for 100ns;
        
        b_shift <= "01";
        wait for 100ns;
        
        b_shift <= "10";
        wait for 100ns;
        
        b_shift <= "11";
        wait for 100ns;
        
        en <= '0';
        wait for 100ns;
    end process;
end Behavioral;
