----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/28/2024 02:28:08 PM
-- Design Name: 
-- Module Name: REG_D - Behavioral
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


entity REG_D is
generic (dw: integer:= 4);
  Port (
  D: in std_logic_vector(dw-1 downto 0);
  W_EN, CLK: in std_logic;
  Q: out std_logic_vector(dw-1 downto 0)
   );
end REG_D;

architecture Behavioral  of REG_D is

signal TEMP:std_logic_vector(dw-1 downto 0);
begin

store: process(D, W_EN,CLK)
begin

if(rising_edge(clk)) then
    if(w_en = '0') then --write mode
        TEMP <= D;
    elsif(w_en = '1') then -- read mode
        Q <= TEMP;
    end if;
end if;

end process store;

end Behavioral ;
