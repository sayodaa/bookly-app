import 'core/data/repo/home_repo_impl.dart';
import 'core/utils/app_route.dart';
import 'core/utils/colors.dart';
import 'core/utils/services_loctor.dart';
import 'features/cart/manager/cubit/cart_cubit.dart';
import 'features/home/manager/featured%20books/feacherd_books_cubit.dart';
import 'package:bookly_app/features/home/manager/newst/newst_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
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
        BlocProvider(
          create: (context) => CartCubit(getIt.get<HomeRepoImpl>())..fetchCartItems(),
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
