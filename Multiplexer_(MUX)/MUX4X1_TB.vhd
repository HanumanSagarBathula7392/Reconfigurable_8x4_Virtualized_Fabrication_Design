----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/20/2025 11:52:05 AM
-- Design Name: 
-- Module Name: MUX4X1_TB - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MUX4X1_TB is
--  Port ( );
end MUX4X1_TB;

architecture Behavioral of MUX4X1_TB is

constant dw: integer := 4; 
constant dwm: integer := 2;
signal A, B, C, D, Z : STD_LOGIC_VECTOR(dw-1 downto 0);
signal SEL: STD_LOGIC_VECTOR(dwm-1 downto 0);

begin

MUX_INST: entity work.MUX4X1 (Behavioral)
Generic map(dw => dw,dwm=>dwm)
port map(A => A, B => B,C => C,D => D, Z => Z, SEL => SEL);
stim: process
begin
A <= "0000"; 
B <= "0001";
C <= "0010";
D <= "0011";

--wait for 25ns;
SEL<="00";   wait for 25ns;
SEL<="01";   wait for 25ns;
SEL<="10";   wait for 25ns;
SEL<="11";   wait for 25ns;

finish;
end process;
END Behavioral;
