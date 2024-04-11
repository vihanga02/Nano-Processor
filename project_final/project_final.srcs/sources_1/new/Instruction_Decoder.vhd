----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/04/2024 12:20:01 PM
-- Design Name: 
-- Module Name: Instruction_Decoder - Behavioral
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

entity Instruction_Decoder is
      Port ( Instruction_Bus : in STD_LOGIC_VECTOR (11 downto 0);
             Check_For_Jump : in STD_LOGIC_VECTOR (3 downto 0);
             Register_Enable : out STD_LOGIC_VECTOR (2 downto 0);
             Load_Select : out STD_LOGIC;
             Immediate_Value : out STD_LOGIC_VECTOR (3 downto 0);
             Register_Select_0 : out STD_LOGIC_VECTOR (2 downto 0);
             Register_Select_1 : out STD_LOGIC_VECTOR (2 downto 0);
             A_S_Select : out STD_LOGIC;
             Jump_Flag : out STD_LOGIC;
             Jump_Address : out STD_LOGIC_VECTOR (2 downto 0));
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is

component Decoder_2_TO_4 is
    Port ( I : in STD_LOGIC_VECTOR (1 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (1 downto 0));
end component;

component Tri_State_Buffer_3_B is
     Port ( data_in : in STD_LOGIC_VECTOR (2 downto 0);
          enable : in STD_LOGIC;
          data_out: out STD_LOGIC_VECTOR (2 downto 0));
end component;

component Tri_State_Buffer_4_B is
    Port ( data_in : in STD_LOGIC_VECTOR (3 downto 0);
          enable : in STD_LOGIC;
          data_out: out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal instruction : STD_LOGIC_VECTOR (1 downto 0);
signal r1 : STD_LOGIC_VECTOR (2 downto 0);
signal r2 : STD_LOGIC_VECTOR (2 downto 0);
signal d : STD_LOGIC_VECTOR (3 downto 0);
signal operation : STD_LOGIC_VECTOR (3 downto 0);

begin

 instruction <= Instruction_bus (11 downto 10);
 r1 <= Instruction_bus (9 downto 7);
 r1 <= Instruction_bus (6 downto 4);
 d <= Instruction_bus (3 downto 0);
 
 Decode_2_to_4_0 : Decoder_2_to_4
     port map(
         I => instruction,
         EN => '1',
         Y => operation);
         
   -- move instruction
  load_select <= operation(2);
  MOV_reg_en_0 : Tri_State_Buffer_3_B
    port map (
            data_in => r1,
            enable => operation(2),
            data_out => register_enable);

  MOV_imm_val : Tri_State_Buffer_4_B
    port map (
            data_in => d,
            enable => operation(2),
            data_out => immediate_value);
            
       
  -- neg instruction
  load_select <= NOT operation(1);
  A_S_Select <= '1';
  NEG_reg_en_0 : Tri_State_Buffer_3_B
      port map (
              data_in => "000",
              enable => operation(1),
              data_out => Register_Select_0);
  
  NEG_reg_en_1 : Tri_State_Buffer_3_B
        port map (
            data_in => r1,
            enable => operation(1),
            data_out => Register_Select_1);
            
   
   -- add instruction
   load_select <= NOT operation(0);
    MOV_reg_en_1 : Tri_State_Buffer_3_B
      port map (
              data_in => r1,
              enable => operation(0),
              data_out => register_enable);
              
   A_S_Select <= '0';
     ADD_reg_en_0 : Tri_State_Buffer_3_B
         port map (
                 data_in => r1,
                 enable => operation(0),
                 data_out => Register_Select_0);
     
     ADD_reg_en_1 : Tri_State_Buffer_3_B
           port map (
               data_in => r2,
               enable => operation(0),
               data_out => Register_Select_1);
               
        
   -- JZR instruction
   JZR_reg_en_0 : Tri_State_Buffer_3_B
            port map (
                    data_in => r1,
                    enable => operation(0),
                    data_out => Register_Select_0);
    Jump_Flag <= NOT(Check_For_Jump(0) OR Check_For_Jump(1) OR Check_For_Jump(2) OR Check_For_Jump(3));
    Jump_Address <= d (2 downto 0);

end Behavioral;
