.POSIX:
.SUFFIXES:

FC       = gfortran
PREFIX   = /usr/local
FFLAGS   = -Wall -fmax-errors=1
LDFLAGS  = -I$(PREFIX)/include/ -L$(PREFIX)/local/lib/
LDLIBS   = -lpthread
TARGET   = pthread.o

EXAMPLES = examples
SIMPLE   = simple
MULTI    = multi

.PHONY: all clean

all: $(OBJ) $(SIMPLE) $(MULTI)

$(TARGET):
	$(FC) -c src/pthread.f90

$(SIMPLE): $(TARGET)
	$(FC) $(FFLAGS) $(LDFLAGS) -o $(SIMPLE) $(EXAMPLES)/$(SIMPLE)/$(SIMPLE).f90 $(LDLIBS)

$(MULTI): $(TARGET)
	$(FC) $(FFLAGS) $(LDFLAGS) -o $(MULTI) $(EXAMPLES)/$(MULTI)/$(MULTI).f90 $(LDLIBS)

clean:
	rm *.mod *.o $(SIMPLE) $(MULTI)
