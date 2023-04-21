import 'package:arcane1/feature/chat_gpt/data/model/text_model.dart';

abstract class TextCompletionRepoDataSource {
  Future<TextCompletionModel> getTextCompletion(String query);
}
