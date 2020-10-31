function [tpoints,r] = transient_feuler(t1,t2,h,out)
% [tpoints,r] = Transient_feuler(t1,t2,h,out)
% Perform Transient analysis for LINEAR circuit using Forward Euler
% This function assumes the C matrix is invertible and will not work 
% for circuits where C is not invertible.
% assume zero initial condition.
% Inputs:  t1 = starting time point (typically 0)
%          t2 = ending time point
%          h  = step size
%          out = output node
% Outputs  tpoints = are the time points at which the output
%                    was evaluated1
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
        x = (C/h)\((C/h-G)*x0 + BTime(tpoints(i)));
        %IC update
        x0 = x;
        r(i+1) = x(out);
    end
end