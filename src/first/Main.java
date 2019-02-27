package first;

import another1.*;

/**
 * @author <a href="mailto:brent.n.douglas@gmail.com">Brent Douglas</a>
 */
public class Main {

    public static void main(final String... args) {
        // sources attached
        FileClassInRoot.main(args);
        // sources not attached
        SrcJarClassInRoot.main(args);

        // sources not attached
        AnotherFileClassInRoot.main(args);
        // sources not attached
        AnotherSrcJarClassInRoot.main(args);
    }
}
