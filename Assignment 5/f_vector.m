function f = f_vector(X)
    global b DIODE_LIST
    
    N = size(b);
    f = zeros(N);

    NbDiodes = size(DIODE_LIST,2);

    for I = 1:NbDiodes
        if (DIODE_LIST(I).node1 ~= 0) && (DIODE_LIST(I).node2 ~= 0) 
            v1 = X(DIODE_LIST(I).node1);
            v2 = X(DIODE_LIST(I).node2);
            Vt = DIODE_LIST(I).Vt;
            Is = DIODE_LIST(I).Is;
            diode_current = Is*(exp((v1-v2)/Vt)-1);
            f(DIODE_LIST(I).node1) = f(DIODE_LIST(I).node1) + diode_current;
            f(DIODE_LIST(I).node2) = f(DIODE_LIST(I).node2) - diode_current;
        elseif (DIODE_LIST(I).node1 == 0)
            v2 = X(DIODE_LIST(I).node2);
            Vt = DIODE_LIST(I).Vt;
            Is = DIODE_LIST(I).Is;
            diode_current = Is*(exp((-v2)/Vt)-1);
            f(DIODE_LIST(I).node2) = f(DIODE_LIST(I).node2) - diode_current;
        elseif (DIODE_LIST(I).node2 == 0)
            v1 = X(DIODE_LIST(I).node1);
            Vt = DIODE_LIST(I).Vt;
            Is = DIODE_LIST(I).Is;
            diode_current = Is*(exp((v1)/Vt)-1);
            f(DIODE_LIST(I).node1) = f(DIODE_LIST(I).node1) + diode_current;
        end
    end