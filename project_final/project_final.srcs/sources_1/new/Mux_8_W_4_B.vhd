----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/02/2024 02:54:21 PM
-- Design Name: 
-- Module Name: Mux_8_W_4_B - Behavioral
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

entity Mux_8_W_4_B is
    Port ( A1_in : in STD_LOGIC_VECTOR (3 downto 0);
           A2_in : in STD_LOGIC_VECTOR (3 downto 0);
           A3_in : in STD_LOGIC_VECTOR (3 downto 0);
           A4_in : in STD_LOGIC_VECTOR (3 downto 0);
           A5_in : in STD_LOGIC_VECTOR (3 downto 0);
           A6_in : in STD_LOGIC_VECTOR (3 downto 0);
           A7_in : in STD_LOGIC_VECTOR (3 downto 0);
           A8_in : in STD_LOGIC_VECTOR (3 downto 0);
           EN : in STD_LOGIC;
           C_out : out STD_LOGIC_VECTOR (3 downto 0);
           S0_in : in STD_LOGIC;
           S1_in : in STD_LOGIC;
           S2_in : in STD_LOGIC);
end Mux_8_W_4_B;

architecture Behavioral of Mux_8_W_4_B is

component Mux_2_W_4_B
    Port ( A_in : in STD_LOGIC_VECTOR (3 downto 0);
           B_in : in STD_LOGIC_VECTOR (3 downto 0);
           S_in : in STD_LOGIC;
           EN : in STD_LOGIC;
           C_out : out STD_LOGIC_VECTOR (3 downto 0));
end component; 

signal Mux_2_way_out_1, Mux_2_way_out_2,Mux_2_way_out_3,Mux_2_way_out_4 : std_logic_vector (3 downto 0);
signal Mux_2_way_out_5, Mux_2_way_out_6 : std_logic_vector (3 downto 0);

begin
    Mux2_1 : Mux_2_W_4_B
        port map (
            A_in => A1_in,
            B_in => A2_in,
            S_in => S0_in,
            EN => EN,
            C_out => Mux_2_way_out_1);
    
    Mux2_2 : Mux_2_W_4_B
        port map (
            A_in => A3_in,
            B_in => A4_in,
            S_in => S0_in,
            EN => EN,
            C_out => Mux_2_way_out_2);
    
    Mux2_3 : Mux_2_W_4_B
        port map (
            A_in => A5_in,
            B_in => A6_in,
            S_in => S0_in,
            EN => EN,
            C_out => Mux_2_way_out_3);
    
    Mux2_4 : Mux_2_W_4_B
        port map (
            A_in => A7_in,
            B_in => A8_in,
            S_in => S0_in,
            EN => EN,
            C_out => Mux_2_way_out_4);

    Mux2_5 : Mux_2_W_4_B
        port map (
            A_in => Mux_2_way_out_1,
            B_in => Mux_2_way_out_2,
            S_in => S1_in,
            EN => EN,
            C_out => Mux_2_way_out_5);
    
    Mux2_6 : Mux_2_W_4_B
        port map (
            A_in => Mux_2_way_out_3,
            B_in => Mux_2_way_out_4,
            S_in => S1_in,
            EN => EN,
            C_out => Mux_2_way_out_6);
    
    Mux2_7 : Mux_2_W_4_B
        port map (
            A_in => Mux_2_way_out_5,
            B_in => Mux_2_way_out_6,
            S_in => S2_in,
            EN => EN,
            C_out => C_out);  

end Behavioral;
