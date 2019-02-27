load("//:gen.bzl", "second_generate_file", "second_generate_srcjar")

package(default_visibility = ["//visibility:public"])


second_generate_file(
    name = "gen_pkg_file_same_pkg",
    package = "inpkg",
    class_name = "PkgFileInSamePackage",
    expected = "to not be visible",
)

second_generate_file(
    name = "gen_pkg_file_sub_pkg",
    package = "inpkg.sub",
    class_name = "PkgFileInSubPackage",
    expected = "to not be visible",
)

second_generate_file(
    name = "gen_pkg_file_sup_pkg",
    package = "sup.inpkg",
    class_name = "PkgFileInSupPackage",
    expected = "to not be visible",
)

second_generate_file(
    name = "gen_pkg_file_another_pkg",
    package = "inanotherpkg",
    class_name = "PkgFileInAnotherPackage",
    expected = "to not be visible",
)

second_generate_srcjar(
    name = "gen_pkg_srcjar_same_pkg",
    package = "inpkg",
    class_name = "PkgSrcjarInSamePackage",
    expected = "to be visible",
)

second_generate_srcjar(
    name = "gen_pkg_srcjar_sub_pkg",
    package = "inpkg.sub",
    class_name = "PkgSrcjarInSubPackage",
    expected = "to be visible",
)

second_generate_srcjar(
    name = "gen_pkg_srcjar_sup_pkg",
    package = "sup.inpkg",
    class_name = "PkgSrcjarInSupPackage",
    expected = "to be visible",
)

second_generate_file(
    name = "gen_pkg_srcjar_another_pkg",
    package = "inanotherpkg",
    class_name = "PkgSrcjarInAnotherPackage",
    expected = "to not be visible",
)


java_library(
    name = "gen_pkg_file_same_pkg_lib",
    srcs = [":gen_pkg_file_same_pkg"],
)
java_library(
    name = "gen_pkg_file_sub_pkg_lib",
    srcs = [":gen_pkg_file_sub_pkg"],
)
java_library(
    name = "gen_pkg_file_sup_pkg_lib",
    srcs = [":gen_pkg_file_sup_pkg"],
)
java_library(
    name = "gen_pkg_file_another_pkg_lib",
    srcs = [":gen_pkg_file_another_pkg"],
)
java_library(
    name = "gen_pkg_srcjar_same_pkg_lib",
    srcs = [":gen_pkg_srcjar_same_pkg"],
)
java_library(
    name = "gen_pkg_srcjar_sub_pkg_lib",
    srcs = [":gen_pkg_srcjar_sub_pkg"],
)
java_library(
    name = "gen_pkg_srcjar_sup_pkg_lib",
    srcs = [":gen_pkg_srcjar_sup_pkg"],
)
java_library(
    name = "gen_pkg_srcjar_another_pkg_lib",
    srcs = [":gen_pkg_srcjar_another_pkg"],
)
