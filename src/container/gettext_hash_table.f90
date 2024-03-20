module gettext_hash_table

    use gettext_sll, only: sll_type, push_back, keyvalue_type
    use gettext_sll_iterator, only: sll_iterator_type
    use gettext_hash, only: adler32
    use gettext_constants, only: NUL, stack_size
    use gettext_utils, only: LANG

    type table_type
        character(:), allocatable :: LANG
        type(sll_type) :: buckets(0:stack_size - 1)
        type(sll_iterator_type) :: iter
    end type table_type

contains

    subroutine read_table(table)
        type(table_type), intent(out) :: table
        integer :: i, key_, value_, dual
        type(keyvalue_type) :: item
        character(:), allocatable :: c

        table%LANG = LANG()
        c = read_whole_file(table%LANG//".mo")
        dual = 0; key_ = 0; value_ = 0
        do i = 1, len(c)
            if (c(i:i) == NUL) then
                dual = dual + 1
            else
                cycle
            end if
            select case (dual)
            case (1)
                key_ = i
                item%key = c(value_ + 1:key_ - 1)
            case (2)
                value_ = i
                item%value = c(key_ + 1:value_ - 1)
                call push_back(table%buckets(modulo(adler32(item%key), stack_size)), item)
                dual = 0
            end select
        end do

    end subroutine read_table

    !> read the file as a string
    function read_whole_file(file) result(string)
        character(*), intent(in) :: file  !! file name to read
        character(:), allocatable :: string  !! file content
        integer :: unit, len

        open (newunit=unit, file=file, status='old', action='read', access='stream', form='unformatted')

        inquire (unit, size=len)
        allocate (character(len=len) :: string)
        read (unit) string  ! use binary read to read the whole file faster

        close (unit)

    end function read_whole_file

end module gettext_hash_table
