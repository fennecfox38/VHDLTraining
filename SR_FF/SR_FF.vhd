library ieee;
use ieee.std_logic_1164.all;

entity SR_FF is
    port (
        S, R, CLK : in std_logic;
        Q, notQ   : out std_logic
    );
end SR_FF;

architecture Behavioral of SR_FF is
begin
    process (CLK)
        variable tmp : std_logic := Q;
    begin
        if (CLK = '1' and CLK'event) then
            if (S = '0' and R = '0') then
                tmp := tmp;
            elsif (S = '0' and R = '1') then
                tmp := '0';
            elsif (S = '1' and R = '0') then
                tmp := '1';
            else
                tmp := 'Z';
            end if;
            Q    <= tmp;
            notQ <= not tmp;
        end if;
    end process;
end Behavioral;