# Lab 02 - UNIX Filters

## Lab Goals

The goal of this lab is to get used to the lab development environment, including using git, GitHub, and GitHub classroom in the lab environment, doing some very simple and basic C programming, and learning about UNIX standard input, standard output, redirection, and pipelining. If you get stuck, check with the TA or CA or with students around you... just don't copy your neighbors code.

## Background : Filter Programs

One of the very nice things about UNIX is that it introduced the concept of a *filter* program. A filter program is a program that reads input data, processes it, and writes output data. UNIX adds the concepts of standardized Input/Output (I/O) by formalizing the concept of a standard input data stream called *stdin*, and a standard output data stream called *stdout*. Many of the C library functions automatically read from stdin (like `getchar` or `scanf`), or write to stdout (line `putchar` or `printf`).

Normally, when you run a program in a UNIX terminal, stdin is connected to the keyboard. If you read from stdin, your program will stop until something is typed on the keyboard. When the user hits the enter key, the entire line is sent to the stdin stream and consumed by the program. If the user types `Ctrl-d`, that indicates an `end of file` on the stdin stream, and the end of file is (hopefully) recognized by the program.

Normally, the stdout stream writes to the terminal, so you can see whatever is written to stdout.

UNIX redirection is a way to change normal processing. You can *redirect* standard input or standard output so that stdin or stdout is connected to a file instead of the keyboard or terminal. You can even use pipelining to connect stdout of one program to stdin of another program.

See [Introduction to Linux: I/O Redirection](https://tldp.org/LDP/intro-linux/html/sect_05_01.html) for more details on redirection.

A filter program in UNIX is just a program that reads input from stdin, potentially modifies the data, and writes the results to stdout.

## Provided Code

I have provided four files in this repository:

### countSpace.c

This file is a C filter program that has been provided for you as an example. This program reads from standard input, and counts the number of white space characters (blanks, tabs, newlines, etc.) found in the file, as well as writing the text, unchanged, to standard output. It then prints a message to standard error that tells the user how many white space characters were in the file.

### expandTabs.c

This file contains the start of a C filter program that you will need to finish. It contains the basic lines of code to define a "main" function which reads from standard input and writes to standard output. However, the code, as delivered does not change the file.

This program needs to replace each tab read from standard input with blanks, where the number of blanks is specified by the command line argument. There is a comment that defines the specific changes required to perform this function. (It's pretty simple... early days yet.)

### example.txt

This file contains some example text that can be used as input to the countSpace program.

### Makefile

I have also provided a Makefile. (Warning - if you download the Makefile instead of cloning it through "git", the web browser may add a ".txt" suffix to this file. The .txt suffix will break the make command. If you clone the repository, this won't happen.) This Makefile has two explicit targets, "test" and "clean". There are also implicit targets for "countSpace", which runs the C compiler (gcc) to create the countSpace executable file from countSpace.c, and "expandTabs" to build the "expandTabs" executable from countTabs.c.

The "test" target builds the executables if required, and runs the result with some command line arguments.

The "clean" command removed the executable file created by make.

## Doing the Lab

1. Clone the repository on a UNIX machine. See [How to Use GitHub](https://www.cs.binghamton.edu/~tbartens/HowTo/Using_GitHub) for details on cloning, etc.
2. Read through `example.txt`, which has the basic concepts for command line arguments, and redirection.
3. Read through the existing code as well as the explanations in this README file to understand the infrastructure. You can try compiling and running the code, but until you code the expandTabs main function, you won't get the correct results.
4. Edit the expandTabs.c file to complete the main function. The TODO comment in the expandTabs.c file explains more about exactly what to do.
5. Build and test the result using the `make test` command. If you code the main function expandTabs.c correctly, you should see how the expandTabs filter modifies the amount of whitespace in the example.txt file.

   If your code is not working correctly, try using gdb to stop your code where it is failing, and step through the code a line at a time to see what is going wrong. See [How to Use GDB](http://www.cs.binghamton.edu/~tbartens/HowTo/Using_gdb) for more on debugging with gdb.
6. Once your code is working, commit and push your results into your master git repository, and get the hash code using `git rev-parse HEAD`. Paste that hash code into the submission area for lab02 in Brightspace.

## Lab Grading

This lab is worth 10 points. You will get the full 10 points if the TA's can download your repository using the git hash code from Brightspace onto a computer science machine, and run `make test`, and get the correct results. Your code will also be tested with a different set of arguments to make sure it works with any arguments. You will receive the following deductions:

- -5 if compiling expandTabs.c causes a compile error.
- -2 if compiling expandTabs.c causes a compiler warning
- -4 if the results do not print correctly.
- -1 if the Brightspace submission occurs after your lab period (A 5 or 10 minute grace period is allowed.)
- -2 for every 24 hours (or part of 24 hours) after the submission date.
