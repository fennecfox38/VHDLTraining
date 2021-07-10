library ieee;
use ieee.std_logic_1164.all;

entity TB_ShiftRegister_4_Right is
end TB_ShiftRegister_4_Right;

architecture TestBench of TB_ShiftRegister_4_Right is
    component ShiftRegister_4_Right is
        port (
            I              : in std_logic_vector(3 downto 0);
            SI, Sh, L, CLK : in std_logic;
            O              : out std_logic_vector(3 downto 0));
    end component;
    signal CLK       : std_logic := '0';
    signal SI, Sh, L : std_logic;
begin
    dut : ShiftRegister_4_Right port map(
        I   => "1011",
        SI  => SI,
        Sh  => Sh,
        L   => L,
        CLK => CLK);

    process (CLK) begin
        CLK <= not CLK after 2 ns;
    end process;

    process begin
        SI <= '0', '1' after 12 ns;
        L  <= '1', '0' after 4 ns;
        Sh <= '0', '1' after 4 ns, '0' after 20 ns;
        wait;
    end process;

end TestBench;