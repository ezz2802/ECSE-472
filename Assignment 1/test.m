%matrix A
A = [2 4 6 2 1;
     4 9 14 8 8;
     2 6 12 12 21;
     4 10 20 17 32;
     8 17 30 18 34];
    
[L,U] = doolittleLU(A);
%[L,U] = gaussianLU(A);