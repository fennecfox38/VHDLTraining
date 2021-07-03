library ieee;
use ieee.std_logic_1164.all;

entity TB_JK_FF is
end TB_JK_FF;

architecture TestBench of TB_JK_FF is
    component JK_FF is
        port (
            J, K, CLK : in std_logic;
            Q, notQ   : out std_logic
        );
    end component;
    signal CLK           : std_logic := '0';
    signal J, K, Q, notQ : std_logic;
begin
    dut : JK_FF port map(J, K, CLK, Q, notQ);

    process(CLK)
    begin
        CLK <= not CLK after 2 ns;
    end process;

    process begin
        J <= '1'; K <= '0'; wait for 3 ns;
        J <= '0'; K <= '1'; wait for 4 ns;
        J <= '1'; K <= '1'; wait for 4 ns;
        J <= '0'; K <= '0'; wait for 4 ns;
        J <= '1'; K <= '1'; wait for 4 ns;
        wait;
    end process;
end TestBench;