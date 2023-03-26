class AdHelper {
  static const bool isTest = false;
  static String get questionsAd {
    if (isTest) {
      return 'ca-app-pub-3940256099942544/1033173712';
    }
    //real add
    return 'ca-app-pub-2400508280875448/7956784590';
  }

  static String get bannerAd {
    if (isTest) {
      return 'ca-app-pub-8666457702645053/8741897352';
    }
    return 'ca-app-pub-2400508280875448/1856897214';
  }
}
