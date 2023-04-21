import 'package:arcane1/feature/app/app_constant/colors.dart';
import 'package:arcane1/feature/chat_gpt/presentation/cubit/text_compl_cubit.dart';
import 'package:arcane1/feature/chat_gpt/presentation/cubit/text_compl_state.dart';
import 'package:arcane1/feature/global/common/big_text.dart';
import 'package:arcane1/feature/global/common/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../global/search_text_field/search_text_field.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    _searchController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: BigText(
          text: "ChatGPT-OpenAI",
          color: whiteColor,
          size: 16,
        ),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<TextCompletionCubit, TextCompletionState>(
                  builder: (context, textCompletionState) {
                if (textCompletionState is TextCompletionLoading) {
                  debugPrint("Checking state.....");
                  return Center(
                    child: Container(
                      width: 200,
                      height: 200,
                      child: Image.asset("assets/loading.gif"),
                    ),
                  );
                }
                if (textCompletionState is TextCompletionLoaded) {
                  final choiceData =
                      textCompletionState.textCompletionModelData.choices;
                  return ListView.builder(
                    itemCount: choiceData.length,
                    itemBuilder: (BuildContext context, int index) {
                      debugPrint("Checking loadede state.....");

                      final textData = choiceData[index];
                      debugPrint(textData.toString());
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              SmallText(
                                text: textData.text,
                                color: whiteColor,
                                size: 14,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Share.share(textData.text);
                                    },
                                    child: const Icon(
                                      Icons.share,
                                      size: 20,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Clipboard.setData(
                                        ClipboardData(
                                          text: textData.text,
                                        ),
                                      );
                                    },
                                    child: const Icon(
                                      Icons.copy,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
                return Center(
                  child: BigText(
                    text: "Search generated",
                    size: 20,
                    color: whiteColor,
                  ),
                );
              }),
            ),
            SearchTextField(
              textEditingController: _searchController,
              onTap: () {
                BlocProvider.of<TextCompletionCubit>(context)
                    .textCompletion(query: _searchController.text)
                    .then((value) => _clearTextField());
              },
            ),
          ],
        ),
      ),
    );
  }

  void _clearTextField() {
    setState(() {
      _searchController.clear();
    });
  }
}
