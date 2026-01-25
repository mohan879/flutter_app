import 'dart:convert';
import 'dart:io';

void main() async {
  final json = jsonDecode(await File('metrics.json').readAsString());
  final results = json['metricResults'] as List;

  // Find files with multiple violations
  final hotspots =
      results
          .where((r) => (r['issues'] as List).length > 1)
          .map(
            (r) => {
              'path': r['path'],
              'violations': (r['issues'] as List).length,
              'effort': (r['issues'] as List).fold<int>(
                0,
                (sum, i) => sum + (i['effortInMinutes'] as int),
              ),
            },
          )
          .toList()
        ..sort((a, b) => (b['effort'] as int).compareTo(a['effort'] as int));

  print('Files with multiple violations (sorted by effort):');

  for (final file in hotspots) {
    print(
      '  ${file['path']}: ${file['violations']} issues, ${file['effort']} min effort',
    );
  }

  // Calculate total technical debt
  final totalEffort = results.fold<int>(0, (sum, r) {
    return sum +
        (r['issues'] as List).fold<int>(
          0,
          (s, i) => s + (i['effortInMinutes'] as int),
        );
  });
  print('\nTotal estimated effort: $totalEffort minutes');
}
