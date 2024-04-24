----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2024 12:51:22 AM
-- Design Name: 
-- Module Name: TB_Comparator - Behavioral
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

entity TB_Comparator is
--  Port ( );
end TB_Comparator;

architecture Behavioral of TB_Comparator is


component Comparator is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
       B : in STD_LOGIC_VECTOR (3 downto 0);
       EN : in STD_LOGIC;
       Equal : out STD_LOGIC;
       Greater : out STD_LOGIC;
       Less : out STD_LOGIC);
end component;

signal A,B:STD_LOGIC_VECTOR(3 downto 0);
signal Equal,Greater,Less, en : STD_LOGIC;

begin
  UUT:Comparator 
        PORT MAP(
              A => A,
              B => B,
              en => en,
              Equal => Equal,
              Greater => Greater,
              Less => Less);
    
    PROCESS
        BEGIN
        EN <= '0';
        A<="1111";
        B<="0000";
        wait for 200ns;
        
        En <= '1';
        wait for 200ns;
        
        A<="0011";
        B<="1011";
        wait for 200ns;
        
        
        A<="1010";
        B<="1010";
        wait for 200 ns;
        WAIT;
    end process;

end Behavioral;
