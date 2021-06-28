library ieee;
use ieee.std_logic_1164.all;

entity TestBench is                    -- Entity TestBench for test bench
end TestBench;                         -- No I/O port description because there is no external I/O

architecture TestBench of TestBench is -- architecture TestBench for test bench
    component FullAdder_4 is               -- 4-bit full adder component (TestBench Target)
        port (
            A, B : in std_logic_vector(3 downto 0);   -- 4-bit bus input A and B
            C_i  : in std_logic;                      -- Carry-in
            C_o  : out std_logic;                     -- Carry-out
            S    : out std_logic_vector(3 downto 0)); -- 4-bit bus output S (Sum of A and B)
    end component;

    signal A   : std_logic_vector(3 downto 0) := "0101"; -- Signal corresponding to input A (Initial Value: 0101)
    signal B   : std_logic_vector(3 downto 0) := "1001"; -- Signal corresponding to input B (Initial Value: 1001)
    signal C_i : std_logic                    := '0';    -- Signal corresponding to input C_i (Initial Value: 0)
    signal S   : std_logic_vector(3 downto 0);           -- Signal corresponding to output S
    signal C_o : std_logic;                              -- Signal corresponding to output C_o

begin               -- dut: Instance of FullAdder_4. Signals defined above are mapped to ports.
    dut : FullAdder_4 port map(A => A, B => B, C_i => C_i, C_o => C_o, S => S);

    process
        variable cnt : integer := 12;
    begin
        wait for 2 ns;                      -- hold 2 ns. (this will make repeat following command in every 2 ns.)
        A <= "1011" when A(3) = '0'         -- Assign 1011 to A when A is 0101 (A(3) is 0),
            else "0101" when A(3) = '1';    -- other than 0101 when A is 1011 (A(3) is 1).
        cnt := cnt-1;                       -- count off cnt
        if cnt=0 then wait; end if;         -- 12 of 2 ns (24 ns) has elapsed. Terminate process.
    end process;

    process
        variable cnt : integer := 5;
    begin
        wait for 5 ns;                      -- hold 5 ns. (this will make repeat following command in every 5 ns.)
        B <= B srl 1;                       -- Assign 1-bit shift rotate left operation on B to B.
        cnt := cnt-1;                       -- count off cnt
        if cnt=0 then wait; end if;         -- 5 of 5 ns (25 ns) has elapsed. Terminate process.
    end process;

    process
        variable cnt : integer := 8;
    begin
        wait for 3 ns;                      -- hold 3 ns. (this will make repeat following command in every 3 ns.)
        C_i <= not C_i;                     -- Invert C_i.
        cnt := cnt-1;                       -- count off cnt
        if cnt=0 then wait; end if;         -- 8 of 3 ns (24 ns) has elapsed. Terminate process.
    end process;

end TestBench;