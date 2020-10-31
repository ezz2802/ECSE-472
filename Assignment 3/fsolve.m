function r = fsolve(fpoints ,out)
%  fsolve(fpoints ,out)
%  Obtain frequency domain response
% global variables G C b
% Inputs: fpoints is a vector containing the fequency points at which
%         to compute the response in Hz
%         out is the output node
% Outputs: r is a vector containing the value of
%            of the response at the points fpoint

% define global variables
global G C b

l = length(fpoints);
%(G+sC)X = b ---> AX = b where s = jw = j*(2*pi*f)
%A = G + (j*(2*pi*f))*C
%solve for X
%store in r (output)
for i = 1:l
    A = G + (1j*(2*pi*fpoints(i)))*C;
    X = A\b;
    r(i) = X(out);
end