function [tpoints,r] = transient_trapez(t1,t2,h,out)
% [tpoints,r] = Transient_trapez(t1,t2,h,out)
% Perform Transient Analysis using the Trapezoidal Rule for LINEAR
% circuits.
% assume zero initial condition.
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
    r = zeros(size(tpoints));
    
    for i = 1:length(tpoints)-1
        x = (G+(2*C)/h)\(((2*C)/h-G)*x0 + BTime(tpoints(i+1)) + BTime(tpoints(i)));
        %IC update
        x0 = x;
        r(i+1) = x(out);
    end
end