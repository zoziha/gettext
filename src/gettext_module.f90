module gettext_module

    use gettext_hash_table, only: table_type, read_table
    use gettext_sll, only: sll_type, keyvalue_type
    use gettext_sll_iterator, only: init_sll_iterator, sll_iterator_type, next_sll_iterator
    use gettext_hash, only: adler32

    private :: adler32

contains

    function gettext(table, key)
        type(table_type), intent(inout) :: table
        character(100), intent(in) :: key
        character(100) :: gettext
        type(keyvalue_type), pointer :: item
        logical :: found

        found = .false.
        table%iter = init_sll_iterator(table%buckets(modulo(adler32(key), 65535)))
        do while (next_sll_iterator(table%iter, item))
            if (item%key == key) then
                gettext = item%value
                found = .true.
                return
            end if
        end do

        if (.not. found) then
            gettext = key
        end if

    end function gettext

end module gettext_module
