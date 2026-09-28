class RouterPath {
  RouterPath._();

  /// Root paths
  static const String rootPath = '/';
  static const String onboardingPath = '/onboarding';

  //  Auth ─
  static const String loginPath = '/login';

  // [Login] => Register
  static const String registerPath = 'register';

  // [Login] => Lupa Password
  static const String forgotPasswordPath = '/forgot-password';

  // [Login | Register | Forgot Password] => Verifikasi OTP
  static const String verifyAcountPath = 'verify-account';

  // [Verify OTP — Forgot Password] => Password Baru
  static const String newPasswordPath = 'new-password';

  // [Verify OTP — Register] => Lengkapi Profil
  static const String completeProfileRegisterPath = 'complete-profile-register';

  /// Main paths
  static const String mainPath = '/main';

  /// Sub Paths
  // Quran
  static const String quranPath = 'quran';
  static const String detailQuranPath = 'detail-quran';

  // Qibla
  static const String qiblaPath = 'qibla';

  // Search
  static const String searchGlobalPath = 'search-global';
  static const String searchQuranPath = 'search-quran';

  // Calendar
  static const String calendarPath = 'calendar';

  // Select City
  static const String selectCityPath = 'select-city';

  // News
  static const String detailNewsPath = 'detail-news';
  static const String newsPath = 'news';
  static const String listAllNewsPath = 'list-all-news';

  // Camera
  static const String cameraPath = 'camera';

  // Jadwal Sholat (push from featured nav)
  static const String jadwalSholatPath = 'jadwal-sholat';

  // Product Detail
  // static const String productDetailPath = 'product-detail';

  // Product Halal
  // static const String productHalalPath = 'product-halal';

  // Global Search Product Halal
  // static const String searchProductHalalPath = 'search-product-halal';

  // Product History
  // static const String historyProductPath = 'history-product';

  // Category Product
  // static const String categoryProductPath = 'category-product';
  // static const String listDetailBrandByProductPath =
  //     'list-detail-brand-by-product';

  // Sahaba AI
  static const String sahabaAiPath = 'sahaba-ai';

  // kisah
  static const String kisahPath = 'kisah';
  static const String detailKisahPath = 'detail-kisah';
}
