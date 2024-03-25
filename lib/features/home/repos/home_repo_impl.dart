import 'package:bookly/core/api_services.dart';
import 'package:bookly/core/failures.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiServices apiServices;

  HomeRepoImpl(this.apiServices);
  @override
  Future<Either<Failure, List<BookModel>>> getNewestBooks() async {
    try {
      var data = await apiServices.get(
          endpoint:
              '/volumes?Filtering=free-ebooks&maxResults=40&startIndex=0&q="computer science"');

      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return Future.value(right(books));
    } catch (e) {
      if (e is DioException) {
        return Future.value(
          left(
            ServerFailure.fromDioError(e),
          ),
        );
      } else {
        return Future.value(left(ServerFailure(
          e.toString(),
        )));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> getFeaturedBooks() async {
    try {
      var data = await apiServices.get(
          endpoint:
              '/volumes?Filtering=free-ebooks&maxResults=8&startIndex=0&q=programming');

      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return Future.value(right(books));
    } catch (e) {
      if (e is DioException) {
        return Future.value(
          left(
            ServerFailure.fromDioError(e),
          ),
        );
      }
      return Future.value(
        left(
          ServerFailure('Un Expected Error'),
        ),
      );
    }
  }
}
