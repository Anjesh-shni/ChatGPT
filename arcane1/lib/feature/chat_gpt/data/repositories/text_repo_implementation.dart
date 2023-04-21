import 'package:arcane1/feature/chat_gpt/data/model/text_model.dart';
import 'package:arcane1/feature/chat_gpt/domain/repository/text_completion_repo.dart';
import '../remote_source/text_compl_remoteData_source.dart';

class TextRepoImplementation implements TextCompletionRepository {
  final TextCompletionRepoDataSource repoDataSource;

  TextRepoImplementation({required this.repoDataSource});
  @override
  Future<TextCompletionModel> getTextCompletion(String query) async =>
    await repoDataSource.getTextCompletion(query);
  
}
