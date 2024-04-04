----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2024 02:36:30 PM
-- Design Name: 
-- Module Name: Multiplier_4 - Behavioral
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

entity Multiplier_4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end Multiplier_4;

architecture Behavioral of Multiplier_4 is
component FA
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S : out STD_LOGIC;
           C_out : out STD_LOGIC);
end component;

signal a0b0, a0b1, a0b2, a0b3, a1b0, a1b1, a1b2, a1b3, a2b0, a2b1, a2b2, a2b3, a3b0, a3b1, a3b2, a3b3 : std_logic;
signal s00, s01, s02, s03, s10, s11, s12, s13, s20, s21, s22, s23, s30, s31, s32, s33 : std_logic;
signal c00, c01, c02, c03, c10, c11, c12, c13, c20, c21, c22, c23, c30, c31, c32, c33 : std_logic;

begin
    FA_0_0 : FA
     port map (
         A => a1b0,
         B => a0b1,
         C_in => '0',
         S => s00,
         C_out => c00);
   
   FA_0_1 : FA
     port map (
         A => a0b2,
         B => a1b1,
         C_in => c00,
         S => s01,
         C_out => c01);
    
    FA_0_2 : FA
     port map (
         A => a0b3,
         B => a1b2,
         C_in => c01,
         S => s02,
         C_out => c02);
    
    FA_0_3 : FA
     port map (
         A => '0',
         B => a1b3,
         C_in => c02,
         S => s03,
         C_out => c03);
   
    FA_1_0 : FA
     port map (
         A => a2b0,
         B => s01,
         C_in => '0',
         S => s10,
         C_out => c10);
   
   FA_1_1 : FA
     port map (
         A => a2b1,
         B => s02,
         C_in => c10,
         S => s11,
         C_out => c11);
    
    FA_1_2 : FA
     port map (
         A => a2b2,
         B => s03,
         C_in => c11,
         S => s12,
         C_out => c12);
    
    FA_1_3 : FA
     port map (
         A => a2b3,
         B => c03,
         C_in => c12,
         S => s13,
         C_out => c13);
    
    FA_2_0 : FA
     port map (
         A => a3b0,
         B => s11,
         C_in => '0',
         S => s20,
         C_out => c20);
   
   FA_2_1 : FA
     port map (
         A => a3b1,
         B => s12,
         C_in => c20,
         S => s21,
         C_out => c21);
    
    FA_2_2 : FA
     port map (
         A => a3b2,
         B => s13,
         C_in => c21,
         S => s22,
         C_out => c22);
    
    FA_2_3 : FA
     port map (
         A => a3b3,
         B => c13,
         C_in => c22,
         S => s23,
         C_out => c23);
         
    a0b0 <= A(0) AND B(0); 
    a0b1 <= A(0) AND B(1);
    a0b2 <= A(0) AND B(2);
    a0b3 <= A(0) AND B(3);
    
    a1b0 <= A(1) AND B(0); 
    a1b1 <= A(1) AND B(1);
    a1b2 <= A(1) AND B(2);
    a1b3 <= A(1) AND B(3);
    
    a2b0 <= A(2) AND B(0); 
    a2b1 <= A(2) AND B(1);
    a2b2 <= A(2) AND B(2);
    a2b3 <= A(2) AND B(3);
    
    a3b0 <= A(3) AND B(0); 
    a3b1 <= A(3) AND B(1);
    a3b2 <= A(3) AND B(2);
    a3b3 <= A(3) AND B(3);
    
    Y(0) <= A(0) AND B(0);
    Y(1) <= s00;
    Y(2) <= s10;
    Y(3) <= s20;
    Y(4) <= s21;
    Y(5) <= s22;
    Y(6) <= s23;
    Y(7) <= c23;

end Behavioral;
