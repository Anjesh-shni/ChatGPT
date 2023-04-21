
import '../../domain/repository/image_generation_repository.dart';
import '../model/image_generation_model.dart';
import '../remote_source/image_generation_remote_data_source.dart';

class ImageGenerationRepositoryImpl implements ImageGenerationRepository {
  final ImageGenerationRemoteDataSource remoteDataSource;

  ImageGenerationRepositoryImpl({required this.remoteDataSource});

  @override
  Future<ImageGenerationModel> getGenerateImages(String query) async =>
      remoteDataSource.getGenerateImages(query);
}
