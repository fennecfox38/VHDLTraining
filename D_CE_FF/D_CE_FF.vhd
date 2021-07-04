library ieee;
use ieee.std_logic_1164.all;

entity D_CE_FF is
    port (
        D, CE, CLK : in std_logic;
        Q, notQ    : out std_logic);
end D_CE_FF;

architecture Behavioral of D_CE_FF is
begin
    process (CE, CLK)
    begin
        if (CE = '1' and rising_edge(CLK)) then
            Q    <= D;
            notQ <= not D;
        end if;
    end process;
end Behavioral;

--architecture Structural of D_CE_FF is
--    component D_FF is
--        port (
--            D, CLK  : in std_logic;
--            Q, notQ : out std_logic);
--    end component;
--    signal D_in : std_logic;
--
--begin
--    FF : D_FF port map(D => D_in, CLK => CLK, Q => Q, notQ => notQ);
--    D_in <= D when CE = '1'
--        else Q;
--end Structural;