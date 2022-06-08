MODULE Module1
    CONST robtarget Home_pos:=[[1200.000005451,0,1278.716031154],[0.000000193,0.000000009,1,0.000000007],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Parem_all:=[[1099.99996407,-150.000004899,1000.00004577],[0.000000094,0.000000009,1,0.000000003],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Parem_ulemine:=[[1299.999906005,-149.999994208,1000.000046882],[0.00000004,0.000000001,1,0.000000002],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Vasak_all:=[[1099.999972595,150.000000162,1000.000047542],[0.00000012,0.000000009,1,0.000000007],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Vasak_ulemine:=[[1299.99990181,149.999995033,1000.000047579],[0.000000019,0.000000006,1,0.000000002],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

    VAR num Xnurk;
    VAR num Ynurk;
    VAR num Znurk;
   
    VAR robtarget ABI_PUNKT;
   
   
    PROC main()
        Path_10;
    ENDPROC

    PROC Path_10()
        Gohome;
        START;
        SIDE_1;
        SIDE_2;
        SIDE_3;
        SIDE_4;
    ENDPROC
   
    PROC Gohome()
        MoveL Home_pos,v100,fine,tWeldGun\WObj:=wobj0;
    ENDPROC    
   
    PROC START()
       
        ABI_PUNKT := Offs(Vasak_all,0,0,20);
        MoveL ABI_PUNKT,v100,fine,tWeldGun\WObj:=wobj0; !Valmistamine keevitamiseks
       
        MoveL Vasak_all,v100,fine,tWeldGun\WObj:=wobj0; !Robot algus punktis

    ENDPROC

    PROC SIDE_1()
       
        ABI_PUNKT := Vasak_all;
       
        Xnurk := EulerZYX(\X,Vasak_all.rot);
        Ynurk := EulerZYX(\Y,Vasak_all.rot); !Leiame koordinadid Vasak_all punktist
        Znurk := EulerZYX(\Z,Vasak_all.rot);
       
        Xnurk := Xnurk + 30;
        ABI_PUNKT.rot := OrientZYX(Znurk, Ynurk, Xnurk);
       
        MoveL ABI_PUNKT,v100,fine,tWeldGun\WObj:=wobj0;
       
        ABI_PUNKT := Vasak_ulemine;
       
        Xnurk := EulerZYX(\X,Vasak_all.rot);
        Ynurk := EulerZYX(\Y,Vasak_all.rot); !Leiame koordinadid Vasak_ulemine punktist
        Znurk := EulerZYX(\Z,Vasak_all.rot);
       
        Xnurk := Xnurk + 30;
       
        ABI_PUNKT.rot := OrientZYX(Znurk, Ynurk, Xnurk);
        MoveL ABI_PUNKT,v100,fine,tWeldGun\WObj:=wobj0;
       
        ABI_PUNKT.trans.z := ABI_PUNKT.trans.z + 40;
        MoveL ABI_PUNKT,v100,fine,tWeldGun\WObj:=wobj0;
       
    ENDPROC
   
    PROC SIDE_2()
       
        ABI_PUNKT := Vasak_ulemine;
       
        Xnurk := EulerZYX(\X,Vasak_all.rot);
        Ynurk := EulerZYX(\Y,Vasak_all.rot); !Leiame koordinadid Vasak_ulemine punktist
        Znurk := EulerZYX(\Z,Vasak_all.rot);
       
        Ynurk := Ynurk - 30;
       
        ABI_PUNKT.rot := OrientZYX(Znurk, Ynurk, Xnurk);
       
        ABI_PUNKT.trans.z := ABI_PUNKT.trans.z + 40;
        MoveL ABI_PUNKT,v100,fine,tWeldGun\WObj:=wobj0;
       
        ABI_PUNKT.trans.z := ABI_PUNKT.trans.z - 40;
        MoveL ABI_PUNKT,v100,fine,tWeldGun\WObj:=wobj0;
       
        ABI_PUNKT := Parem_ulemine;
       
        Xnurk := EulerZYX(\X,Vasak_all.rot);
        Ynurk := EulerZYX(\Y,Vasak_all.rot); !Leiame koordinadid Parem_ulemine punktist
        Znurk := EulerZYX(\Z,Vasak_all.rot);
       
        Ynurk := Ynurk - 30;
       
        ABI_PUNKT.rot := OrientZYX(Znurk, Ynurk, Xnurk);
        MoveL ABI_PUNKT,v100,fine,tWeldGun\WObj:=wobj0;
       
        ABI_PUNKT.trans.z := ABI_PUNKT.trans.z + 40;
        MoveL ABI_PUNKT,v100,fine,tWeldGun\WObj:=wobj0;
    ENDPROC

    PROC SIDE_3()
       
        ABI_PUNKT := Parem_ulemine;
       
        Xnurk := EulerZYX(\X,Vasak_all.rot);
        Ynurk := EulerZYX(\Y,Vasak_all.rot); !Leiame koordinadid Parem_ulemine punktist
        Znurk := EulerZYX(\Z,Vasak_all.rot);
       
        Xnurk := Xnurk - 30;
       
       
        ABI_PUNKT.rot := OrientZYX(Znurk, Ynurk, Xnurk);
       
        ABI_PUNKT.trans.z := ABI_PUNKT.trans.z + 40;
        MoveL ABI_PUNKT,v100,fine,tWeldGun\WObj:=wobj0;
       
        ABI_PUNKT.trans.z := ABI_PUNKT.trans.z - 40;
        MoveL ABI_PUNKT,v100,fine,tWeldGun\WObj:=wobj0;
       
        ABI_PUNKT := Parem_all;
       
        Xnurk := EulerZYX(\X,Vasak_all.rot);
        Ynurk := EulerZYX(\Y,Vasak_all.rot); !Leiame koordinadid Parem_all punktist
        Znurk := EulerZYX(\Z,Vasak_all.rot);
       
        Xnurk := Xnurk - 30;
       
        ABI_PUNKT.rot := OrientZYX(Znurk, Ynurk, Xnurk);
        MoveL ABI_PUNKT,v100,fine,tWeldGun\WObj:=wobj0;
       
        ABI_PUNKT.trans.z := ABI_PUNKT.trans.z + 40;
        MoveL ABI_PUNKT,v100,fine,tWeldGun\WObj:=wobj0;
    ENDPROC

    PROC SIDE_4()
       
        ABI_PUNKT := Parem_all;
       
        Xnurk := EulerZYX(\X,Vasak_all.rot);
        Ynurk := EulerZYX(\Y,Vasak_all.rot); !Leiame koordinadid Parem_all punktist
        Znurk := EulerZYX(\Z,Vasak_all.rot);
       
        Ynurk := Ynurk + 20;
       
        ABI_PUNKT.rot := OrientZYX(Znurk, Ynurk, Xnurk);
        ABI_PUNKT.trans.z := ABI_PUNKT.trans.z + 40;
        MoveL ABI_PUNKT,v100,fine,tWeldGun\WObj:=wobj0;
       
        ABI_PUNKT.trans.z := ABI_PUNKT.trans.z - 40;
        MoveL ABI_PUNKT,v100,fine,tWeldGun\WObj:=wobj0;
       
        ABI_PUNKT := Vasak_all;
       
        Xnurk := EulerZYX(\X,Vasak_all.rot);
        Ynurk := EulerZYX(\Y,Vasak_all.rot); !Leiame koordinadid Vasak_all punktist
        Znurk := EulerZYX(\Z,Vasak_all.rot);
       
        Ynurk := Ynurk + 20;
       
        ABI_PUNKT.rot := OrientZYX(Znurk, Ynurk, Xnurk);
        MoveL ABI_PUNKT,v100,fine,tWeldGun\WObj:=wobj0;
       
        ABI_PUNKT.trans.z := ABI_PUNKT.trans.z + 40;
        MoveL ABI_PUNKT,v100,fine,tWeldGun\WObj:=wobj0;
       
        Gohome;      
    ENDPROC
ENDMODULE