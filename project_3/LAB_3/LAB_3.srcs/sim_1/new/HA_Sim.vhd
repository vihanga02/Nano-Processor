----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/13/2024 02:20:19 PM
-- Design Name: 
-- Module Name: HA_Sim - Behavioral
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

entity TB_HA is
--  Port ( );
end TB_HA;

architecture Behavioral of TB_HA is

 COMPONENT HA
    PORT( A, B : IN STD_LOGIC;
        S, C : OUT STD_LOGIC);
 END COMPONENT;
    SIGNAL a, b : std_logic;
    SIGNAL s, c : std_logic;
begin
    UUT: HA PORT MAP(
        A => a,
        B => b,
        S => s,
        C => c
    );
    process
     begin
     a <= '0'; -- set initial values
     b <= '0';
     WAIT FOR 100 ns; -- after 100 ns change inputs
     b <= '1';
     WAIT FOR 100 ns; --change again
     a <= '1';
     b <= '0';
     WAIT FOR 100 ns; --change again
     b <= '1';
     WAIT; -- will wait forever
    end process;

end Behavioral;
