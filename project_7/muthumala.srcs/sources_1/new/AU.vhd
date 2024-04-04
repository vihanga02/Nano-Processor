----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/15/2024 10:09:15 AM
-- Design Name: 
-- Module Name: AU - Behavioral
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

entity AU is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           RegSel : in STD_LOGIC;
           Clk : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Zero : out STD_LOGIC;
           Carry : out STD_LOGIC);
end AU;

architecture Behavioral of AU is

component Slow_Clk
Port ( Clk_in : in STD_LOGIC;
       Clk_out : out STD_LOGIC);
end component;

component RCA_4
Port (  A0 : in STD_LOGIC;
        A1 : in STD_LOGIC;
        A2 : in STD_LOGIC;
        A3 : in STD_LOGIC;
        B0 : in STD_LOGIC;
        B1 : in STD_LOGIC;
        B2 : in STD_LOGIC;
        B3 : in STD_LOGIC;
        C_in : in STD_LOGIC;
        S0 : out STD_LOGIC;
        S1 : out STD_LOGIC;
        S2 : out STD_LOGIC;
        S3 : out STD_LOGIC;
        C_out : out STD_LOGIC);
end component;

component Reg
Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
       En : in STD_LOGIC;
       Clk : in STD_LOGIC;
       Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal  Clk_slow, RegSel_bar : STD_LOGIC;
signal Reg_0_out, Reg_1_out, s_out : STD_LOGIC_VECTOR(3 downto 0);
signal Rca_c_out : STD_LOGIC ;

begin
RegSel_bar <= not(RegSel);

Slow_Clk_0 : Slow_Clk

Port map ( Clk_in =>Clk,
            Clk_out => Clk_slow
     );

Reg_0 : Reg
Port map ( D => A,
           EN => RegSel_bar,
           Clk => Clk_slow,
           Q => Reg_0_out);
                   
Reg_1 : Reg
Port map ( D => A,
           EN => RegSel,
           Clk => Clk_slow,
           Q => Reg_1_out);
           
RCA_4_0 : RCA_4
port map(A0 => Reg_0_out(0),
         A1 => Reg_0_out(1),
         A2 => Reg_0_out(2),
         A3 => Reg_0_out(3),
         B0 => Reg_1_out(0),
         B1 => Reg_1_out(1),
         B2 => Reg_1_out(2),
         B3 => Reg_1_out(3),
         C_in => '0',
         S0 => s_out(0),
         S1 => s_out(1),
         S2 => s_out(2),
         S3 => s_out(3),
         C_out => Rca_c_out);
         
     Carry <= Rca_c_out;
     
     S(0) <= s_out(0);
     S(1) <= s_out(1);
     S(2) <= s_out(2);
     S(3) <= s_out(3);
     
     Zero <= not (s_out(0) or s_out(1) or s_out(2) or s_out(3) or Rca_c_out); 
     
end Behavioral;
