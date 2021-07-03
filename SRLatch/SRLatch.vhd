library ieee;
use ieee.std_logic_1164.all;

entity SRLatch is
    port (
        S, R    : in std_logic;
        Q, notQ : out std_logic
    );
end SRLatch;

architecture DataFlow of SRLatch is
begin
    Q    <= R nor notQ after 100 ps;
    notQ <= S nor Q after 100 ps;
end DataFlow;