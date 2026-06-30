import 'package:sahaba_mobile/app/app.dart';
import 'package:sahaba_mobile/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() => const App());
}
