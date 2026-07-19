import 'dart:io';

import 'package:sahaba_mobile/infrastructure/core/api/dio_api.dart';

// import 'package:saras_mobile/domains/env/env_model.dart';

class SahabaHttpOvverides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (_, host, port) {
        final url = Uri.parse(baseUrl);
        final minioUrl = Uri.parse(minio);
        final myQuranUrl = Uri.parse(myQuranBaseUrl);
        final calendarUrl = Uri.parse(calendarBaseUrl);
        bool isSameHost(Uri value) =>
            host == value.host && (!value.hasPort || port == value.port);
        return isSameHost(url) ||
            isSameHost(minioUrl) ||
            isSameHost(myQuranUrl) ||
            isSameHost(calendarUrl);
      };
  }
}
