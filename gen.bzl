
def _do_generate(ctx, output_dir, name, java_file_path, output_file, extras):
  cmds = [
    "p=$PWD",
    "mkdir -p %s" % output_dir,
    """cat <<EOF > %s
package %s;

public class %s {
    /**
     * This comment is expected %s in IDEA's sources
     */
    public static void main(final String... args) {
        System.out.println("Hello world!");
    }
}
EOF\n""" % (java_file_path, ctx.attr.package, name, ctx.attr.expected),
  ]

  cmd = "\n".join(cmds + [" find ."] + extras)

  cmd_file = ctx.new_file(ctx.label.name + "-generate-cmd")
  ctx.actions.write(
      output = cmd_file,
      content = cmd
  )
  inputs = [cmd_file]
  outputs = [output_file]
  ctx.actions.run_shell(
      outputs=outputs,
      inputs=[cmd_file],
      command="bash %s" % cmd_file.path,
  )
  return struct(files = depset(outputs))

# These rules create the java files in the current dir ( e.g. File.java )
# Imports the file but not the srcjar

def _first_generate_file_impl(ctx):
  name = "FileClassInRoot"
  java_file = ctx.new_file(name + ".java")
  return _do_generate(ctx, "not-important", name, java_file.path, java_file, [])

first_generate_file = rule(
    implementation = _first_generate_file_impl,
    attrs = {
        "package": attr.string(),
        "expected": attr.string(),
    },
)

def _first_generate_srcjar_impl(ctx):
  name = "SrcJarClassInRoot"
  dir = "output/"
  srcjar_file = ctx.new_file(dir + name + ".srcjar")
  return _do_generate(ctx, dir, name, dir + "/" + name + ".java", srcjar_file, [
      "( cd $p/output && jar cf $p/%s .)" % (srcjar_file.path)
  ])

first_generate_srcjar = rule(
    implementation = _first_generate_srcjar_impl,
    attrs = {
        "package": attr.string(),
        "expected": attr.string(),
    },
)

# These rules more the java files to be in their package dir (e.g. package/File.java)
# Imports the srcjar but not the file

def _second_generate_file_impl(ctx):
  name = "FileClassInPackage"
  java_file = ctx.new_file(ctx.attr.package + "/" + name + ".java")
  return _do_generate(ctx, ctx.attr.package, name, java_file.path, java_file, [])

second_generate_file = rule(
    implementation = _second_generate_file_impl,
    attrs = {
        "package": attr.string(),
        "expected": attr.string(),
    },
)

def _second_generate_srcjar_impl(ctx):
  name = "SrcJarClassInPackage"
  dir = "output/" + ctx.attr.package
  srcjar_file = ctx.new_file(dir + "/" + name + ".srcjar")
  return _do_generate(ctx, dir, name, dir + "/" + name + ".java", srcjar_file, [
      "( cd $p/output && jar cf $p/%s .)" % (srcjar_file.path)
  ])

second_generate_srcjar = rule(
    implementation = _second_generate_srcjar_impl,
    attrs = {
        "package": attr.string(),
        "expected": attr.string(),
    },
)