import 'dart:io';

// import 'package:saras_mobile/domains/env/env_model.dart';

class SahabaHttpOvverides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (_, host, port) {
        final url = Uri.parse('http://192.168.10.167:3333');
        return host == url.host && (!url.hasPort || port == url.port);
      };
  }
}
