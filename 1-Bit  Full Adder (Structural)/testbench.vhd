--https://www.edaplayground.com/x/PnjH
library ieee;
use ieee.std_logic_1164.all;

entity TestBench is
end TestBench;

architecture TestBench of TestBench is
    component FullAdder
        port (
            X, Y, C_in : in std_logic;
            C_out, Sum : out std_logic);
    end component;

    signal X, Y, C_in : std_logic := '0';
    signal C_out, Sum : std_logic;

begin

    dut : FullAdder port map(
        X => X, Y => Y, C_in => C_in,
        C_out => C_out, Sum => Sum);

    process begin
        wait for 40 ns;
        X <= not X;
    end process;

    process begin
        wait for 20 ns;
        Y <= not Y;
    end process;

    process begin
        wait for 10 ns;
        C_in <= not C_in;
    end process;

end TestBench;