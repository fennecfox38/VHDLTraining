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
    Q <= R nor notQ;-- when notQ /= 'U' else R nor '1';
    notQ <= S nor Q;-- when Q /= 'U' else S nor '0';
end DataFlow;