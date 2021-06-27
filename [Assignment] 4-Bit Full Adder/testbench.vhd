--https://www.edaplayground.com/x/A8im
library ieee;
use ieee.std_logic_1164.all;

entity TestBench is                    -- 테스트벤치를 위한 Entity TestBench 
end TestBench;                         -- 외부 입출력이 없기때문에 입출력 포트 정보는 필요 없음.

architecture TestBench of TestBench is -- 테스트벤치를 위한 architecture TestBench
    component FullAdder_4 is               -- 4비트 전가산기의 컴포넌트 (TestBench Target)
        port (
            A, B : in std_logic_vector(3 downto 0);   -- 4비트 입력 A와 B
            C_i  : in std_logic;                      -- Carry-in
            C_o  : out std_logic;                     -- Carry-out
            S    : out std_logic_vector(3 downto 0)); -- 4비트 출력 S (A와 B의 합)
    end component;

    signal A   : std_logic_vector(3 downto 0) := "0101"; -- 입력 A에 대응하는 신호 (초기값 0101)
    signal B   : std_logic_vector(3 downto 0) := "1001"; -- 입력 B에 대응하는 신호 (초기값 1001)
    signal C_i : std_logic                    := '0';    -- 입력 C_i에 대응하는 신호 (초기값 0)
    signal S   : std_logic_vector(3 downto 0);           -- 출력 S에 대응하는 신호
    signal C_o : std_logic;                              -- 출력 C_o에 대응하는 신호

begin               -- dut: FullAdder_4의 인스턴스. 앞서 선언한 신호들이 각 포트로 연결된다.
    dut : FullAdder_4 port map(A => A, B => B, C_i => C_i, C_o => C_o, S => S);

    process begin
        wait for 2 ns;                      -- 2 ns 후 (매 2 ns 마다)
        A <= "1011" when A(3) = '0'         -- A가 0101이면 (A3가 0) 1011로,
            else "0101" when A(3) = '1';    -- A가 1011이면 (A3가 1) 0101로 바꾼다.
    end process;

    process begin
        wait for 5 ns;                      -- 5 ns 후 (매 5 ns 마다)
        B <= B srl 1;                       -- B에 1만큼의 shift rotate left 연산을 적용
    end process;

    process begin
        wait for 3 ns;                      -- 3 ns 후 (매 3 ns 마다)
        C_i <= not C_i;                     -- C_i를 반전시킨다.
    end process;

end TestBench;