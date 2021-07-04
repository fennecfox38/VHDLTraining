library ieee;
use ieee.std_logic_1164.all;

entity TB_D_FF_CLR_PRE is
end TB_D_FF_CLR_PRE;

architecture TestBench of TB_D_FF_CLR_PRE is
    component D_FF_CLR_PRE is
        port (
            D, CLK, CLR, PRE : in std_logic;
            Q, notQ          : out std_logic);
    end component;
    signal CLK                  : std_logic := '0';
    signal D, CLR, PRE, Q, notQ : std_logic;

begin
    dut : D_FF_CLR_PRE port map(D, CLK, CLR, PRE, Q, notQ);

    process (CLK) begin
        CLK <= not CLK after 2 ns;
    end process;

    process begin
        D   <= '1', '0' after 8 ns;
        CLR <= '1', '0' after 4 ns;
        PRE <= '0', '1' after 11 ns, '0' after 12 ns;
        wait;
    end process;
end TestBench;