import 'package:sahaba_mobile/bootstrap.dart';
import 'package:sahaba_mobile/presentation/app/app.dart';

Future<void> main() async {
  await bootstrap(() => const App());
}
