##### Introduction of Using Flex and the General Workflow to Generate a Scanner:

1. in bash, run
    env_setup.sh

2. Create the scanner program in flex, first by creating a script with the .l extention that will generate the scanner
 example: lex.l (see contents of lex.l for demonstration purposes)

3. Next, in bash run
    flex lex.l
to generate the scanner source code a C source code.

4. Now, we have a C source code program called lex.yy.c 
Assuming we have a compiler installed (env_setup.sh sets up gcc if its not already installed), in bash run

gcc lex.yy.c

and the scanner program a.out will be generated.

5. To run a.out, a regex-able string must be given as in input parameter when executing the program. In linux run it by

    ./a.out <input_argument>

    example: ./a.out ABCdefg

with the example scanner generated from lex.l, our scanner will take the input and return the number of capital letters in our input.


##### Constructing the scanner for Our Compiler

1. setup the environment according to step one in the previous section if not already done so.

2. Program the lex.l file according to the desired functionality of the scanner you desire. 
The scanner for a compiler will need to take input by the user (we already will have this by way of flex's functionality) then it will need to return a list of properly processed tokens to be handed off to the parser.

3. flex lex.l

4. gcc lex.yy.c

5. The scanner is ready, rename it to something that makes sense such as scanner.out.

6. Move to Phase2--parser-dev