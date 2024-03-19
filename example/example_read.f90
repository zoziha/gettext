program example_read

    use gettext_module

    type(table_type) :: tbl

    call read_table(tbl, 'zh_CN.mo')
    print *, gettext&
&(tbl, "XYZ                                                                                                 ")
    print *, "你好"

end program example_read
