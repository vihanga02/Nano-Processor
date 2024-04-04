----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/04/2024 11:22:36 AM
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
   SIGNAL S0,S1,S2,S3:std_logic;
   SIGNAL carry:std_logic;
   SIGNAL B00:std_logic:=(B(0) XOR K);
   SIGNAL B11:std_logic:=(B(1)XOR K);
   SIGNAL B22:std_logic:=(B(2) XOR K);
   SIGNAL B33:std_logic:=(B(3) XOR K);
   
begin
    FA_0 : FA
   port map (
       A => A(0),
       B => B00,
       C_in => C_in, -- Set to ground
       S => S(0),
       C_Out => FA0_C);
  FA_1 : FA
    port map (
       A => A(1),
       B => B11,
       C_in => FA0_C,
       S => S(1),
       C_Out => FA1_C);

   FA_2 : FA
   port map (
       A => A(2),
       B => B22,
       C_in => FA1_C,
       S => S(2),
       C_Out => FA2_C);
   FA_3 : FA
   port map (
       A => A(3),
       B => B33,
       C_in => FA2_C,
       S => S(3),
       C_Out => carry);
    
    overFlow <= carry XOR FA2_C;
    C_outT <= carry;
  
    PROCESS 
      BEGIN
        if (S3 ='0' and S2='0' and S1='0' and S0='0') then
            Zero<= '1';
        else
            Zero <= '0';
        end if;
     end process;

end Behavioral;
