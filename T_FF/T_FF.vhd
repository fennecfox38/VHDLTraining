library ieee;
use ieee.std_logic_1164.all;

entity T_FF is
    port (
        T, CLK  : in std_logic;
        Q, notQ : out std_logic);
end T_FF;

architecture Behavioral of T_FF is
begin
    process (CLK)
    begin
        if (Q = 'U') then
            Q    <= '0';
            notQ <= '1';
        end if;
        if (CLK = '1' and CLK'event and T='1') then
            Q <= not Q;
            notQ <= not notQ;
        end if;
    end process;
end Behavioral;

--architecture Structural of T_FF is
--    component JK_FF is
--        port (
--            J, K, CLK : in std_logic;
--            Q, notQ   : out std_logic);
--    end component;
--
--begin
--    FF : JK_FF port map(J => T, K => T, CLK => CLK, Q => Q, notQ => notQ);
--end Structural;