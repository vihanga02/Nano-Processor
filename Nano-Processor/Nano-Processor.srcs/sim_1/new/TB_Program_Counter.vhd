----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2024 01:29:01 PM
-- Design Name: 
-- Module Name: TB_Program_Counter - Behavioral
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

entity TB_Program_Counter is
--  Port ( );
end TB_Program_Counter;

architecture Behavioral of TB_Program_Counter is


Component Program_Counter
    Port ( Counter_IN : in STD_LOGIC_VECTOR (2 downto 0);
          Reset : in STD_LOGIC;
          Clk : in STD_LOGIC;
          Counter_Out : out STD_LOGIC_VECTOR (2 downto 0));
End Component;

    SIGNAL Count_in, Count_out : STD_LOGIC_VECTOR(2 downto 0);
    SIGNAL rst, Clk : STD_LOGIC := '0';
    
begin

UUT : Program_Counter PORT MAP(
        Counter_IN => Count_in,
        Reset => rst,
        Clk => Clk,
        Counter_Out => Count_out);
        
    clock_process: process
        begin
            Clk <= '0';
            WAIT FOR 5 ns;
            Clk <= '1';
            WAIT FOR 5 ns;
      end process;
      
process
      begin
          -- rst = 0 means output will  be same as input otherwise output will be 000
          rst <= '0';
          Count_in <= "000";
          wait for 50ns;
          
          Count_in <= "001";
          wait for 50ns;
          
          Count_in <= "010";
          wait for 50ns;
          
          Count_in <= "011";
          wait for 50ns;
          
          Count_in <= "100";
          wait for 50ns;
          
          Count_in <= "101";
          wait for 50ns;
          
          Count_in <= "110";
          wait for 50ns;
          
          Count_in <= "111";
          wait for 50ns;
          
          rst <= '1';
          wait for 50ns;
          rst <= '0';
          Count_in <= "000";
          wait for 50ns;
          
          Count_in <= "001";
          wait for 50ns;
          
          Count_in <= "110";
          wait for 50ns;
          
          wait; -- wait forever
                  
    end process;

end Behavioral;
