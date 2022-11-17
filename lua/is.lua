local is = {}

is.windows = jit.os == 'Windows'
is.mac = jit.os == 'OSX'
is.linux = jit.os == 'Linux'

return is
