import 'package:flutter/services.dart';
import 'package:tmeny_flutter/common/utils/common.dart';

class EnglishNumbersFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: convertArabicNumbersToEnglish(newValue.text),
      composing: newValue.composing,
      selection: newValue.selection,
    );
  }
}