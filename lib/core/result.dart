import 'failure.dart';

class Result<T> {
  final bool isSuccess;
  final T? value;
  final Failure? error;

  Result.success(this.value) : isSuccess = true, error = null;
  Result.error(this.error) : isSuccess = false, value = null;
}