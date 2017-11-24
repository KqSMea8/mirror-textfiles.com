
		   ***************************************
		   *					 *
		   *					 *
		   *	KRAKOWICZ'S KRACKING KORNER IV   *
		   *					 *
		   *					 *
		   *					 *
		   *					 *
		   *					 *
		   *	      THE ARCADE MACHINE	 *
		   *					 *
		   *					 *
		   *					 *
		   * WITH NOTES ON NMI AND IDSI'S JUGGLER*
		   *					 *
		   *					 *
		   *					 *
		   ***************************************




  AFTER A NINE-MONTH DELAY, BR0DERBUND HAS FINALLY RELEASED THE ARCADE MACHINE
(A.M.).  THE PROTECTION SCHEME IS A NEW CHALLENGE FOR COPIERS, SINCE IT USES
THE TECHNIQUE KNOWN AS SPIRALING OR QUARTER-TRACKING, AS WELL AS THE STANDARD
BR0DERBUND SYSTEM OF A NEW ADDRESS MARKER FOR EACH TRACK.  AN ATTEMPT TO COPY
THE DISK WITH A CONVENTIONAL NIBBLE COPIER QUICKLY REVEALS THAT TRACKS 0 AND
3-11 ARE EASILY COPIED WITH AN ADDRESS MARKER OF D5 AA 96, WHILE THE REST OF
THE TRACKS ARE A MYSTERY.  PROBING INTO THE LOADER REVEALS THE FOLLOWING
INFORMATION ABOUT TRACK USAGE:

      TRACK	CONTENTS
      -----	--------

      T0/S0	PRELOADER --> 800-8FF
		(AS ALWAYS)
	/S1-5	LOADER --> 300-7FF

      T1-2	HIRES SPLIT "BR0DERBUND"
		 LOGO AND PROGRAM

      T12-20	MAIN PROGRAM WHICH LOADS
		 INTO 800-BFFF

      T12-13.5	FOUR HALFTRACKS USED FOR
		 QUARTER-TRACKING

      T3-4	#1 SHAPE CREATOR

      T5-6	#2 PATH CREATOR

      T7-8	#3 GAME OPTIONS

      T9-A	#4 LEVEL OPTIONS

      TC-D	#5 BKGD/TITLE CREATOR

      TE-F	#6 LOAD/SAVE GAME

      T10-11	#7 CREATE GAME DISK

		(OPTION #8 JUMPS TO 0800
		 TO RUN THE GAME)


  THE APPROACH TO KRACKING THIS TYPE OF PROGRAM SEEMS STRAIGHTFORWARD:LOAD THE
PROGRAM INTO MEMORY, RESET IT, AND SAVE IT OUT TO DISK AS A BINARY FILE, WITH
THE APPROPRIATE MEMORY MOVES.  HOPEFULLY, YOU'LL LOCATE THE STARTING ADDRESS
AND BE ABLE TO RUN THE BINARY FILE AT WILL.  IF YOU WISH TO INCLUDE ALL OF THE
ADVERTISING FOR BR0DERBUND AT THE BEGINNING, THIS WORKS.  IF YOU TRY TO DELETE
THE DUAL BANNER, IT CRASHES.  THE REASON IS THAT MODULE SWITCHING IS VIA THE
STACK--THEY PUSH THE CORRECT LOCATION ONTO THE STACK AND DO AN RTS.  SO, UNLESS
YOU HAPPEN TO KNOW THE VALUE OF THE PROGRAM COUNTER (THAT IS, EXACTLY WHAT THE
ADDRESS WAS WHEN YOU STOPPED), THE STACK POINTER (S) AND THE PROCESSOR STATUS
WORD (P), AND RESTORE THEM EXACTLY AS THEY WERE BEFORE THE RESET, THE PROGRAM
PROBABLY WON'T RUN.  ANYONE WHO TRIED TO BREAK JUGGLER FOUND THIS TO BE
FRUSTRATING IN THE EXTREME, SINCE SOMETIMES THE GAME WOULD RUN ALL THE WAY
THROUGH THE FIRST LEVEL BEFORE CRASHING - THE SAME TECHNIQUE WAS USED THERE,
BUT WITH EVEN MORE PROTECTION.

  THERE IS A HARD WAY AND AN EASY WAY TO DO EVERYTHING, AND IF YOU ARE
COMPLETELY RESTRICTED TO SOFTWARE DEVICES, IT IS STILL POSSIBLE TO BREAK ARCADE
MACHINE.  REFERRING TO THE NIBBLE ALTERATION TECHNIQUES DESCRIBED IN THE
PREVIOUS EPISODE, IT IS POSSIBLE TO LOCATE AND ALTER THE GAME LOADER SO THAT IT
HALTS WITH CONDITIONS WELL DEFINED AFTER THE ENTIRE PROGRAM IS IN MEMORY.  IF
IT IS YOUR PURPOSE IN LIFE TO LEARN AS MUCH AS YOU POSSIBLY CAN ABOUT DISK
PROTECTION SCHEMES AND THE CIRCUMVENTION THEREOF (ONLY A FEW REALLY CRAZY
PEOPLE ARE SO INCLINED), THIS IS REWARDING.  IF YOU ARE INTERESTED IN PREPARING
AN UNPROTECTED VERSION OF THE GAME WITH MINUMUM ADVERTISING AND MINIMUM EFFORT,
HOWEVER, THERE IS AN EASIER WAY.

  THIS SOLUTION IS ELEGANT, BUT REQUIRES A VISIT TO THAT GOD OF THE UNDERWORLD
=>HARDWARE<=.  B

 PLEASE PLACE ANY NEW KRAKING TIPS
 OR TECNIQUES ON THE KRACKING BOARD.


  [\/][\/][\/][\/][\/][\/][\/][\/][\/]

	    USS ENTERPRISE I
	      318-367-8860

