module gettext_hash

contains

    !> Adler-32 checksum
    integer pure function adler32(string)
        character(*), intent(in) :: string
        integer :: i, s1, s2
        integer, parameter :: MOD_ADLER = 65521  ! largest prime smaller than 65536

        s1 = 1
        s2 = 0

        do i = 1, len(string)
            s1 = mod(s1 + ichar(string(i:i)), MOD_ADLER)
            s2 = mod(s2 + s1, MOD_ADLER)
        end do

        adler32 = shiftl(s2, 16) + s1

    end function adler32

end module gettext_hash
