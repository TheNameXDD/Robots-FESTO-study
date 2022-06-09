
MODULE Module1
	CONST robtarget START:=[[24.34,-204.38,182.33],[0.0085815,0.119214,0.992824,-0.00376045],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget HOME:=[[165.62,-199.53,513.73],[0.00851436,0.119291,0.992816,-0.00373504],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
 
    VAR robtarget ABI_PUNKT;
    VAR robtarget NEXT := START;
    
    CONST num SIDE1 := -50;
    VAR num SIDE_CENT := SIDE1 / 2;
    VAR num NEXT_STEP := 60;
    
	PROC Main()
        MoveL HOME,v100,fine,tool0;
        
        SetDO Stop_led, 1;
        WaitDI Startnupp, 1;
        SetDO Stop_led, 0;
        
        TPWrite "Hakkan lõikama. Käsiti opipeerimine detailidega on keelatud";
        
        TPWrite "Hakkan lõikama 1-me kolmnurk";
        KOLMNURK;
        TPWrite "Kolmnurk 1 on lõigatud";
        
        NEXT_KOLMNURK;
        
        TPWrite "Hakkan lõikama 2-ne kolmnurk";
        KOLMNURK;
        TPWrite "Kolmnurk 2 on lõigatud";
        
        TPWrite "Kolmnurk 1 ja kolmnurk 2 on lõigatud.";
        
        MoveL HOME,v100,fine,tool0;
        TPWrite "DONE. On lubatud opireerida detailidega";
        SetDO Stop_led, 1;
	ENDPROC
    PROC KOLMNURK()
        ABI_PUNKT:=Offs(NEXT,0,0,30);
        MoveL ABI_PUNKT,v100,fine,tool0;
        
        ABI_PUNKT:=Offs(NEXT,0,10,30);
        MoveL ABI_PUNKT,v100,fine,tool0;
        
        ABI_PUNKT:=Offs(NEXT,0,10,0);
        MoveL ABI_PUNKT,v100,fine,tool0;
        
        MoveL NEXT,v200,fine,tool0;
        
        ABI_PUNKT:=Offs(NEXT,SIDE1,0,0);
        MoveL ABI_PUNKT,v100,fine,tool0;
        
        !ABI_PUNKT:=Offs(NEXT,SIDE1,0,30);
        !MoveL ABI_PUNKT,v100,fine,tool0;
        
        ABI_PUNKT:=Offs(NEXT,SIDE1,0,0);
        MoveL ABI_PUNKT,v100,fine,tool0;
        
        ABI_PUNKT:=Offs(NEXT,SIDE_CENT,SIDE1,0);
        MoveL ABI_PUNKT,v100,fine,tool0;
        
        !ABI_PUNKT:=Offs(NEXT,SIDE_CENT,SIDE1,30);
        !MoveL ABI_PUNKT,v100,fine,tool0;
        
        ABI_PUNKT:=Offs(NEXT,SIDE_CENT,SIDE1,0);
        MoveL ABI_PUNKT,v100,fine,tool0;
        
        MoveL NEXT,v100,fine,tool0;
        
        ABI_PUNKT:=Offs(NEXT,0,10,0);
        MoveL ABI_PUNKT,v100,fine,tool0;
        
        ABI_PUNKT:=Offs(NEXT,0,10,30);
        MoveL ABI_PUNKT,v100,fine,tool0;
    ENDPROC
    PROC NEXT_KOLMNURK()
        NEXT.trans.x := NEXT.trans.x - NEXT_STEP;
    ENDPROC
ENDMODULE