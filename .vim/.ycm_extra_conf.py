flags = [
'-Wall',
'-Wextra',
'-Werror',
'-std=c++11',
'-Wno-long-long',
'-Wno-variadic-macros',
'-isystem',
'/usr/include',
]

def FlagsForFile( filename, **kwargs ):
    return {'flags': flags, 'do_cache': True}
