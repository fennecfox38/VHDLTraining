library ieee;
use ieee.std_logic_1164.all;

entity TB_D_CE_FF is
end TB_D_CE_FF;

architecture TestBench of TB_D_CE_FF is
    component D_CE_FF is
        port (
            D, CE, CLK : in std_logic;
            Q, notQ    : out std_logic);
    end component;
    signal CLK            : std_logic := '0';
    signal D, CE, Q, notQ : std_logic;

begin
    dut : D_CE_FF port map(D, CE, CLK, Q, notQ);

    process (CLK)
    begin
        CLK <= not CLK after 2 ns;
    end process;

    process begin
        D  <= '0';
        CE <= '1';
        wait for 3 ns;
        D <= '1';
        wait for 4 ns;
        D <= '0';
        wait for 4 ns;
        D <= '1';
        wait for 4 ns;
        D  <= '0';
        CE <= '0';
        wait for 4 ns;
        D  <= '1';
        CE <= '1';
        wait;
    end process;
end TestBench;