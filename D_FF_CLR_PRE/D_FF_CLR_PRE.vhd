library ieee;
use ieee.std_logic_1164.all;

entity D_FF_CLR_PRE is
    port (
        D, CLK, CLR, PRE : in std_logic;
        Q, notQ          : out std_logic);
end D_FF_CLR_PRE;

architecture Behavioral of D_FF_CLR_PRE is
begin
    process (PRE, CLR, CLK) begin
        if ((PRE & CLR) = "11") then
            Q    <= 'Z';
            notQ <= 'Z';
        elsif ((PRE & CLR) = "10") then
            Q    <= '1';
            notQ <= '0';
        elsif ((PRE & CLR) = "01") then
            Q    <= '0';
            notQ <= '1';
        elsif rising_edge(CLK) then
            Q    <= D;
            notQ <= not D;
        end if;
    end process;
end Behavioral;