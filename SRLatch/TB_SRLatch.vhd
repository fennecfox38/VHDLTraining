library ieee;
use ieee.std_logic_1164.all;

entity TB_SRLatch is
end TB_SRLatch;

architecture TestBench of TB_SRLatch is
    component SRLatch is
        port (
            S, R    : in std_logic;
            Q, notQ : out std_logic
        );
    end component;
    signal S, R    : std_logic;
    signal Q, notQ : std_logic;

begin
    dut : SRLatch port map(S => S, R => R, Q => Q, notQ => notQ);

    process begin
        S <= '0';
        R <= '0';
        wait for 2 ns;
        S <= '0';
        R <= '1';
        wait for 2 ns;
        S <= '1';
        R <= '0';
        wait for 2 ns;
        S <= '0';
        R <= '0';
        wait for 2 ns;
        S <= '0';
        R <= '1';
        wait for 2 ns;
        S <= '0';
        R <= '0';
        wait for 2 ns;
        wait;
    end process;
end TestBench;