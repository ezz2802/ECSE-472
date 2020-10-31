function [Xdc, dX] = dcsolve(Xguess,maxerr)
    global G b
    dX = [];
    dx = 10;
    while(norm(dx) > maxerr)
        p = G*Xguess + f_vector(Xguess) - b;
        dp = G + nlJacobian(Xguess);
        dx = -inv(dp)*(p);
        Xdc = Xguess;
        dX = [dX, norm(dx)]; %#ok<AGROW>
        Xguess = Xguess + dx;  
    end
end