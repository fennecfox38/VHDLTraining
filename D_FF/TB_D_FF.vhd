library ieee;
use ieee.std_logic_1164.all;

entity TB_D_FF is
end TB_D_FF;

architecture TestBench of TB_D_FF is
    component D_FF is
        port (
            D, CLK  : in std_logic;
            Q, notQ : out std_logic);
    end component;
    signal CLK        : std_logic := '0';
    signal D, Q, notQ : std_logic;

begin
    dut : D_FF port map(D, CLK, Q, notQ);

    process (CLK)
    begin
        CLK <= not CLK after 2 ns;
    end process;

    process begin
        D <= '0';
        wait for 3 ns;
        D <= '1';
        wait for 4 ns;
        D <= '0';
        wait for 4 ns;
        D <= '1';
        wait for 4 ns;
        D <= '1';
        wait for 4 ns;
    end process;
end TestBench;