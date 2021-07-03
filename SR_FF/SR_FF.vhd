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

--architecture Structural of SR_FF is
--    component SRLatch is
--        port (
--            S, R    : in std_logic;
--            Q, notQ : out std_logic
--        );
--    end component;
--    signal P, notP : std_logic;
--
--begin
--    Master: SRLatch port map(S=>(S and not CLK), R=>(R and not CLK), Q=>P, notQ=>notP);
--    Slave : SRLatch port map(S=>(P and CLK), R=>(notP and CLK), Q=>Q, notQ=>notQ);
--end Structural;