library ieee;
use ieee.std_logic_1164.all;

entity TB_FullAdder_1 is
end TB_FullAdder_1;

architecture TestBench of TB_FullAdder_1 is
    component FullAdder_1
        port (
            X, Y, C_in : in std_logic;
            C_out, Sum : out std_logic);
    end component;

    signal X, Y, C_in : std_logic := '0';
    signal C_out, Sum : std_logic;

begin

    dut : FullAdder_1 port map(
        X => X, Y => Y, C_in => C_in,
        C_out => C_out, Sum => Sum);

    process begin
        wait for 4 ns;
        X <= not X;
    end process;

    process begin
        wait for 2 ns;
        Y <= not Y;
    end process;

    process begin
        wait for 1 ns;
        C_in <= not C_in;
    end process;

end TestBench;