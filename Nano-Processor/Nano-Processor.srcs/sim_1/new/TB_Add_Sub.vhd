----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2024 01:18:05 PM
-- Design Name: 
-- Module Name: TB_Add_Sub - Behavioral
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

entity TB_Add_Sub is
--  Port ( );
end TB_Add_Sub;

architecture Behavioral of TB_Add_Sub is

 component Add_Sub_Unit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
          B : in STD_LOGIC_VECTOR (3 downto 0);
          C_in : in STD_LOGIC;
          S : out STD_LOGIC_VECTOR (3 downto 0);
          C_outT : out STD_LOGIC;
          overFlow:out Std_logic;
          zero:out STD_LOGIC;
          K : in STD_LOGIC);
end component;

signal A,B,S: STD_LOGIC_VECTOR(3 DOWNTO 0);
signal K:STD_LOGIC;
signal C_outT:std_logic;
signal zero,C_in,overFlow:std_logic;

begin

UUT:Add_Sub_Unit PORT MAP(
    A => A,
    B => B, 
    C_in => C_in,
    S => S,
    C_outT => C_outT,
    overFlow => overflow,
    zero=> zero,
    K => K);
--IndexNumber
    --220213D = 11 0101 1100 0011 0101
    --220419N = 11 0101 1101 0000 0011
    --220303e = 11 0101 1100 1000 1111
    --220407C = 11 0101 1100 1111 0111    
    
 process
    begin
        C_in <= '0';
     --add 5 to 3
        K <= '0';
        A <= "0011";
        B <= "0101";
        wait for 100 ns;
    
    --subtract 15 from 8
        K <= '1';
        A <= "1000";
        B <= "1111";
        wait for 100 ns;
    
    --add 3 to 0        
        K <= '0';
        A <= "0000";
        B <= "0011";
        wait for 100 ns;
    
    --subtract 7 from 15        
        K <= '1';
        A <= "1111";
        B <= "0111";
        wait;
    end process;
end Behavioral;
