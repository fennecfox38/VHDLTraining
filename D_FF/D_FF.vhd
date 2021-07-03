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
        --else
        --    Q <= '0' when Q='U';
        --    notQ <='1' when notQ='U';
        end if;
    end process;
end Behavioral;

--architecture Structural of D_FF is
--    component Gated_DLatch is
--        port (
--            D, G    : in std_logic;
--            Q, notQ : out std_logic);
--    end component;
--    signal P : std_logic;
--
--begin
--    Latch1 : Gated_DLatch port map(D=>D,G=>(not CLK),Q=>P);
--    Latch2 : Gated_DLatch port map(D=>P,G=>CLK,Q=>Q,notQ=>notQ);
--end Structural;