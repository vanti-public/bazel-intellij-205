load("//:gen.bzl", "first_generate_srcjar", "first_generate_file")

package(default_visibility = ["//visibility:public"])

filegroup(
    name = "srcs",
    srcs = ["Main.java"],
)

first_generate_file(
    name = "gen_file",
    package = "first",
    expected = "to be visible",
)

first_generate_srcjar(
    name = "gen_srcjar",
    package = "first",
    expected = "not to be visible",
)

java_library(
    name = "first_file_lib",
    srcs = [":gen_file"],
)

java_library(
    name = "first_srcjar_lib",
    srcs = [":gen_srcjar"],
)

java_library(
    name = "main",
    srcs = [
        ":srcs"
    ],
    deps = [
        ":first_srcjar_lib",
        ":first_file_lib",
    ],
)
