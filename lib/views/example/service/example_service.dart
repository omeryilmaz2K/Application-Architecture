import '../../../core/base/model/base_model.dart';
import '../../../core/init/network/network_manager.dart';
import '../model/example_model.dart';

final class ExampleService<T extends BaseModel> {
  ExampleService({required this.networkManager});

  final NetworkManager networkManager;

  Future<ExampleModel> getExampleRequest(T model) async {
    final response = await networkManager.dioGet(
      'todos/1',
      model,
    );

    return response;
  }
}
