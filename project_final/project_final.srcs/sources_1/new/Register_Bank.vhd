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
           Q0 : out STD_LOGIC_VECTOR (3 downto 0);
           Q1 : out STD_LOGIC_VECTOR (3 downto 0);
           Q2 : out STD_LOGIC_VECTOR (3 downto 0);
           Q3 : out STD_LOGIC_VECTOR (3 downto 0);
           Q4 : out STD_LOGIC_VECTOR (3 downto 0);
           Q5 : out STD_LOGIC_VECTOR (3 downto 0);
           Q6 : out STD_LOGIC_VECTOR (3 downto 0);
           Q7 : out STD_LOGIC_VECTOR (3 downto 0));
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
        Q : out STD_LOGIC_VECTOR (3 downto 0) := "0000");
 end component;
 
 signal reg_en_out : std_logic_vector (7 downto 0);
 signal reg_en_in : std_logic_vector(2 downto 0);

begin
    Decode_3_to_8_0 : Decoder_3_to_8
        port map(
            I => reg_en_in,
            EN => '1',
            Y => reg_en_out );
    
    Reg_0 : Reg_4_B  -- Read only register with the initial value of 0000
        Port map ( 
            D => Value_In,
            EN => '0',
            Reset => Reset,
            Clk => Clk,
            Q => Q0);
    
    Reg_1 : Reg_4_B
       Port map ( 
            D => Value_In,
            EN => reg_en_out(1),
            Reset => Reset,
            Clk => Clk,
            Q => Q1);
                        
     Reg_2 : Reg_4_B
        Port map ( 
            D => Value_In,
            EN => reg_en_out(2),
            Reset => Reset,
            Clk => Clk,
            Q => Q2);
            
     Reg_3 : Reg_4_B
        Port map ( 
            D => Value_In,
            EN => reg_en_out(3),
            Reset => Reset,
            Clk => Clk,
            Q => Q3);    
            
     Reg_4 : Reg_4_B
        Port map ( 
            D => Value_In,
            EN => reg_en_out(4),
            Reset => Reset,
            Clk => Clk,
            Q => Q4); 
                        
    Reg_5 : Reg_4_B
        Port map ( 
            D => Value_In,
            EN => reg_en_out(5),
            Reset => Reset,
            Clk => Clk,
            Q => Q5); 
                                    
    Reg_6 : Reg_4_B
        Port map ( 
            D => Value_In,
            EN => reg_en_out(6),
            Reset => Reset,
            Clk => Clk,
            Q => Q6); 
            
    Reg_7 : Reg_4_B
        Port map ( 
            D => Value_In,
            EN => reg_en_out(7),
            Reset => Reset,
            Clk => Clk,
            Q => Q7);                            
            

end Behavioral;
