


/* DEFINITION SECTION -- can be accessed inside yylex() and main() */

/*  IMPORTANT NOTE!:  UNTESTED, make updates to the code then test */
/* Try unit dest based design: Create the unit tests and test cases for the scanner first then run the output of this scanner givene the test input against it. */


%{
int count = 0;
//char capitals[50]; // TODO: This will require dynamic allocation of the capitals array to work properly ,this is a static declaration temporarily
//char lowercase[50]; // TODO: ditto as the capitals
%}



/* RULE SECTION */


%%
[A-Z] {printf("%s capital letter\n", yytext);
       count++;} // TODO: Add the append/update to the capitals character array here for each found capital letter
.     {printf("%s not a capital letter\n", yytext);} // TODO: Add the append/update to the lowercase character array here for each found lowercase letter
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
printf("\nNumber of Capital letters "
      "in the given input - %d\n", count);
 
return 0;
}