package third;

/**
 * @author Matt Nathan
 */
public class Main {

  public static void main(final String... args) {
    // has sources attached?

    // file located in source root
    // source files
    inroot.RootFileInSamePackage.main(args); // yes
    inroot.sub.RootFileInSubPackage.main(args); // no
    sup.inroot.RootFileInSupPackage.main(args); // no
    inanotherroot.RootFileInAnotherPackage.main(args); // no
    // .srcjar
    inroot.RootSrcjarInSamePackage.main(args); // no
    inroot.sub.RootSrcjarInSubPackage.main(args); // no
    sup.inroot.RootSrcjarInSupPackage.main(args); // no
    inanotherroot.RootSrcjarInAnotherPackage.main(args); // no

    // file located in a package folder. inpkg/PkgFileInSamePackage.java for example
    // source files
    inpkg.PkgFileInSamePackage.main(args); // no
    inpkg.sub.PkgFileInSubPackage.main(args); // no
    sup.inpkg.PkgFileInSupPackage.main(args); // no
    inanotherpkg.PkgFileInAnotherPackage.main(args); // no
    // .srcjar
    inpkg.PkgSrcjarInSamePackage.main(args); // yes
    inpkg.sub.PkgSrcjarInSubPackage.main(args); // yes
    sup.inpkg.PkgSrcjarInSupPackage.main(args); // yes
    inanotherpkg.PkgSrcjarInAnotherPackage.main(args); // no
  }
}
