----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/04/2024 01:42:00 PM
-- Design Name: 
-- Module Name: MUX41 - Behavioral
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

entity MUX4X1 is
Generic(dw: integer := 4; dwm: integer := 2);
    Port ( A, B, C, D : in std_logic_vector(dw-1  downto 0);
           Sel : in std_logic_vector(DWM-1 downto 0); --2 bit select line
           Z : out std_logic_vector(dw-1 downto 0));
end MUX4X1;

architecture Behavioral of MUX4X1 is

begin
mux_4_1_proc: process(A, B, C, D, Sel)
    begin
        case Sel is
        when "00" => Z <= A;
        when "01" => Z <= B;
        when "10" => Z <= C;
        when "11" => Z <= D;
        when others => Z <= (others => 'Z');
        end case;
    end process;
end Behavioral;
