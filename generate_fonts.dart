// ignore_for_file: avoid_print

import 'dart:io';

void main() {
  final fontDir = Directory('assets/fonts');
  final fontFiles = fontDir.listSync(recursive: true).whereType<File>();
  final fontMap = <String, List<String>>{};

  for (var file in fontFiles) {
    final filename = file.path.split(Platform.pathSeparator).last;
    final fontName = filename.split('-').first;

    fontMap.putIfAbsent(fontName, () => []).add(file.path);
  }

  for (var entry in fontMap.entries) {
    print('- family: ${entry.key}');
    print('  fonts:');
    for (var font in entry.value) {
      print('    - asset: $font');
    }
  }
}
