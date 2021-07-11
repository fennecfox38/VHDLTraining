library ieee;
use ieee.std_logic_1164.all;

entity SerialAdder is
    port (
        X, Y, CLK : in std_logic;
        S         : out std_logic);
end SerialAdder;

architecture Structural of SerialAdder is
    component FullAdder_1 is
        port (
            X, Y, C_in : in std_logic;
            C_out, Sum : out std_logic);
    end component;
    component D_FF is
        port (
            D, CLK  : in std_logic;
            Q, notQ : out std_logic);
    end component;
    signal Qx, Qy, Qc, C_o : std_logic;
begin
    --FA : FullAdder_1 port map(X => X, Y => Y, C_in => Qc, C_out => C_o, Sum => S);
    FA  : FullAdder_1 port map(X => Qx, Y => Qy, C_in => Qc, C_out => C_o, Sum => S);
    DFFX : D_FF port map(D => X, CLK => CLK, Q => Qx);
    DFFY : D_FF port map(D => Y, CLK => CLK, Q => Qy);
    DFFC : D_FF port map(D => C_o, CLK => CLK, Q => Qc);
end Structural;