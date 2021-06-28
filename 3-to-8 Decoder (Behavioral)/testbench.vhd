use std.env.stop;
library ieee;
use ieee.std_logic_1164.all;

entity TestBench is
end TestBench;

architecture TestBench of TestBench is
    component Decoder_3_8 is
        port (
            Input  : in std_logic_vector(2 downto 0);
            Output : out std_logic_vector(7 downto 0));
    end component;

    signal Input  : std_logic_vector(2 downto 0) := "000";
    signal Output : std_logic_vector(7 downto 0);

begin
    dut : Decoder_3_8 port map(Input => Input, Output => Output);

    process begin
        wait for 10 ns;
        Input(0) <= not Input(0);
    end process;

    process begin
        wait for 20 ns;
        Input(1) <= not Input(1);
    end process;

    process
        variable cnt : integer := 2;
    begin
        wait for 40 ns;
        Input(2) <= not Input(2);
        cnt := cnt-1;
        if cnt = 0 then
            wait for 1 ns;
            stop;
        end if;
    end process;
end TestBench;