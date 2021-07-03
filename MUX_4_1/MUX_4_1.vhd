library ieee;
use ieee.std_logic_1164.all;

entity MUX_4_1 is
    port (
        Input  : in std_logic_vector(3 downto 0);
        Sel    : in std_logic_vector(1 downto 0);
        Output : out std_logic);
end MUX_4_1;

architecture Behavioral of MUX_4_1 is
begin
    with Sel select
        Output <= Input(0) when "00",
        Input(1) when "01",
        Input(2) when "10",
        Input(3) when others;

end architecture;