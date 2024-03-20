module user_gettext

    use gettext_module, gettext_mate => gettext

    type(table_type) :: tbl

    interface operator(.t.)
        module procedure gettext
    end interface

contains

    subroutine locale()
        call read_table(tbl)
    end subroutine locale

    function gettext(key)
        character(*), intent(in) :: key
        character(:), allocatable :: gettext

        gettext = gettext_mate(tbl, key)

    end function gettext

end module user_gettext

program example_read

    use user_gettext, only: gettext, locale, operator(.t.)

    call locale()
    print "(2A)", "`Hello World!`的中文翻译：", gettext("Hello World!")    ! 无句尾空格
    print "(2A)", "`Hello World! `的中文翻译：", gettext("Hello World! ")  ! 有句尾空格
    print "(2A)", "`Hello World! `的中文翻译：", .t."Hello World! "        ! 有句尾空格

end program example_read
