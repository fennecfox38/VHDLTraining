library ieee;
use ieee.std_logic_1164.all;                -- Use type 'std_logic'

entity FullAdder_1 is                       -- Entity of single-bit full adder (Describe I/O Port)
    port (
        X, Y, C_in : in std_logic;          -- Input X, Y and C_in(Carry in)
        C_out, Sum : out std_logic);        -- Output Sum and C_out(Carry Out)
end FullAdder_1;

architecture DataFlow of FullAdder_1 is     -- Dataflow Modeling for 1 bit full adder
begin
    Sum   <= (X and Y and C_in) or (X and not Y and not C_in) or (not X and Y and not C_in) or (not X and not Y and C_in);
    C_out <= (X and Y) or (C_in and X) or (C_in and Y);
end DataFlow;