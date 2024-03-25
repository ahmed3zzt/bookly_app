import 'package:bookly/core/app_router.dart';
import 'package:bookly/features/home/presentation/manger/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/virtical_list.dart';
import 'package:bookly/features/home/presentation/views/widgets/horizontal_list.dart.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:unicons/unicons.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Connectivity().onConnectivityChanged,
      builder: (context, AsyncSnapshot<ConnectivityResult> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data == ConnectivityResult.none) {
            if (BlocProvider.of<NewestBooksCubit>(context).state
                is NewestBooksSuccess) {
              return homeBuilder(context);
            } else {
              return offlineBuilder(context);
            }
          } else {
            return homeBuilder(context);
          }
        } else {
          if (BlocProvider.of<NewestBooksCubit>(context).state
              is NewestBooksSuccess) {
            return homeBuilder(context);
          } else {
            return loadingBuilder(context);
          }
        }
      },
    );
  }

  Widget homeBuilder(context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 24.0),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/Logo.png',
                  scale: 2.0,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    GoRouter.of(context).push(
                      AppRouter.searchRoute,
                    );
                  },
                  icon: const Icon(UniconsLine.search, size: 28),
                ),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 300,
            child: HorizontalList(),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 32.0, bottom: 32.0),
            child: Text(
              'Best Sellers',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const VerticalList(),
      ],
    );
  }

  Widget offlineBuilder(context) {
    return Scaffold(
      body: Center(
        child: Text('No Internet Connection Available',
            style: Theme.of(context).textTheme.headlineLarge),
      ),
    );
  }

  Widget loadingBuilder(context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(
            height: 20,
          ),
          Text('Check Network Connection'),
        ],
      ),
    );
  }
}
