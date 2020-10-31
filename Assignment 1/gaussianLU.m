function [L,U] = gaussianLU(A)
    r = size(A,1);
    L = eye(r);
    U = A;
    for i = 1:r-1
        for j = i+1:r
            L(j,i) = U(j,i)/U(i,i);
            U(j,i:r) = U(j,i:r) - (U(i,i:r)*L(j,i));
        end
    end
end