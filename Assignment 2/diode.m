function diode(name,n1,n2,Is,Vt)
    global DIODE_LIST

    nbDiodes = size(DIODE_LIST,2);

    N = nbDiodes + 1;
    DIODE_LIST(N).diodename = name;
    DIODE_LIST(N).node1 = n1;
    DIODE_LIST(N).node2 = n2;
    DIODE_LIST(N).Is = Is;
    DIODE_LIST(N).Vt = Vt;