--https://www.edaplayground.com/x/PnjH
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

library ieee;
use ieee.std_logic_1164.all;

entity FullAdder is
    port (
        X, Y, C_in : in std_logic;
        C_out, Sum : out std_logic);
end FullAdder;

architecture Structural of FullAdder is
    component HalfAdder is
        port (
            X, Y : in std_logic;
            C, S : out std_logic);
    end component;

    signal C1, C2, Temp : std_logic;
begin
    HA1 : HalfAdder port map(X => X, Y => Y, C => C1, S => Temp);
    HA2 : HalfAdder port map(X => Temp, Y => C_in, C => C2, S => Sum);
    C_out <= C1 or C2;
end Structural;