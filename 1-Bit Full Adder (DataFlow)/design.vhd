library ieee;
use ieee.std_logic_1164.all;

entity FullAdder is
    port (
        X, Y, C_in : in std_logic;
        C_out, Sum : out std_logic);
end FullAdder;

architecture DataFlow of FullAdder is
begin
    Sum   <= X xor Y xor C_in;
    C_out <= (X and Y) or (X and C_in) or (Y and C_in);
end DataFlow;