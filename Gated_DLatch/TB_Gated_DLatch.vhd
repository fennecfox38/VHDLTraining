library ieee;
use ieee.std_logic_1164.all;

entity TB_Gated_DLatch is
end TB_Gated_DLatch;

architecture TestBench of TB_Gated_DLatch is
    component Gated_DLatch is
        port (
            D, G    : in std_logic;
            Q, notQ : out std_logic);
    end component;
    signal D, G    : std_logic;
    signal Q, notQ : std_logic := 'Z';

begin
    dut : Gated_DLatch port map(D, G, Q, notQ);

    process begin
        D <= '0';
        G <= '0';
        wait for 1 ns;
        D <= '1';
        G <= '0';
        wait for 1 ns;
        D <= '0';
        G <= '0';
        wait for 1 ns;
        D <= '1';
        G <= '0';
        wait for 1 ns;
        D <= '1';
        G <= '1';
        wait for 1 ns;
        D <= '0';
        G <= '1';
        wait for 1 ns;
        D <= '1';
        G <= '1';
        wait for 2 ns;
        D <= '0';
        G <= '1';
        wait for 2 ns;
        D <= '1';
        G <= '1';
        wait for 1 ns;
        D <= '1';
        G <= '0';
        wait for 1 ns;
        D <= '0';
        G <= '0';
        wait for 1 ns;
        wait;
    end process;
end TestBench;