import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/core/error/failure.dart';

abstract class BaseUseCase<Type, Parameters> {
  Future<Either<ServerFailure, Type>> call(Parameters parameters);
}

class NoParameters extends Equatable {
  const NoParameters();

  @override
  List<Object?> get props => [];
}
