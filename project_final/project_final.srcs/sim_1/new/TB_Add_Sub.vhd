----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/14/2024 11:32:07 PM
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
 process
 
 begin
    C_in <= '0';
 --add 7 to 4
    K<='0';
    A<="0111";
    B<="0100";
    wait for 100 ns;
--subtract 5 from 8
    K<='1';
    A<="1000";
    B<="0101";
    wait for 100 ns;
    
    K<='0';
    A<="0000";
    B<="0000";
    wait;
    end process;
    

end Behavioral;
