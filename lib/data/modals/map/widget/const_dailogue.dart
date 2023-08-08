import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String? subtitle;
  final String hint;
  final VoidCallback onTap;
  final TextEditingController controller;
  const CustomDropdown({
    Key? key,
    this.subtitle,
    required this.controller,
    this.hint = "Option",
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        border: Border.all(color: greyColor3, width: 0.7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        onTap: onTap,
        readOnly: true,
        showCursor: false,
        controller: controller,
        decoration: InputDecoration(
          constraints: const BoxConstraints(
            minWidth: 0,
            minHeight: 0,
          ),
          hintText: hint,contentPadding: EdgeInsets.all(18),
          hintStyle:  TextStyle(fontSize: 17),
          fillColor: const Color(0xffF9F9F9),
          filled: true,
          suffixIcon: const Icon(
            Icons.keyboard_arrow_down_outlined,
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
Future<dynamic> customDialog(
    BuildContext context,
    List<String> optionList,
    Function onTap,
    String title,
    ) {
  TextEditingController textEditingController = TextEditingController();

  return showDialog(
    context: context,
    builder: (context) {
      return NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowGlow();
          return false;
        },
        child: StatefulBuilder(
          builder: (BuildContext context, setState) {
            textEditingController.addListener(() {
              setState(() {});
            });
            return AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              content: SizedBox(
                height: 300,
                width: 320,
                child: Column(
                  children: [
                    TextField(
                      controller: textEditingController,
                      decoration: InputDecoration(
                          hintText: "Search your $title",
                          hintStyle: TextStyle(fontSize: 17)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ...optionList
                                .map((e) => e
                                .toLowerCase()
                                .contains(textEditingController.text)
                                ? e
                                : "")
                                .toList()
                                .map(
                                  (e) => e == ""
                                  ? const SizedBox.shrink()
                                  : ListTile(
                                title: Text(e),
                                onTap: () {
                                  onTap(e);
                                },
                              ),
                            )
                                .toList()
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    },
  );
}
