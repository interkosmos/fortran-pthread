! pthread.f90
!
! Fortran 2003 ISO C binding interfaces to POSIX Threads.
!
! Author:  Philipp Engel
! Licence: ISC
module pthread
    use, intrinsic :: iso_c_binding
    implicit none
    private
    integer, parameter :: SIZE_OF_TYPE = 2

    type, bind(c), public :: pthread_t
        private
        integer(kind=c_int) :: hidden(SIZE_OF_TYPE)
    end type pthread_t

    public :: pthread_create
    public :: pthread_join

    interface
        ! int pthread_create(pthread_t *, const pthread_attr_t *, void *(void *), void *)
        function pthread_create(thread, attr, start_routine, arg) bind(c, name='pthread_create')
            import :: c_int, c_ptr, c_funptr
            type(c_ptr),    intent(in), value :: thread
            type(c_ptr),    intent(in), value :: attr
            type(c_funptr), intent(in), value :: start_routine
            type(c_ptr),    intent(in), value :: arg
            integer(kind=c_int)               :: pthread_create
        end function pthread_create

        ! int pthread_join(pthread_t, void **)
        function pthread_join( thread, value_ptr) bind(c, name='pthread_join')
            import :: c_int, c_ptr, pthread_t
            type(pthread_t), intent(in), value :: thread
            type(c_ptr),     intent(in)        :: value_ptr
            integer(kind=c_int)                :: pthread_join
        end function pthread_join
    end interface
end module pthread
