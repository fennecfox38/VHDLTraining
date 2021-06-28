library ieee;
use ieee.std_logic_1164.all;

entity FullAdder_4 is
    port (
        A, B : in std_logic_vector(3 downto 0);
        C_i  : in std_logic;
        C_o  : out std_logic;
        S    : out std_logic_vector(3 downto 0));
end FullAdder_4;

architecture Structural of FullAdder_4 is
    component FullAdder_1 is
        port (
            X, Y, C_in : in std_logic;
            C_out, Sum : out std_logic);
    end component;
    signal C : std_logic_vector(3 downto 0);
begin
    FA0 : FullAdder_1 port map(A(0), B(0), C_i, C(1), S(0));
    FA1 : FullAdder_1 port map(A(1), B(1), C(1), C(2), S(1));
    FA2 : FullAdder_1 port map(A(2), B(2), C(2), C(3), S(2));
    FA3 : FullAdder_1 port map(A(3), B(3), C(3), C_o, S(3));
end Structural;