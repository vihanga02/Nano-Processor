----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2024 11:20:44 AM
-- Design Name: 
-- Module Name: Main_Process - Behavioral
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


entity Main_Process is
    Port (
        Clk_In : in STD_LOGIC;
        Reset : in STD_LOGIC;
        Overflow_Flag : out STD_LOGIC;
        Zero_Flag : out STD_LOGIC;
        seg_data: out STD_LOGIC_VECTOR (6 downto 0);
        anode : out STD_LOGIC_VECTOR (3 downto 0);
        Reg_7_Out : out std_logic_vector(3 downto 0);
        Equal : out STD_LOGIC;
        Greater : out STD_LOGIC;
        Less : out STD_LOGIC;
        Log_and_Shift_out : out STD_LOGIC_VECTOR (3 downto 0)
    );
end Main_Process;

architecture Behavioral of Main_Process is

component Instruction_Decoder is
      Port ( Instruction_Bus : in STD_LOGIC_VECTOR (12 downto 0);
             Check_For_Jump : in STD_LOGIC_VECTOR (3 downto 0);
             Register_Enable : out STD_LOGIC_VECTOR (2 downto 0);
             Load_Select : out STD_LOGIC;
             Immediate_Value : out STD_LOGIC_VECTOR (3 downto 0);
             Register_Select_0 : out STD_LOGIC_VECTOR (2 downto 0);
             Register_Select_1 : out STD_LOGIC_VECTOR (2 downto 0);
             A_S_Select : out STD_LOGIC;
             Jump_Flag : out STD_LOGIC;
             Jump_Address : out STD_LOGIC_VECTOR (2 downto 0);
             Comparator_En : out STD_LOGIC;
             Logical_unit_en : out STD_LOGIC;
             Logical_Operation_Select : out STD_LOGIC_VECTOR(1 Downto 0);
             Bit_Shift_En : out STD_LOGIC;
             Bit_Shift_with_Dir : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component Mux_8_W_4_B is
    Port ( A0 : in STD_LOGIC_VECTOR (3 downto 0);
           A1 : in STD_LOGIC_VECTOR (3 downto 0);
           A2 : in STD_LOGIC_VECTOR (3 downto 0);
           A3 : in STD_LOGIC_VECTOR (3 downto 0);
           A4 : in STD_LOGIC_VECTOR (3 downto 0);
           A5 : in STD_LOGIC_VECTOR (3 downto 0);
           A6 : in STD_LOGIC_VECTOR (3 downto 0);
           A7 : in STD_LOGIC_VECTOR (3 downto 0);
           C_OUT : out STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0));
end component;

component Mux_2_W_3_B is
    Port ( A_in : in STD_LOGIC_VECTOR (2 downto 0);
           B_in : in STD_LOGIC_VECTOR (2 downto 0);
           S_in : in STD_LOGIC;
           C_out : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component Mux_2_W_4_B is
    Port ( S_in : in STD_LOGIC;
           A_in : in STD_LOGIC_VECTOR (3 downto 0);
           B_in : in STD_LOGIC_VECTOR (3 downto 0);
           C_out : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Register_Bank is
     Port ( Value_In : in STD_LOGIC_VECTOR (3 downto 0);
           Clk : in STD_LOGIC;
           Reg_En : in STD_LOGIC_VECTOR (2 downto 0);
           Reset : in STD_LOGIC;
           R0 : out STD_LOGIC_VECTOR (3 downto 0);
           R1 : out STD_LOGIC_VECTOR (3 downto 0);
           R2 : out STD_LOGIC_VECTOR (3 downto 0);
           R3 : out STD_LOGIC_VECTOR (3 downto 0);
           R4 : out STD_LOGIC_VECTOR (3 downto 0);
           R5 : out STD_LOGIC_VECTOR (3 downto 0);
           R6 : out STD_LOGIC_VECTOR (3 downto 0);
           R7 : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Add_Sub_Unit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
          B : in STD_LOGIC_VECTOR (3 downto 0);
          C_in : in STD_LOGIC;
          S : out STD_LOGIC_VECTOR (3 downto 0);
          C_outT : out STD_LOGIC;
          overFlow:out Std_logic;
          zero:out STD_LOGIC;
          K : in STD_LOGIC);
end component;

component Program_Rom is
    Port ( Memo_Sel : in STD_LOGIC_VECTOR (2 downto 0);
           Instruct_Bus : out STD_LOGIC_VECTOR (12 downto 0));
end component;

component Adder_3_B is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           C_in : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (2 downto 0);
           C_out : out STD_LOGIC);
end component;

component Program_Counter is
   Port ( Counter_IN : in STD_LOGIC_VECTOR (2 downto 0);
          Reset : in STD_LOGIC;
          Clk : in STD_LOGIC;
          Counter_Out : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component LUT_16_7 is
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));
end component;

