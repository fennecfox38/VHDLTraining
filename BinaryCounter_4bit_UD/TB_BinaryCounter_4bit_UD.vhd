library ieee;
use ieee.std_logic_1164.all;

entity TB_BinaryCounter_4bit_UD is
end entity;

architecture TestBench of TB_BinaryCounter_4bit_UD is
    component BinaryCounter_4bit_UD is
        port (
            CLK, Down : in std_logic;
            O         : out std_logic_vector(3 downto 0));
    end component;
    signal CLK, Down : std_logic := '0';
    signal O         : std_logic_vector(3 downto 0);

begin
    dut : BinaryCounter_4bit_UD port map(CLK => CLK, Down=>Down, O => O);

    process (CLK) begin
        CLK <= not CLK after 2 ns;
    end process;

    process begin
        Down <= '0', '1' after 64 ns;
        wait;
    end process;
end TestBench;