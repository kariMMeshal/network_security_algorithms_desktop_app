//

import 'package:flutter/cupertino.dart';

int euclideanAlgorithm({required int a, required int b}) {
  if (b == 0) return a;

  debugPrint("GCD($a,$b)");

  return euclideanAlgorithm(a: b, b: (a % b));
}
