library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;
use work.custom_pack.all;

entity TopModule is
generic (dw: integer:=4;
        dws: integer:=5;
        dwm: integer:=2;
        rows: integer:=4;
        cols: integer:=4);
Port ( A,B : in ARR_1D(0 to COLS-1) (DW-1 downto 0);
Y : out ARRAY_2D(0 to ROWS-1,0 to COLS-1) (DW-1 downto 0);
CLK: in std_logic;
W_ENA,W_ENB,W_ENOP,W_ENY: in ARR_EN2D(0 to ROWS-1,0 to COLS-1);
SELMA,SELMB: in ARRAY_2D(0 to ROWS-1,0 to COLS-1)(DWM-1 downto 0);  
SELCU : in ARRAY_2D(0 to ROWS-1,0 to COLS-1)(DWS-1 downto 0));
end TopModule;

architecture Behavioral of TopModule is
SIGNAL AI0m,AI1m,AI2m,AI3m : ARRAY_2D(0 to ROWS-1,0 to COLS-1) (DW-1 downto 0);
SIGNAL BI0m,BI1m,BI2m,BI3m : ARRAY_2D(0 to ROWS-1,0 to COLS-1) (DW-1 downto 0);
SIGNAL MUXA,MUXB:ARRAY_2D(0 to ROWS-1,0 to COLS-1) (DW-1 downto 0);
SIGNAL As,Bs:ARRAY_2D(0 to ROWS-1,0 to COLS-1) (DW-1 downto 0);
SIGNAL REGOPs:ARRAY_2D(0 to ROWS-1,0 to COLS-1) (DWS-1 downto 0);
SIGNAL CUo : ARRAY_2D(0 to ROWS-1,0 to COLS-1) (DW-1 downto 0);
SIGNAL REGYo : ARRAY_2D(0 to ROWS-1,0 to COLS-1) (DW-1 downto 0);

begin
--AI0M<=((A(0),REGYo(3,0),"0000","0000"),
--       (A(0),REGYo(3,0),"0000","0000"),
--       (A(0),REGYo(3,0),"0000","0000"),
--       (A(0),REGYo(3,0),"0000","0000"));
--AI0m(0,0)<=A(0);AI0m(0,1)<=A(1);AI0m(0,2)<=A(2);AI0m(0,3)<=A(3);
--BI0m(0,0)<=B(0);BI0m(0,1)<=B(1);BI0m(0,2)<=B(2);BI0m(0,3)<=B(3);
--AI1m(0,0)<=REGYo(3,0);AI1m(0,1)<=A(1);AI1m(1,0)<=A(2);AI1m(1,1)<=A(3);
--BI1m(0,0)<=B(0);BI1m(0,1)<=B(1);BI1m(1,0)<=B(2);BI1m(1,1)<=B(3);
--REGYo(0,0)<=Y(0);REGYo(0,1)<=Y(1);REGYo(1,0)<=Y(2);REGYo(1,1)<=Y(3);

