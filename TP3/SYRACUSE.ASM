	LOAD_A #17

debut	LOAD_B #1
	AND_B_A
	JMPZ pair

impair	LOAD_B # 3
	MUL_A_B
	LOAD_B_A
	INC_B
	LOAD_A_B
	JMP debut

pair	LOAD_B_A
	DIV_B #2
	LOAD_A_B
	JMP debut