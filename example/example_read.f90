program example_read

    use gettext_module

    type(table_type) :: tbl

    call read_table(tbl, './example/1.txt')
    print *, gettext&
&(tbl,"XYZ                                                                                                 ")

end program example_read
