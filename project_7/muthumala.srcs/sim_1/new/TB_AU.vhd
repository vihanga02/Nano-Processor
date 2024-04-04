----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/15/2024 10:57:41 AM
-- Design Name: 
-- Module Name: TB_AU - Behavioral
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

entity TB_AU is
--  Port ( );
end TB_AU;

architecture Behavioral of TB_AU is

component AU is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           RegSel : in STD_LOGIC;
           Clk : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Zero : out STD_LOGIC;
           Carry : out STD_LOGIC);
end component;

signal a,s : std_logic_vector(3 downto 0);
signal regsel,zero,carry : std_logic;
signal clk : std_logic := '0';

begin

UTT : AU port map (
        A => a,
        RegSel => regsel,
        Clk => clk,
        S => s,
        Zero => zero,
        Carry => carry);
        
 process begin
    clk <= not clk;
    wait for 5ns;
 end process;
 
 process begin
    -- 11 0101 1100 1111 0111
    
    a <= "0111";
    regsel <=  '0';
    wait for 100ns;
    
    a <= "1111";
    regsel <=  '1';
    wait for 100ns;
    
    a <= "1100";
    regsel <=  '0';
    wait for 100ns;
    
    a <= "0101";
    regsel <=  '1';
    wait for 100ns;
    
    a <= "1111";
    regsel <=  '0';
    wait for 100ns;
        
    a <= "1100";
    regsel <=  '1';
    wait for 100ns;
    
    a <= "0111";
    regsel <=  '0';
    wait for 100ns;
            
    a <= "0101";
    regsel <=  '1';
    wait;

end process;
        
end Behavioral;
