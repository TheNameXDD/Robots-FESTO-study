MODULE MainModule
CONST robtarget Home_start:=[[5,245,10],[0,0,1,0],[-1,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget Home_1:=[[136.009636452,245,10],[0,0,1,0],[-1,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget Home_2:=[[175,125,10],[0,-0.026176949,0.999657325,0],[-2,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget Home_3:=[[136.009636452,5,10],[0,0,1,0],[-2,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget Home_4:=[[5,5,10],[0,0,1,0],[-2,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget Home_finish:=[[5,245,10],[0,-0.000000001,1,0],[-1,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Window_start:=[[100.000455389,175,10],[0,0,1,0],[-1,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Window_1:=[[100.000455389,75,10],[0,0,1,0],[-2,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Window_2:=[[40.000455389,75,10],[0,0,1,0],[-2,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Window_3:=[[40.000455389,175,10],[0,0,1,0],[-1,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Window_finish:=[[100.000455389,175,10],[0,0,1,0],[-1,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Home_pos:=[[50.000036874,-628.226528931,276.005168338],[0.000000059,0.707106788,0.707106775,-0.000000059],[-1,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

     VAR robtarget ABI_PUNKT;
   
    !Maja joonistamine. Autor: Sander Paju
   
    PROC main()
        Path_30;
        WaitTime 1;
        Path_10;
        Path_20;  
    ENDPROC
PROC Path_10()
        TPWrite "Hakkan joonistama maja";
       
        ABI_PUNKT:=Offs(Home_start,0,0,30);
        MoveL ABI_PUNKT,v100,fine,Pen_TCP\WObj:=home;
        WaitTime 1;
       
   MoveL Home_start,v100,fine,Pen_TCP\WObj:=home;
   MoveL Home_1,v100,fine,Pen_TCP\WObj:=home;
   MoveL Home_2,v100,fine,Pen_TCP\WObj:=home;
   MoveL Home_3,v100,fine,Pen_TCP\WObj:=home;
   MoveL Home_4,v100,fine,Pen_TCP\WObj:=home;
   MoveL Home_finish,v100,fine,Pen_TCP\WObj:=home;
        WaitTime 1;
       
        ABI_PUNKT:=Offs(Home_finish,0,0,30);
        MoveL ABI_PUNKT,v100,fine,Pen_TCP\WObj:=home;
       
       
        TPWrite "Maja on joonistatud :)";
ENDPROC
    PROC Path_20()
        TPWrite "Hakkan joonistama keskmine aken";
       
        ABI_PUNKT:=Offs(Window_start,0,0,30);
        MoveL ABI_PUNKT,v100,fine,Pen_TCP\WObj:=home;
        WaitTime 1;
       
        MoveL Window_start,v100,fine,Pen_TCP\WObj:=home;
        MoveL Window_1,v100,fine,Pen_TCP\WObj:=home;
        MoveL Window_2,v100,fine,Pen_TCP\WObj:=home;
        MoveL Window_3,v100,fine,Pen_TCP\WObj:=home;
        MoveL Window_finish,v100,fine,Pen_TCP\WObj:=home;
       
        ABI_PUNKT:=Offs(Window_finish,0,0,30);
        MoveL ABI_PUNKT,v100,fine,Pen_TCP\WObj:=home;
       
        TPWrite "Keskmine aken on joonistatud";
        WaitTime 1;
        TPWrite "Maja on valmis, liigun tagasi!";
        Path_30;
    ENDPROC
    PROC Path_30()
       MoveL Home_pos,v100,fine,Pen_TCP;
    ENDPROC
ENDMODULE