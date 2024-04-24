----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/24/2024 04:35:34 PM
-- Design Name: 
-- Module Name: Comparator - Behavioral
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

entity Comparator is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           EN : in STD_LOGIC;
           Equal : out STD_LOGIC;
           Greater : out STD_LOGIC;
           Less : out STD_LOGIC);
end Comparator;

architecture Behavioral of Comparator is
    signal x0: std_logic:=A(0) xnor B(0);
    signal x1: std_logic:=A(1) xnor B(1);
    signal x2: std_logic:=A(2) xnor B(2);
    signal x3: std_logic:=A(3) xnor B(3);

begin
    x0 <= A(0) xnor B(0);
    x1 <=A(1) xnor B(1);
    x2 <=A(2) xnor B(2);
    x3 <=A(3) xnor B(3);
    
    Equal<= EN AND (x3 and x2 and x1 and x0);
    Greater<= EN AND ((A(3)AND (NOT B(3)))  OR (x3 and A(2) AND (NOT B(2))) OR (X3 AND X2 AND A(1)  AND (NOT B(1)))OR (X3 AND X2 AND X1 AND A(0) AND(NOT(B(0))))) ;
    Less<= EN AND ((not(A(3))AND B(3))  OR (x3 and not(A(2)) AND B(2)) OR (X3 AND X2 AND not(A(1))  AND B(1))OR (X3 AND X2 AND X1 AND not( A(0)) AND B(0))) ;
    
end Behavioral;
