import 'flutter_types.dart';

// ❌ Bad: Using raw Flutter APIs instead of custom wrappers

void badNavigation(BuildContext context) {
  // LINT: Use AppRouter.push() for consistent navigation with analytics tracking.
  Navigator.push(context, MaterialPageRoute(builder: (_) => Text('Page')));

  // LINT: Use AppRouter.pushNamed() instead.
  Navigator.pushNamed(context, '/home');

  // LINT: Use AppRouter.pop() for consistent back navigation.
  Navigator.pop(context);
}

Future<void> badDialogs(BuildContext context) async {
  // LINT: Use AppDialogs.show() for consistent dialog styling and analytics.
  await showDialog(context: context, builder: (_) => Text('Dialog'));

  // LINT: Use AppBottomSheet.show() for consistent styling.
  await showModalBottomSheet(
    context: context,
    builder: (_) => Text('Bottom Sheet'),
  );
}

void badSnackbar(BuildContext context) {
  // LINT: Use AppSnackbar.show() for consistent snackbar styling.
  ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text('Message')));
}
