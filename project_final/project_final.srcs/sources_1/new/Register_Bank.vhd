----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/01/2024 05:35:38 PM
-- Design Name: 
-- Module Name: Register_Bank - Behavioral
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

entity Register_Bank is
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
end Register_Bank;

architecture Behavioral of Register_Bank is

component Decoder_3_to_8
 port(
    I: in STD_LOGIC_VECTOR;
    EN: in STD_LOGIC;
    Y: out STD_LOGIC_VECTOR );
 end component;
 
 component Reg_4_B
 Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
        En : in STD_LOGIC;
        Clk : in STD_LOGIC;
        Reset : in STD_LOGIC;
        R : out STD_LOGIC_VECTOR (3 downto 0) := "0000");
 end component; 
 
 component Reg_8_B
 Port ( D : in STD_LOGIC_VECTOR (7 downto 0);
        En : in STD_LOGIC;
        Clk : in STD_LOGIC;
        Reset : in STD_LOGIC;
        R : out STD_LOGIC_VECTOR (7 downto 0) := "0000");
 end component;
 
 signal reg_en_out : std_logic_vector (7 downto 0);
 signal not_reg_0 : std_logic;

begin
    Decode_3_to_8_0 : Decoder_3_to_8
        port map(
            I => Reg_En,
            EN => '1',
            Y => reg_en_out );
    
    Reg_0 : Reg_4_B  -- Read only register with the initial value of 0000
        Port map ( 
            D => Value_In,
            EN => '0',
            Reset => Reset,
            Clk => Clk,
            R => R0);
 
    Reg_1 : Reg_4_B
       Port map ( 
            D => Value_In,
            EN => reg_en_out(1),
            Reset => Reset,
            Clk => Clk,
            R => R1);
                        
     Reg_2 : Reg_4_B
        Port map ( 
            D => Value_In,
            EN => reg_en_out(2),
            Reset => Reset,
            Clk => Clk,
            R => R2);
            
     Reg_3 : Reg_4_B
        Port map ( 
            D => Value_In,
            EN => reg_en_out(3),
            Reset => Reset,
            Clk => Clk,
            R => R3);    
            
     Reg_4 : Reg_4_B
        Port map ( 
            D => Value_In,
            EN => reg_en_out(4),
            Reset => Reset,
            Clk => Clk,
            R => R4); 
                        
    Reg_5 : Reg_4_B
        Port map ( 
            D => Value_In,
            EN => reg_en_out(5),
            Reset => Reset,
            Clk => Clk,
            R => R5); 
                                    
    Reg_6 : Reg_4_B
        Port map ( 
            D => Value_In,
            EN => reg_en_out(6),
            Reset => Reset,
            Clk => Clk,
            R => R6); 
            
    not_reg_0 <= NOT reg_en_out(0);
    
    Reg_7 : Reg_4_B
        Port map ( 
            D => Value_In,
            EN => not_reg_0,
            Reset => Reset,
            Clk => Clk,
            R => R7);                            
            
    Reg_8 : Reg_8_B
        port map (
            D => Value_In,
            EN => not_reg_0,
            Reset => Reset,
            Clk => Clk,
            R => R7);

end Behavioral;
