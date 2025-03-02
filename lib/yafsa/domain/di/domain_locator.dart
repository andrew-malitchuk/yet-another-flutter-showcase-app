import 'package:get_it/get_it.dart';
import 'package:yafsa/yafsa/data/repository/source/book_repository.dart';
import 'package:yafsa/yafsa/data/repository/source/preference_repository.dart';
import 'package:yafsa/yafsa/domain/source/get_books_usecase.dart';
import 'package:yafsa/yafsa/domain/source/search_books_usecase.dart';

import '../impl/source/add_to_library_usecase_impl.dart';
import '../impl/source/filter_books_usecase_impl.dart';
import '../impl/source/get_book_page_usecase_impl.dart';
import '../impl/source/get_book_usecase_impl.dart';
import '../impl/source/get_books_usecase_impl.dart';
import '../impl/source/get_language_usecase_impl.dart';
import '../impl/source/get_recent_book_usecase_impl.dart';
import '../impl/source/get_recommendation_usecase_impl.dart';
import '../impl/source/is_onboarding_shown_usecase_impl.dart';
import '../impl/source/save_book_usecase_impl.dart';
import '../impl/source/search_books_usecase_impl.dart';
import '../impl/source/set_language_usecase_impl.dart';
import '../impl/source/set_onboarding_shown_usecase_impl.dart';
import '../impl/source/watch_books_usecase_impl.dart';
import '../source/add_to_library_usecase.dart';
import '../source/filter_books_usecase.dart';
import '../source/get_book_page_usecase.dart';
import '../source/get_book_usecase.dart';
import '../source/get_language_usecase.dart';
import '../source/get_recent_book_usecase.dart';
import '../source/get_recommendation_usecase.dart';
import '../source/is_onboarding_shown_usecase.dart';
import '../source/save_book_usecase.dart';
import '../source/set_language_usecase.dart';
import '../source/set_onboarding_shown_usecase.dart';
import '../source/watch_books_usecase.dart';

void initializeDomainLocator() {
  GetIt.instance.registerSingletonAsync<GetRecommendationUseCase>(() async {
    await GetIt.instance.isReady<BookRepository>();
    return GetRecommendationUseCaseImpl(GetIt.instance<BookRepository>());
  });

  GetIt.instance.registerSingletonAsync<IsOnboardingShownUseCase>(() async {
    await GetIt.instance.isReady<PreferenceRepository>();
    return IsOnboardingShownUseCaseImpl(GetIt.instance<PreferenceRepository>());
  });

  GetIt.instance.registerSingletonAsync<SetOnboardingShownUseCase>(() async {
    await GetIt.instance.isReady<PreferenceRepository>();
    return SetOnboardingShownUseCaseImpl(
        GetIt.instance<PreferenceRepository>());
  });

  GetIt.instance.registerSingletonAsync<GetBooksUseCase>(() async {
    await GetIt.instance.isReady<BookRepository>();
    return GetBooksUseCaseImpl(GetIt.instance<BookRepository>());
  });

  GetIt.instance.registerSingletonAsync<GetRecentBookUseCase>(() async {
    await GetIt.instance.isReady<BookRepository>();
    return GetRecentBookUseCaseImpl(GetIt.instance<BookRepository>());
  });

  GetIt.instance.registerSingletonAsync<GetBookUseCase>(() async {
    await GetIt.instance.isReady<BookRepository>();
    return GetBookUseCaseImpl(GetIt.instance<BookRepository>());
  });

  GetIt.instance.registerSingletonAsync<SaveBookUseCase>(() async {
    await GetIt.instance.isReady<BookRepository>();
    return SaveBookUseCaseImpl(GetIt.instance<BookRepository>());
  });

  GetIt.instance.registerSingletonAsync<GetBookPageUseCase>(() async {
    await GetIt.instance.isReady<BookRepository>();
    return GetBookPageUseCaseImpl(GetIt.instance<BookRepository>());
  });

  GetIt.instance.registerSingletonAsync<SearchBooksUseCase>(() async {
    await GetIt.instance.isReady<BookRepository>();
    return SearchBooksUseCaseImpl(GetIt.instance<BookRepository>());
  });

  GetIt.instance.registerSingletonAsync<FilterBooksUseCase>(() async {
    await GetIt.instance.isReady<BookRepository>();
    return FilterBooksUseCaseImpl(GetIt.instance<BookRepository>());
  });

  GetIt.instance.registerSingletonAsync<SetLanguageUseCase>(() async {
    await GetIt.instance.isReady<PreferenceRepository>();
    return SetLanguageUseCaseImpl(GetIt.instance<PreferenceRepository>());
  });

  GetIt.instance.registerSingletonAsync<GetLanguageUseCase>(() async {
    await GetIt.instance.isReady<PreferenceRepository>();
    return GetLanguageUseCaseImpl(GetIt.instance<PreferenceRepository>());
  });

  GetIt.instance.registerSingletonAsync<WatchBookPageUseCase>(() async {
    await GetIt.instance.isReady<BookRepository>();
    return WatchBookPageUseCaseImpl(GetIt.instance<BookRepository>());
  });

  GetIt.instance.registerSingletonAsync<AddToLibraryUseCase>(() async {
    await GetIt.instance.isReady<BookRepository>();
    return AddToLibraryUseCaseImpl(GetIt.instance<BookRepository>());
  });
}
