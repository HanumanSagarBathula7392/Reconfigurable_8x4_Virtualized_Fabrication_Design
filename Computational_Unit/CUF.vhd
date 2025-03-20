----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2024 02:12:25 PM
-- Design Name: 
-- Module Name: CUF - Behavioral
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

entity CU_6 is
generic (dw: integer:=4;
        dws: integer:=5);
Port ( A,B : in STD_LOGIC_VECTOR(dw-1 downto 0); 
 O : out STD_LOGIC_VECTOR(dw-1 downto 0); 
-- Carry : out std_logic; 
 SEL : in STD_LOGIC_VECTOR(dws-1 downto 0));
end CU_6;

architecture Behavioral of CU_6 is
signal Result : std_logic_vector (dw-1 downto 0);
signal Cout : std_logic_vector (DWS-1 downto 0); 
begin

 process(A,B,SEL)
 begin
 case( SEL) is
 WHEN "00000"=> --NO OP
 Result <= (others => '0');
 WHEN "00001" =>
 Result<=A AND B; --AND
 WHEN "00010" =>
 Result<=A OR B; --OR
 WHEN "00011" =>
 Result<=A NAND B; --NAND
 WHEN "00100" =>
 Result<=A NOR B; --NOR
 WHEN "00101" =>
 Result<=A XOR B; --XOR
 WHEN "00110" =>
 Result<=A XNOR B; --XNOR
 when "00111" => 
 Result <=A+B; --Addition
 when "01000" => 
 Result <=A-B; --Substraction
 when "01001" => 
 Result <=std_logic_vector(to_unsigned(to_integer(unsigned(A)) * to_integer(unsigned(B)),DW)); --multiplication
 WHEN "01010" => 
 if(A>B) then --GREATER THAN
 Result <= (others => '1');
 else
 Result <= (others => '0');
 end if;
 WHEN "01011" => 
 if(A<B) then --LESS THAN
 Result <= (others => '1');
 else
 Result <= (others => '0');
 end if;
 WHEN "01100" => 
 if(A=B) then --EQUAL TO
 Result <= (others => '1');
 else
 Result <= (others => '0');
 end if;
 WHEN "01101" => 
 if(A>=B) then --GREATER THAN EQUAL TO
 Result <= (others => '1');
 else
 Result <= (others => '0');
 end if;
 WHEN "01110" => 
 if(A<=B) then --LESS THAN EQUAL TO
 Result <= (others => '1');
 else
 Result <= (others => '0');
 end if;
 WHEN "01111" => 
 if(A/=B) then --NOT EQUAL TO
 Result <= (others => '1');
 else
 Result <= (others => '0');
 end if;
 WHEN "10000"=> --Arithmetic Shift Left
 Result <= to_stdlogicvector(to_bitvector(A) sla to_integer(unsigned(B)));
 WHEN "10001" =>
 Result<= to_stdlogicvector(to_bitvector(A) sra to_integer(unsigned(B))); --Arithmetic Shift Right
 WHEN "10010" =>
 Result<=to_stdlogicvector(to_bitvector(A) rol to_integer(unsigned(B))); --Rotate Shift Left
 WHEN "10011" =>
 Result<=to_stdlogicvector(to_bitvector(A) ror to_integer(unsigned(B))); --Rotate Shift Right
 WHEN "10100" =>
 Result<=to_stdlogicvector(to_bitvector(A) sll to_integer(unsigned(B))); --Logic Shift Left
 WHEN "10101" =>
 Result<=to_stdlogicvector(to_bitvector(A) srl to_integer(unsigned(B))); --Logic Shift Right
 WHEN "10110"=> --PASS A
 Result<= A;
 WHEN "10111"=> --PASS B
 Result<= B;
 when others => Result <= (others => 'Z');
end case;
end process;
 
O<=Result;
--Cout <= ('0' & A) + ('0' & B);
--Carry <= Cout(4);
 
end Behavioral;

