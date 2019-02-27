package(default_visibility = ["//visibility:public"])

filegroup(
    name = "srcs",
    srcs = ["Main.java"],
)

java_library(
    name = "main",
    srcs = [
        ":srcs"
    ],
    deps = [
        "//src/inroot:gen_root_file_same_pkg_lib",
        "//src/inroot:gen_root_file_sub_pkg_lib",
        "//src/inroot:gen_root_file_sup_pkg_lib",
        "//src/inroot:gen_root_file_another_pkg_lib",
        "//src/inroot:gen_root_srcjar_same_pkg_lib",
        "//src/inroot:gen_root_srcjar_sub_pkg_lib",
        "//src/inroot:gen_root_srcjar_sup_pkg_lib",
        "//src/inroot:gen_root_srcjar_another_pkg_lib",
        "//src/inpkg:gen_pkg_file_same_pkg_lib",
        "//src/inpkg:gen_pkg_file_sub_pkg_lib",
        "//src/inpkg:gen_pkg_file_sup_pkg_lib",
        "//src/inpkg:gen_pkg_file_another_pkg_lib",
        "//src/inpkg:gen_pkg_srcjar_same_pkg_lib",
        "//src/inpkg:gen_pkg_srcjar_sub_pkg_lib",
        "//src/inpkg:gen_pkg_srcjar_sup_pkg_lib",
        "//src/inpkg:gen_pkg_srcjar_another_pkg_lib",
    ],
)
