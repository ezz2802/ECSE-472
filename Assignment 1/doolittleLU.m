function [L,U] = doolittleLU(A)
    r = size(A,1);
    U = zeros(r); U(1,:) = A(1,:);
    L = zeros(r); L(:,1) = A(:,1)/U(1,1); L(1,1) = 1;
    for j=2:r
        for i=2:r
            for k=i:r
                U(i,k) = A(i,k) - dot(L(i,1:i-1), U(1:i-1,k));
            end
            L(i,j) = (A(i,j) - dot(L(i,1:j-1), U(1:j-1,j)))/U(j,j);
        end
    end
end