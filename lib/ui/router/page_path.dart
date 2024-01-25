/// 画面ID
enum PageId {
  signIn,
  develop,
}

/// 画面パス
extension PagePath on PageId {
  String get path {
    switch (this) {
      case PageId.signIn:
        return '/sign-in';
      case PageId.develop:
        return '/develop';
    }
  }
}

/// 画面名
extension PageName on PageId {
  String get routeName {
    switch (this) {
      case PageId.signIn:
        return 'sign-in';
      case PageId.develop:
        return 'develop';
    }
  }
}
