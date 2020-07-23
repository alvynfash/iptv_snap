extension StringExtension on String {
  String get capitalizeFirstCharacter =>
      '${this[0].toUpperCase()}${this.substring(1)}';

  String get capitalizeFirstCharacterOnly =>
      '${this[0].toUpperCase()}${this.substring(1).toLowerCase()}';

  String get capitalizeFirstCharactersOnly {
    var newString =
        this.replaceRange(0, this.length, this.capitalizeFirstCharacterOnly);

    int count = 0;
    for (var character in this.split('')) {
      if (character == ' ' && count < this.length - 1) {
        newString = newString.replaceRange(
          count + 1,
          count + 2,
          this[count + 1].toUpperCase(),
        );
      }
      count++;
    }
    return newString;
  }
}