-------------------------------ROW0-----COL0------------------------------------------
AI0m(0,0)<=A(0);AI1m(0,0)<=REGYo(3,0);AI2m(0,0)<="0000";AI3m(0,0)<="0000";
BI0m(0,0)<=B(0);BI1m(0,0)<=REGYo(3,0);BI2m(0,0)<="0000";BI3m(0,0)<="0000";
--------------------------------------------------------------------------------------
-------------------------------ROW0-----COL1------------------------------------------
AI0m(0,1)<=A(1);AI1m(0,1)<=REGYo(0,0);AI2m(0,1)<=REGYo(3,1);AI3m(0,1)<="0000";
BI0m(0,1)<=B(1);BI1m(0,1)<=REGYo(0,0);BI2m(0,1)<=REGYo(3,1);BI3m(0,1)<="0000";
--------------------------------------------------------------------------------------
---------------------------------ROW0------COL2------------------------------------------
AI0m(0,2)<=A(2);AI1m(0,2)<=REGYo(0,0);AI2m(0,2)<=REGYo(3,2);AI3m(0,2)<="0000";
BI0m(0,2)<=B(2);BI1m(0,2)<=REGYo(0,0);BI2m(0,2)<=REGYo(3,2);BI3m(0,2)<="0000";
----------------------------------------------------------------------------------
-----------------------------ROW0----COL3---------------------------------
AI0m(0,3)<=A(3);AI1m(0,3)<=REGYo(0,0);AI2m(0,3)<=REGYo(3,3);AI3m(0,3)<="0000";
BI0m(0,3)<=B(3);BI1m(0,3)<=REGYo(0,0);BI2m(0,3)<=REGYo(3,3);BI3m(0,3)<="0000";
-------------------------------------------------------------------------------------
-----------ROW1-------COL0--------------CU(1,0)----------------
AI0m(1,0)<=REGYo(0,0);AI1m(1,0)<="0000";AI2m(1,0)<="0000";AI3m(1,0)<="0000";
BI0m(1,0)<=REGYo(0,0);BI1m(1,0)<="0000";BI2m(1,0)<="0000";BI3m(1,0)<="0000";
--------------------------------------------------------------------------------------
-----------------------------------ROW1------COL1---------CU(1,1)-----------------------
AI0m(1,1)<=REGYo(0,1);AI1m(1,1)<=REGYo(1,0);AI2m(1,1)<="0000";AI3m(1,1)<="0000";
BI0m(1,1)<=REGYo(0,1);BI1m(1,1)<=REGYo(1,0);BI2m(1,1)<="0000";BI3m(1,1)<="0000";
------------------------------------------------------------------------------------------
-------------------------------------ROW1------COL2---CU(1,2)-----------------------------
AI0m(1,2)<=REGYo(0,2);AI1m(1,2)<=REGYo(1,0);AI2m(1,2)<="0000";AI3m(1,2)<="0000";
BI0m(1,2)<=REGYo(0,2);BI1m(1,2)<=REGYo(1,0);BI2m(1,2)<="0000";BI3m(1,2)<="0000";
------------------------------------------------------------------------------------------
----------------------------------ROW1-----COL3----CU(1,3)--------------------------------
AI0m(1,3)<=REGYo(0,3);AI1m(1,3)<=REGYo(1,0);AI2m(1,3)<="0000";AI3m(1,3)<="0000";
BI0m(1,3)<=REGYo(0,3);BI1m(1,3)<=REGYo(1,0);BI2m(1,3)<="0000";BI3m(1,3)<="0000";
------------------------------------------------------------------------------------------
---------------------------ROW2---------COL0----CU(2,0)----------------------
AI0m(2,0)<=REGYo(0,0);AI1m(2,0)<=REGYo(1,0);AI2m(2,0)<="0000";AI3m(2,0)<="0000";
BI0m(2,0)<=REGYo(0,0);BI1m(2,0)<=REGYo(1,0);BI2m(2,0)<="0000";BI3m(2,0)<="0000";
------------------------------------------------------------------------------
--------------------------------------ROW2---COL1--CU(2,1)-------------------------------
AI0m(2,1)<=REGYo(0,1);AI1m(2,1)<=REGYo(1,1);AI2m(2,1)<=REGYo(2,0);AI3m(2,1)<="0000";
BI0m(2,1)<=REGYo(0,1);BI1m(2,1)<=REGYo(1,1);BI2m(2,1)<=REGYo(2,0);BI3m(2,1)<="0000";
---------------------------------------------------------------------------------------
------------------------------------ROW2----COL2----CU(2,2)----------------
AI0m(2,2)<=REGYo(0,2);AI1m(2,2)<=REGYo(1,2);AI2m(2,2)<=REGYo(2,0);AI3m(2,2)<="0000";
BI0m(2,2)<=REGYo(0,2);BI1m(2,2)<=REGYo(1,2);BI2m(2,2)<=REGYo(2,0);BI3m(2,2)<="0000";
-------------------------------------------------------------------------------------------
---------------------------------------ROW2-----COL3----CU(2,3)---------
AI0m(2,3)<=REGYo(0,3);AI1m(2,3)<=REGYo(1,3);AI2m(2,3)<=REGYo(2,0);AI3m(2,3)<="0000";
BI0m(2,3)<=REGYo(0,3);BI1m(2,3)<=REGYo(1,3);BI2m(2,3)<=REGYo(2,0);BI3m(2,3)<="0000";
----------------------------------------------------------------------------------------
----------------------------------------------ROW3-----COL0----CU(3,0)---------------
AI0m(3,0)<=REGYo(1,0);AI1m(3,0)<=REGYo(2,0);AI2m(3,0)<="0000";AI3m(3,0)<="0000";
BI0m(3,0)<=REGYo(1,0);BI1m(3,0)<=REGYo(2,0);BI2m(3,0)<="0000";BI3m(3,0)<="0000";
-------------------------------------------------------------------
----------------------------------------ROW3-----COL1----CU(3,1)-------
AI0m(3,1)<=REGYo(1,1);AI1m(3,1)<=REGYo(2,1);AI2m(3,1)<=REGYo(3,0);AI3m(3,1)<="0000";
BI0m(3,1)<=REGYo(1,1);BI1m(3,1)<=REGYo(2,1);BI2m(3,1)<=REGYo(3,0);BI3m(3,1)<="0000";
----------------------------------------------------------------------------------------
--------------------------------ROW3----COL2---CU(3,2)-----------
AI0m(3,2)<=REGYo(1,2);AI1m(3,2)<=REGYo(2,2);AI2m(3,2)<=REGYo(3,0);AI3m(3,2)<="0000";
BI0m(3,2)<=REGYo(1,2);BI1m(3,2)<=REGYo(2,2);BI2m(3,2)<=REGYo(3,0);BI3m(3,2)<="0000";
----------------------------------------------------------------------------------------
-------------------------------------ROW3-----COL3----CU(3,3)--------------------------
AI0m(3,3)<=REGYo(1,3);AI1m(3,3)<=REGYo(2,3);AI2m(3,3)<=REGYo(3,0);AI3m(3,3)<="0000";
BI0m(3,3)<=REGYo(1,3);BI1m(3,3)<=REGYo(2,3);BI2m(3,3)<=REGYo(3,0);BI3m(3,3)<="0000";
----------------------------------------------------------------------------------------
ROWS_PROC: FOR I IN 0 TO ROWS-1 GENERATE
       COLS_PROC: FOR J IN 0 TO COLS-1 GENERATE 
