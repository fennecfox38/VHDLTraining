--https://www.edaplayground.com/x/A8im
library ieee;
use ieee.std_logic_1164.all;                -- std_logic 형 이용.

entity FullAdder_4 is                       -- 4비트 전가산기의 entity (입출력 포트)
    port (
        A, B : in std_logic_vector(3 downto 0);     -- 4비트 입력 A와 B
        C_i  : in std_logic;                        -- Carry-in
        C_o  : out std_logic;                       -- Carry-out
        S    : out std_logic_vector(3 downto 0));   -- 4비트 출력 S (A와 B의 합)
end FullAdder_4;

architecture Structural of FullAdder_4 is   -- 4비트 전가산기의 구조적 모델링
    component FullAdder_1 is                    -- 1비트 전가산기 컴포넌트 이용
        port (
            X, Y, C_in : in std_logic;          -- 입력 X, Y와 C_in(Carry in)
            C_out, Sum : out std_logic);        -- 출력 Sum과 C_out(Carry Out)
    end component;
    signal C : std_logic_vector(3 downto 0);    -- 각 가산기간 연결될 carry 신호
begin
    FA0 : FullAdder_1 port map(A(0), B(0), C_i, C(1), S(0));    -- 0번째 전가산기
    FA1 : FullAdder_1 port map(A(1), B(1), C(1), C(2), S(1));   -- 1번째 전가산기
    FA2 : FullAdder_1 port map(A(2), B(2), C(2), C(3), S(2));   -- 2번째 전가산기
    FA3 : FullAdder_1 port map(A(3), B(3), C(3), C_o, S(3));    -- 3번째 전가산기
end Structural;