library ieee;
use ieee.std_logic_1164.all;

entity ShiftRegister_4_Right is
    port (
        I              : in std_logic_vector(3 downto 0);
        SI, Sh, L, CLK : in std_logic;
        O              : out std_logic_vector(3 downto 0));
end ShiftRegister_4_Right;

architecture Structural of ShiftRegister_4_Right is
    component D_FF is
        port (
            D, CLK  : in std_logic;
            Q, notQ : out std_logic);
    end component;
    component MUX_4_1 is
        port (
            Input  : in std_logic_vector(3 downto 0);
            Sel    : in std_logic_vector(1 downto 0);
            Output : out std_logic);
    end component;
    signal D : std_logic_vector(3 downto 0);

begin
    MUX0 : MUX_4_1 port map(Input => (O(1) & O(1) & I(0) & O(0)), Sel => (Sh & L), Output => D(0));
    MUX1 : MUX_4_1 port map(Input => (O(2) & O(2) & I(1) & O(1)), Sel => (Sh & L), Output => D(1));
    MUX2 : MUX_4_1 port map(Input => (O(3) & O(3) & I(2) & O(2)), Sel => (Sh & L), Output => D(2));
    MUX3 : MUX_4_1 port map(Input => (SI & SI & I(3) & O(3)), Sel => (Sh & L), Output => D(3));
    DFF0 : D_FF port map(D => D(0), CLK => CLK, Q => O(0));
    DFF1 : D_FF port map(D => D(1), CLK => CLK, Q => O(1));
    DFF2 : D_FF port map(D => D(2), CLK => CLK, Q => O(2));
    DFF3 : D_FF port map(D => D(3), CLK => CLK, Q => O(3));

end Structural;