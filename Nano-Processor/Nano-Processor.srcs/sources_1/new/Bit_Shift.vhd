----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/24/2024 08:05:34 PM
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
        B_Shift_with_Dir : in STD_LOGIC_VECTOR (2 downto 0); -- MSB shows direction to shift and next 2 shows no of digits
        En : in STD_LOGIC;
        A_out : out STD_LOGIC_VECTOR (3 downto 0));
end Bit_Shift;

architecture Behavioral of Bit_Shift is
 
component Decoder_3_to_8
   port (
       I : in std_logic_vector (2 downto 0);
       En : in std_logic;
       Y : out std_logic_vector (7 downto 0));
end component;

component Tri_State_Buffer_4_B 
    port ( 
        data_in : in STD_LOGIC_VECTOR (3 downto 0);
        enable : in STD_LOGIC;
        data_out: out STD_LOGIC_VECTOR (3 downto 0));
end component; 
    
signal Decoder_Out : STD_LOGIC_VECTOR (7 downto 0);
signal Lshift_0, Lshift_1, Lshift_2, Lshift_3 :  STD_LOGIC_VECTOR (3 downto 0);
signal Rshift_0, Rshift_1, Rshift_2, Rshift_3 :  STD_LOGIC_VECTOR (3 downto 0);
signal Final_Out : STD_LOGIC_VECTOR (3 downto 0);

begin

Decoder: Decoder_3_to_8
    port map ( I => B_Shift_with_Dir,
               En => '1',
               Y => Decoder_Out);
               
Lshift_0 <= A;

Lshift_1(0) <= '0';
Lshift_1(1) <= A(0);
Lshift_1(2) <= A(1);
Lshift_1(3) <= A(2);

Lshift_2(0) <= '0';
Lshift_2(1) <= '0';
Lshift_2(2) <= A(0);
Lshift_2(3) <= A(1);

Lshift_3(0) <= '0';
Lshift_3(1) <= '0';
Lshift_3(2) <= '0';
Lshift_3(3) <= A(0);

Rshift_0 <= A;

Rshift_1(0) <= A(1);
Rshift_1(1) <= A(2);
Rshift_1(2) <= A(3);
Rshift_1(3) <= '0';

Rshift_2(0) <= A(2);
Rshift_2(1) <= A(3);
Rshift_2(2) <= '0';
Rshift_2(3) <= '0';

Rshift_3(0) <= A(3);
Rshift_3(1) <= '0';
Rshift_3(2) <= '0';
Rshift_3(3) <= '0';

Buff_0 : Tri_State_Buffer_4_B
    port map (
        data_in => Lshift_0,
        enable => Decoder_Out(0),
        data_out => Final_Out);
        
 Buff_1 : Tri_State_Buffer_4_B
    port map (
        data_in => Lshift_1,
        enable => Decoder_Out(1),
        data_out => Final_Out);
 
 Buff_2 : Tri_State_Buffer_4_B
    port map (
        data_in => Lshift_2,
        enable => Decoder_Out(2),
        data_out => Final_Out);
       
 Buff_3 : Tri_State_Buffer_4_B
    port map (
        data_in => Lshift_3,
        enable => Decoder_Out(3),
        data_out => Final_Out);

Buff_4 : Tri_State_Buffer_4_B
    port map (
        data_in => Rshift_0,
        enable => Decoder_Out(4),
        data_out => Final_Out);
        
 Buff_5 : Tri_State_Buffer_4_B
    port map (
        data_in => Rshift_1,
        enable => Decoder_Out(5),
        data_out => Final_Out);
 
 Buff_6 : Tri_State_Buffer_4_B
    port map (
        data_in => Rshift_2,
        enable => Decoder_Out(6),
        data_out => Final_Out);
       
 Buff_7 : Tri_State_Buffer_4_B
    port map (
        data_in => Rshift_3,
        enable => Decoder_Out(7),
        data_out => Final_Out);
 
        
A_out(0) <= Final_Out(0) AND EN;
A_out(1) <= Final_Out(1) AND EN;
A_out(2) <= Final_Out(2) AND EN;
A_out(3) <= Final_Out(3) AND EN;

end Behavioral;
