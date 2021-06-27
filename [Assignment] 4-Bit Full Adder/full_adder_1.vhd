--https://www.edaplayground.com/x/A8im
library ieee;
use ieee.std_logic_1164.all;                -- std_logic 형 이용.

entity FullAdder_1 is                       -- 단일비트 전가산기의 entity (입출력 포트)
    port (
        X, Y, C_in : in std_logic;          -- 입력 X, Y와 C_in(Carry in)
        C_out, Sum : out std_logic);        -- 출력 Sum과 C_out(Carry Out)
end FullAdder_1;

architecture DataFlow of FullAdder_1 is     -- 단일비트 전가산기의 데이터플로우 모델링
begin
    Sum   <= (X and Y and C_in) or (X and not Y and not C_in) or (not X and Y and not C_in) or (not X and not Y and C_in);
    C_out <= (X and Y) or (C_in and X) or (C_in and Y);
end DataFlow;