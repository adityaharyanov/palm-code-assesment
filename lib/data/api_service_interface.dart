abstract class ApiServiceInterface {
  Future<T?> get<T>(String url);
}

typedef Response = Map<String, dynamic>;
