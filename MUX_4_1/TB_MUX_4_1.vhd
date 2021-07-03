library ieee;
use ieee.std_logic_1164.all;

entity TB_MUX_4_1 is
end TB_MUX_4_1;

architecture TestBench of TB_MUX_4_1 is
    component MUX_4_1 is
        port (
            Input  : in std_logic_vector(3 downto 0);
            Sel    : in std_logic_vector(1 downto 0);
            Output : out std_logic);
    end component;

    signal Input  : std_logic_vector(3 downto 0) := "0101";
    signal Sel    : std_logic_vector(1 downto 0);
    signal Output : std_logic;

begin
    dut : MUX_4_1 port map(Input=>Input, Sel=>Sel, Output=>Output);

    process
    begin
        Sel <= "00"; wait for 1 ns;
        Sel <= "01"; wait for 1 ns;
        Sel <= "10"; wait for 1 ns;
        Sel <= "11"; wait for 1 ns;
        wait;
    end process;

end TestBench;