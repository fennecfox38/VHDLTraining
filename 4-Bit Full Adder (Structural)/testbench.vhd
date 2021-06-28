library ieee;
use ieee.std_logic_1164.all;

entity TestBench is
end TestBench;

architecture TestBench of TestBench is
    component FullAdder_4 is
        port (
            A, B : in std_logic_vector(3 downto 0);
            C_i  : in std_logic;
            C_o  : out std_logic;
            S    : out std_logic_vector(3 downto 0));
    end component;
    
    signal A : std_logic_vector(3 downto 0) := "0110";
    signal B : std_logic_vector(3 downto 0) := "0000";
    signal C_i  : std_logic                    := '0';
    signal S    : std_logic_vector(3 downto 0);
    signal C_o  : std_logic;

begin
    dut : FullAdder_4 port map(A => A, B => B, C_i => C_i, C_o => C_o, S => S);

    process begin wait for 1 ns; C_i <= not C_i; end process;
    process begin wait for 2 ns; B(0) <= not B(0); end process;
    process begin wait for 4 ns; B(1) <= not B(1); end process;
    process begin wait for 8 ns; B(2) <= not B(2); end process;
    process begin wait for 16 ns; B(3) <= not B(3); end process;

end TestBench;