----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2024 01:32:42 PM
-- Design Name: 
-- Module Name: TB_Reg_3_B - Behavioral
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

entity TB_Reg_3_B is
--  Port ( );
end TB_Reg_3_B;

architecture Behavioral of TB_Reg_3_B is


component Reg_3_B is
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
          En : in STD_LOGIC;
          Clk : in STD_LOGIC;
          Reset : in STD_LOGIC;
          Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;

SIGNAL Clk, En, Rst : STD_LOGIC;
SIGNAL D : STD_LOGIC_VECTOR(2 downto 0);
SIGNAL Q : STD_LOGIC_VECTOR(2 downto 0);

begin

UUT : Reg_3_B PORT MAP (
        Clk => Clk,
        Reset => Rst,
        En => En,
        D => D,
        Q => Q
    ); 
    
    
    clock_process : process -- background clock process
    begin
    
        Clk <= '0';
        wait for 5ns;
        Clk <= '1';
        wait for 5ns;
    
    end process;
    
    reg_process : process
    begin
        Rst <= '1';
        En <= '0';
        D <= "011";
        wait for 100ns;
        
        Rst <= '0';
        D <= "110";
        wait for 100ns;
        
        En <= '1';
        wait for 10ns;
        
        D <= "111";
        wait for 100ns;
        
        -- reset the register
        Rst <= '1';
        wait for 100ns;
        Rst <= '0';
        
        D <= "101";
        wait for 100ns;
        
        wait; -- wait forever
    
    end process;


end Behavioral;
