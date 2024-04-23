----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2024 11:14:50 AM
-- Design Name: 
-- Module Name: Add_Sub_Unit - Behavioral
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


entity Add_Sub_Unit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
          B : in STD_LOGIC_VECTOR (3 downto 0);
          C_in : in STD_LOGIC;
          S : out STD_LOGIC_VECTOR (3 downto 0);
          C_outT : out STD_LOGIC;
          overFlow:out Std_logic;
          zero:out STD_LOGIC;
          K : in STD_LOGIC);
end Add_Sub_Unit;

architecture Behavioral of Add_Sub_Unit is

    component FA
        port (
        A : in std_logic;
        B : in std_logic;
        C_in : in std_logic;
        S : out std_logic;
        C_out : out std_logic);
   end component;
   
   SIGNAL FA0_C, FA1_C, FA2_C, FA3_C  : std_logic;
   SIGNAL SO : std_logic_vector (3 downto 0);
   SIGNAL carry:std_logic;
   SIGNAL B00:std_logic:=(B(0) XOR K);
   SIGNAL B11:std_logic:=(B(1)XOR K);
   SIGNAL B22:std_logic:=(B(2) XOR K);
   SIGNAL B33:std_logic:=(B(3) XOR K);
   
begin
    B00 <= (B(0) XOR K);
    B11 <= (B(1) XOR K);
    B22 <= (B(2) XOR K);
    B33 <= (B(3) XOR K);
   
  FA_0 : FA
   port map (
       A => A(0),
       B => B00,
       C_in => k, -- Set to ground
       S => SO(0),
       C_Out => FA0_C);
       
  FA_1 : FA
    port map (
       A => A(1),
       B => B11,
       C_in => FA0_C,
       S => SO(1),
       C_Out => FA1_C);

   FA_2 : FA
   port map (
       A => A(2),
       B => B22,
       C_in => FA1_C,
       S => SO(2),
       C_Out => FA2_C);
       
   FA_3 : FA
   port map (
       A => A(3),
       B => B33,
       C_in => FA2_C,
       S => SO(3),
       C_Out => carry);
    
    overFlow <= carry XOR FA2_C;
    C_outT <= carry;
    S <= SO;
  
    Zero <= (NOT SO(0)) AND (NOT SO(1)) AND (NOT SO(2)) AND (NOT SO(3)); 

end Behavioral;
