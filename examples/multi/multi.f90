! multi.f90
!
! Example that shows how to run a routine inside several pthreads.
!
! Author:  Philipp Engel
! Licence: ISC
module util
    implicit none
    public :: hello
contains
    subroutine hello(n)
        integer, intent(in) :: n
        integer             :: i

        do i = 1, 10
            call sleep(1)
            print '("Thread #", i0, " - ", i2)', n, i
        end do
    end subroutine hello
end module util

program main
    use, intrinsic :: iso_c_binding
    use :: pthread
    use :: util
    integer, parameter :: NTHREADS = 5
    integer            :: i, rc

    type(pthread_t), target :: threads(NTHREADS)
    integer,         target :: routines(NTHREADS) = [ (i, i = 1, NTHREADS) ]

    do i = 1, NTHREADS
        rc = pthread_create(c_loc(threads(i)), c_null_ptr, c_funloc(hello), c_loc(routines(i)))
    end do

    do i = 1, NTHREADS
        rc = pthread_join(threads(i), c_loc(routines(i)))
    end do
end program main
