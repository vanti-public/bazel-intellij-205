package second;

import another2.*;

/**
 * @author <a href="mailto:brent.n.douglas@gmail.com">Brent Douglas</a>
 */
public class Main {

    public static void main(final String... args) {
        // source not attached
        FileClassInPackage.main(args);
        // source attached
        SrcJarClassInPackage.main(args);

        // source not attached
        AnotherFileClassInPackage.main(args);
        // source attached
        AnotherSrcJarClassInPackage.main(args);
    }
}
