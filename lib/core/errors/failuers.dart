import 'dart:io';
import 'package:dio/dio.dart';

abstract class Failuers {
  Failuers(String string);
}
class ServerFailuers extends Failuers {
  ServerFailuers(super.string);
  
  factory ServerFailuers.fromDioError(DioException dioError){
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailuers('Connect Time Out');
      case DioExceptionType.sendTimeout:
        return ServerFailuers('Send Connect Time Out');
      case DioExceptionType.receiveTimeout:
        return ServerFailuers('Receive Connect Time Out');
      case DioExceptionType.badCertificate:
       return ServerFailuers('Bad Certificate Connect Time Out');
      case DioExceptionType.badResponse:
        return ServerFailuers.fromResponse(dioError.response!,dioError.response!.statusCode!);
      case DioExceptionType.cancel:
        return ServerFailuers('Cancel Connect Time Out');
      case DioExceptionType.connectionError:
       return ServerFailuers('Connection Error');
      case DioExceptionType.unknown:
      if(dioError.error is SocketException){
        return ServerFailuers('No Internet Connection');
      }
      return ServerFailuers(' Oops, Unknown Error !!,  Please Try Again'); 
    }
  }
  factory ServerFailuers.fromResponse(dynamic response,int statusCode) {
    if (statusCode == 401 || statusCode == 403 || statusCode == 400) {   
  return ServerFailuers(response['error']['message']);
}else if (statusCode == 404) {
  return ServerFailuers('Method Not Found Error 404');
}else if (statusCode == 500) {
  return ServerFailuers('Server Error 500 , Please Try Again');
}else{
  return ServerFailuers('Unknown Error , Please Try Again');
}
  }
}
