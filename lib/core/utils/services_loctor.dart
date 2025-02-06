import 'package:bookly_app/features/data/repo/home_repo_impl.dart';
import 'package:bookly_app/features/data/services/services.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupServicesLocator() {
  getIt.registerSingleton<Services>( Services(dio: Dio()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(services:getIt.get<Services>()));
}
