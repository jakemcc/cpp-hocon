cc_library(
  name = "leatherman",
  srcs = ["lib/leatherman_curl.a",
          "lib/leatherman_execution.a",
          "lib/leatherman_json_container.a",
          "lib/leatherman_logging.a",
          "lib/leatherman_util.a",
          "lib/leatherman_dynamic_library.a",
          "lib/leatherman_file_util.a",
          "lib/leatherman_locale.a",
          "lib/leatherman_ruby.a"],
  hdrs = glob(["include/**/*.hpp"]),
  includes = ["include"],
  deps = ["@org_boost_boost//:all"],
  visibility = ["//visibility:public"],
)

