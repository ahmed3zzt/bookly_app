import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:bookly/features/single_book/presentation/views/single_book_view.dart';
import 'package:bookly/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String initialRoute = '/';
  static const String bookDetailsRoute = '/book_details';
  static const String searchRoute = '/search';
  static const String homeRoute = '/home_view';

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: initialRoute,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: bookDetailsRoute,
        builder: (context, state) => const SingleBookView(),
      ),
      GoRoute(
        path: searchRoute,
        builder: (context, state) => const SingleBookView(),
      ),
      GoRoute(
        path: homeRoute,
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
}
