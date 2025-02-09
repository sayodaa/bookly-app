import 'package:bookly_app/core/utils/app_route.dart';
import 'package:bookly_app/core/utils/colors.dart';
import 'package:bookly_app/core/utils/services_loctor.dart';
import 'package:bookly_app/features/data/repo/home_repo_impl.dart';
import 'package:bookly_app/features/logic/featured%20books/feacherd_books_cubit.dart';
import 'package:bookly_app/features/logic/newst/newst_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setupServicesLocator();
  return runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeacherdBooksCubit(homeRepo:getIt.get<HomeRepoImpl>())..fetchFeaturedData(),
        ),
        BlocProvider(
          create: (context) => NewstCubit(getIt.get<HomeRepoImpl>())..fetchNewstBooksData(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: AppColors.backgroundColor,
          textTheme: GoogleFonts.boogalooTextTheme(ThemeData.dark().textTheme),
        ),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
