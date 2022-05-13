import 'package:diacritic/diacritic.dart';
import 'package:flutter_mockup_bloc/resource/app_constant.dart';

late final RegExp _lineBreakHtmlTagRegex =
    RegExp('(\<br\/?\>)', multiLine: true);
late final RegExp _webLinkRegex = RegExp(
  r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+',
  multiLine: true,
);
late final RegExp _validUrlProtocolRegex = RegExp(r'(https?|ftp)://');

extension StringExt on String {
  String get toLabel => "$this: ";

  String get toPhoneLaunchUri => "tel:$this";

  String get toWebUrl =>
      startsWith(_validUrlProtocolRegex) ? this : "https://$this";

  String get capitalize =>
      this.length > 0 ? "${this[0].toUpperCase()}${this.substring(1)}" : '';

  List<String> get dataValues =>
      this.trim().split(RegExp(r',\n?\s*'))..removeWhere((e) => e.isEmpty);

  String get fileNameWithExtension => this.substring(this.lastIndexOf('/') + 1);

  String get fileExtension => this.substring(this.lastIndexOf('.') + 1);

  String get displayFileExtension => fileExtension.toUpperCase();

  String get extensionOfFileFromDownloadLink => fileExtension;

  bool get isPngImageDownloadLink =>
      extensionOfFileFromDownloadLink.contains('png');

  bool get isNotPngImageDownloadLink => isPngImageDownloadLink == false;

  String get resolveLineBreakHtmlTag =>
      this.replaceAll(_lineBreakHtmlTagRegex, '\n');

  static int Function(String, String) comparator = (a, b) => a.compareTo(b);

  static int Function(String, String) lowerCaseWithoutDiacriticComparator =
      (a, b) => removeDiacritics(a.toLowerCase()).compareTo(
            removeDiacritics(b.toLowerCase()),
          );

  bool get isStringNotUpdate => this == AppConstants.not_update;

  bool get containLoginWord => contains(AppConstants.login);

  List<TextPart> get splitedWebLinks {
    final List<RegExpMatch> matches = _webLinkRegex.allMatches(this).toList();

    if (matches.isEmpty) return const [];

    final List<TextPart> result = [];

    for (int strIndex = 0, matchIndex = 0;
        matchIndex < matches.length;
        strIndex = matches[matchIndex].end, matchIndex++) {
      final RegExpMatch match = matches[matchIndex];

      result.addAll([
        TextPart(
          isLink: false,
          text: substring(strIndex, match.start),
        ),
        TextPart(
          isLink: true,
          text: substring(match.start, match.end),
        ),
      ]);
    }

    result.add(
      TextPart(
        isLink: true,
        text: substring(matches.last.end, length),
      ),
    );

    return result;
  }
}

class TextPart {
  final bool isLink;
  final String text;

  TextPart({
    required this.isLink,
    required this.text,
  });
}

extension StringNullableExt on String? {
  String get emptyIfNull => this ?? '';
}
