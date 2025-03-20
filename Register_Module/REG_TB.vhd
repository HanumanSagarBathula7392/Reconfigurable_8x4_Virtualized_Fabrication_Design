----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/20/2025 11:52:05 AM
-- Design Name: 
-- Module Name: REG_TB - Behavioral
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
USE STD.ENV.FINISH;

entity REG_TB is
--  Port ( );
end REG_TB;

architecture Behavioral of REG_TB is

constant dw: integer:= 4;
signal D, Q: std_logic_vector(dw-1  downto 0);
signal w_en: std_logic;
signal clk: std_logic:= '0';

begin

REG_UNIT: entity work.REG_D(Behavioral)
generic map (dw => dw)
port map(D => D, Q => Q, w_en => w_en, clk => clk);

clk <= not clk after 10 ns; --toggle the clock every 10 ns

stim: process
begin

D <= "0100"; 
w_en <= '0'; wait for 20 ns; --write mode

w_en <= '1'; wait for 30 ns; --read mode
finish;

end process stim;

end Behavioral;
