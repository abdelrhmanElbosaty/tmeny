
abstract class UseCase<Input, Result> {
  Future<Result> execute(Input input);
}