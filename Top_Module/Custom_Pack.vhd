library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


package custom_pack is 

subtype dim1 is std_logic_vector;
type arr_1d is array(natural range<>) of dim1;
type array_2d is array(natural range<>,natural range<>) of dim1;
type arr_en2d is array(natural range<>,natural range<>) of std_logic;
end package custom_pack;
