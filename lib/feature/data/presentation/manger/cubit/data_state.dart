import 'package:robotics_app/feature/data/data/model/data_model.dart';

abstract class DataState {}

class DataInitial extends DataState {}

class DataLoading extends DataState {}

class DataLoaded extends DataState {
  final DataModel dataModel;

  DataLoaded({required this.dataModel});
}

class DataError extends DataState {
  final String message;

  DataError(this.message);
}
