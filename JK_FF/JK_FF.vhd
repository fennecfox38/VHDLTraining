library ieee;
use ieee.std_logic_1164.all;

entity JK_FF is
    port (
        J, K, CLK : in std_logic;
        Q, notQ   : out std_logic
    );
end JK_FF;

architecture Behavioral of JK_FF is
begin
    process (CLK)
        variable tmp : std_logic := Q;
    begin
        if (CLK = '1' and CLK'event) then
            if (J = '0' and K = '0') then
                tmp := tmp;
            elsif (J = '0' and K = '1') then
                tmp := '0';
            elsif (J = '1' and K = '0') then
                tmp := '1';
            else
                tmp := not tmp;
            end if;
            Q    <= tmp;
            notQ <= not tmp;
        end if;
    end process;
end Behavioral;