import 'package:arcane1/feature/chat_gpt/data/model/text_completion_data.dart';

class TextCompletionModel {
  final num created;
  final List<TextCompletionData> choices;

  TextCompletionModel({required this.created, required this.choices});
  factory TextCompletionModel.fromJson(Map<String, dynamic> json) {
    final textGeneratedItems = json['choices'] as List;
    List<TextCompletionData> choices = textGeneratedItems
        .map((singleItem) => TextCompletionData.fromJson(singleItem))
        .toList();

    return TextCompletionModel(
      created: json["created"],
      choices: choices,
    );
  }
}
