library ieee;
use ieee.std_logic_1164.all;

entity Gated_DLatch is
    port (
        D, G    : in std_logic;
        Q, notQ : out std_logic);
end Gated_DLatch;

architecture DataFlow of Gated_DLatch is
begin
    Q <= D when G = '1'
        else Q;
    notQ <= not D when G = '1'
        else notQ;
end DataFlow;