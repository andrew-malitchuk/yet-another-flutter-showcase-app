import 'package:go_router/go_router.dart';
import 'package:yafsa/yafsa/presentation/core/navigation/direction/navigation_direction.dart';
import 'package:yafsa/yafsa/presentation/feature/detalization/detalization_page.dart';

import '../../../feature/language/language_page.dart';
import '../../../feature/main/catalog/filter/filter_page.dart';
import '../../../feature/main/catalog/catalog/catalog_page.dart';
import '../../../feature/main/catalog/search/search_page.dart';
import '../../../feature/main/library/library_page.dart';
import '../../../feature/main/main_page.dart';
import '../../../feature/main/home/home_page.dart';
import '../../../feature/main/menu/about/about_page.dart';
import '../../../feature/main/menu/menu/menu_page.dart';
import '../../../feature/main/menu/preference/preference_page.dart';
import '../../../feature/onboarding/onboarding_page.dart';
import '../../../feature/root/root_page.dart';
import '../core/transition/trsnsition_page.dart';

final navigationGraph = GoRouter(initialLocation: RootDirection.path, routes: [
  GoRoute(
      path: RootDirection.path,
      pageBuilder: (context, state) => buildCustomTransitionPage(
          context: context, state: state, child: const RootPage())),
  GoRoute(
      path: OnboardingDirection.path,
      pageBuilder: (context, state) => buildCustomTransitionPage(
          context: context, state: state, child: const OnboardingPage())),
  StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) => MainPage(
      navigationShell: navigationShell,
    ),
    branches: [
      StatefulShellBranch(
        routes: [
          GoRoute(
              path: HomeDirection.path,
              builder: (context, state) => const HomePage(),
              pageBuilder: (context, state) => buildCustomTransitionPage(
                  context: context, state: state, child: const HomePage())),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
              path: CatalogDirection.path,
              pageBuilder: (context, state) => buildCustomTransitionPage(
                  context: context, state: state, child: const CatalogPage()),
              routes: [
                GoRoute(
                  path: SearchDirection.path,
                  pageBuilder: (context, state) => buildCustomTransitionPage(
                      context: context,
                      state: state,
                      child: const SearchPage()),
                ),
                GoRoute(
                  path: FilterDirection.path,
                  pageBuilder: (context, state) => buildCustomTransitionPage(
                      context: context,
                      state: state,
                      child: const FilterPage()),
                ),
              ]),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
              path: LibraryDirection.path,
              builder: (context, state) => const LibraryPage(),
              pageBuilder: (context, state) => buildCustomTransitionPage(
                  context: context, state: state, child: const LibraryPage())),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: MenuDirection.path,
            pageBuilder: (context, state) => buildCustomTransitionPage(
                context: context, state: state, child: const MenuPage()),
            routes: [
              GoRoute(
                path: AboutDirection.path,
                pageBuilder: (context, state) => buildCustomTransitionPage(
                    context: context, state: state, child: const AboutPage()),
              ),
              GoRoute(
                path: PreferenceDirection.path,
                pageBuilder: (context, state) => buildCustomTransitionPage(
                    context: context,
                    state: state,
                    child: const PreferencePage()),
              ),
              GoRoute(
                path: LanguageDirection.path,
                pageBuilder: (context, state) => buildCustomTransitionPage(
                    context: context,
                    state: state,
                    child: const LanguagePage()),
              ),
            ],
          ),
        ],
      ),
      //
    ],
  ),
  GoRoute(
      path: DetalizationDirection.path,
      pageBuilder: (context, state) {
        final id = state.pathParameters['id'];
        return buildCustomTransitionPage(
            context: context,
            state: state,
            child: DetalizationPage(id: (id ?? "")));
      }),
]);
