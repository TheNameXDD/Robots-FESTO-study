MODULE Module1
PERS tooldata Pen_TCP:=[TRUE,[[-75.7354,-16.9332,167.299],[1,0,0,0]],[1,[-20,-17,15],[1,0,0,0],0,0,0]];
 
CONST robtarget START_PUNKT:=[[-71.26,-264.43,177.69],[0.0192752,-0.720364,0.692835,-0.026155],[-2,0,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget HOME:=[[62.12,-205.93,442.92],[0.00744217,0.664944,0.74685,0.00307293],[-1,0,-4,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
   
    VAR robtarget ABI_PUNKT1;
    VAR robtarget ABI_PUNKT2;
    VAR robtarget ABI_PUNKT3;
   
    VAR intnum FORCE_STOP;
   
    PROC main()
       
        CONNECT FORCE_STOP WITH STOPPING;
        ISignalDI Stopnupp, 0, FORCE_STOP;
       
        SetDO Stop_led, 1;
       
        IF Pöördlüliti = 1 THEN
            RestoPath;
            StartMove;
        ELSE
       
        WaitDI Startnupp, 1;
        SetDO Stop_led, 0;
        Start;
       
        ENDIF
       
    ENDPROC
    PROC Start()
        MoveL HOME, v200, fine,tool0\WObj:=wobj0;
        TPWrite "Hakkan joonistama";
        DETAIL;
        MoveL HOME, v200, fine,tool0\WObj:=wobj0;
    ENDPROC
    PROC DETAIL()
        ABI_PUNKT1:=Offs(START_PUNKT,0,0,30);
        MoveL ABI_PUNKT1,v200,fine,tool0\WObj:=wobj0;
       
        MoveL START_PUNKT,v200,fine,tool0\WObj:=wobj0;
       
        ABI_PUNKT1:=Offs(START_PUNKT,0,-100,0);
        MoveL ABI_PUNKT1,v200,fine,tool0\WObj:=wobj0;
       
        ABI_PUNKT3:=Offs(START_PUNKT,29,-139,0);
       
        ABI_PUNKT2:=Offs(START_PUNKT,50,-150,0);
        MoveC ABI_PUNKT3,ABI_PUNKT2,v200,z20,tool0\WObj:=wobj0;
       
        ABI_PUNKT1:=Offs(START_PUNKT,200,-150,0);
        MoveL ABI_PUNKT1,v200,fine,tool0\WObj:=wobj0;
       
        ABI_PUNKT1:=Offs(START_PUNKT,250,-100,0);
        MoveL ABI_PUNKT1,v200,fine,tool0\WObj:=wobj0;
       
        ABI_PUNKT1:=Offs(START_PUNKT,250,0,0);
        MoveL ABI_PUNKT1,v200,fine,tool0\WObj:=wobj0;
       
        ABI_PUNKT1:=Offs(START_PUNKT,155,0,0);
        MoveL ABI_PUNKT1,v200,fine,tool0\WObj:=wobj0;
       
        ABI_PUNKT3:=Offs(START_PUNKT,125,30,0);
       
        ABI_PUNKT2:=Offs(START_PUNKT,95,0,0);
        MoveC ABI_PUNKT3,ABI_PUNKT2,v200,fine,tool0\WObj:=wobj0;
       
        ABI_PUNKT1:=Offs(START_PUNKT,0,0,0);
        MoveL ABI_PUNKT1,v200,fine,tool0\WObj:=wobj0;
       
    ENDPROC
    TRAP STOPPING
        StorePath;
        SetDO Stop_led, 1;
        MoveL HOME, v200, fine,tool0\WObj:=wobj0;
        IDelete FORCE_STOP;
        TPWrite "TÄHELEPANU! Aktiveerus STOP mode. Robot liigub KODU pos.";
        main;
    ENDTRAP
ENDMODULE