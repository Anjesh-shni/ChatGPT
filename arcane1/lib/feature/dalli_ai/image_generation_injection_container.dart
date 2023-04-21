import 'package:arcane1/feature/dalli_ai/presentation/cubit/image_generation_cubit.dart';
import '../../injection_container.dart';
import 'data/remote_source/image_generation_remote_data_source.dart';
import 'data/remote_source/image_generation_remote_data_source_impl.dart';
import 'data/repositories/image_generation_repository_impl.dart';
import 'domain/repository/image_generation_repository.dart';
import 'domain/usecases/image_generation_usecase.dart';

Future<void> imageGenerationInjectionContainer() async{

  //Futures bloc
  sl.registerFactory<ImageGenerationCubit>(
        () => ImageGenerationCubit(
      imageGenerationUseCase: sl.call(),
    ),
  );

  //UseCase
  sl.registerLazySingleton<ImageGenerationUseCase>(() => ImageGenerationUseCase(
    repository: sl.call(),
  ));
  //repository
  sl.registerLazySingleton<ImageGenerationRepository>(
          () => ImageGenerationRepositoryImpl(
        remoteDataSource: sl.call(),
      ));
  //remote data
  sl.registerLazySingleton<ImageGenerationRemoteDataSource>(
          () => ImageGenerationRemoteDataSourceImpl(
        httpClient: sl.call(),
      ));
}