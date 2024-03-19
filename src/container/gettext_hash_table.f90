module gettext_hash_table

    use gettext_sll, only: sll_type, push_back, keyvalue_type
    use gettext_sll_iterator, only: sll_iterator_type
    use gettext_hash, only: adler32

    type table_type
        character(len=10) :: LANG
        type(sll_type) :: buckets(0:65535 - 1)
        type(sll_iterator_type) :: iter
    end type table_type

contains

    subroutine read_table(table, file)
        type(table_type), intent(out) :: table
        character(*), intent(in) :: file
        integer :: unit, stat
        type(keyvalue_type) :: item

        open (newunit=unit, file=file, status='old', action='read')
        do
            read (unit, '(2a100)', iostat=stat) item%key, item%value
            if (stat < 0) exit
            call push_back(table%buckets(modulo(adler32(item%key), 65535)), item)
        end do

    end subroutine read_table

end module gettext_hash_table
