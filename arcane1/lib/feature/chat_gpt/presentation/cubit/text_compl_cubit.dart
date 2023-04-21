import 'dart:io';
import 'package:arcane1/core/custom_exception.dart';
import 'package:arcane1/feature/chat_gpt/domain/usecases/text_completion_usecase.dart';
import 'package:arcane1/feature/chat_gpt/presentation/cubit/text_compl_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class TextCompletionCubit extends Cubit<TextCompletionState> {
  final TextCompletionUseCase textCompletionUseCase;
  TextCompletionCubit({required this.textCompletionUseCase})
      : super(TextCompletionInitial());

  Future<void> textCompletion({required String query}) async {
    emit(TextCompletionLoading());
    try {
      final textCompletionModelData = await textCompletionUseCase.call(query);
      debugPrint(textCompletionModelData.toString());
      emit(TextCompletionLoaded(
          textCompletionModelData: textCompletionModelData));
    } on SocketException catch (e) {
      emit(TextCompletionFailure(errorMsg: e.message));
    } on ServerException catch (e) {
      emit(TextCompletionFailure(errorMsg: e.message));
    }
  }
}