component Slow_Clk is
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;

component Comparator is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           EN : in STD_LOGIC;
           Equal : out STD_LOGIC;
           Greater : out STD_LOGIC;
           Less : out STD_LOGIC);
end component;

component Logical_Unit is
    Port (
        A : in STD_LOGIC_VECTOR (3 downto 0);
        B : in STD_LOGIC_VECTOR (3 downto 0);
        En : in STD_LOGIC;
        Op_Select : in STD_LOGIC_VECTOR (1 downto 0);
        Out_Result : out STD_LOGIC_VECTOR (3 downto 0)
    );
end component;

component Bit_Shift is
    Port ( 
        A : in STD_LOGIC_VECTOR (3 downto 0);
        B_Shift_with_Dir : in STD_LOGIC_VECTOR (2 downto 0); 
        En : in STD_LOGIC;
        A_out : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal Instruction_Bus : STD_LOGIC_VECTOR (12 downto 0);
signal Check_For_Jump : STD_LOGIC_VECTOR (3 downto 0);
signal Register_Enable : STD_LOGIC_VECTOR (2 downto 0);
signal Immediate_Value : STD_LOGIC_VECTOR (3 downto 0);
signal Register_Select_0, Register_Select_1 : STD_LOGIC_VECTOR (2 downto 0);
signal A_S_Select,Jump_Flag, Load_Select: STD_LOGIC;
signal Jump_Address : STD_LOGIC_VECTOR (2 downto 0);

signal reg_bank_in : STD_LOGIC_VECTOR (3 downto 0);
signal clk : STD_LOGIC;
signal Data_bus_0, Data_bus_1, Data_bus_2, Data_bus_3, Data_bus_4, Data_bus_5, Data_bus_6, Data_bus_7 : STD_LOGIC_VECTOR (3 downto 0);

signal mux_0_out, mux_1_out : STD_LOGIC_VECTOR (3 downto 0);

signal add_sub_out : STD_LOGIC_VECTOR( 3 downto 0);
signal c_out_add_sub : STD_LOGIC;

signal adder_3_bit_out, next_address : STD_LOGIC_VECTOR (2 downto 0);
signal adder_3_bit_carry_out : STD_LOGIC;

signal memory_select : STD_LOGIC_VECTOR (2 downto 0);

signal zero, over, bit_Shift_en : STD_LOGIC;
signal Comparator_En, Logical_unit_en : STD_LOGIC;
signal Logical_Operation_Select : STD_LOGIC_VECTOR (1 downto 0);

signal B_Shift_with_Dir : STD_LOGIC_VECTOR (2 downto 0);

begin 
Instruction_decoder_0 : Instruction_decoder
    port map (
         Instruction_Bus => Instruction_Bus,
         Check_For_Jump => Check_for_jump,
         Register_Enable => Register_enable,
         Load_Select => Load_Select,
         Immediate_Value => Immediate_Value,
         Register_Select_0 => Register_Select_0,
         Register_Select_1 => Register_Select_1,
         A_S_Select => A_S_Select,
         Jump_Flag => Jump_Flag,
         Jump_Address => Jump_Address,
         Comparator_En => Comparator_En,
         Logical_Unit_En => Logical_unit_en,
         Logical_Operation_Select => Logical_Operation_Select,
         Bit_Shift_En => bit_Shift_en,
         Bit_Shift_with_Dir => B_Shift_with_Dir);
         
Register_Bank_0 : Register_Bank
    port map (
           Value_In => reg_bank_in,
           Clk => Clk,
           Reg_En => Register_enable,
           Reset => Reset,
           R0 => Data_bus_0,
           R1 => Data_bus_1,
           R2 => Data_bus_2,
           R3 => Data_bus_3,
           R4 => Data_bus_4,
           R5 => Data_bus_5,
           R6 => Data_bus_6,
           R7 => Data_bus_7);
           
Mux_8_W_4_b_0 : Mux_8_W_4_B
    port map (
           A0 => Data_bus_0,
           A1 => Data_bus_1,
           A2 => Data_bus_2,
           A3 => Data_bus_3,
           A4 => Data_bus_4,
           A5 => Data_bus_5,
           A6 => Data_bus_6,
           A7 => Data_bus_7,
           C_OUT => mux_0_out,
           S => Register_Select_1);

Check_For_Jump <= mux_1_out;

Mux_8_W_4_b_1 : Mux_8_W_4_B
    port map (
           A0 => Data_bus_0,
           A1 => Data_bus_1,
           A2 => Data_bus_2,
           A3 => Data_bus_3,
           A4 => Data_bus_4,
           A5 => Data_bus_5,
           A6 => Data_bus_6,
           A7 => Data_bus_7,
           C_OUT => mux_1_out,
           S => Register_Select_0);  
           
Add_Sub : Add_Sub_Unit
    port map (
          A => mux_0_out,
          B  => mux_1_out,
          C_in  => '0',
          S  => add_sub_out,
          C_outT  => c_out_add_sub,
          overFlow  => over,
          zero  => zero,
          K => A_S_Select);  
          
Mux_2_W_4_B_0 : Mux_2_W_4_B
    port map (
           S_in => Load_Select,
           A_in => add_sub_out,
           B_in => Immediate_Value,
           C_out => reg_bank_in);
           
Adder_3_b_0 : Adder_3_B
    port map (
           A => memory_select,
           C_in => '0',
           S => adder_3_bit_out,
           C_out => adder_3_bit_carry_out);

Mux_2_w_3_b_0 : Mux_2_W_3_B
    port map (
           A_in => adder_3_bit_out,
           B_in => Jump_Address,
           S_in => Jump_Flag,
           C_out => next_address);
         
   
Program_Counter_0 : Program_counter
    port map (
          Counter_IN => next_address,
          Reset => Reset,
          Clk => CLK,
          Counter_Out => memory_select);
      
Pro_rom : Program_Rom
   port map (
        Memo_Sel => memory_select,
        Instruct_Bus => Instruction_Bus);
        
slow_clock : Slow_clk
    port map(
        Clk_in => Clk_in,
        CLk_out => clk);
 
Seg_display : LUT_16_7
    port map(
        address => Data_bus_7,
        data => seg_data);
 
comparator_0 :  Comparator
    Port map ( 
           A => mux_0_out,
           B => mux_1_out,
           EN => comparator_en,
           Equal => Equal,
           Greater => Greater,
           Less => Less);
           
Logical_unit_0 :  Logical_Unit 
      Port map (
           A => mux_0_out,
           B => mux_1_out,
           En => Logical_unit_en,
           Op_Select => Logical_Operation_Select,
           Out_Result => Log_and_Shift_out);
   
 Bit_Shift_0 :  Bit_Shift 
       Port map ( 
           A => mux_0_out,
           B_Shift_with_Dir => B_Shift_with_Dir,
           En => Bit_Shift_En,
           A_out => Log_and_Shift_out);
        
Zero_Flag <= zero AND NOT instruction_bus(12) AND NOT instruction_bus(11) AND NOT instruction_bus(10);     
Overflow_Flag <= over AND NOT instruction_bus(12) AND NOT instruction_bus(11) AND NOT instruction_bus(10);
anode <= "1110";
Reg_7_Out <= Data_bus_7; 

end Behavioral;
