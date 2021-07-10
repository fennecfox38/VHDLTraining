library ieee;
use ieee.std_logic_1164.all;

entity BinaryCounter_4bit_UD is
    port (
        CLK, Down : in std_logic;
        O         : out std_logic_vector(3 downto 0));
end BinaryCounter_4bit_UD;

architecture Structural of BinaryCounter_4bit_UD is
    component T_FF is
        port (
            T, CLK  : in std_logic;
            Q, notQ : out std_logic);
    end component;
    signal T, notO : std_logic_vector(3 downto 0);

begin
    TFF0 : T_FF port map(T => T(0), CLK => CLK, Q => O(0), notQ=>notO(0));
    TFF1 : T_FF port map(T => T(1), CLK => CLK, Q => O(1), notQ=>notO(1));
    TFF2 : T_FF port map(T => T(2), CLK => CLK, Q => O(2), notQ=>notO(2));
    TFF3 : T_FF port map(T => T(3), CLK => CLK, Q => O(3), notQ=>notO(3));

    T(0) <= '1';
    T(1) <= (not Down and O(0)) or (Down and notO(0));
    T(2) <= (not Down and O(0) and O(1)) or (Down and notO(0) and notO(1));
    T(3) <= (not Down and O(0) and O(1) and O(2)) or (Down and notO(0) and notO(1) and notO(2));
end Structural;