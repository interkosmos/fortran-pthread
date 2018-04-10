! pthread.f90
!
! Author:  Philipp Engel
! Licence: ISC
module pthread
    use, intrinsic :: iso_c_binding
    implicit none

    private

    integer, parameter :: size_of_types = 2

    type, bind(c) :: pthread_t
        private
        integer(kind=c_int), dimension(size_of_types) :: hidden
    end type pthread_t

    public :: pthread_t

    public :: pthread_create
    public :: pthread_join

    interface
        ! int pthread_create(pthread_t *, const pthread_attr_t *, void *(void *), void *)
        integer(kind=c_int) function pthread_create(thread, attr, start_routine, arg) bind(c)
            import :: c_ptr, c_funptr, c_int
            type(c_ptr),    value :: thread
            type(c_ptr),    value :: attr
            type(c_funptr), value :: start_routine
            type(c_ptr),    value :: arg
        end function pthread_create

        ! int pthread_join(pthread_t, void **)
        integer(kind=c_int) function pthread_join( thread, value_ptr) bind(c)
            import :: c_ptr, c_int, pthread_t
            type(pthread_t), value :: thread
            type(c_ptr)            :: value_ptr
        end function pthread_join
    end interface
end module pthread
