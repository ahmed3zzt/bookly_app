import 'package:bookly/core/app_router.dart';
import 'package:bookly/core/services_locator.dart';
import 'package:bookly/core/theme.dart';
import 'package:bookly/features/home/presentation/manger/feature_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/manger/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/features/home/repos/home_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            getIt<HomeRepoImpl>(),
          )..getFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            getIt<HomeRepoImpl>(),
          ),
        )
      ],
      child: MaterialApp.router(
        title: 'Bookly',
        debugShowCheckedModeBanner: false,
        theme: AppTheme,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
