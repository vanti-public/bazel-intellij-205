load("//:gen.bzl", "first_generate_srcjar", "first_generate_file")

package(default_visibility = ["//visibility:public"])

first_generate_file(
    name = "gen_root_file_same_pkg",
    package = "inroot",
    class_name = "RootFileInSamePackage",
    expected = "to be visible",
)

first_generate_file(
    name = "gen_root_file_sub_pkg",
    package = "inroot.sub",
    class_name = "RootFileInSubPackage",
    expected = "to not be visible",
)

first_generate_file(
    name = "gen_root_file_sup_pkg",
    package = "sup.inroot",
    class_name = "RootFileInSupPackage",
    expected = "to not be visible",
)

first_generate_file(
    name = "gen_root_file_another_pkg",
    package = "inanotherroot",
    class_name = "RootFileInAnotherPackage",
    expected = "to not be visible",
)

first_generate_srcjar(
    name = "gen_root_srcjar_same_pkg",
    package = "inroot",
    class_name = "RootSrcjarInSamePackage",
    expected = "to not be visible",
)

first_generate_srcjar(
    name = "gen_root_srcjar_sub_pkg",
    package = "inroot.sub",
    class_name = "RootSrcjarInSubPackage",
    expected = "to not be visible",
)

first_generate_srcjar(
    name = "gen_root_srcjar_sup_pkg",
    package = "sup.inroot",
    class_name = "RootSrcjarInSupPackage",
    expected = "to not be visible",
)

first_generate_srcjar(
    name = "gen_root_srcjar_another_pkg",
    package = "inanotherroot",
    class_name = "RootSrcjarInAnotherPackage",
    expected = "to not be visible",
)


java_library(
    name = "gen_root_file_same_pkg_lib",
    srcs = [":gen_root_file_same_pkg"],
)
java_library(
    name = "gen_root_file_sub_pkg_lib",
    srcs = [":gen_root_file_sub_pkg"],
)
java_library(
    name = "gen_root_file_sup_pkg_lib",
    srcs = [":gen_root_file_sup_pkg"],
)
java_library(
    name = "gen_root_file_another_pkg_lib",
    srcs = [":gen_root_file_another_pkg"],
)
java_library(
    name = "gen_root_srcjar_same_pkg_lib",
    srcs = [":gen_root_srcjar_same_pkg"],
)
java_library(
    name = "gen_root_srcjar_sub_pkg_lib",
    srcs = [":gen_root_srcjar_sub_pkg"],
)
java_library(
    name = "gen_root_srcjar_sup_pkg_lib",
    srcs = [":gen_root_srcjar_sup_pkg"],
)
java_library(
    name = "gen_root_srcjar_another_pkg_lib",
    srcs = [":gen_root_srcjar_another_pkg"],
)