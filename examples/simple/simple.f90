! simple.f90
!
! Example that shows how to run a routine inside a pthread.
!
! Author:  Philipp Engel
! Licence: ISC
module util
    implicit none
    public :: hello
contains
    subroutine hello()
        integer :: i

        do i = 1, 10
            print '(i2, ": Hello, World!")', i
        end do
    end subroutine hello
end module util

program main
    use, intrinsic :: iso_c_binding
    use :: pthread
    use :: util
    implicit none
    type(pthread_t), target :: thread
    integer                 :: rc

    rc = pthread_create(c_loc(thread), c_null_ptr, c_funloc(hello), c_null_ptr)
    rc = pthread_join(thread, c_null_ptr)
end program main
