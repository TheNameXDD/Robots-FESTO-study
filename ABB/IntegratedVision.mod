MODULE modMain 
        CONST string myjob := "spaju.job";
        CONST string checkjob := "spaju_inspect.job";
        VAR cameratarget detail;
        
    PROC main()
        MoveJ myhome, v100, fine, tool;
        DetectObject;
        MoveJ myhome, v100, fine, tool;
    ENDPROC
    PROC DetectObject()
        CamSetProgramMode mycamera;
        CamLoadJob mycamera, checkjob;
        CamSetRunMode mycamera;
        CamReqImage mycamera;
        CamGetResult mycamera, detail;
        
        IF detail.val1 > 0 THEN
            CheckPosObject;
        ELSE
            DetectObject;
        ENDIF
    ENDPROC      
    PROC PickObject()
        MoveL Offs(myrobtarget,0,0,50), v100, fine, tool \WObj:=wobjvision;
        MoveL myrobtarget, v50, fine, tool \WObj:=wobjvision;
        Gripper \in;
        MoveL Offs(myrobtarget,0,0,50), v100, fine, tool \WObj:=wobjvision;
        PutObject;
    ENDPROC
    PROC PutObject()
        MoveL Offs(myputplace,0,0,50), v100, fine, tool \WObj:=wobj0;
        MoveL Offs(myputplace,0,0,10), v50, fine, tool \WObj:=wobj0;
        WaitTime 1;
        Gripper \out;
        MoveL Offs(myputplace,0,0,50), v100, fine, tool \WObj:=wobj0;
        main;
    ENDPROC
    PROC Gripper(\switch in | switch out)
        IF Present (in) THEN
            WaitTime 1;
            Reset do_BlowOut;
            SetDO do_BlowIn, 1;
            WaitTime 1;
        ENDIF
        IF Present (out) THEN
            WaitTime 1;
            Reset do_BlowIn;
            PulseDO\PLength:=1,do_BlowOut;
            WaitTime 1;
        ENDIF
    ENDPROC
    PROC CheckPosObject()
        CamSetProgramMode mycamera;
        CamLoadJob mycamera, myjob;
        CamSetRunMode mycamera;
        CamReqImage mycamera;
        CamGetResult mycamera, detail;
        wobjvision.oframe := detail.cframe;
        
        PickObject;
    ENDPROC
ENDMODULE
