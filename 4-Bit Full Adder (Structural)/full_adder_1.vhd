--https://www.edaplayground.com/x/h5ed
library ieee;
use ieee.std_logic_1164.all;

entity FullAdder_1 is
    port (
        X, Y, C_in : in std_logic;
        C_out, Sum : out std_logic);
end FullAdder_1;

architecture DataFlow of FullAdder_1 is
begin
    Sum   <= X xor Y xor C_in;
    C_out <= (X and Y) or (C_in and X) or (C_in and Y);
end DataFlow;