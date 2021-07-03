library ieee;
use ieee.std_logic_1164.all;

entity TB_SR_FF is
end TB_SR_FF;

architecture TestBench of TB_SR_FF is
    component SR_FF is
        port (
            S, R, CLK : in std_logic;
            Q, notQ   : out std_logic
        );
    end component;
    signal CLK           : std_logic := '0';
    signal S, R, Q, notQ : std_logic;
begin
    dut : SR_FF port map(S, R, CLK, Q, notQ);

    process(CLK)
    begin
        CLK <= not CLK after 2 ns;
    end process;

    process begin
        S <= '1'; R <= '0'; wait for 3 ns;
        S <= '0'; R <= '1'; wait for 4 ns;
        S <= '1'; R <= '0'; wait for 4 ns;
        S <= '0'; R <= '0'; wait for 4 ns;
        wait;
    end process;
end TestBench;