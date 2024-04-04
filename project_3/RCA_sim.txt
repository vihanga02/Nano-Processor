----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/13/2024 04:44:12 PM
-- Design Name: 
-- Module Name: RCA_4_sim - Behavioral
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

entity RCA_4_sim is
--  Port ( );
end RCA_4_sim;

architecture Behavioral of RCA_4_sim is
COMPONENT RCA_4
 PORT(A0, A1, A2, A3, B0, B1, B2, B3, C_in  : IN STD_LOGIC;
    S0, S1, S2, S3, C_out : OUT STD_LOGIC);
 END COMPONENT;
    SIGNAL a0, a1, a2, a3, b0, b1, b2, b3, c_in : std_logic;
    SIGNAL s0, s1, s2, s3, c_out : std_logic;

begin
UUT: RCA_4 PORT MAP(
    A0 => a0,
    A1 => a1,
    A2 => a2,
    A3 => a3,
    B0 => b0,
    B1 => b1,
    B2 => b2,
    B3 => b3,
    C_in => c_in,
    S0 => s0,
    S1 => s1,
    S2 => s2,
    S3 => s3,
    C_out => c_out
 );
process
 begin
     a0  <= '1';
     a1  <= '1';
     a2  <= '1';
     a3  <= '0';
     
     b0  <= '1';
     b1  <= '1';
     b2  <= '1';
     b3  <= '1'; 
 
     c_in <= '0';
     WAIT FOR 125 ns; --change again
     a0  <= '0';
      a1  <= '0';
      a3  <= '1';
      
      b1  <= '0';
      b3  <= '0';
     WAIT FOR 125 ns; --change again
       a0  <= '1';
       a1  <= '1';
       a2  <= '0';
    WAIT FOR 125 ns; --change again
         a2  <= '1';
         b1  <= '1';
    WAIT FOR 125 ns; --change again
        a3 <= '0';
        b3 <= '1';
   WAIT FOR 125 ns; --change again
        a2 <= '0';
        b0 <= '0'; 
   WAIT FOR 125 ns; --change again
        a1 <= '0';
        b1 <= '0';
   WAIT FOR 125 ns; --change again
        a3 <= '1';
        b2 <= '0';   
 WAIT; -- will wait forever
end process;

end Behavioral;
