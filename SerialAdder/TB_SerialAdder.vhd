library ieee;
use ieee.std_logic_1164.all;

entity TB_SerialAdder is
end TB_SerialAdder;

architecture TestBench of TB_SerialAdder is
    component SerialAdder is
        port (
            X, Y, CLK : in std_logic;
            S         : out std_logic);
    end component;
    signal CLK : std_logic :='0';
    signal X,Y,S : std_logic;

begin
    dut : SerialAdder port map(X=>X,Y=>Y,CLK=>CLK,S=>S);

    process (CLK) begin
        CLK <= not CLK after 2 ns;
    end process;

    process begin
        X<='1', '0' after 7 ns, '1' after 15 ns;
        Y<='0', '1' after 3 ns, '0' after 11 ns;
        wait;
    end process;
end TestBench;