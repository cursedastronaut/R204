	LOADSI #0        
	LOADDIADRSI        
boucle	INCSI                
	LOADBADRDI        
	LOADAADRSI        
	CMPBA
maybe	JMPNZ fail        
	LOADADI         
	DECDI
	JMPNZ aaaa
	JMP maybe
AAAA	CMPSIA                
	JMPPZ boucle
	LOADA #1        
	JMP fin                
fail	LOADA #-1        
fin	JMP fin