----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/06/2024 01:30:28 PM
-- Design Name: 
-- Module Name: Lab2 - Behavioral
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

entity Lab2 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           X : out STD_LOGIC;
           Y : out STD_LOGIC;
           Z : out STD_LOGIC);
end Lab2;

architecture Behavioral of Lab2 is
signal Green_Out : std_logic;
signal Amber_Out : std_logic;

begin
    Green_Out <= A AND B AND C;
    Green_Out <= A AND B AND C;
    Amber_Out <= ((NOT A) AND B AND C ) OR (A AND (NOT B) AND C) OR (A AND B AND (NOT C));
    X <= Green_Out;
    Y <= Amber_Out;
    Z <= NOT (Green_Out OR Amber_Out) ; 
end Behavioral;
