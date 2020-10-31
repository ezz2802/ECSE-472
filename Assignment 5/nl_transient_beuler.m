function [tpoints,r] = nl_transient_beuler(t1,t2,h,out)
% [tpoints,r] = beuler(t1,t2,h,out)
% Perform transient analysis for NONLINEAR Circuits using Backward Euler
% Assume zero initial condition.
% Inputs:  t1 = starting time point (typically 0) 
%          t2 = ending time point
%          h  = step size
%          out = output node
% Outputs  tpoints = are the time points at which the output
%                    was evaluated
%          r       = value of the response at above time points
% plot(tpoints,r) should produce a plot of the transient response

    global G C b
    %IC assumed to be 0's
    x0 = zeros(size(b));
    %vector where the output will be evaluated
    tpoints = t1:h:t2;
    %result
    r = [];
    
    xNL = zeros(size(b));
    maxerr = 10^(-6);
for n = t1:h:t2
    normerr = 10;
    while(normerr > maxerr)
        f_vect = f_vector(xNL);
        jac = nlJacobian(xNL);
        dp = G+C/h + jac;
        p = (G+C/h)*xNL - (C/h)*x0 - BTime(n+h) + f_vect ;
        dx = -dp\p;
        normerr = norm(dx);
        xNL = xNL + dx;
    end
    xout = xNL - dx;
    r = [r;xout(out)]; %#ok<AGROW>
    x0 = xout;
end