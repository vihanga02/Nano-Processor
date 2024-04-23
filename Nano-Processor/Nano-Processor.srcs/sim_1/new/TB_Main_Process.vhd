----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2024 01:22:38 PM
-- Design Name: 
-- Module Name: TB_Main_Process - Behavioral
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

entity TB_Main_Process is
--  Port ( );
end TB_Main_Process;

architecture Behavioral of TB_Main_Process is

component Main_Process is
    Port (
        Clk_In : in STD_LOGIC;
        Reset : in STD_LOGIC;
        Overflow_Flag : out STD_LOGIC;
        Zero_Flag : out STD_LOGIC;
        seg_data: out STD_LOGIC_VECTOR (6 downto 0);
        Reg_7_Out : out std_logic_vector (3 downto 0);
        anode : out STD_LOGIC_VECTOR (3 downto 0)
    );
end component;

SIGNAL Rst, Clk, Ovf, Zeroes : STD_LOGIC;
SIGNAL  Anode : STD_LOGIC_VECTOR(3 downto 0);
SIGNAL  reg_7_out : STD_LOGIC_VECTOR(3 downto 0);
SIGNAL Seg_data : STD_LOGIC_VECTOR(6 downto 0);

begin
    UTT : Main_Process
        port map (
            clk_In => clk,
            Reset => rst,
            Overflow_Flag => ovf,
            Zero_Flag => zeroes,
            seg_data => seg_data,
            anode => anode,
            Reg_7_Out => reg_7_out
            );
            
    clk_process : process -- clock processor
        begin
            Clk <= '0';
            wait for 1ns;
            
            Clk <= '1';
            wait for 1ns;
    end process;
    
    process 
        begin
            
            Rst <= '1';
            wait for 50ns;
            Rst <= '0';
            wait for 450ns; --wait forever
        
        end process;

end Behavioral;
