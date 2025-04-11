/PROG  STACK
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 1510;
CREATE		= DATE 25-04-09  TIME 21:24:00;
MODIFIED	= DATE 25-04-12  TIME 00:01:04;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 54;
MEMORY_SIZE	= 1942;
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
  18:  FOR R[1:COUNTER]=1 TO 6 ;
  19:  FOR R[3:COUNTERY]=1 TO 2 ;
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
  34:L P[3] R[2:SPEED]mm/sec FINE Offset,PR[4:Y_OFFSET]    ;
  35:  CALL DROPOFF    ;
  36:L P[4] 2000mm/sec FINE Offset,PR[4:Y_OFFSET]    ;
  37:J PR[2:HOME_POS] 100% FINE    ;
  38:  PR[4,2:Y_OFFSET]=PR[4,2:Y_OFFSET]+150    ;
  39:  IF R[3:COUNTERY]<>2,JMP LBL[1] ;
  40:  IF R[1:COUNTER]<>3,JMP LBL[1] ;
  41:  PR[4,3:Y_OFFSET]=PR[4,3:Y_OFFSET]+50    ;
  42:  PR[4,1:Y_OFFSET]=0    ;
  43:  PR[4,2:Y_OFFSET]=0    ;
  44:  JMP LBL[3] ;
  45:  LBL[1] ;
  46:  IF R[3:COUNTERY]<>2,JMP LBL[2] ;
  47:  PR[4,1:Y_OFFSET]=PR[4,1:Y_OFFSET]+(-75)    ;
  48:  PR[4,2:Y_OFFSET]=0    ;
  49:  LBL[2] ;
  50:  LBL[3] ;
  51:  ENDFOR ;
  52:  ENDFOR ;
  53:  WAIT   3.00(sec) ;
  54:   ;
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
P[3]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'F U T, 0, 1, 1',
	X =   -92.754  mm,	Y =   425.000  mm,	Z =  -361.372  mm,
	W =      .000 deg,	P =   -90.000 deg,	R =     0.000 deg
};
P[4]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'F U T, 0, 1, 1',
	X =   -92.754  mm,	Y =   425.000  mm,	Z =   150.000  mm,
	W =      .000 deg,	P =   -90.000 deg,	R =     0.000 deg
};
/END
