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

    signal X, Y, C_in : std_logic;
    signal C_out, Sum : std_logic;

begin

    dut : FullAdder port map(
        X => X, Y => Y, C_in => C_in,
        C_out => C_out, Sum => Sum);

    process begin
        X <= '0'; Y <='0'; C_in <= '0'; wait for 1 ns;
        X <= '0'; Y <='0'; C_in <= '1'; wait for 1 ns;
        X <= '0'; Y <='1'; C_in <= '0'; wait for 1 ns;
        X <= '0'; Y <='1'; C_in <= '1'; wait for 1 ns;
        X <= '1'; Y <='0'; C_in <= '0'; wait for 1 ns;
        X <= '1'; Y <='0'; C_in <= '1'; wait for 1 ns;
        X <= '1'; Y <='1'; C_in <= '0'; wait for 1 ns;
        X <= '1'; Y <='1'; C_in <= '1'; wait for 1 ns;
        wait;
    end process;

end TestBench;