--            CU_RES_INST: entity work.CU_REG(Behavioral)
--            GENERIC MAP(dw=>dw,dws=>dws,dwm=>dwm,COLS=>COLS)
--            PORT MAP(A=>A(I,J),B=>Bs(I,J),SELMA=>SELMA(I,J),SELMB=>SELMB(I,J),
--            O=>Ys(I,J),CLK=>CLK,W_EN=>W_EN,SELCU=>SELCU(I,J));
CU_INST: entity work.CU_6(Behavioral)
generic map(dw=>dw,dws=>dws)
port map(A=>As(I,J), B=>Bs(I,J), O=>CUO(I,J), SEL=>REGOPs(I,J));

MUX1A_INST: entity work.MUX4X1(Behavioral)
generic map(dw=>dw,dwm=>dwm)
port map(A=>AI0m(I,J), B=>AI1m(I,J), C=>AI2m(I,J), D=>AI3m(I,J),Sel=>SELMA(I,J), Z=>MUXA(I,J));

MUXB_INST: entity work.MUX4X1(Behavioral)
generic map(dw=>dw,dwm=>dwm)
port map(A=>BI0m(I,J), B=>BI1m(I,J), C=>BI2m(I,J), D=>BI3m(I,J),Sel=>SELMB(I,J), Z=>MUXB(I,J));

REGA_INST: entity work.REG_D(Behavioral)
generic map(dw=>dw)
port map( D=>MUXA(I,J), W_EN=>W_ENA(I,J), CLK=>CLK,Q=>As(I,J));

REGB_INST: entity work.REG_D(Behavioral)
generic map(dw=>dw)
port map( D=>MUXB(I,J), W_EN=>W_ENB(I,J), CLK=>CLK,Q=>Bs(I,J));

REGOP_INST: entity work.REG_D(Behavioral)
generic map(dw=>dws)
port map( D=>SELCU(I,J), W_EN=>W_ENOP(I,J), CLK=>CLK,Q=>REGOPs(I,J));

REGY_INST: entity work.REG_D(Behavioral)
generic map(dw=>dw)
port map( D=>CUO(I,J), W_EN=>W_ENY(I,J), CLK=>CLK,Q=>REGYo(I,J) );

OUTPUT_INST: Y(I,J)<=REGYo(I,J);
        
        end generate COLS_PROC;
end generate ROWS_PROC;
          
end Behavioral;
