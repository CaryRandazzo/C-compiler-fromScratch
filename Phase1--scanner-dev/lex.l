/////////////////////////////////////////////////////////////////////////
/*** DEFINITION SECTION -- can be accessed inside yylex() and main() ***/
/////////////////////////////////////////////////////////////////////////

%{
int count = 0;
%}


//////////////////////
/*** RULE SECTION ***/
//////////////////////

%%
[A-Z] {printf("%s capital letter\n", yytext);
       count++;}
.     {printf("%s not a capital letter\n", yytext);}
\n    {return 0;}
%%
//////////////////////
/*** CODE SECTION ***/
//////////////////////

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


// Call the main flex function and render the desired output. 
yylex();
printf("\nNumber of Capital letters "
      "in the given input - %d\n", count);
 
return 0;
}