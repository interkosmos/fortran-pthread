! multi.f90
! Example that shows how to run a routine inside several pthreads.
!
! Author:  Philipp Engel
! Licence: ISC
program main
    use, intrinsic :: iso_c_binding
    use :: pthread

    interface
        subroutine hello(n)
            integer, intent(in) :: n
        end subroutine hello
    end interface

    integer, parameter :: nthreads = 5
    integer            :: rc, i

    type(pthread_t), dimension(nthreads), target :: threads
    integer,         dimension(nthreads), target :: routines = (/ (i, i = 1, nthreads) /)

    do i = 1, nthreads
        rc = pthread_create(c_loc(threads(i)), c_null_ptr, c_funloc(hello), c_loc(routines(i)))
    end do

    do i = 1, nthreads
        rc = pthread_join(threads(i), c_loc(routines(i)))
    end do
end program main

subroutine hello(n)
    integer, intent(in) :: n
    integer             :: i

    do i = 1, 10
        call sleep(1)
        print '("Thread #", i0, " - ", i2)', n, i
    end do
end subroutine hello
