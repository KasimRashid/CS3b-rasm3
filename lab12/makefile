all:
	as -g -o lab12.o lab12.s
	as -g -o ../obj/factorial.o factorial.s
	ld -o lab12 lab12.o ../obj/String_length.o ../obj/putstring.o ../obj/putch.o ../obj/int64asc.o ../obj/factorial.o ../obj/getstring.o ../obj/ascint64.o

.PHONY: clean

clear:
	rm -f * .o run *~
