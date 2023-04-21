import 'package:arcane1/feature/chat_gpt/data/model/text_model.dart';
import 'package:equatable/equatable.dart';

abstract class TextCompletionState extends Equatable {}

class TextCompletionInitial extends TextCompletionState {
  @override
  List<Object> get props => [];
}

class TextCompletionLoading extends TextCompletionState {
  @override
  List<Object> get props => [];
}

class TextCompletionLoaded extends TextCompletionState {
  final TextCompletionModel textCompletionModelData;

  TextCompletionLoaded({required this.textCompletionModelData});
  @override
  List<Object> get props => [];
}

class TextCompletionFailure extends TextCompletionState {
  final String? errorMsg;

  TextCompletionFailure({this.errorMsg});
  @override
  List<Object> get props => [];
}
