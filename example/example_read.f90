program example_read

    use gettext_module

    type(table_type) :: tbl

    call read_table(tbl, 'zh_CN.mo')
    print "(2A)", "`Hello World!`的中文翻译：", gettext(tbl, "Hello World!")

end program example_read
