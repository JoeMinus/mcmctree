PRGS =  mcmctree 
CC = cc # cc, gcc, cl # if running on an intel cluster, check if you can compile with the intel compiler, icc

CFLAGS = -O3
#CFLAGS = -fast # this flag is for the intel compiler

LIBS = -lm # -lM

all : $(PRGS)

mcmctree : mcmctree.c  tools.c treesub.c treespace.c paml.h 
	$(CC) $(CFLAGS) -o $@ mcmctree.c tools.c $(LIBS)
	$(CC) $(CFLAGS) -o infinitesites -D INFINITESITES mcmctree.c tools.c $(LIBS)
