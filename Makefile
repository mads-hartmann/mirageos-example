MIRAGE  = mirage

MODE   ?= unix
NET    ?= socket

MIRAGE_FLAGS ?=

all: build

configure: src
	cd src && $(MIRAGE) configure -t $(MODE) $(MIRAGE_FLAGS)

build: configure
	cd src && $(MAKE) depend && $(MAKE)

clean:
	-cd src && $(MAKE) clean

testrun:
	$(SUDO) sh ./testrun.sh src
