const p10 = [3, 5, 2, 7, 4, 10, 1, 9, 8, 6];
const p8 = [6, 3, 7, 4, 8, 5, 10, 9];
const ip = [2, 6, 3, 1, 4, 8, 5, 7];
const ipInv = [4, 1, 3, 5, 7, 2, 8, 6];
const ep = [4, 1, 2, 3, 2, 3, 4, 1];
const p4 = [2, 4, 3, 1];
const s0 = [
  [1, 0, 3, 2],
  [3, 2, 1, 0],
  [0, 2, 1, 3],
  [3, 1, 3, 2],
];
const s1 = [
  [0, 1, 2, 3],
  [2, 0, 1, 3],
  [3, 0, 1, 0],
  [2, 1, 0, 3],
];

// Permutation function
String permute(String bits, List<int> order) =>
    order.map((i) => bits[i - 1]).join();

// Circular left shift
String shift(String bits, int n) => bits.substring(n) + bits.substring(0, n);

// Key generation
List<String> getKeys(String key) {
  var p10Key = permute(key, p10);
  var l = p10Key.substring(0, 5), r = p10Key.substring(5);
  var k1 = permute(shift(l, 1) + shift(r, 1), p8);
  var k2 = permute(shift(shift(l, 1), 2) + shift(shift(r, 1), 2), p8);
  return [k1, k2];
}

// S-Box lookup
String sbox(String bits, List<List<int>> box) {
  var row = int.parse("${bits[0]}${bits[3]}", radix: 2);
  var col = int.parse("${bits[1]}${bits[2]}", radix: 2);
  return box[row][col].toRadixString(2).padLeft(2, '0');
}

// fk function
String fk(String bits, String key) {
  var l = bits.substring(0, 4), r = bits.substring(4);
  var epr = permute(r, ep);
  var xorNum = int.parse(epr, radix: 2) ^ int.parse(key, radix: 2);
  var xor = xorNum.toRadixString(2).padLeft(8, '0');

  var sOut = sbox(xor.substring(0, 4), s0) + sbox(xor.substring(4, 8), s1);
  var p4res = permute(sOut, p4);
  var newL = (int.parse(l, radix: 2) ^ int.parse(p4res, radix: 2))
      .toRadixString(2)
      .padLeft(4, '0');
  return newL + r;
}

////////////////////////////////////////////////////////////////////////////////

Map<String, String> sdesEncrypt({required String plain, required String key}) {
  var keys = getKeys(key);
  var ipBits = permute(plain, ip);
  var firstFK = fk(ipBits, keys[0]);
  var swapped = firstFK.substring(4) + firstFK.substring(0, 4);
  var secondFK = fk(swapped, keys[1]);
  var cipher = permute(secondFK, ipInv);
  return {'K1': keys[0], 'K2': keys[1], 'Cipher': cipher};
}

Map<String, String> sdesDecrypt({required String cipher, required String key}) {
  var keys = getKeys(key);
  var ipBits = permute(cipher, ip);
  var firstFK = fk(ipBits, keys[1]);
  var swapped = firstFK.substring(4) + firstFK.substring(0, 4);
  var secondFK = fk(swapped, keys[0]);
  var plain = permute(secondFK, ipInv);
  return {'K1': keys[0], 'K2': keys[1], 'Plain': plain};
}

