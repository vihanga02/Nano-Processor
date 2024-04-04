----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2024 02:06:26 PM
-- Design Name: 
-- Module Name: Multiplier_2 - Behavioral
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

entity Multiplier_2 is
    Port ( A : in STD_LOGIC_VECTOR (1 downto 0);
           B : in STD_LOGIC_VECTOR (1 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end Multiplier_2;

architecture Behavioral of Multiplier_2 is
component FA
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S : out STD_LOGIC;
           C_out : out STD_LOGIC);
end component;
signal a0b0, a0b1, a1b0, a1b1, c1 : STD_Logic;
begin

    FA_0 : FA
     port map (
         A => a1b0,
         B => a0b1,
         C_in => '0',
         S => Y(1),
         C_out => c1);
   
   FA_1 : FA
     port map (
         A => '0',
         B => a1b1,
         C_in => c1,
         S => Y(2),
         C_out => Y(3));
    
    a0b0 <= A(0) AND B(0); 
    a0b1 <= A(0) AND B(1); 
    a1b0 <= A(1) AND B(0); 
    a1b1 <= A(1) AND B(1);
    
    Y(0) <= a0b0;
    
end Behavioral;
