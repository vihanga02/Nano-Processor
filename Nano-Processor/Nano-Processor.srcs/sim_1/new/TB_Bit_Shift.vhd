----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/24/2024 08:57:36 PM
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
        B_Shift_with_Dir : in STD_LOGIC_VECTOR (2 downto 0);
        En : in STD_LOGIC;
        A_out : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal a, a_out : STD_LOGIC_VECTOR (3 downto 0);
signal b_shift : STD_LOGIC_VECTOR (2 downto 0);
signal en : STD_LOGIC;

begin

UTT : Bit_Shift
    port map (
        A => a,
        B_Shift_with_Dir => b_shift,
        En => en,
        A_out => a_out);

PROCESS
    begin 
        a <= "1111";

        en <= '0';

        b_shift <= "000";
        wait for 100ns;
        
        en <= '1';
        b_shift <= "001";
        wait for 100ns;

        b_shift <= "010";
        wait for 100ns;

        b_shift <= "011";
        wait for 100ns;

        en <= '0';
        wait for 100ns;

        en <= '1';
        wait for 100ns;

        b_shift <= "100";
        wait for 100ns;
        
        b_shift <= "101";
        wait for 100ns;

        b_shift <= "110";
        wait for 100ns;

        b_shift <= "111";
        wait for 100ns;

     wait; -- wait forever   

    end process;

end Behavioral;
