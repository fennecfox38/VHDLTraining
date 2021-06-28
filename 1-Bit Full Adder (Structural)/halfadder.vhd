library ieee;
use ieee.std_logic_1164.all;

entity HalfAdder is
    port (
        X, Y : in std_logic;
        C, S : out std_logic);
end HalfAdder;

architecture DataFlow of HalfAdder is
begin
    S <= X xor Y;
    C <= X and Y;
end DataFlow;