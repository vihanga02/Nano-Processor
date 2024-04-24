----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/24/2024 07:14:23 PM
-- Design Name: 
-- Module Name: TB_Logical_Unit - Behavioral
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

entity TB_Logical_Unit is
--  Port ( );
end TB_Logical_Unit;

architecture Behavioral of TB_Logical_Unit is

Component Logical_Unit is
    Port (
        A : in STD_LOGIC_VECTOR (3 downto 0);
        B : in STD_LOGIC_VECTOR (3 downto 0);
        EN : in STD_LOGIC;
        Op_Select : in STD_LOGIC_VECTOR (1 downto 0);
        Out_Result : out STD_LOGIC_VECTOR (3 downto 0)
    );
end component;

signal a, b, out_result : STD_LOGIC_VECTOR (3 downto 0);
signal op_select : STD_LOGIC_VECTOR (1 downto 0);
signal en : STD_LOGIC;

begin
    UTT : Logical_Unit
        port map (
            A => a,
            B => b,
            EN => en,
            Op_Select => op_select,
            out_result => out_result);
            
      
    Process
        begin
            a <= "1010";
            b <= "0101";
            en <= '0';
            op_select <= "00";
            wait for 200ns;
            
            en <= '1';
            wait for 200ns;
            
            op_select <= "01";
            wait for 200ns;
            
            op_select <= "10";
            wait for 200ns;
            
            op_select <= "11";
            wait;
        end process;
        
end Behavioral;
