----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2024 03:10:15 PM
-- Design Name: 
-- Module Name: Bit_Shift - Behavioral
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

entity Bit_Shift is
    Port ( 
        A : in STD_LOGIC_VECTOR (3 downto 0);
        B_Shift : in STD_LOGIC_VECTOR (1 downto 0);
        EN : in STD_LOGIC;
        A_out : out STD_LOGIC_VECTOR (3 downto 0));
end Bit_Shift;

architecture Behavioral of Bit_Shift is
 
component Decode_2_to_4
   port (
       I : in std_logic_vector (1 downto 0);
       En : in std_logic;
       Y : out std_logic_vector (3 downto 0));
end component;

component Tri_State_Buffer_4_B 
    port ( 
        data_in : in STD_LOGIC_VECTOR (3 downto 0);
        enable : in STD_LOGIC;
        data_out: out STD_LOGIC_VECTOR (3 downto 0));
end component; 
    
signal shift_0,shift_1, shift_2, shift_3, decoder_out, out_signal : STD_LOGIC_VECTOR (3 downto 0);

begin

Decoder: Decode_2_to_4
    port map ( I => B_Shift,
               En => '1' ,
               Y => Decoder_Out);
               
shift_0 <= A;

shift_1(0) <= '0';
shift_1(1) <= A(0);
shift_1(2) <= A(1);
shift_1(3) <= A(2);

shift_2(0) <= '0';
shift_2(1) <= '0';
shift_2(2) <= A(0);
shift_2(3) <= A(1);

shift_3(0) <= '0';
shift_3(1) <= '0';
shift_3(2) <= '0';
shift_3(3) <= A(0);

Buff_0 : Tri_State_Buffer_4_B
    port map (
        data_in => shift_0,
        enable => decoder_out(0),
        data_out => out_signal);
        
 Buff_1 : Tri_State_Buffer_4_B
    port map (
        data_in => shift_1,
        enable => decoder_out(1),
        data_out => out_signal);
 
 Buff_2 : Tri_State_Buffer_4_B
    port map (
        data_in => shift_2,
        enable => decoder_out(2),
        data_out => out_signal);
       
 Buff_3 : Tri_State_Buffer_4_B
    port map (
        data_in => shift_3,
        enable => decoder_out(3),
        data_out => out_signal);
        
A_out(0) <= out_signal(0) AND EN;
A_out(1) <= out_signal(1) AND EN;
A_out(2) <= out_signal(2) AND EN;
A_out(3) <= out_signal(3) AND EN;

-- A_out <= out_signal;
end Behavioral;
