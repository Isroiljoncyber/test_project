
import 'package:either_dart/either.dart';
import 'package:test_project/core/utils/excaptions.dart';

abstract class UseCase<Type, Params> {
  Future<Either<ServerException, Type>> call(Params params);
}