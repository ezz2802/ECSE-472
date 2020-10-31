global G C
global b;

global DIODE_LIST
DIODE_LIST = struct('diodename',{ }, 'node1', [ ], 'node2', [ ], 'Is', [ ], 'Vt', [ ]);

G = zeros(2,2);
C = zeros(2,2);
b = zeros(2,1);    

vol(1,0,2)
res(1,2,50)
res(2,0,50)
cap(2,0,1e-10);
diode('D1',1,2,1e-15,26e-3);