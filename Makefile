CC = gcc
CFLAGS = -Wall -std=c18 -ggdb

test : countSpace expandTabs
	./countSpace
	./countSpace <example.txt >/dev/null
	./expandTabs 3 <example.txt | ./countSpace 
	./expandTabs 5 <example.txt | ./countSpace
	
gdb : countSpace
	gdb --args ./expandTabs 3 <example.txt

clean :
	-rm countSpace expandTabs