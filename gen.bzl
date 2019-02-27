
_TEMPLATE_LABEL = "//:Template.java"

def _do_generate(ctx, output_dir, name, java_file, output_file, extras):
  print("Creating java file in " + java_file.path + "!")
  print("Expecting output file " + output_file.path + "!")
  ctx.actions.expand_template(
    template = ctx.file._template,
    output = java_file,
    substitutions = {
      "{PACKAGE}": ctx.attr.package,
      "{CLASS_NAME}": name,
      "{COMMENT}": ctx.attr.expected,
    }
  )

  outputs = [output_file]

  if java_file != output_file:
    cmds = [
      "p=$PWD",
      "echo \"working dir\" $p",
      "mkdir -p %s" % output_dir,
    ]

    cmd = "\n".join(cmds + [" find ."] + extras)

    cmd_file = ctx.actions.declare_file(ctx.label.name + "-generate-cmd")
    print("Writing cmd file in " + cmd_file.path + "!")
    ctx.actions.write(
        output = cmd_file,
        content = cmd
    )
    inputs = [cmd_file]
    ctx.actions.run_shell(
      outputs=outputs,
      inputs=[java_file, cmd_file],
      command="bash %s" % cmd_file.path,
    )

  return struct(files = depset(outputs))

# These rules create the java files in the current dir ( e.g. File.java )
# Imports the file but not the srcjar

def _first_generate_file_impl(ctx):
  name = ctx.attr.class_name
  java_file = ctx.actions.declare_file(name + ".java")
  return _do_generate(ctx, "not-important", name, java_file, java_file, [])

first_generate_file = rule(
    implementation = _first_generate_file_impl,
    attrs = {
        "package": attr.string(),
        "class_name": attr.string(
            default = "FileClassInRoot"
        ),
        "expected": attr.string(),
        "_template": attr.label(
            default = Label(_TEMPLATE_LABEL),
            allow_single_file = True,
        ),
        "_jdk": attr.label(
            default = Label("@bazel_tools//tools/jdk:current_java_runtime"),
            providers = [java_common.JavaRuntimeInfo],
        ),
    },
)

def _first_generate_srcjar_impl(ctx):
  name = ctx.attr.class_name
  dir = "output/"
  java_file = ctx.actions.declare_file(dir + name + ".java")
  srcjar_file = ctx.actions.declare_file(dir + name + ".srcjar")

  java_runtime = ctx.attr._jdk[java_common.JavaRuntimeInfo]
  jar_path = "%s/bin/jar" % java_runtime.java_home

  return _do_generate(ctx, dir, name, java_file, srcjar_file, [
      "cd $p/%s" % java_file.dirname,
      "$p/%s cf $p/%s %s.java" % (jar_path, srcjar_file.path, name)
  ])

first_generate_srcjar = rule(
    implementation = _first_generate_srcjar_impl,
    attrs = {
        "package": attr.string(),
        "class_name": attr.string(
            default = "SrcJarClassInRoot"
        ),
        "expected": attr.string(),
        "_template": attr.label(
            default = Label(_TEMPLATE_LABEL),
            allow_single_file = True,
        ),
        "_jdk": attr.label(
            default = Label("@bazel_tools//tools/jdk:current_java_runtime"),
            providers = [java_common.JavaRuntimeInfo],
        ),
    },
)

# These rules more the java files to be in their package dir (e.g. package/File.java)
# Imports the srcjar but not the file

def _second_generate_file_impl(ctx):
  pkgDir = "/".join(ctx.attr.package.split("."))
  name = ctx.attr.class_name
  java_file = ctx.actions.declare_file(pkgDir + "/" + name + ".java")
  return _do_generate(ctx, pkgDir, name, java_file, java_file, [])

second_generate_file = rule(
    implementation = _second_generate_file_impl,
    attrs = {
        "package": attr.string(),
        "class_name": attr.string(
            default = "FileClassInPackage"
        ),
        "expected": attr.string(),
        "_template": attr.label(
            default = Label(_TEMPLATE_LABEL),
            allow_single_file = True,
        ),
        "_jdk": attr.label(
            default = Label("@bazel_tools//tools/jdk:current_java_runtime"),
            providers = [java_common.JavaRuntimeInfo],
        ),
    },
)

def _second_generate_srcjar_impl(ctx):
  name = ctx.attr.class_name
  pkgDir = "/".join(ctx.attr.package.split("."))
  dir = "output/" + pkgDir
  java_file = ctx.actions.declare_file(dir + "/" + name + ".java")
  srcjar_file = ctx.actions.declare_file(dir + "/" + name + ".srcjar")
  java_runtime = ctx.attr._jdk[java_common.JavaRuntimeInfo]
  jar_path = "%s/bin/jar" % java_runtime.java_home
  return _do_generate(ctx, dir, name, java_file, srcjar_file, [
      "cd $p/%s" % java_file.dirname,
      "cd %s" % "/".join([".." for d in pkgDir.split("/")]),
      "$p/%s cf $p/%s %s.java" % (jar_path, srcjar_file.path, pkgDir + "/" + name)
  ])

second_generate_srcjar = rule(
    implementation = _second_generate_srcjar_impl,
    attrs = {
        "package": attr.string(),
        "class_name": attr.string(
            default = "SrcJarClassInPackage"
        ),
        "expected": attr.string(),
        "_template": attr.label(
            default = Label(_TEMPLATE_LABEL),
            allow_single_file = True,
        ),
        "_jdk": attr.label(
            default = Label("@bazel_tools//tools/jdk:current_java_runtime"),
            providers = [java_common.JavaRuntimeInfo],
        ),
    },
)