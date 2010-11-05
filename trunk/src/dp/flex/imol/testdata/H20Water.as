package dp.flex.imol.testdata {
public class H20Water {

    public static function molfile():String {
        return new String(
                "H2O Water 7732185\n" +
                "##CCCBDB11 51005:49\n" +
                "Geometry Optimized at PM3\n" +
                "  3  2  0  0  0  0  0  0  0  0    V2000\n" +
                "    0.0000    0.0000    0.1402 O  0000000000000000000\n" +
                "    0.0000   -0.7678   -0.4207 H  0000000000000000000\n" +
                "    0.0000    0.7678   -0.4207 H  0000000000000000000\n" +
                "  1  2  1  0     0  0\n" +
                "  1  3  1  0     0  0\n");
    }

    public function H20Water() {
    }
}
}