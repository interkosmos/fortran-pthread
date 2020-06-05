# fortran-pthread
Proof of concept of an interface to POSIX Threads for Fortran 2003.

## Build
Use the provided `Makefile` to build the interfaces:

```
$ make
```

Or, run your favourite Fortran compiler directly:

```
$ gfortran -c src/pthread.f90
```

## Examples
Please check directory `examples` for demos:

* **simple** runs a routine inside a `pthread`.
* **multi** runs a routine inside several `pthreads`.

Compile the examples with:

```
$ make <name>
```

## Licence
ISC
