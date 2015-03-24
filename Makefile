all: sfn

sfn: terminal.o sfn.d
	dmd sfn.d terminal.o -ofsfn -O -w -wi

terminal.o: terminal.c
	gcc terminal.c -shared -c


man: sfn.1

sfn.1: sfn.1.ronn
	ronn -r sfn.1.ronn


dmd: sfn

gdc: terminal.o sfn.d
	gdc sfn.d terminal.o -o sfn -O2 -Wall

ldc: terminal.o sfn.d
	ldc2 sfn.d terminal.o -O2 -of sfn

ldc2: ldc

install:
	install -D sfn ${DESTDIR}/usr/bin/sfn
	install -D sfn.1 ${DESTDIR}/usr/share/man/man1/sfn.1

clean:
	rm -f sfn *.o
