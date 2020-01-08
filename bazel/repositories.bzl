load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def load_dependencies(skip_targets = []):
    _com_github_catch2()
    _com_github_puppetlabs_leatherman()

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

def _com_github_puppetlabs_leatherman():
    http_archive(
        name = "com_github_puppetlabs_leatherman",
        build_file = "//bazel/external:leatherman.BUILD",
        urls = ["https://github.com/puppetlabs/leatherman/releases/download/1.9.1/leatherman.tar.gz"],
        sha256 = "3da32c9712e19158c95d3e00d02141e5a9ed81522a75c20dd2a9024e3dbb8363",
        strip_prefix = "dest/usr/local",
    )
