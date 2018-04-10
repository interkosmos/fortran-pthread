FC      = gfortran8
CFLAGS  = -Ofast -Wl,-rpath=/usr/local/lib/gcc8/ -I/usr/local/include/ -L/usr/local/lib/
LDFLAGS = -lpthread
SRC     = pthread.f90
OBJ     = pthread.o

DIR     = examples
SIMPLE  = simple

all: $(OBJ) $(SIMPLE)

pthread: $(OBJ)

$(OBJ):
	$(FC) -c $(SRC)

$(SIMPLE): $(DIR)/$*.f90 $(OBJ)
	$(FC) $(CFLAGS) -o $@ $? $(LDFLAGS)

.PHONY: clean

clean:
	rm *.mod $(OBJ) $(SIMPLE)
