program xgettext

    use gettext_sll_node, only: keyvalue_type
    use gettext_constants, only: stack_size, NUL

    type(keyvalue_type) :: items(stack_size)
    integer :: maxcount

    call read_file(items, 'zh_CN.po', maxcount)
    call write_file(items, 'zh_CN.mo', maxcount)
    print "(A,i0,A)", "Processed ", maxcount, " message(s)."

contains

    subroutine read_file(items, file, maxcount)
        type(keyvalue_type), intent(out) :: items(:)
        character(*), intent(in) :: file
        integer, intent(out) :: maxcount
        integer :: unit, stat, j
        type(keyvalue_type) :: item
        character(2) :: c

        maxcount = 0; j = 1
        open (newunit=unit, file=file, status='old', action='read')
        do
            j = j + 2
            read (unit, '(a1,a100)', iostat=stat) c(1:1), item%key
            if (stat < 0) exit
            read (unit, '(a1,a100)', iostat=stat) c(2:2), item%value
            if (c /= "+-") then
                if (c(2:2) /= "-") j = j + 1
                print *, "Error: file read error at line ", j
                stop
            end if
            maxcount = maxcount + 1
            items(maxcount) = item
        end do
        close (unit)

    end subroutine read_file

    subroutine write_file(items, file, maxcount)
        type(keyvalue_type), intent(in) :: items(:)
        character(*), intent(in) :: file
        integer, intent(in) :: maxcount
        integer :: unit, j

        open (newunit=unit, file=file, status='replace', action='write', form="unformatted", access="stream")
        do j = 1, maxcount
            write (unit) items(j)%key, NUL, items(j)%value, NUL
        end do
        close (unit)

    end subroutine write_file

end program xgettext
