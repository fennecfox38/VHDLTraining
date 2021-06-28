library ieee;
use ieee.std_logic_1164.all;                -- Use type 'std_logic's

entity FullAdder_4 is                       -- Entity of 4-bit Full Adder (Describe I/O port)
    port (
        A, B : in std_logic_vector(3 downto 0);     -- 4-bit Bus Input A and B
        C_i  : in std_logic;                        -- Carry-in
        C_o  : out std_logic;                       -- Carry-out
        S    : out std_logic_vector(3 downto 0));   -- 4-bit Bus Output S (Sum of A and B)
end FullAdder_4;

architecture Structural of FullAdder_4 is   -- Structural Modeling for 4 bit Full Adder
    component FullAdder_1 is                    -- Use 1-bit full adder component
        port (
            X, Y, C_in : in std_logic;          -- Input X, Y and C_in(Carry in)
            C_out, Sum : out std_logic);        -- Output Sum and C_out(Carry Out)
    end component;
    signal C : std_logic_vector(3 downto 0);    -- Carry signal connected to each full adders
begin
    FA0 : FullAdder_1 port map(A(0), B(0), C_i, C(1), S(0));    -- 0th Full Adder
    FA1 : FullAdder_1 port map(A(1), B(1), C(1), C(2), S(1));   -- 1st Full Adder
    FA2 : FullAdder_1 port map(A(2), B(2), C(2), C(3), S(2));   -- 2nd Full Adder
    FA3 : FullAdder_1 port map(A(3), B(3), C(3), C_o, S(3));    -- 3rd Full Adder
end Structural;