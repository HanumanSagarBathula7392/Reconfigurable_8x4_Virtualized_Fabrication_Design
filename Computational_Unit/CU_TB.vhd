----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/20/2025 11:52:05 AM
-- Design Name: 
-- Module Name: CU_TB - Behavioral
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
use ieee.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;
USE STD.ENV.FINISH;

entity CU_TB is
--  Port ( );
end CU_TB;

architecture Behavioral of CU_TB is
constant dw: integer := 4; 
constant dws: integer := 5;
signal A, B, O : STD_LOGIC_VECTOR(dw-1 downto 0);
signal SEL: STD_LOGIC_VECTOR(dws-1 downto 0);

begin

CU_INST: entity work.CU_6 (Behavioral)
Generic map(dw => dw,dws=>dws)
port map(A => A, B => B, O => O, SEL => SEL);
stim: process
begin
A <= "0110"; 
B <= "1001";
--wait for 25ns;
SEL<="00000";   wait for 25ns;
SEL<="00001";   wait for 25ns;
SEL<="00010";   wait for 25ns;
SEL<="00011";   wait for 25ns;
SEL<="00100";   wait for 25ns;
SEL<="00101";   wait for 25ns;
SEL<="00110";   wait for 25ns;
SEL<="00111";   wait for 25ns;
SEL<="01000";   wait for 25ns;
SEL<="01001";   wait for 25ns;
SEL<="01010";   wait for 25ns;
SEL<="01011";   wait for 25ns;
SEL<="01100";   wait for 25ns;
SEL<="01101";   wait for 25ns;
SEL<="01110";   wait for 25ns;
SEL<="01111";   wait for 25ns;
SEL<="10000";   wait for 25ns;
SEL<="10001";   wait for 25ns;
SEL<="10010";   wait for 25ns;
SEL<="10011";   wait for 25ns;
SEL<="10100";   wait for 25ns;
SEL<="10101";   wait for 25ns;
SEL<="10110";   wait for 25ns;
SEL<="10111";   wait for 25ns;
SEL<="11000";   wait for 25ns;
SEL<="11001";   wait for 25ns;
finish;
end process;
END Behavioral;