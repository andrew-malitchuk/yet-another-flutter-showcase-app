sealed class NavigationDirection {
  static String path = "";
  static String name = "";
}

class RootDirection extends NavigationDirection {
  static String path = "/";
  static String name = "Root";
}

class OnboardingDirection extends NavigationDirection {
  static String path = "/onboarding";
  static String name = "Onboarding";
}

class MainDirection extends NavigationDirection {
  static String path = "/main";
  static String name = "Main";
}

class HomeDirection extends MainDirection {
  static String path = "/home";
  static String name = "Home";
}

class CatalogDirection extends MainDirection {
  static String path = "/catalog";
  static String name = "Catalog";
}

class SearchDirection extends CatalogDirection {
  static String path = "search";
  static String tab = "/catalog/search";
  static String name = "Search";
}

class FilterDirection extends CatalogDirection {
  static String path = "filter";
  static String tab = "/catalog/filter";
  static String name = "Filter";
}

class LibraryDirection extends MainDirection {
  static String path = "/library";
  static String name = "Library";
}

class MenuDirection extends MainDirection {
  static String path = "/menu";
  static String name = "Menu";
}

class AboutDirection extends MenuDirection {
  static String path = "about";
  static String tab = "/menu/about";
  static String name = "About";
}

class PreferenceDirection extends MainDirection {
  static String path = "preferences";
  static String tab = "/menu/preferences";
  static String name = "Preferences";
}

class DetalizationDirection extends NavigationDirection {
  static String path = "/detalization/:id";
  static String name = "Detalization";

  static String getPath(int id) {
    return "/detalization/$id";
  }
}

class LanguageDirection extends NavigationDirection {
  static String path = "language";
  static String tab = "/menu/language";
  static String name = "Language";
}
