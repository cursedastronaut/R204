	LOADSI #0	;SI = 0
	LOADDIADRSI	;DI = data[SI]
boucle	INCSI		;++SI
	LOADBADRDI	;B = data[DI]
	LOADAADRSI	;A = data[SI]
	DECDI		;--DI
	CMPBA		;if (b != a)
	JMPNZ fail	;goto fail
	LOADADI		;A = DI
	CMPSIA		;if (SI == A)
	JMPPZ boucle	;goto boucle
	LOADA #1	;A = 1; //reussite
	JMP fin		;goto fin
fail	LOADA #-1	;A=-1
fin	JMP fin
