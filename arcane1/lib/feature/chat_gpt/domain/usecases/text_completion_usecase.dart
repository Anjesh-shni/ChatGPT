import 'package:arcane1/feature/chat_gpt/domain/repository/text_completion_repo.dart';
import '../../data/model/text_model.dart';

class TextCompletionUseCase {
  final TextCompletionRepository repository;

  TextCompletionUseCase({required this.repository});
  Future<TextCompletionModel> call(String query) async {
    return repository.getTextCompletion(query);
  }
}
