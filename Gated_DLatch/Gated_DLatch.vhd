library ieee;
use ieee.std_logic_1164.all;

entity Gated_DLatch is
    port (
        D, G    : in std_logic;
        Q, notQ : out std_logic);
end Gated_DLatch;

architecture Behavioral of Gated_DLatch is
begin
    process (D,G)
    begin
        if G='1' then
            Q <= D;
            notQ <= not D;
        --else
        --    Q <= '0' when Q='U';
        --    notQ <= '1' when notQ='U';
        end if;
    end process;
end Behavioral;

--architecture Structural of Gated_DLatch is
--    component SRLatch is
--        port (
--            S, R    : in std_logic;
--            Q, notQ : out std_logic
--        );
--    end component;
--    signal S, R : std_logic;
--
--begin
--    Latch : SRLatch port map(S => S, R => R, Q => Q, notQ => notQ);
--    S <= D and G;
--    R <= not D and G;
--end Structural;
