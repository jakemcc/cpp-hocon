load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def load_dependencies(skip_targets = []):
    # Setup external Bazel rules
    # _foreign_cc_dependencies()

    # The long repo names (`com_github_fmtlib_fmt` instead of `fmtlib`) are
    # semi-standard in the Bazel community, intended to avoid both duplicate
    # dependencies and name conflicts.
    # _com_github_fmtlib_fmt()
    # _com_github_gabime_spdlog()

    _com_github_catch2()

    _org_boost_boost()
    _com_github_puppetlabs_leatherman()
    # _com_github_puppetlabs_cpp_hocon()

    # _com_google_googletest()

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

# def _com_github_fmtlib_fmt():
#   http_archive(
#     name = "com_github_fmtlib_fmt",
#     build_file = "//bazel/external:fmtlib.BUILD",
#     urls = ["https://github.com/fmtlib/fmt/releases/download/6.1.0/fmt-6.1.0.zip"],
#     sha256 = "0e2afdcb9fb852f15642c920ff78139a81f31cda82454b06d62b0b6038d0a90e",
#     strip_prefix = "fmt-6.1.0",
#   )
#   native.bind(
#     name = "fmtlib",
#     actual = "@com_github_fmtlib_fmt//:fmtlib",
#   )

# def _com_github_gabime_spdlog():
#   http_archive(
#     name = "com_github_gabime_spdlog",
#     build_file = "//bazel/external:spdlog.BUILD",
#     sha256 = "821c85b120ad15d87ca2bc44185fa9091409777c756029125a02f81354072157",
#     strip_prefix = "spdlog-1.4.2",
#     urls = ["https://github.com/gabime/spdlog/archive/v1.4.2.tar.gz"],
#   )
#   native.bind(
#     name = "spdlog",
#     actual = "@com_github_gabime_spdlog//:spdlog",
#   )

def _com_github_puppetlabs_cpp_hocon():
    http_archive(
        name = "com_github_puppetlabs_cpp_hocon",
        build_file = "//bazel/external:cpp_hocon.BUILD",
        urls = ["https://github.com/puppetlabs/cpp-hocon/releases/download/0.2.1/cpp-hocon.tar.gz"],
        sha256 = "cf86780301f0c5f05c21af66fe9a90ae81592717103c6a6d2a9a5291d8beddc2",
        strip_prefix = "dest/usr/local",
    )
    native.bind(
        name = "cpp_hocon",
        actual = "@com_github_puppetlabs_cpp_hocon//:cpp_hocon",
    )

def _com_github_puppetlabs_leatherman():
    http_archive(
        name = "com_github_puppetlabs_leatherman",
        build_file = "//bazel/external:leatherman.BUILD",
        urls = ["https://github.com/puppetlabs/leatherman/releases/download/1.9.1/leatherman.tar.gz"],
        sha256 = "3da32c9712e19158c95d3e00d02141e5a9ed81522a75c20dd2a9024e3dbb8363",
        strip_prefix = "dest/usr/local",
    )
    native.bind(
        name = "leatherman",
        actual = "@com_github_puppetlabs_leatherman//:leatherman",
    )

def _org_boost_boost():
    http_archive(
        name = "org_boost_boost",
        urls = [
            "https://dl.bintray.com/boostorg/release/1.72.0/source/boost_1_72_0.tar.bz2",
            "https://managedway.dl.sourceforge.net/project/boost/boost/1.72.0/boost_1_72_0.tar.bz2",
        ],
        sha256 = "59c9b274bc451cf91a9ba1dd2c7fdcaf5d60b1b3aa83f2c9fa143417cc660722",
        strip_prefix = "boost_1_72_0",
        build_file = "//bazel/external:boost.BUILD"
    )
    native.bind(
        name = "boost",
        actual = "@org_boost_boost//:boost",
    )
    native.bind(
        name = "boost_all",
        actual = "@org_boost_boost//:all",
    )

# def _com_google_googletest():
#   _repository_impl("com_google_googletest")
#   native.bind(
#     name = "googletest",
#     actual = "@com_google_googletest//:gtest",
#   )

# def _foreign_cc_dependencies():
#   _repository_impl("rules_foreign_cc")
