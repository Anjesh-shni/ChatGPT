import 'package:arcane1/feature/chat_gpt/data/remote_source/text_compl_remoteData_source.dart';
import 'package:arcane1/feature/chat_gpt/data/remote_source/text_impl_remoteData_source.dart';
import 'package:arcane1/feature/chat_gpt/domain/repository/text_completion_repo.dart';
import 'package:arcane1/feature/chat_gpt/domain/usecases/text_completion_usecase.dart';
import 'package:arcane1/feature/chat_gpt/presentation/cubit/text_compl_cubit.dart';

import '../../injection_container.dart';
import 'data/repositories/text_repo_implementation.dart';

Future<void> textCompletionDependencyInjection() async {
  //future bloc
  sl.registerFactory<TextCompletionCubit>(
    () => TextCompletionCubit(
      textCompletionUseCase: sl.call(),
    ),
  );
  //useCase
  sl.registerLazySingleton<TextCompletionUseCase>(
    () => TextCompletionUseCase(
      repository: sl.call(),
    ),
  );

  //repository
  sl.registerLazySingleton<TextCompletionRepository>(
    () => TextRepoImplementation(
      repoDataSource: sl.call(),
    ),
  );

  //remote data
  sl.registerLazySingleton<TextCompletionRepoDataSource>(
    () => TextCompletionRepoDataSourceImpl(
      httpClient: sl.call(),
    ),
  );
}
