import 'dart:convert';

import 'package:arcane1/core/custom_exception.dart';
import 'package:arcane1/core/open_ai.dart';
import 'package:arcane1/feature/chat_gpt/data/model/text_model.dart';
import 'package:arcane1/feature/chat_gpt/data/remote_source/text_compl_remoteData_source.dart';
import 'package:http/http.dart' as http;

class TextCompletionRepoDataSourceImpl implements TextCompletionRepoDataSource {
  final http.Client httpClient;

  TextCompletionRepoDataSourceImpl({required this.httpClient});
  //Private endPoint
  String endPoint(String endpoint) => '$BASE_URL/$endpoint';

  //For header
  Map<String, String> _headerBearerOptions(String token) => {
        "Content-Type": "application/json",
        "Authorization": "Bearer$token",
      };
  @override
  Future<TextCompletionModel> getTextCompletion(String query) async {
    final String _endPoint = "completions";

    Map<String, String> rawParams = {
      "model": "text-davinci-003",
      "prompt": query
    };
    final encodeParams = json.encode(rawParams);

    final response = await httpClient.post(
      Uri.parse(endPoint(_endPoint)),
      body: encodeParams,
      headers: _headerBearerOptions(API_KEY),
    );

    if (response.statusCode == 200) {
      return TextCompletionModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException(message: "Server Exception");
    }
  }
}
