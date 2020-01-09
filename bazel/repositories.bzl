load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def load_dependencies(skip_targets = []):
    _com_github_catch2()
    _com_github_fmtlib_fmt()

def _com_github_fmtlib_fmt():
  http_archive(
    name = "com_github_fmtlib_fmt",
    build_file = "//bazel/external:fmtlib.BUILD",
    urls = ["https://github.com/fmtlib/fmt/releases/download/6.1.0/fmt-6.1.0.zip"],
    sha256 = "0e2afdcb9fb852f15642c920ff78139a81f31cda82454b06d62b0b6038d0a90e",
    strip_prefix = "fmt-6.1.0",
  )

def _com_github_catch2():
    http_archive(
        name='com_github_catch2',
        sha256='6e5e686c9e83ff92d622dd04281e9893957a812cfc97d2d1028a988e4bc6a31e',
        urls=['https://github.com/catchorg/catch2/archive/v1.10.0.tar.gz'],
        build_file='//bazel/external:catch2.BUILD',
        strip_prefix = 'Catch2-1.10.0'
    )
    native.bind(
        name = "catch2",
        actual = "@com_github_catch2//:catch2"
    )
