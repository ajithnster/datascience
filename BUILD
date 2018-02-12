load("@subpar//:subpar.bzl", "par_binary")

par_binary(
    name = 'hello',
    srcs = ['hello.py'],
    deps = ['//baz:some_py_lib'],
    data = ['quux.dat'],
)