/* DEFINITION SECTION -- can be accessed inside yylex() and main() */


%{
char alpha[50]; 

%}


/* RULE SECTION */


%%
[A-Z] {} // Do nothing.

[a-z] {printf("%s is alpha\n", yytext);} // return alpha character

[0-9] {printf("%s is numeric\n", yytext);} // return numeric character

.     {printf("%s not a capital letter\n", yytext);} // Other

\n    {return 0;}

%%


/* CODE SECTION */


// DOCUMENTATION:
      // yywrap() - wraps the above rule section
      /* yyin - takes the file pointer
            which contains the input*/
      /* yylex() - this is the main flex function
            which runs the Rule Section*/
      // yytext is the text in the buffer


int yywrap(){}
int main(){
 

// Take input from the user to locate an input file stored as 'filename'.
// Use this filename against the previous rules and definitions of the scanner as part of the first steps to identifying tokens for a parser.
FILE *fp;
char filename[50];
printf("Enter the filename: \n");
scanf("%s",filename);
fp = fopen(filename,"r");
yyin = fp;
// TODO: (Design choice) Consider dumping the array to a file, but I guess it should return the arrays directly to the program. Research how to do this and use it with another program externally.

// Call the main flex function and render the desired output. 
yylex();

 
return 0;
}