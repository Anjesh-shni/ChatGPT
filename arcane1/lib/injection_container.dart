import 'package:arcane1/feature/chat_gpt/dependency_injection.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;
Future<void> init() async {
  final http.Client httpClient = http.Client();
  sl.registerLazySingleton<http.Client>(() => httpClient);

  await textCompletionDependencyInjection();
}
