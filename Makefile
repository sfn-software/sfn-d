all:
	dmd sfn.d -ofsfn -O -w -wi
	
install:
	install -D sfn ${DESTDIR}/usr/bin/sfn
