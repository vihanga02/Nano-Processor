----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2024 12:53:47 PM
-- Design Name: 
-- Module Name: TB_FA - Behavioral
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

entity TB_FA is
--  Port ( );
end TB_FA;

architecture Behavioral of TB_FA is
 COMPONENT FA
    PORT( A, B, C_in : IN STD_LOGIC;
        C_out, S : OUT STD_LOGIC);
    END COMPONENT;
     SIGNAL a, b, ci : std_logic;
     SIGNAL co, s : std_logic;
begin
UUT: FA PORT MAP(
    A => a,
    B => b,
    C_in => ci,
    S => s,
    C_out => co
 );
 process
     begin
     a <= '0'; -- set initial values
     b <= '0';
     ci <= '0';
     WAIT FOR 100 ns; -- after 100 ns change inputs
     ci <= '1';
     WAIT FOR 100 ns; --change again
     b <= '1';
     ci <= '0';
     WAIT FOR 100 ns; --change again
     ci <= '1';
     WAIT FOR 100 ns; --change again
     a <= '1';
     b <= '0';
     ci <= '0';
     WAIT FOR 100 ns; --change again
     ci <= '1';
     WAIT FOR 100 ns; --change again
     b <= '1';
     ci <= '0';
     WAIT FOR 100 ns; --change again
      ci <= '1';
     WAIT; -- will wait forever
    end process;

end Behavioral;
