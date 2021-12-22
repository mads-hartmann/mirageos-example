MIRAGE  = mirage

MODE   ?= unix
NET    ?= socket

MIRAGE_FLAGS ?=

BASE_TESTS = \
  tutorial/hello

ifeq ($(MODE),muen)
	TESTS = $(BASE_TESTS)
else
	TESTS = $(BASE_TESTS)
	TESTS += device-usage/block
endif

ifdef WITH_TRACING
TESTS += device-usage/tracing
endif

CONFIGS = $(patsubst %, %-configure, $(TESTS))
BUILDS  = $(patsubst %, %-build,     $(TESTS))
TESTRUN = $(patsubst %, %-testrun,   $(TESTS))
CLEANS  = $(patsubst %, %-clean,     $(TESTS))

all: build

configure: $(CONFIGS)
build: $(BUILDS)
testrun: $(TESTRUN)
clean: $(CLEANS)

## default tests
%-configure:
	cd $* && $(MIRAGE) configure -t $(MODE) $(MIRAGE_FLAGS)

%-build: %-configure
	-cp Makefile.user $*
	cd $* && $(MAKE) depend && $(MAKE)

%-clean:
	-cd $* && $(MAKE) clean
	-$(RM) $*/Makefile.user

%-testrun:
	$(SUDO) sh ./testrun.sh $*
