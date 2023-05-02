import 'package:flutter/services.dart';

class NoStartWithSpaceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.startsWith(' ')) {
      final String trimmedText = newValue.text.trimLeft();

      return TextEditingValue(
        text: trimmedText,
        composing: newValue.composing,
        selection: newValue.selection,
      );
    }
    return newValue;
  }
}

class NoContainSpaceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.startsWith(' ') || newValue.text.endsWith(' ')) {
      final String trimmedText = newValue.text.trim();

      return TextEditingValue(
        text: trimmedText,
        selection: newValue.selection,
      );
    }
    return newValue;
  }
}

class AlwaysLowerCaseInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final String text = newValue.text.toLowerCase();

    return TextEditingValue(
      text: text,
      selection: newValue.selection,
    );
  }
}
