import 'dart:math';

/// Create a random name, suitable for an input element.
String randomElementName(int length) {
    var rand = new Random();
    var chars = new List.generate(length, (i) => rand.nextInt(26) + 97);
    return new String.fromCharCodes(chars);
}
