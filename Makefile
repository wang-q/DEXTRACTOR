-include settings.mk

DEST_DIR  = ~/bin

CFLAGS = -O2 -Wall -Wno-unused-result -fno-strict-aliasing
LDFLAGS = -I$(HAVE_HDF5)/include -I$(HAVE_ZLIB)/include -L$(HAVE_HDF5)/lib -L$(HAVE_ZLIB)/lib -lhdf5 -lz

ALL = dextract dexta undexta dexar undexar dexqv undexqv dex2DB

all: $(ALL)

dextract: dextract.c sam.c bax.c expr.c expr.h bax.h DB.c DB.h QV.c QV.h
	gcc $(CFLAGS) dextract.c sam.c bax.c expr.c DB.c QV.c $(LDFLAGS) -o $@

dexta: dexta.c DB.c DB.h QV.c QV.h
	gcc $(CFLAGS) dexta.c DB.c QV.c -o $@

undexta: undexta.c DB.c DB.h QV.c QV.h
	gcc $(CFLAGS) undexta.c DB.c QV.c -o $@

dexar: dexar.c DB.c DB.h QV.c QV.h
	gcc $(CFLAGS) dexar.c DB.c QV.c -o $@

undexar: undexar.c DB.c DB.h QV.c QV.h
	gcc $(CFLAGS) undexar.c DB.c QV.c -o $@

dexqv: dexqv.c DB.c DB.h QV.c QV.h
	gcc $(CFLAGS) dexqv.c DB.c QV.c -o $@

undexqv: undexqv.c DB.c DB.h QV.c QV.h
	gcc $(CFLAGS) undexqv.c DB.c QV.c -o $@

dex2DB: dex2DB.c sam.c bax.c DB.c QV.c bax.h DB.h QV.h
	gcc $(CFLAGS) dex2DB.c sam.c bax.c DB.c QV.c $(LDFLAGS) -o $@

clean:
	rm -f $(ALL)
	rm -fr *.dSYM
	rm -f dextract.tar.gz

install:
	cp $(ALL) $(DEST_DIR)

package:
	make clean
	tar -zcf dextract.tar.gz README.md Makefile *.h *.c
