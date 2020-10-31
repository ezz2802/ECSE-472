function J = nlJacobian(X)

    global G DIODE_LIST
    N = size(G);
    J = zeros(N);
    NbDiodes = size(DIODE_LIST,2);

    for j=1:NbDiodes
        if (DIODE_LIST(j).node1 == 0)
            v2 = X(DIODE_LIST(j).node2);
            Vt = DIODE_LIST(j).Vt;
            Is = DIODE_LIST(j).Is;
            k = Is/Vt*(exp((-v2)/Vt));
            v2 = DIODE_LIST(I).node2;
            J(v2,v2) = J(v2,v2) + k;
        elseif (DIODE_LIST(j).node2==0)
            v1 = X(DIODE_LIST(j).node1);
            Vt = DIODE_LIST(j).Vt;
            Is = DIODE_LIST(j).Is;
            k = Is/Vt*(exp((v1)/Vt));
            v1 = DIODE_LIST(j).node1;
            J(v1,v1) = J(v1,v1) + k;
        else
            v1 = X(DIODE_LIST(j).node1);
            v2 = X(DIODE_LIST(j).node2);
            Vt = DIODE_LIST(j).Vt;
            Is = DIODE_LIST(j).Is;
            k = Is/Vt*(exp((v1-v2)/Vt));
            v1 = DIODE_LIST(j).node1;
            v2 = DIODE_LIST(j).node2;
            J(v1,v1) = J(v1,v1) + k;
            J(v2,v2) = J(v2,v2) + k;
            J(v1,v2) = J(v1,v2) - k;
            J(v2,v1) = J(v2,v1) - k;
        end
    end
end

