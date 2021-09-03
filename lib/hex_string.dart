extension HexString on int {
  String toHexString() => this.toRadixString(16).toUpperCase();
}

extension ParseHex on String {
  String toHexString() {
    final value = int.parse(this);
    return '0x${value.toHexString()}';
  }

  String toDecString({int radix = 16}) {
    final value = int.parse(this, radix: radix);
    return '$value';
  }
}
