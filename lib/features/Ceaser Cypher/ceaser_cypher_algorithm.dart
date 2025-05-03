String caesarCipherAlgorithm({
  required String text,
  required String key,
  required bool isDecrypt,
}) {
  int parsedKey;

  try {
    parsedKey = int.parse(key);
  } catch (e) {
    return "Invalid key! Please enter a valid number.";
  }
  StringBuffer encryptedText = StringBuffer();

  for (int i = 0; i < text.length; i++) {
    String letter = text[i];

    if (letter.trim().isEmpty) {
      encryptedText.write(" ");
      continue;
    }

    int ascii = letter.codeUnitAt(0);

    if ((ascii >= 65 && ascii <= 90) || (ascii >= 97 && ascii <= 122)) {
      int base = (letter.toUpperCase() == letter) ? 65 : 97;
      int letterIndex = ascii - base;
      int shiftedIndex =
          isDecrypt ? (letterIndex - parsedKey) : (letterIndex + parsedKey);
      int newAscii = base + (shiftedIndex % 26);

      encryptedText.write(String.fromCharCode(newAscii));
    } else {
      encryptedText.write(letter);
    }
  }

  return encryptedText.toString();
}




