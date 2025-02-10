import 'package:bookly_app/core/utils/services_loctor.dart';
import 'package:bookly_app/features/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/data/repo/home_repo_impl.dart';
import 'package:bookly_app/features/logic/search/searh_cubit.dart';
import 'package:bookly_app/features/logic/similler/simeller_books_cubit.dart';
import 'package:bookly_app/features/presentation/views/details_view.dart';
import 'package:bookly_app/features/presentation/views/home_view.dart';
import 'package:bookly_app/features/presentation/views/search_view.dart';
import 'package:bookly_app/features/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kDetailsView = '/detailsView';
  static const kSearchView = '/searchView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimellerBooksCubit(
            category: state.extra.toString(),
            getIt.get<HomeRepoImpl>(),
            books: [],
          ),
          child: DetailsView(
            bookModel: state.extra as BookModel,
          ),
        ),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => BlocProvider(
          create: (context) => SearhCubit(
            homeRepo: getIt.get<HomeRepoImpl>(),
          ),
          child: SearchView(),
        ),
      ),
    ],
  );
}
