function [tpoints,r] = transient_beuler(t1,t2,h,out)
% [tpoints,r] = beuler(t1,t2,h,out)
% Perform transient analysis for LINEAR Circuits using Backward Euler
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
    
    for i = 0:length(tpoints)-1
        x = (G+C/h)\((C/h)*x0 + BTime(tpoints(i+1)));
        %IC update
        x0 = x;
        r(i+1) = x(out);
    end
end