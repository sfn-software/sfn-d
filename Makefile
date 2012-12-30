all: dmd

dmd:
	dmd sfn.d -ofsfn -O -w -wi

gdc:
	gdc sfn.d -o sfn -O2 -Wall
	
install:
	install -D sfn ${DESTDIR}/usr/bin/sfn

clean:
	rm -f sfn sfn.o
