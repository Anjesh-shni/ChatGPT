import 'package:arcane1/feature/app/app_constant/colors.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {

  final TextEditingController? textEditingController;
  final VoidCallback? onTap;

  const SearchTextField({super.key, this.textEditingController, this.onTap});

 

  @override
  Widget build(BuildContext context) {
    return _serchTextField();
  }

  Widget _serchTextField() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, left: 4, right: 4),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 1.0,
                    spreadRadius: 1.0,
                    offset: const Offset(0, 0.50),
                    color: Colors.black.withOpacity(0.4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxHeight: 60),
                            child: Scrollbar(
                              child: TextField(
                                maxLines: null,
                                style: const TextStyle(fontSize: 14),
                                controller: textEditingController,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Ask me anything..."),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: textEditingController!.text.isEmpty ? null : onTap,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: textEditingController!.text.isEmpty
                    ? Colors.green.withOpacity(0.4)
                    : Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.send_outlined,
                color: whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
