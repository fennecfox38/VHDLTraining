library ieee;
use ieee.std_logic_1164.all;

entity D_FF is
    port (
        D, CLK  : in std_logic;
        Q, notQ : out std_logic);
end D_FF;

architecture Behavioral of D_FF is
begin
    process (CLK)
    begin
        if (CLK = '1' and CLK'event) then
            Q    <= D;
            notQ <= not D;
        end if;
    end process;
end Behavioral;