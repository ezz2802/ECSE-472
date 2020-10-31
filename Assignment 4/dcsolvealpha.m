function Xdc = dcsolvealpha(Xguess,alpha,maxerr)
% Compute dc solution using newtwon iteration for the augmented system
% G*X + f(X) = alpha*b
% Inputs: 
% Xguess is the initial guess for Newton Iteration
% alpha is a paramter (see definition in augmented system above)
% maxerr defined the stopping criterion from newton iteration: Stop the
% iteration when norm(deltaX)<maxerr
% Oupputs:
% Xdc is a vector containing the solution of the augmented system
    global G b
    dx = 10;
    while(norm(dx) > maxerr)
        p = G*Xguess + f_vector(Xguess) - alpha*b;
        dp = G + nlJacobian(Xguess);
        dx = -inv(dp)*(p);
        Xguess = Xguess + dx;
    end
    Xdc = Xguess;
end