----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2024 02:35:12 PM
-- Design Name: 
-- Module Name: Logical_Operations_Unit - Behavioral
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

entity Logical_Operations_Unit is
    Port (
        A : in STD_LOGIC_VECTOR (3 downto 0);
        B : in STD_LOGIC_VECTOR (3 downto 0);
        Op_Select : in STD_LOGIC_VECTOR (1 downto 0);
        EN : in STD_LOGIC;
        Out_Result : out STD_LOGIC_VECTOR (3 downto 0)
    );
end Logical_Operations_Unit;

architecture Behavioral of Logical_Operations_Unit is
 
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
   
    signal AND_Result : STD_LOGIC_VECTOR(3 downto 0);
    signal OR_Result : STD_LOGIC_VECTOR(3 downto 0);
    signal XOR_Result : STD_LOGIC_VECTOR(3 downto 0);
    signal XNOR_Result : STD_LOGIC_VECTOR(3 downto 0);

    signal Decoder_Out : STD_LOGIC_VECTOR(3 downto 0);
    signal Final_Out : STD_LOGIC_VECTOR(3 downto 0);

    begin

    Decoder: Decode_2_to_4
        port map ( I => Op_Select,
                   En => '1',
                   Y => Decoder_Out);

    AND_Result <= A and B;
    OR_Result <= A or B;
    XOR_Result <= A xor B;
    XNOR_Result <= not (A xor B);


    Tri_State_AND: Tri_State_Buffer_4_B
        port map (data_in => AND_Result, 
                 enable => Decoder_Out(0), 
                 data_out => Final_Out);

    Tri_State_OR: Tri_State_Buffer_4_B
        port map (data_in => OR_Result, 
                 enable => Decoder_Out(1), 
                 data_out => Final_Out);

    Tri_State_XOR: Tri_State_Buffer_4_B
        port map (data_in => XOR_Result, 
        enable => Decoder_Out(2), 
        data_out => Final_Out);

    Tri_State_XNOR: Tri_State_Buffer_4_B
        port map (data_in => XNOR_Result, 
        enable => Decoder_Out(3), 
        data_out => Final_Out);

    Out_Result(0) <= Final_Out(0) AND en;
    Out_Result(1) <= Final_Out(1) AND en;
    Out_Result(2) <= Final_Out(2) AND en;
    Out_Result(3) <= Final_Out(3) AND en;

end Behavioral;
