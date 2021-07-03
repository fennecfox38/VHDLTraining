library ieee;
use ieee.std_logic_1164.all;

entity TB_T_FF is
end TB_T_FF;

architecture TestBench of TB_T_FF is
    component T_FF is
        port (
            T, CLK  : in std_logic;
            Q, notQ : out std_logic);
    end component;
    signal CLK  : std_logic := '0';
    signal T    : std_logic;
    signal Q    : std_logic := '0';
    signal notQ : std_logic := '1';

begin
    dut : T_FF port map(T, CLK, Q, notQ);

    process (CLK)
    begin
        CLK <= not CLK after 2 ns;
    end process;

    process begin
        T <= '0'; 
        wait for 3 ns;
        T <= '1';
        wait for 4 ns;
        T <= '0';
        wait for 4 ns;
        T <= '1';
        wait for 4 ns;
        T <= '1';
        wait for 4 ns;
        wait;
    end process;
end TestBench;