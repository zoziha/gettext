module gettext_utils

contains

    function LANG()
        character(:), allocatable :: LANG
        character(64) :: value
        integer :: stat

        call get_environment_variable("LANG", value, status=stat)
        if (stat == 0) then
            LANG = value(:index(value, ".") - 1)
        else
            LANG = "C"
        end if

    end function LANG

end module gettext_utils
