project(
    'gettext',
    'fortran',
    default_options : [
        'buildtype=debugoptimized',
        'fortran_std=f2008',
        'default_library=shared',
    ],
)

subdir('src')

gettext_lib = library('gettext', gettext_src)

example_read = executable('example_read', 'example/example_read.f90', link_with: gettext_lib)
xgettext = executable('xgettext', 'example/xgettext.f90', link_with: gettext_lib)
