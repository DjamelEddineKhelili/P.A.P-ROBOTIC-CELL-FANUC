/PROG  STACK2
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 1478;
CREATE		= DATE 25-04-11  TIME 23:13:44;
MODIFIED	= DATE 25-04-11  TIME 23:32:06;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 52;
MEMORY_SIZE	= 1926;
PROTECT		= READ_WRITE;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= 1,*,*,*,*;
CONTROL_CODE	= 00000000 00000000;
/APPL
  SPOT : TRUE ; 
  SPOT Welding Equipment Number : 1 ;
/MN
   1:  !FRAMES ;
   2:  UFRAME_NUM=0 ;
   3:  UTOOL_NUM=1 ;
   4:   ;
   5:   ;
   6:  !VARIABLES ;
   7:  R[3:COUNTERY]=0    ;
   8:  R[4:COMPTEUR]=0    ;
   9:  R[1:COUNTER]=0    ;
  10:  R[2:SPEED]=2000    ;
  11:  PR[4,3:Y_OFFSET]=0    ;
  12:  PR[4,2:Y_OFFSET]=0    ;
  13:  PR[4,1:Y_OFFSET]=0    ;
  14:  !HOME POS ;
  15:J PR[2:HOME_POS] 100% FINE    ;
  16:   ;
  17:  !OFFSET ;
  18:  FOR R[1:COUNTER]=1 TO 2 ;
  19:  FOR R[3:COUNTERY]=1 TO 6 ;
  20:   ;
  21:   ;
  22:   ;
  23:  !CONVEYOR ;
  24:  DO[1]=ON ;
  25:  WAIT DI[1]=ON    ;
  26:  WAIT    .80(sec) ;
  27:J P[2] 100% FINE    ;
  28:L P[1] R[2:SPEED]mm/sec FINE    ;
  29:  CALL PICKUP    ;
  30:L P[2] R[2:SPEED]mm/sec FINE    ;
  31:  DO[1]=OFF ;
  32:  WAIT DI[2]=ON    ;
  33:J P[4] 100% FINE Offset,PR[4:Y_OFFSET]    ;
  34:L P[5] R[2:SPEED]mm/sec FINE Offset,PR[4:Y_OFFSET]    ;
  35:  CALL DROPOFF2    ;
  36:L P[5] 2000mm/sec FINE Offset,PR[4:Y_OFFSET]    ;
  37:J PR[2:HOME_POS] 100% FINE    ;
  38:  PR[4,1:Y_OFFSET]=PR[4,1:Y_OFFSET]+75    ;
  39:  IF R[3:COUNTERY]<>3,JMP LBL[1] ;
  40:  PR[4,3:Y_OFFSET]=PR[4,3:Y_OFFSET]+50    ;
  41:  PR[4,1:Y_OFFSET]=0    ;
  42:  LBL[1] ;
  43:  IF R[3:COUNTERY]<>6,JMP LBL[2] ;
  44:  PR[4,2:Y_OFFSET]=PR[4,2:Y_OFFSET]+150    ;
  45:  PR[4,3:Y_OFFSET]=0    ;
  46:  PR[4,1:Y_OFFSET]=0    ;
  47:  LBL[2] ;
  48:  ENDFOR ;
  49:  ENDFOR ;
  50:  CALL STACK    ;
  51:  WAIT   3.00(sec) ;
  52:   ;
/POS
P[1]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'F U T, 0, 1, 1',
	X =  -128.999  mm,	Y =  -525.784  mm,	Z =   105.500  mm,
	W =    90.000 deg,	P =   -90.000 deg,	R =     0.000 deg
};
P[2]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'F U T, 0, 1, 1',
	X =  -128.999  mm,	Y =  -525.784  mm,	Z =   275.500  mm,
	W =    90.000 deg,	P =   -90.000 deg,	R =     0.000 deg
};
P[4]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'F U T, 0, 1, 1',
	X =   262.908  mm,	Y =   187.051  mm,	Z =   250.000  mm,
	W =      .000 deg,	P =   -90.000 deg,	R =     0.000 deg
};
P[5]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'F U T, 0, 1, 1',
	X =   262.908  mm,	Y =   187.051  mm,	Z =    26.798  mm,
	W =      .000 deg,	P =   -90.000 deg,	R =     0.000 deg
};
/END
