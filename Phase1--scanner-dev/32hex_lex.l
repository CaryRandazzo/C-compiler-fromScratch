// Found an example of lexer code for flex that scans input for 32bit hexadecimal integers. 

//Citation: 
  // Lan Gao - PhD, Department of Computer Science and Engineering, University of California, Riverside 
  // File located at: alumni.cs.ucr.edu/~lgao/teaching/flex/hex.lex
  
/* 
 * Description: Recognize the 32-bit hexadecimal integer from stdin
 * Pattern: 0[xX]([0-9a-fA-F]{1,8})
 */

digit		[0-9]
alpha		[a-fA-F]
hextail		({digit}|{alpha}){1,8}
hex		0[xX]{hextail}

%%
{hex}	printf("Found a HEX number %s !", yytext);
.	printf("");
%%

main()
{
  printf("Give me your input:\n");
  yylex();
}
