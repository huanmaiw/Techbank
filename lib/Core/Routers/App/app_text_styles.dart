import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TextAutoSize extends StatelessWidget {
  const TextAutoSize(
      this.text, {
        super.key,
        this.style,
        this.textAlign,
        this.maxLines = 1,
        this.maxFontSize = 24,
        this.minFontSize = 12,
        this.overflow = TextOverflow.ellipsis,
        this.group,
      });

  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int maxLines;
  final double maxFontSize;
  final double minFontSize;
  final TextOverflow overflow;
  final AutoSizeGroup? group;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      maxFontSize: maxFontSize,
      minFontSize: minFontSize,
      group: group,
    );
  }
}